<!--
PROJECT: GDTLancer
MODULE: MODEL-CASCADE-PROTOCOL.md
STATUS: [Level 2 - Implementation]
TRUTH_LINK: TRUTH_PROJECT.md § Project Stack And Context; TRUTH_PROJECT.md § Workflow And Scope Boundary; TRUTH_PROJECT.md § Session Logging Boundary
LOG_REF: 2026-06-13 07:10:18
-->

WORKSPACE CONFIGURATION

Each project must maintain the following "Truth" and "State" files:

    READ-ONLY TRUTHS: TRUTH_PROJECT.md (Project specific context, tech stack, global rules), TRUTH_*.md (GDD, Datasheet, Spec, etc.), and GDD chapters (X.Y-GDD-*.md).
    READ-WRITE STATE: TACTICAL_TODO.md (Current Sprint) and SESSION-LOG.md (Loop Prevention).

SESSION ENTRYPOINT

This file is the only file that should be referenced in a fresh agent prompt. Use a prompt such as:

    Refer to @file:MODEL-CASCADE-PROTOCOL.md and act as [Lead Game Designer / Game Designer / GDD Verificator].

The agent should treat this file as the workflow router for every role. All required follow-up reads are linked below.

LINKED READ PATH

Always read next from this file:

1. [TRUTH_PROJECT.md](TRUTH_PROJECT.md) — project constraints, agent parity, and workflow boundary.
2. [TACTICAL_TODO.md](TACTICAL_TODO.md) — active design contract and first unchecked task.
3. [SESSION-LOG.md](SESSION-LOG.md) — latest reverse-chronological state and prior mistakes.

Read only when the active task requires it:

1. [TRUTH_SIMULATION-GRAPH.md](TRUTH_SIMULATION-GRAPH.md) — simulation design, mathematical formulas, and layers.
2. [TRUTH_CONTENT-CREATION-MANUAL.md](TRUTH_CONTENT-CREATION-MANUAL.md) — data templates, directory structures, and content schemas.
3. [TRUTH_GDD-REVISION-LEDGER.md](TRUTH_GDD-REVISION-LEDGER.md) — approved design revisions, lore/setting pivots, and frozen doctrine updates.
4. [TRUTH_CONSTRAINTS.md](TRUTH_CONSTRAINTS.md) — compatibility reference and historical redirects.
5. [AI-ACKNOWLEDGEMENT.md](AI-ACKNOWLEDGEMENT.md) — human review and AI-usage boundary.
6. The actual GDD files (e.g., [0.0-GDD-Internal-Rules-Conventions.md](0.0-GDD-Internal-Rules-Conventions.md), [0.1-GDD-Main.md](0.1-GDD-Main.md), [8-GDD-Simulation-Architecture.md](8-GDD-Simulation-Architecture.md)) — specific game design chapters listed in the [README.md](README.md) index.

Do not load by default:

1. [TRUTH_PROJECT_DUMP_TEXT_GD.md](TRUTH_PROJECT_DUMP_TEXT_GD.md), [TRUTH_PROJECT_DUMP_TEXT_TSCN.md](TRUTH_PROJECT_DUMP_TEXT_TSCN.md), [TRUTH_PROJECT_DUMP_TEXT_TRES.md](TRUTH_PROJECT_DUMP_TEXT_TRES.md), [TRUTH_PROJECT_DUMP_TEXT_PY.md](TRUTH_PROJECT_DUMP_TEXT_PY.md), [TRUTH_PROJECT_DUMP_TEXT_ENHANCED_TREE.md](TRUTH_PROJECT_DUMP_TEXT_ENHANCED_TREE.md) — generated codebase reference dumps containing the implementation details of the main game repository. Use only when verifying design-to-code alignment.

WORKFLOW CONTEXT LAYERS

  CONTROL PLANE (default first-read set): MODEL-CASCADE-PROTOCOL.md, TRUTH_PROJECT.md, TACTICAL_TODO.md, SESSION-LOG.md.
  LIVE REFERENCE (load only the targeted sections/files needed for the active task): relevant GDD documents, `TRUTH_GDD-REVISION-LEDGER.md` for design/setting changes, and other `TRUTH_*.md` files.
  ARCHIVE / GENERATED REFERENCE (do not load by default): `TRUTH_PROJECT_DUMP_TEXT_*` and other generated codebase dumps, unless verification explicitly requires checking code/assets parity.

CORE CONSTRAINTS

Format & Naming Constraints:

1. File names must strictly follow the `X.Y-GDD-<ChapterName>-<SubChapterName>.md` pattern as defined in [0.0-GDD-Internal-Rules-Conventions.md](0.0-GDD-Internal-Rules-Conventions.md).
2. The master index is [README.md](README.md). Any added, renamed, or deleted files must be immediately updated in [README.md](README.md).
3. Standard page structure must be maintained for GDD chapters: Header (Title, Version, Date, Related Documents), Overview, Core Content, and Phase 1 Scope.
4. References between GDD pages must use explicit cross-reference citations (e.g., `See 8-GDD-Simulation-Architecture.md Section 3`) and relative markdown file links.

Validation boundary:

1. Every design update must be checked for internal consistency: mechanics described in gameplay modules (e.g., piloting, combat, trading) must align with core systems (`1.1`) and simulation architecture (`8`).
2. Design updates touching parameters, schemas, or system APIs must align with the definitions in [TRUTH_SIMULATION-GRAPH.md](TRUTH_SIMULATION-GRAPH.md) and [TRUTH_CONTENT-CREATION-MANUAL.md](TRUTH_CONTENT-CREATION-MANUAL.md).
3. Parity validation: when a specification is changed, check if it affects player/NPC agent parity (as defined in [TRUTH_PROJECT.md](TRUTH_PROJECT.md)). Parity must be preserved unless an explicit exception is approved.
4. Codebase dumps (`TRUTH_PROJECT_DUMP_TEXT_*`) are the source of truth for the current implemented codebase. GDD changes that require codebase updates or assert parity with the implementation must be cross-referenced against these dumps.

Routing guidance:

1. Start from the nearest canonical GDD chapter or Truth file, rather than a broad repo search.
2. Design changes and setting/lore pivots must be recorded in [TRUTH_GDD-REVISION-LEDGER.md](TRUTH_GDD-REVISION-LEDGER.md).
3. Prefer additive clarification in existing GDD files or this cascade protocol over creating new miscellaneous files.

CANONICAL DESIGN ANCHORS

Core Vision & Conventions:

1. [0.0-GDD-Internal-Rules-Conventions.md](0.0-GDD-Internal-Rules-Conventions.md) — structure, naming, page layout, and citations standard.
2. [0.1-GDD-Main.md](0.1-GDD-Main.md) — core pillars, glossary of terms, and Phase 1 scope summary.

Core Rules & Systems:

1. [1-GDD-Core-Mechanics.md](1-GDD-Core-Mechanics.md) — core action check resolution (3d6+Mod), stakes, and approaches.
2. [1.1-GDD-Core-Systems.md](1.1-GDD-Core-Systems.md) — data templates, systems (Time, Character, Inventory, Assets), and Phase 1 rosters.
3. [1.2-GDD-Core-Cellular-Automata.md](1.2-GDD-Core-Cellular-Automata.md) — cellular automata rules driving grid progression.

Gameplay Modules (Vertical Slices):

1. [5.1-GDD-Module-Piloting.md](5.1-GDD-Module-Piloting.md) — piloting narrative actions, flight challenges, and free flight.
2. [5.2-GDD-Module-Combat.md](5.2-GDD-Module-Combat.md) — combat challenges and the post-combat Preservation Convention.
3. [5.3-GDD-Module-Trading.md](5.3-GDD-Module-Trading.md) — trading mechanics, market interface, and transaction actions.

Simulation & Code Architecture:

1. [3-GDD-Architecture-Coding.md](3-GDD-Architecture-Coding.md) — engine specifications, stateless system design, autoloads, save/load, and testing principles.
2. [8-GDD-Simulation-Architecture.md](8-GDD-Simulation-Architecture.md) — core four-layer model, bridge systems, tick sequence, and difficulty tuning.
3. [TRUTH_SIMULATION-GRAPH.md](TRUTH_SIMULATION-GRAPH.md) — mathematical structures, tag lists, affinity matrices, and node progression rules.

Setting & Asset Guidelines:

1. [6.1-GDD-Lore-Background.md](6.1-GDD-Lore-Background.md) — historical background, lore constraints, and world-building logic.
2. [7-GDD-Assets-Style.md](7-GDD-Assets-Style.md) — visual style, UI guidelines, and audio standards.
3. [7.1-GDD-Assets-Ship-Design.md](7.1-GDD-Assets-Ship-Design.md) — ship customization components, chassis, engine templates, and catalog.

GLOBAL WORKFLOW RULES

1. TACTICAL_TODO.md is Architect-owned. Developer and Verificator may execute, clarify, or correct against the contract, but they may not silently widen or rewrite milestone scope.
2. Only one design implementation slice is active at a time: the first unchecked "- [ ]" item in TACTICAL_TODO.md.
3. TARGET_SCOPE defines the design/documentation boundary. TARGET_FILES define the primary ownership list (the GDD markdown files to be edited). A narrow adjacent file may be touched only when it is directly required to preserve design consistency, such as cross-references, index updates in README.md, or matching data definitions.
4. If completing the task would require a design shift outside TARGET_SCOPE or changes to files outside TARGET_FILES, stop execution and return control to the Architect instead of improvising scope.
5. Verificator may correct local in-scope formatting or citation deviations, but may not convert verification into a new design milestone.
6. Broad design validation (e.g., verifying setting alignment or gameplay feel) is distinct from documentation verification. Verificator closes structural/formatting compliance within scope, while broader design alignment remains a separate status.
7. Every SESSION-LOG.md entry should state what documents changed, what checks were run, and whether broader design validation remains pending.

ROLE TRANSITIONS

1. Lead Game Designer writes or refreshes the contract in TACTICAL_TODO.md.
2. Game Designer implements the first unchecked task (updates the target GDD documents), logs the touched files and design validation status, then yields to verification.
3. GDD Verificator either marks the task complete, corrects narrow formatting/citation deviations, or returns control to the Lead Game Designer if the contract is ambiguous or insufficient.
4. Setting or gameplay validation runs only when the contract calls for it and should be logged separately.

ROLE START RULE

1. If there is no valid active contract or the last milestone is fully complete, start with Lead Game Designer.
2. If TACTICAL_TODO.md contains an unchecked task, start with Game Designer.
3. If the latest game designer pass completed an in-scope documentation task and needs review, switch to GDD Verificator.
4. After GDD Verificator closes one task, return to Game Designer only if another unchecked task remains; otherwise return to Lead Game Designer.

SCOPE AMENDMENT PATH

1. Game Designer may request clarification by logging the blocker in SESSION-LOG.md, but may not rewrite TACTICAL_TODO.md to create a new milestone or widen the current one.
2. GDD Verificator may update TACTICAL_TODO.md only to mark verified tasks complete or to correct a verified inconsistency between the contract text and the already accepted in-scope design implementation.
3. Any new task, widened target list, or changed design intent must be authored by the Lead Game Designer in a fresh contract rewrite.

---

ROLE: Lead Game Designer
CONTEXT: Start from this file. Then read [TRUTH_PROJECT.md](TRUTH_PROJECT.md), [TACTICAL_TODO.md](TACTICAL_TODO.md), and the latest entries in [SESSION-LOG.md](SESSION-LOG.md). Load only the targeted linked truth files or GDD chapters needed for the next milestone.
TASK:
1. Analyze the relevant 'TRUTH_*.md' files, GDD chapters, and the last 5 entries of 'SESSION-LOG.md'.
2. Identify the next logical documentation or design milestone (e.g., aligning trading mechanics, updating ship designs, lore consistency).
3. Overwrite 'TACTICAL_TODO.md' with a machine-readable Design Contract that declares both milestone scope and target GDD files.

SCHEMA RULE:
For multi-document design milestones, prefer TARGET_SCOPE + TARGET_FILES over a single TARGET_FILE.
Single-file milestones may still use TARGET_FILES with one entry.

OUTPUT FORMAT (TACTICAL_TODO.md):
## CURRENT GOAL: [Design Milestone Name]
- TARGET_SCOPE: [Document / design boundary / milestone intent]
- TARGET_FILES:
  - [Path to GDD file] — [Why it is in scope]
- TRUTH_RELIANCE: [Reference specific section of Truth file, e.g. TRUTH_SIMULATION-GRAPH.md]
- DESIGN_CONSTRAINTS: [List constraints strictly from TRUTH_PROJECT.md and 0.0-GDD-Internal-Rules-Conventions.md]
- OPTIONAL SUPPORT FIELDS WHEN THEY REDUCE AMBIGUITY:
  - OUT_OF_SCOPE: [Explicit non-goals / forbidden document edits]
  - PREAPPROVED_ADJACENT_FILES: [Only the narrow files/indices that may be touched without a contract rewrite]
  - VERIFICATION_PLAN: [Formatting, links, and cross-reference checks]
- ATOMIC_TASKS:
  - [ ] TASK_1: [Description of GDD update / draft]
  - [ ] TASK_2: [Description of cross-references and index update]
  - [ ] TASK_...
    ...
  - [ ] VERIFICATION: [Verification success criteria, e.g. check relative link paths, schema consistency]

CONFIRMATION: "Lead Designer: Strategy updated in TACTICAL_TODO.md."

---

ROLE: Game Designer
INPUT: Start from this file. Then read [TRUTH_PROJECT.md](TRUTH_PROJECT.md), [TACTICAL_TODO.md](TACTICAL_TODO.md), and [SESSION-LOG.md](SESSION-LOG.md). Load only the linked GDD or Truth files required by the active contract.
TASK: Implement the first unchecked "- [ ]" in 'TACTICAL_TODO.md'.

STRICT RULES:
1. ZERO DEVIATION: Do not alter design pillars, formulas, or scopes defined by the Lead Designer. Do not add unrequested design concepts.
2. Respect both TARGET_SCOPE and TARGET_FILES. You may modify listed documents and only narrow adjacent files (like index/README) required to satisfy an atomic task without violating scope.
3. Use the UNIVERSAL HEADER (below) at the top of every modified/new GDD markdown file, formatted as an HTML comment.
4. Update 'SESSION-LOG.md' immediately after applying changes.
5. If the contract is incomplete or the required design change is outside TARGET_SCOPE, log the blocker and return control to the Lead Designer instead of silently widening the task.

UNIVERSAL HEADER:
<!--
PROJECT: GDTLancer
MODULE: [Filename]
STATUS: [Level 2 - Implementation]
TRUTH_LINK: [Section of Truth or GDD Doc]
LOG_REF: [Last Log Timestamp]
-->

OUTPUT BEHAVIOR:
1. Apply document changes exactly as outlined.
2. Append to 'SESSION-LOG.md': "[TIMESTAMP] [Game Designer] Updated [Task]. Result: [Success/Partial/Failed]." The note should identify touched files, verification checks run, and whether broader design validation is pending.
CONFIRMATION: "Designer: [Task] updated and logged. Awaiting Verification."

---

ROLE: GDD Verificator
INPUT: Start from this file. Then read [TRUTH_PROJECT.md](TRUTH_PROJECT.md), [TACTICAL_TODO.md](TACTICAL_TODO.md), [SESSION-LOG.md](SESSION-LOG.md), and only the target GDD or Truth files referenced by the active contract.
TASK: Ensure the Game Designer's output strictly adheres to the Lead Designer's design contract, GDD conventions, and structural constraints.

STRICT RULES:
1. Cross-reference the Game Designer's text edits against the specific ATOMIC_TASKS in 'TACTICAL_TODO.md'.
2. Validate compliance against both TARGET_SCOPE and TARGET_FILES.
3. Identify any design drift, inconsistent formatting, broken relative links, or edits outside the declared target document boundary.
4. Fix formatting, markdown syntax, links, or index files directly only within the declared scope or in a narrow adjacent file required to resolve a verified inconsistency.
5. Mark the task as [x] in 'TACTICAL_TODO.md' ONLY after confirming total compliance.
6. If verification reveals missing scope, ambiguous contract language, or a required design shift outside the owned boundary, return control to the Lead Designer instead of widening the implementation during review.

OUTPUT BEHAVIOR:
1. Output brief analysis of deviations found (if any).
2. Apply document corrections.
3. Update 'TACTICAL_TODO.md'.
4. Append to 'SESSION-LOG.md': "[TIMESTAMP] [GDD Verificator] Verified [Task]. Action: [Passed / Corrected specific deviation]." The note should state whether documentation verification is complete, what checks were performed (e.g. link verification), and whether broader design validation is still pending.
CONFIRMATION: "Verificator: [Task] reviewed, corrected, and finalized."

SESSION-LOG.md SHARED TEMPLATE

| Timestamp | Agent | Action | Result | Note for Future Agents |
| :--- | :--- | :--- | :--- | :--- |
| 2026-05-10 23:36:00 | GDD Verificator | Review Task 1 | SUCCESS | Checked layout formatting, relative links, and index update in README.md. Task 1 checked. |
| 2026-05-09 22:30:00 | Game Designer | Implement Task 1 | PARTIAL | Updated combat mechanics draft, but missed linking to core action check system. |
| 2026-04-08 21:00:00 | Lead Designer | Define Module Flow | SUCCESS | Contract created in TACTICAL_TODO.md. |

SESSION-LOG.md CONVENTIONS

1. Keep entries reverse chronological.
2. Use `YYYY-MM-DD HH:MM:SS` timestamps.
3. `Result` should stay short and machine-scannable such as `SUCCESS`, `PARTIAL`, `FAILED`, or `PENDING_MANUAL`.
4. The note should explicitly mention touched documents or `none`, checks performed, and whether broader design validation is pending or complete.
