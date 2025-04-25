# GDTLancer Analogue Version - Setup & Formatting Guide

**Version:** 1.0
**Date:** April 3, 2025
**Related Documents:** GDTLancer Main GDD v1.6, Core Mechanics Design v1.2, Analogue Setup v1.1, Module/System GDDs

## 1. Purpose

This document details the recommended physical layout, content organization, and formatting principles for the printed materials used in the Analogue (Tabletop RPG) version of GDTLancer. The aim is to ensure clarity, ease of use, and efficient information access during play, supporting the game's modular design.

## 2. General Formatting Principles

* **Paper Size:** Primarily target A4/Letter for main sheets (Character, Map) and A5/Half-Letter for reference cards/booklets where practical. A bound A5 notepad format is a potential alternative structure.
* **Layout:** Utilize clean, readable fonts (e.g., sans-serif 10-12pt for body text, larger for headings). Employ clear headings, logical information grouping (using boxes or sections), and sufficient white space.
* **Tracking Methods:** Standardized methods for tracking dynamic values:
    * **Linear Progress Tracks:** (e.g., Goal Progress, Time Clock) Use tracks printed along a reinforced (clear tape recommended) edge of the relevant sheet, marked with **paperclip sliders**. Typically 8-10 segments.
    * **Point Pools:** (e.g., Focus Points, Wealth Points, Hull/Shields) Use marked boxes `[ ]` or dedicated areas for writing the current value with pencil or erasable marker (if using laminated sheets/protectors). Small pools like Focus Points (FP) can use check-boxes `[ ] [ ] [ ]`.
    * **Notes & Dynamic Stats:** Use pencil or erasable markers for temporary notes, status effects, or calculated values like the Module Modifier.
* **Modularity:** Design sheets to function together. Information should be located where it's most relevant contextually (e.g., core character stats on Character Sheet, operational modifiers on Asset/Module Sheets). Minimize redundant information.

## 3. Component Layouts

* **3.1 Character Sheet Layout:** (Primary Sheet, e.g., A4/Letter)
    * **Section 1: Agent Identification:** Character Name, Pronouns, Concept/Background Summary, Player Name.
    * **Section 2: Core Skills/Stats:** List base Skill values (e.g., Piloting: `[+X]`, Tech: `[+Y]`, Social: `[+Z]`, etc.). These are the foundation for calculating Module Modifiers.
    * **Section 3: Meta-Resources & Condition:**
        * Focus Points (FP): Track (e.g., `FP: [ ] [ ] [ ]` Max 3).
        * Wealth Points (WP): Box for current value `WP: [ ___ ]`.
        * Condition/Stress Track (Optional, if added later).
    * **Section 4: Time & World State:**
        * **Time Clock Track:** Linear track (e.g., 8 segments: `[ ][ ][ ][ ][ ][ ][ ][ ] TU`) along one reinforced edge for a paperclip slider. Label clearly.
    * **Section 5: Progression:**
        * XP Track or Milestone list/checkboxes.
        * Notes area for earned Perks/Assets summary (names only).
    * **Section 6: Active Goals/Vows:**
        * Area to list 2-3 active Goals. For each: Goal Name/Objective, Rank (optional), **Progress Track** (linear track, e.g., 10 segments `[ ][ ]...[ ]`) along a reinforced edge for a paperclip slider.
    * **Section 7: Status & Notes:** Area for temporary status effects, campaign notes, quick inventory reference (non-Asset items), contacts.

* **3.2 Map Sheet(s) Layout:** (A4/Letter or larger, potentially foldable)
    * **Main Area:** Visual map (pointcrawl, hex, sector chart) showing locations, routes (with TU costs), known hazards, faction territories. Clear Key/Legend.
    * **Annotation Space:** Margins or dedicated areas for player notes, marking current location, drawing discovered routes, tracking local threats/opportunities.

* **3.3 Asset/Module Sheet Layout:** (A5/Half-Letter card/sheet, likely double-sided, one per major Asset)
    * **Side 1: Asset Details:**
        * Header: Asset Name & Type (e.g., Ship: Wayfarer Freighter).
        * Visual: Image/Icon (Optional).
        * Description: Brief flavor text.
        * Core Stats: Hull `[ ]/[Max]`, Shields `[ ]/[Max]`, Cargo Capacity `[X]`, etc. Relevant **`Asset Difficulty`** scores (e.g., Piloting: -3, Combat: -4).
        * Enabled Modules: List of Gameplay Modules this Asset grants access to.
        * Condition/Notes: Track damage, quirks, modifications specific to this Asset.
    * **Side 2: Enabled Module Details** (Sections repeated or expanded as needed):
        * Header: Module Name (e.g., Piloting & Travel).
        * **Modifier Calc:** `Uses Skill: [e.g., Piloting]` | `Asset Difficulty: [-3]` | `Current Skill: [+_]` | **`Module Modifier = [___]`** (Space for player to calculate & write).
        * **Action Outcome Summary:** The compact table referencing Risky/Cautious outcomes:
            ```
            | Result      | Cautious Outcome / Ref Code | Risky Outcome / Ref Code |
            |-------------|-----------------------------|--------------------------|
            | Crit (14+)  | Stable Success+ / C-CRIT-PILOT| Major Success++ / R-CRIT-PILOT|
            | SwC (10-13) | Success + Minor Cost / C-SWC-PILOT | Success + Notable Cost / R-SWC-PILOT|
            | Fail (<10)  | Fail + Minor Setback / C-FAIL-PILOT | Fail + Major Conseq. / R-FAIL-PILOT |
            ```
        * **Module Mechanics:** Brief summary of key module actions (e.g., `Undertake Journey`, `Fast Transit` TU costs).
        * **Asset Variations:** List special bonuses/actions *this Asset* provides *in this Module*.
        * **Module Resources:** Tracks for specific ammo, charges, etc. (if applicable).

* **3.4 Universal Mechanics Reference Layout:** (A5/Half-Letter card or separate A4 sheet)
    * **Action Check:** Flowchart or steps (Roll 3d6 + Mod + FP -> Compare vs 10/14).
    * **Focus Points:** Gain/Loss rules, Spending options (Narrative Boost, Sim Boost).
    * **Action Approaches:** Definitions of `Act Risky` / `Act Cautiously` and their general impact on outcome severity.
    * **Time Clock & World Event Tick:** Summary of how TU are tracked and what happens when the clock fills (Tick -> Event + WP Upkeep -> Reset).
    * **Wealth Points:** Brief definition and primary uses (Upkeep, Major Costs).
    * *(Optional)* Basic status effect definitions.

* **3.5 Module Event Booklet(s)/Reference(s) Layout:** (Booklet, multi-page A5/Half-Letter, or cards)
    * **Organization:** Clearly titled by Module (e.g., "Piloting & Travel Events"). Entries organized and indexed by **Event Reference Code** (e.g., `C-SWC-PILOT`, `R-FAIL-PILOT`).
    * **Content per Entry:**
        * Reference Code.
        * Brief Narrative Flavor text expanding on the summary.
        * Specific Mechanical Effects (WP cost/gain, TU add, Hull/Shield damage, status effect applied, next Action Check required, Module switch, roll on d6 sub-table).
        * Clear distinction between Cautious and Risky versions where applicable. Use formatting (bolding, lists) for clarity.

## 4. Information Flow Example

Player decides to `Undertake Journey` (Piloting Module action). They grab their **Ship Asset Sheet**, look at the Piloting section (Side 2), calculate the `Module Modifier` using their **Character Sheet**'s Piloting Skill and the ship's `Asset Difficulty`. They declare `Act Cautiously`. They roll 3d6, potentially spend FP (tracked on Character Sheet), add the Module Modifier. They check the result against thresholds (from **Universal Ref**). They find the outcome summary and Ref Code on the **Asset/Module Sheet**'s table. They look up the Ref Code in the **Piloting Event Booklet**, apply the detailed effects, mark TU on the **Character Sheet**'s Time Clock, and potentially update the **Map Sheet**.
