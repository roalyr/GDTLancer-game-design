# GDTLancer Module Design: Piloting & Travel

**Version:** 1.3
**Date:** April 3, 2025
**Related Documents:** GDTLancer Main GDD v1.6, Core Mechanics Design v1.2

## 1. Purpose & Scope

* **Module Name:** Piloting & Travel
* **Purpose:** Governs Agent ship movement within and between systems, supporting direct simulation control and abstracted narrative resolution. Manages the passage of abstract time during travel.
* **Scope:** Initiating/executing travel, navigation, hazard avoidance, advancing the Time Clock, resolving travel-related events. Excludes detailed combat maneuvering (Combat Module) and specific docking interactions (Interaction Module). Direct resource costs for travel are handled abstractly via the global WP Upkeep system triggered by the Time Clock.

## 2. Core Activities

* **Manual Flight:** Direct, real-time control of the ship (digital primary). Advances Time Clock at a baseline rate or during specific actions.
* **Abstracted Travel:** Narrative resolution for journeys using `Undertake Journey` or `Fast Transit`. Directly advances the Time Clock.

## 3. Manual Flight Mode

* **Description:** Simulation-focused flight allowing direct player control. Success primarily depends on player skill and ship performance stats. Default for detailed in-system activity (digital).
* **Narrative Integration:** Specific high-stakes moments (**Trigger Actions**) prompt resolution via the core **Action Check**. Player typically declares an **Action Approach** (`Act Risky`/`Act Cautiously`). Resolution uses Action Check (3d6 + Mod + FP) vs Thresholds, consulting appropriate outcome branch. Outcomes impact game state, potentially add **Time Units (TU)** to the Time Clock (especially Cautious delays/complications).
* **Focus Use:** **Focus Points (FP)** spent before Action Checks or for instant simulation boosts.
* **Time Cost:** Engaging in detailed manual flight for significant durations advances the **Time Clock** at a default rate (TBD) or specific actions might add TU.

## 4. Abstracted Travel Modes (Introduction)

* **Concept:** Methods for resolving travel narratively, offering choices in pacing and engagement. Primary travel methods in the Analogue Version. Directly impact the **Time Clock**. Specific mechanics detailed in Section 5.
* **Modes:** `Undertake Journey` (segment-by-segment) and `Fast Transit` (single-roll skip).

## 5. Module-Specific Mechanics

These mechanics resolve abstracted travel using the core Action Check system, incorporating Action Approaches and directly interfacing with the Time Clock.

* **5.1. `Undertake Journey` (Segment-by-Segment Resolution)**
    * **Purpose:** Standard abstracted travel, higher fidelity/event density.
    * **Trigger:** Resolving travel one segment at a time.
    * **Mechanic:** Player declares **Action Approach** (`Act Risky`/`Cautiously`) for the segment. Make one **Action Check** (3d6 + Piloting Mod + FP spend vs. Thresholds) per segment. Resolve outcome sequentially.
    * **Time Cost:** Each segment **adds +1 TU (base)** to the **Time Clock**. Cautious Complications or specific events may add additional TU.
    * **Outcomes & Events:** Roll result + Approach determines outcome via **Event System**. Risky approach trends toward more extreme positive/negative events; Cautious towards stability and potential TU delays. Failure typically interrupts journey and triggers Major Complication/Event.
* **5.2. `Fast Transit` (Single-Roll Skip)**
    * **Purpose:** Optional fast-forward mechanic for speed over detail.
    * **Trigger:** Player chooses to resolve an entire multi-segment route with one roll.
    * **Mechanic:** Player declares **Action Approach** (`Act Risky`/`Cautiously`). Make **one** **Action Check** (3d6 + Piloting Mod + FP spend vs. Thresholds) for the entire journey. Difficulty may adjust based on route.
    * **Time Cost:** Immediately **add +1 TU per segment skipped** to the **Time Clock** upon initiation. This may trigger one or more **World Event Ticks** (and associated WP Upkeep demands) upon resolution.
    * **Outcomes & Events:** Compressed results via **Event System**, severity influenced by Approach. Crit = clean arrival (+Focus). SwC = arrival + summarized Minor Comp. Failure = journey interrupted by Major Failure Event en route (+Lose Focus).

## 6. Module-Specific Progression (TBD)

* *(To Be Defined)* Potential for improving Piloting Mod, unlocking travel-related Asset Variations, tracking travel achievements (via global Progression System).

## 7. Key Mechanics Utilized (Global)

* **Action Check System:** Resolves Trigger Actions and Abstracted Travel.
* **Action Approach System:** Modifies outcome interpretation (`Risky`/`Cautious`).
* **Focus System (FP):** Provides agency via roll influence and buffs.
* **Time Clock System (TU):** Paces gameplay, triggers World Event Ticks. Advanced by travel and actions within this module.
* **Wealth Point System (WP):** Covers major costs; periodic Upkeep triggered by World Event Ticks covers abstract operational costs. Not directly spent *per segment* here.
* **Event System:** Provides narrative/mechanical outcomes for travel events/complications.

## 8. Interface with Other Systems/Modules

* **Transitions:** Enters/Exits from space scenes, docking (Interaction Module).
* **Triggers:** Can trigger Combat, Repair, Investigation based on Event System outcomes.
* **Outputs:** Advances Time Clock. Feeds data to Progression System (XP) and Chronicle System (history logging). Triggers World Event Ticks indirectly via Time Clock.

## 9. Analogue Version Notes

* Manual flight moments resolved via Action Checks with chosen Action Approach.
* Core travel uses player choice of **`Undertake Journey`** (segment-by-segment, advancing TU Clock each segment) or **`Fast Transit`** (single roll, advancing TU Clock upfront for all segments).
* Map essential. Track **Time Clock** and **WP** (for Upkeep during World Event Ticks). Relies on Event System tables/booklets.

## 10. UI/UX Notes (Digital)

* Clear mode indication (Manual/Abstracted).
* HUD for flight data & ship status. Map interface for route plotting.
* Clear prompts for Action Checks including **Action Approach choice**.
* UI for abstracted travel progress/outcomes. Visible **Focus Point** meter & spending options. Visible **Time Clock** progress. **WP** balance visible (likely global UI).
