# GDTLancer Analogue Version Setup

**Version:** 1.0
**Date:** April 2, 2025
**Related Documents:** GDTLancer Main GDD v1.5, Core Mechanics Design v1.1, Module/System GDDs (as developed)

## 1. Overview & Philosophy

This document outlines the standard physical components and recommended setup for playing the Analogue (Tabletop RPG) version of GDTLancer. The goal is to deliver the core GDTLancer experience – balancing simulation abstraction with narrative mechanics, player agency, and emergent storytelling – using tabletop materials.

The Analogue version relies more heavily on narrative resolution mechanics (`Action Checks`, `Event System`) than the digital version's direct simulation but follows the same core principles. Gameplay typically proceeds in turns or abstract time intervals rather than real-time.

## 2. Required Components

A typical solo or group session requires the following physical components per player or shared:

1.  **Dice:** At least three standard six-sided dice (3d6).
2.  **Character Sheet(s):** One per player character.
3.  **Map Sheet(s):** Represents the known space environment. Shared or individual copies.
4.  **Asset/Module Sheet(s):** Representing the key Assets (ships, major equipment) the character(s) possess.
5.  **Universal Mechanics Reference:** A concise rules summary sheet.
6.  **Module Event Booklet(s)/Reference(s):** Detailed outcome tables for specific Gameplay Modules.
7.  **Tokens/Trackers:** For managing variable resources like Focus, Wealth, Fuel, Hull, etc.

## 3. Component Details & Organization

* **3.1. Map Sheet(s):**
    * **Purpose:** Provides spatial context for navigation, exploration, and understanding the game world.
    * **Content:** Displays star systems, points of interest, travel routes (with segment costs/descriptors), known hazards. Includes space for player annotations (new discoveries, notes, current location marker).
    * **Format:** Can range from pre-generated sector maps to pointcrawls or hex grids. May involve multiple sheets for different zoom levels (Sector vs. System view).

* **3.2. Character Sheet:**
    * **Purpose:** Tracks the core identity, capabilities, and narrative state of the player character (Agent).
    * **Content:** Character Name, Description, Background/Origin info, **Base Skill Values** (e.g., Piloting +X, Tech +Y - used for calculating Module Modifiers), Current/Max **Focus Points (FP)**, Current **Wealth Points (WP)**, **XP/Progression** track, list of **Active Goals** (with Progress Track status), summary inventory/cargo notes, persistent status effects.
    * *Note:* Does not typically list the final operational Modifiers used in specific Modules; those are derived on the Asset/Module sheets.

* **3.3. Asset/Module Sheet(s):**
    * **Purpose:** Represents significant owned Assets (like ships, specialized scanners, mining rigs) and provides the specific rules context and operational modifiers for the Gameplay Modules they enable.
    * **Format:** Ideally one double-sided sheet/card per major Asset, or a small booklet.
    * **Content:**
        * **Asset Side:** Asset Name, Description/Image, Key Stats (e.g., Hull, Shield Max, Fuel/Supply Max, Cargo Capacity), relevant **`Asset Difficulty`** scores (e.g., Piloting Difficulty: -3, Combat Maneuvering Difficulty: -4). Lists Gameplay Modules enabled by this Asset. Asset condition track.
        * **Module Side(s):** For each enabled Gameplay Module:
            * Module Name (e.g., Piloting & Travel).
            * **Relevant Skill:** (e.g., "Uses Piloting Skill").
            * **Calculated Module Modifier:** A space to write the result of `[Character's Relevant Skill + Asset Difficulty = ___]`. This is the primary modifier used for Action Checks in this Module with this Asset.
            * **Integrated Outcome Table:** A compact table summarizing outcomes for Action Checks within this module, based on Result Tier (Crit/SwC/Fail) and chosen Action Approach (`Risky`/`Cautious`). Includes **Event Reference Codes** pointing to the Module Event Booklet.
            * **Asset Variations:** Any special rules, situational modifiers, or unique actions granted by *this specific Asset* within this Module.
            * Module-Specific Resource Tracks (if any, e.g., special ammo).

* **3.4. Universal Mechanics Reference:**
    * **Purpose:** Quick lookup for core game rules applicable across all modules.
    * **Content:** Summary of the **Action Check** (3d6+Mod vs Thresholds 10/14), **Focus Point** rules (Gain/Loss/Spend options), definitions and implications of **Action Approaches** (`Risky` / `Cautious`). May include basic rules for generic resource spending or status effects.

* **3.5. Module Event Booklet(s)/Reference(s):**
    * **Purpose:** Provides the detailed outcomes corresponding to the Event Reference Codes found on Asset/Module sheets.
    * **Structure:** Organized by Gameplay Module (e.g., Piloting Events, Combat Events). Within each module, entries are indexed by the **Event Reference Code** (e.g., `C-SWC-PILOT`, `R-FAIL-COMBAT`).
    * **Content:** Each entry provides the full narrative description, mechanical effects (stat changes, resource costs, new checks required), or d6 sub-table needed to resolve the specific outcome for that code. Players only need the booklet(s) relevant to the modules they can currently access via their Assets.

* **3.6. Tokens/Trackers:**
    * **Purpose:** Physical representation for fluctuating values.
    * **Examples:** Poker chips for Focus Points, glass beads for Wealth Points, dice to track Fuel/Supplies/Hull, small markers for Progress Tracks or map position.

## 4. Gameplay Flow Summary

1.  **Consult Map & Character Sheet:** Determine location, goals, resources.
2.  **Choose Action & Engage Module:** Decide action (e.g., Travel, Mine). Select the relevant **Asset/Module Sheet**.
3.  **Determine Context:** Note the **Calculated Module Modifier** from the sheet.
4.  **Declare Action & Approach:** State the specific action (e.g., `Undertake Journey` segment, attempt risky maneuver) and declare `Act Risky` or `Act Cautiously`.
5.  **Make Action Check:** Roll 3d6, add Module Modifier, add bonus from spent FP (if any). Compare to Thresholds (10/14). Consult **Universal Mechanics Reference** if needed.
6.  **Find Outcome:** Look at the **Integrated Outcome Table** on the **Asset/Module Sheet** based on result tier and chosen approach. Note the summary and **Event Reference Code**.
7.  **Resolve Outcome:** Look up the Event Reference Code in the relevant **Module Event Booklet**. Apply all described effects, update resources/status on sheets/trackers.
8.  **Update State:** Mark map position, check off goal progress, etc. Repeat from Step 1/2.

## 5. World Evolution ("World Event Tick")

* To simulate the dynamic world of the digital version, the Analogue Version uses a **"World Event Tick"** mechanic (rules detailed in World & Agency System GDD). This is typically resolved between sessions or during significant downtime (e.g., long rest, extended repair). It uses tables or procedures to introduce major background events (faction shifts, discoveries, disasters) that can affect the player's context and opportunities.

