# GDTLancer Module Design: Piloting & Travel

**Version:** 1.2
**Date:** April 2, 2025
**Related Documents:** GDTLancer Main GDD v1.5, Core Mechanics Design v1.1

## 1. Purpose & Scope

* **Module Name:** Piloting & Travel
* **Purpose:** Governs Agent ship movement within and between systems, supporting direct simulation control and abstracted narrative resolution.
* **Scope:** Initiating/executing travel, navigation, hazard avoidance, managing travel resources, resolving travel-related events. Excludes detailed combat maneuvering (Combat Module) and specific docking interactions (Interaction Module).

## 2. Core Activities

* **Manual Flight:** Direct, real-time control of the ship (digital primary).
* **Abstracted Travel:** Narrative resolution for journeys using `Undertake Journey` or `Fast Transit`.

## 3. Manual Flight Mode

* **Description:** Simulation-focused flight allowing direct player control. Success primarily depends on player skill and ship performance stats within the physics simulation. Default mode for detailed in-system activity (digital).
* **Narrative Integration:** Specific high-risk moments or player-declared risky actions (**Trigger Actions**) prompt resolution via the core **Action Check** mechanic.
    * **Player Choice:** When facing such a Trigger Action (e.g., navigating dense asteroids, pushing engines), the player typically declares an **Action Approach** (`Act Risky` or `Act Cautiously`).
    * **Resolution:** An Action Check (3d6 + Piloting or Tech Mod + FP spend) is made. The result tier (Crit Success, SwC, Failure) combined with the chosen Approach determines the specific outcome and its severity (defined by event outcomes or module-specific rules).
    * **Focus Use:** Players can spend **Focus Points (FP)** before the Action Check to influence the roll result.

## 4. Abstracted Travel Modes (Introduction)

* **Concept:** Methods for resolving travel narratively, offering choices in pacing. Primary travel methods in the Analogue Version. Specific mechanics detailed in Section 6.
* **Modes:** `Undertake Journey` (segment-by-segment) and `Fast Transit` (single-roll skip).

## 5. Module-Specific Resources

* **Fuel / Supplies:**
    * **Primary Resource:** Consumables essential for travel.
    * **Consumption:** Deducted based on travel mode (`Undertake Journey`: per segment; `Fast Transit`: upfront total) and potentially modified by event outcomes.
    * **Depletion:** Running low restricts `Fast Transit` and adds tension.
    * **Replenishment:** Primarily handled via other modules; rare travel events might offer minor replenishment.

## 6. Module-Specific Mechanics

These mechanics provide structured ways to resolve abstracted travel using the core Action Check system, incorporating player choice via Action Approaches.

* **6.1. `Undertake Journey` (Segment-by-Segment Resolution)**
    * **Purpose:** Standard abstracted travel, higher fidelity/event density.
    * **Trigger:** Resolving travel one segment at a time.
    * **Mechanic:** Player declares **Action Approach** (`Act Risky` or `Act Cautiously`) for the segment. Make one **Action Check** (3d6 + Piloting Mod + FP spend vs. Thresholds) per segment. Resolve outcome sequentially. Consume 1 Fuel/Supply per segment (base).
    * **Outcomes & Events:** The combination of the roll result (Crit/SwC/Fail) and chosen Approach determines the outcome severity via the **Event System**:
        * *Risky Approach:* Higher potential for positive events/discoveries on Crit Success, but Major Complications on Failure tend to be more severe (e.g., dangerous ambushes, critical malfunctions).
        * *Cautious Approach:* More stable outcomes. Crits might be less spectacular positive events. Failures trigger less severe Major Complications (e.g., significant delays, moderate resource loss, forced detour instead of direct threat). Success w/ Comp focuses on minimizing negative fallout.
* **6.2. `Fast Transit` (Single-Roll Skip)**
    * **Purpose:** Optional fast-forward mechanic for speed over detail.
    * **Trigger:** Player chooses to resolve an entire multi-segment route with one roll.
    * **Mechanic:** Player declares **Action Approach** (`Act Risky` or `Act Cautiously`) for the entire journey. Make **one** **Action Check** (3d6 + Piloting Mod + FP spend vs. Thresholds). Difficulty may adjust based on route length/hazards.
    * **Prerequisite:** Requires sufficient Fuel/Supplies (calculated upfront).
    * **Outcomes & Events:** Compressed results, severity influenced by Approach:
        * *Crit Success:* Arrive efficiently. +1 FP. (Risky might grant additional minor bonus).
        * *Success w/ Comp:* Arrive. Trigger **Event System** for *one* summarized Minor Complication (severity/type influenced by Approach).
        * *Failure:* DO NOT arrive. Lose Focus. Trigger **Event System** for *one* Major Failure Event (severity/location influenced by Approach), placing Agent in a new situation en route.

## 7. Module-Specific Progression (TBD)

* *(To Be Defined)* Potential for improving Piloting Mod via the Character System, unlocking travel-related Asset Variations via the Asset System, tracking travel achievements.

## 8. Key Mechanics Utilized (Global)

* **Action Check System:** Resolves Trigger Actions and Abstracted Travel mechanics.
* **Action Approach System:** Modifies outcome interpretation based on player choice (`Risky`/`Cautious`).
* **Focus System:** Provides player agency via roll influence and buffs.
* **Resource Management:** Tracks Fuel/Supplies.
* **Event System:** Provides narrative and mechanical outcomes for travel events, influenced by Action Approach.

## 9. Interface with Other Systems/Modules

* **Transitions:** Enters/Exits from space scenes, docking interfaces (Interaction Module).
* **Triggers:** Can trigger Combat, Repair, Investigation based on Event System outcomes.
* **Outputs:** Feeds data to Progression System (XP) and Chronicle System (history logging).

## 10. Analogue Version Notes

* Manual flight moments are resolved via **Action Checks** with player choosing **Action Approach**.
* Core travel uses player choice of **`Undertake Journey`** (segment-by-segment) or **`Fast Transit`** (single roll), both involving Action Approach declaration influencing outcomes from Event tables.
* Map and resource tracking are essential.

## 11. UI/UX Notes (Digital)

* Clear mode indication (Manual/Abstracted).
* HUD for flight data & resources.
* Map interface for route plotting & abstraction initiation.
* Clear prompts for Action Checks, including **choice of Action Approach (`Risky`/`Cautious`)**.
* UI for abstracted travel progress/outcomes. Visible Focus meter/options.

