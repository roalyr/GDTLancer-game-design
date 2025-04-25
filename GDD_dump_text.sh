#!/bin/bash

# --- Script Identification ---
SCRIPT_NAME=$(basename "$0")

# Default values
INPUT_DIR="."
OUTPUT_FILE="COMBINED_TEXT.md" # Default output, will be excluded
FILE_EXTENSION="md" # Default file extension
EXCLUDE_WORDS=()
EXCLUDE_DIRS=(".git") # Exclude .git by default
ADD_SEPARATOR=false
EXTRACTION_METHOD="" # Auto-detect: pandoc -> lynx -> cat

# --- Function Definitions ---

# Print usage instructions
usage() {
  echo "Usage: $0 [-i <input_dir>] [-o <output_file>] [-e <extension>] [-w <word1,word2,...>] [-d <dir1,dir2,...>] [-s] [-h]"
  echo "  -i <input_dir>   : Directory to search for files (default: .)"
  echo "  -o <output_file> : File to save combined text (default: COMBINED_TEXT.txt)"
  echo "                     (This output file itself will be excluded from processing)"
  echo "  -e <extension>   : File extension to process (default: md)"
  echo "  -w <word_list>   : Comma-separated list of words to exclude from lines"
  echo "  -d <dir_list>    : Comma-separated list of directory names to exclude (e.g., node_modules,build)"
  echo "                     (.git is excluded by default)"
  echo "  -s               : Add a separator line between content from different files"
  echo "  -h               : Display this help message"
  echo ""
  echo "Note: The script file '$SCRIPT_NAME' and the output file will always be excluded."
  exit 1
}

# Check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Determine the best text extraction method
determine_extraction_method() {
  # (Function content unchanged)
  if command_exists pandoc; then
    EXTRACTION_METHOD="pandoc"
  elif command_exists lynx; then
    EXTRACTION_METHOD="lynx"
  elif command_exists cat; then
    if [[ "$FILE_EXTENSION" =~ ^(md|html|htm|rst|org)$ ]]; then
        echo "Warning: Neither pandoc nor lynx found. Using 'cat', formatting of '*.$FILE_EXTENSION' files will be preserved." >&2
    else
        echo "Using 'cat' for text extraction."
    fi
    EXTRACTION_METHOD="cat"
  else
    echo "Error: Cannot find 'pandoc', 'lynx', or 'cat'. Please install one." >&2
    exit 1
  fi
  echo "Using '$EXTRACTION_METHOD' for text extraction."
}

# Extract text from a file using the chosen method
extract_text() {
  # (Function content unchanged)
  local file="$1"
  case "$EXTRACTION_METHOD" in
    pandoc) pandoc "$file" -t plain ;;
    lynx)   lynx -dump -nolist "$file" ;;
    cat)    cat "$file" ;;
  esac
}

# --- Argument Parsing ---

# Store default output file for later comparison if user overrides it
DEFAULT_OUTPUT_FILE="$OUTPUT_FILE"

while getopts "i:o:e:w:d:sh" opt; do
  case $opt in
    i) INPUT_DIR="$OPTARG" ;;
    o) OUTPUT_FILE="$OPTARG" ;;
    e) FILE_EXTENSION="$OPTARG" ;;
    w) IFS=',' read -r -a EXCLUDE_WORDS <<< "$OPTARG" ;;
    d) # Append user-specified dirs to the default .git exclusion
       IFS=',' read -r -a user_exclude_dirs <<< "$OPTARG"
       EXCLUDE_DIRS+=("${user_exclude_dirs[@]}")
       ;;
    s) ADD_SEPARATOR=true ;;
    h) usage ;;
    \?) echo "Invalid option: -$OPTARG" >&2; usage ;;
  esac
done
shift $((OPTIND-1))

# --- Validation ---

if [ ! -d "$INPUT_DIR" ]; then
  echo "Error: Input directory '$INPUT_DIR' not found." >&2
  exit 1
fi

# Remove leading dot from extension if present (e.g., user enters .txt)
FILE_EXTENSION="${FILE_EXTENSION#.}"
if [ -z "$FILE_EXTENSION" ]; then
    echo "Error: File extension cannot be empty." >&2
    usage
fi

# Get the absolute path of the output file for robust exclusion, requires realpath
# If realpath isn't available, we'll stick to basename exclusion which works in most cases
OUTPUT_FILE_BASENAME=$(basename "$OUTPUT_FILE")
# Optional: Use realpath for more robust output file exclusion if needed
# if command_exists realpath; then
#   OUTPUT_FILE_ABS=$(realpath "$OUTPUT_FILE" 2>/dev/null) # Get absolute path, suppress errors if it doesn't exist yet
# fi
# Using basename comparison is generally sufficient and avoids needing realpath


determine_extraction_method

# --- Exclusion Pattern Generation ---

# Build find's -prune pattern for directories
FIND_EXCLUDE_DIRS_PATTERN=()
# Ensure unique directory names before building pattern
unique_exclude_dirs=($(printf "%s\n" "${EXCLUDE_DIRS[@]}" | sort -u))

if [ ${#unique_exclude_dirs[@]} -gt 0 ]; then
    echo "Excluding directories: ${unique_exclude_dirs[*]}"
    for dir in "${unique_exclude_dirs[@]}"; do
        # Add patterns for path exclusion: match anywhere in the path
        if [ -n "$dir" ]; then
          FIND_EXCLUDE_DIRS_PATTERN+=(-o -path "*/${dir}/*" -o -path "*/${dir}")
        fi
    done
    # Remove the first '-o' if patterns were added
    if [ ${#FIND_EXCLUDE_DIRS_PATTERN[@]} -gt 0 ]; then
        FIND_EXCLUDE_DIRS_PATTERN=("(" "${FIND_EXCLUDE_DIRS_PATTERN[@]:1}" ")" -prune)
    fi
fi


# Build grep's regex pattern for words
GREP_EXCLUDE_WORDS_PATTERN=""
if [ ${#EXCLUDE_WORDS[@]} -gt 0 ]; then
  # Simple word boundary matching for whole words.
  GREP_EXCLUDE_WORDS_PATTERN=$(printf '\\b%s\\b\|' "${EXCLUDE_WORDS[@]}")
  GREP_EXCLUDE_WORDS_PATTERN=${GREP_EXCLUDE_WORDS_PATTERN%\|} # Remove trailing '|'
  echo "Excluding lines containing words: ${EXCLUDE_WORDS[*]}"
else
  echo "No words specified for exclusion."
fi

# --- File Processing ---

# Clear/Create the output file
# Check if output is same as script - unlikely but possible
if [ "$OUTPUT_FILE_BASENAME" = "$SCRIPT_NAME" ] && [ "$OUTPUT_FILE" = "$0" ]; then
    echo "Error: Output file cannot be the script file itself ('$SCRIPT_NAME')." >&2
    exit 1
fi
> "$OUTPUT_FILE"
echo "Output file '$OUTPUT_FILE' created/cleared."

echo "Processing '*.$FILE_EXTENSION' files in directory: $INPUT_DIR (sorted alphabetically)"
echo "Excluding script '$SCRIPT_NAME' and output file '$OUTPUT_FILE_BASENAME'." # Use basename for echo
echo "Saving combined text to: $OUTPUT_FILE"
echo "----------------------------------------------------"

# Find target files, excluding specified directories AND specific files, sort them, then process
# Use process substitution for reading file names to handle special characters
while IFS= read -r file; do
    # Check if file still exists (it might be deleted between find and now)
    # Also double-check basename match here as an extra precaution, though find should handle it
    file_basename=$(basename "$file")
    if [ ! -f "$file" ] || [ "$file_basename" = "$SCRIPT_NAME" ] || [ "$file_basename" = "$OUTPUT_FILE_BASENAME" ]; then
        # echo "Skipping (deleted or excluded): $file" # Optional debug line
        continue
    fi

    echo "Processing: $file"

    # Extract text using the chosen method
    extracted_text=$(extract_text "$file")
    exit_status=$?

    if [ $exit_status -ne 0 ]; then
        echo "Warning: Failed to extract text from '$file' (exit code: $exit_status)." >&2
        continue # Skip to the next file
    fi

    # Filter out excluded words if any are specified
    if [ -n "$GREP_EXCLUDE_WORDS_PATTERN" ]; then
        printf '%s\n' "$extracted_text" | grep -vE -- "$GREP_EXCLUDE_WORDS_PATTERN" >> "$OUTPUT_FILE"
    else
        printf '%s\n' "$extracted_text" >> "$OUTPUT_FILE"
    fi

    # Add separator if requested
    if [ "$ADD_SEPARATOR" = true ]; then
        echo -e "\n--- End of $file ---\n" >> "$OUTPUT_FILE"
    fi

# Use find with the specified file extension, prune excluded dirs, exclude specific files, print paths, sort results
done < <(find "$INPUT_DIR" \
            -type d "${FIND_EXCLUDE_DIRS_PATTERN[@]}" -o \
            \( \
                -type f \
                -name "*.${FILE_EXTENSION}" \
                \! -name "$SCRIPT_NAME" \
                \! -name "$OUTPUT_FILE_BASENAME" \
            \) -print \
         | sort)
# Explanation of find command:
# -type d ... -prune : If it's a directory matching exclusion patterns, don't descend into it.
# -o \( ... \) : Otherwise (if not pruned), consider the following group:
#   -type f : Must be a file.
#   -name "*.${FILE_EXTENSION}" : Must match the target extension.
#   \! -name "$SCRIPT_NAME" : AND must NOT be the script file.
#   \! -name "$OUTPUT_FILE_BASENAME" : AND must NOT be the output file (basename match).
# -print : Print the path of matching files.
# | sort : Sort the found paths alphabetically.

echo "----------------------------------------------------"
echo "Combined text saved to $OUTPUT_FILE"

exit 0
