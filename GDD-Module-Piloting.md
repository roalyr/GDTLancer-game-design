# GDTLancer Module Design: Piloting & Travel

**Version:** 1.1
**Date:** April 2, 2025
**Related Documents:** GDTLancer Main GDD v1.4, Core Mechanics GDD

## 1. Purpose & Scope

* **Module Name:** Piloting & Travel
* **Purpose:** Governs Agent ship movement within and between systems, supporting direct simulation control and abstracted narrative resolution.
* **Scope:** Initiating/executing travel, navigation, hazard avoidance, managing travel resources, resolving travel-related events. Excludes detailed combat maneuvering and specific docking interactions.

## 2. Core Activities

* **Manual Flight:** Direct, real-time control of the ship (digital primary).
* **Abstracted Travel:** Narrative resolution for journeys using `Undertake Journey` or `Fast Transit`.

## 3. Manual Flight Mode

* **Description:** Simulation-focused flight allowing direct player control. Success primarily depends on player skill and ship performance stats within the physics simulation. Default mode for detailed in-system activity (digital).
* **Narrative Integration:** Specific high-risk moments or declared actions trigger resolution using **Universal Narrative Moves** (detailed in Section 6 below), interfacing with the core **Action Check** mechanic and **Focus** resource.

## 4. Abstracted Travel Modes (Introduction)

* **Concept:** Methods for resolving travel narratively, offering choices in pacing. Primary travel methods in the Analogue Version. Specific mechanics detailed in Section 7.
* **Modes:** `Undertake Journey` (segment-by-segment) and `Fast Transit` (single-roll skip).

## 5. Module-Specific Resources

* **Fuel / Supplies:**
    * **Primary Resource:** Consumables essential for travel. Single or separate tracks.
    * **Consumption:** Deducted based on travel mode (`Undertake Journey`: per segment; `Fast Transit`: upfront total) and potential event outcomes. Clearly tracked.
    * **Depletion:** Running low restricts `Fast Transit` and increases risks during `Undertake Journey`.
    * **Replenishment:** Primarily handled via other modules (Trading, Docking). Rare travel events might offer minor replenishment.

## 6. Universal Moves in Context (Piloting & Travel)

This section details how the globally defined **Universal Narrative Moves** are typically applied within the Piloting & Travel module, resolved using the core **Action Check** system.

* **6.1. `Face Danger`**
    * **Common Triggers:** Reacting to sudden hazards (collision warnings, radiation bursts, system alerts during manual flight), pushing engines past safe limits, attempting extreme maneuvers declared by the player, resisting environmental effects (ion storms, gravity wells), recovering from a navigational error. Resolving specific outcomes from `Undertake Journey` Failures (e.g., "Hazard Encounter!").
    * **Typical Modifiers:** Piloting (for maneuvers), Tech/Engineering (for system strain/failures), sometimes Sensors (for detecting escape vector).
    * **Potential Outcome Hooks:**
        * *Crit Success:* Hazard avoided cleanly, system stabilized, course corrected perfectly. Gain Focus.
        * *Success w/ Comp:* Avoid primary danger but suffer consequence (e.g., `Apply Minor Hull Damage`, `Gain Status: Minor Engine Strain`, `Consume Extra Fuel`, `End in Disadvantageous Position`).
        * *Failure:* Suffer significant consequence (e.g., `Apply Major Hull Damage`, `Gain Status: System Offline [Engines/Nav]`, `Trigger Event: Lost in Hazard`, `Lose Significant Fuel`). Lose Focus.
* **6.2. `Secure an Advantage`**
    * **Common Triggers:** Proactively scanning a route for hazards/patrols before travel, plotting a risky but potentially faster course, calibrating sensors for a specific task, taking time to find optimal positioning before a tricky maneuver or docking approach (manual flight).
    * **Typical Modifiers:** Sensors (for scanning), Piloting (for positioning/route plotting), Tech (for system calibration).
    * **Potential Outcome Hooks:**
        * *Crit Success:* Gain 2 Advantage Tokens. Gain Focus. May reveal specific beneficial info (e.g., "Hazard ahead can be bypassed via small fissure").
        * *Success w/ Comp:* Gain 1 Advantage Token. May take extra time or consume minor resources.
        * *Failure:* No advantage gained. May waste time or slightly worsen starting position. Lose Focus.
    * **Advantage Tokens:** Can be spent for +1 on subsequent related Action Checks within this module (e.g., the `Face Danger` check when navigating the hazard you scanned).
* **6.3. `Gather Information`**
    * **Common Triggers:** Performing detailed scans of spatial anomalies, trying to identify distant ship signatures or origins, analyzing wreckage encountered, actively searching for specific navigational data or signals.
    * **Typical Modifiers:** Sensors, potentially Tech (for decryption/deep scanning).
    * **Potential Outcome Hooks:**
        * *Crit Success:* Gain detailed, reliable information + potential insight/opportunity (e.g., "Derelict signature identified as known missing freighter; logs may be intact"). Gain Focus.
        * *Success w/ Comp:* Gain partial or slightly unreliable info (e.g., "Ship identified, but origin unclear"), scan takes significant time/fuel, or your scan is detected.
        * *Failure:* Gain no useful info or misleading info. May trigger hostile reaction if scan detected. Lose Focus.

## 7. Module-Specific Mechanics

These mechanics provide structured ways to resolve abstracted travel using the core Action Check system.

* **7.1. `Undertake Journey` (Segment-by-Segment Resolution)**
    * **Purpose:** Standard abstracted travel, higher fidelity/event density.
    * **Trigger:** Resolving travel one segment at a time.
    * **Mechanic:** Make one **Action Check** (3d6 + Piloting Mod vs. Thresholds) per segment. Resolve outcome sequentially. Consume 1 Fuel/Supply per segment (base).
    * **Potential Outcome Hooks:**
        * *Crit Success (≥ 14):* Arrive smoothly. `Gain +1 Focus`. Optional check for Minor Positive Event (`Trigger Event System: Minor Positive Travel`).
        * *Success w/ Comp (10-13):* Arrive. `Trigger Event System: Minor Travel Complication` (Hooks might include: `+1 Time Unit`, `Consume +1 Fuel`, `Gain Status: Minor Sensor Glitch`, `Log Narrative Detail`).
        * *Failure (< 10):* Issue! `Lose Focus`. `Trigger Event System: Major Travel Complication` (Hooks might include: `Trigger Module: Combat`, `Trigger Check: Face Danger (Tech/Pilot)`, `Status: Lost`, `Lose d3+1 Fuel`). Journey likely interrupted.
* **7.2. `Fast Transit` (Single-Roll Skip)**
    * **Purpose:** Optional fast-forward mechanic for speed over detail.
    * **Trigger:** Player chooses to resolve an entire multi-segment route with one roll.
    * **Mechanic:** Make **one** **Action Check** (3d6 + Piloting Mod vs. Thresholds) for the journey. Difficulty may adjust based on route length/hazards.
    * **Prerequisite:** Requires sufficient Fuel/Supplies (calculated upfront).
    * **Potential Outcome Hooks:**
        * *Crit Success (≥ 14 adj.):* Arrive at destination. `Gain +1 Focus`. `Log Narrative Detail: Smooth Trip`.
        * *Success w/ Comp (10-13 adj.):* Arrive at destination. `Trigger Event System: Summarized Minor Complication` (Hooks might include: `Consume Additional 5% Total Fuel`, `Gain Status: Minor System Strain`, `Log Narrative Detail: Uneventful but taxing trip`).
        * *Failure (< 10 adj.):* DO NOT arrive at destination. `Lose Focus`. `Trigger Event System: Major Travel Failure` (Hooks must define *where* along route & *what* the situation is, e.g., `Set Location: Hazard Zone X`, `Trigger Module: Combat (Ambush)`, `Gain Status: Major Engine Failure`).

## 8. Module-Specific Progression (TBD)

* *(To Be Defined)* Potential for improving Piloting Mod, unlocking travel-related ship perks/modules (via global Progression System), tracking travel achievements.

## 9. Key Mechanics Utilized (Global)

* **Action Check System:** Resolves all Trigger Actions and Abstracted Travel mechanics.
* **Focus System:** Provides player agency via roll influence and buffs.
* **Resource Management:** Tracks Fuel/Supplies.
* **Event System:** Provides narrative and mechanical outcomes for Abstracted Travel results.

## 10. Interface with Other Systems/Modules

* **Transitions:** Enters/Exits from space scenes, docking sequences (Interaction Module).
* **Triggers:** Can trigger Combat, Repair, Investigation based on Event System outcomes.
* **Outputs:** Travel data feeds Progression System (XP) and Chronicle System (history logging).

## 11. Analogue Version Notes

* Manual flight moments use relevant **Universal Moves** via Action Checks.
* Core travel uses player choice of **`Undertake Journey`** (segment-by-segment) or **`Fast Transit`** (single roll). Map and resource tracking are essential.

## 12. UI/UX Notes (Digital)

* Clear mode indication. HUD for flight data & resources. Map interface for route planning & abstraction initiation. Clear Action Check prompts. UI for abstracted travel progress/outcomes. Visible Focus meter/options.

