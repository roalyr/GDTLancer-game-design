# GDTLancer Core Mechanics Design

**Version:** 1.3
**Date:** May 16, 2025
**Related Documents:** GDTLancer Main GDD v1.7

## 1. Purpose

This document defines the fundamental, universally applied mechanics used throughout GDTLancer for resolving actions, managing core resources (Focus, Wealth, Time), pacing events, and guiding player agency. These mechanics provide a consistent foundation across all Gameplay Modules, Systems, and Layers.

## 2. Action Check

* **Purpose:** The fundamental mechanic for determining the outcome when an Agent attempts a **Trigger Action** – where success is uncertain and failure has meaningful consequences.
* **Core Mechanic:** `3d6 + Module Modifier ≥ Thresholds` (Roll-Over system).
    * Roll 3d6.
    * Add the relevant **Module Modifier** (See Section 3).
    * **Focus Points (FP)** may be spent before the roll to modify the total (See Section 7).
    * Compare final total against defined Thresholds.
* **Standard Thresholds:** (Default values, tunable)
    * **Failure:** Total < 10
    * **Success with Complication (SwC):** Total 10 – 13
    * **Critical Success:** Total ≥ 14
* **Outcome Summary:**
    * **Critical Success:** Action succeeds exceptionally well. Outcome details influenced by **Action Approach** (See Section 6) and context. Typically grants +1 FP. May impact **Time Clock** or **WP**.
    * **Success with Complication:** Action succeeds, but with a cost/partial effect. Outcome details influenced by **Action Approach** and context. May impact **Time Clock** or **WP**.
    * **Failure:** Action fails with negative consequences. Outcome details influenced by **Action Approach** and context. Typically resets FP to 0. May impact **Time Clock** or **WP**.

## 3. Modifiers

* **Purpose:** Represent Agent proficiency and situational factors influencing Action Check success chance.
* **Primary Type: Module Modifier**
    * Main modifier applied to the Action Check roll.
    * Reflects Agent effectiveness with the active **Asset** within the current **Gameplay Module**.
    * **Derivation:** Calculated from `Relevant Agent Skill + Asset Difficulty` (details in Character/Asset Systems).
    * **Contextual Value:** Changes based on active Module and Asset.
* **Situational Modifiers:** Temporary +/- 1 (rarely +/- 2) from specific effects may occasionally apply.

## 4. Time Clock & Time Units (TU)

* **Purpose:** Tracks the abstract passage of time, paces gameplay, and triggers background world events. Replaces granular timekeeping (hours/days) and direct tracking of basic consumables like fuel/supplies for operational pacing.
* **Unit:** Time Unit (TU). Represents an abstract block of significant activity time.
* **Tracking:** Via the **Time Clock**, a segmented track (e.g., 8 segments). Mark off segments as TU are spent.
* **Gaining/Spending TU:**
    * Travel segments (`Undertake Journey`, `Fast Transit` segment equivalents) cost a base amount of TU (e.g., +1 TU per segment).
    * Downtime activities (repair, research) have defined TU costs.
    * Certain **Action Check** outcomes, especially **Cautious** Complications or Failures, add +TU (representing delays, careful work).
* **World Event Tick:**
    * **Trigger:** Occurs automatically when the Time Clock fills completely.
    * **Effects:**
        1. Resolves background world events/Agent progress via the **Event System**.
        2. Requires the Player/Agent to pay **WP Upkeep** (see Section 5).
        3. Resets the Time Clock to 0.
    * **Frequency:** The rate depends on how quickly actions consuming TU are performed. Fast Transit rapidly advances the clock.

## 5. Wealth Points (WP)

* **Purpose:** Represents an Agent's significant economic resources and purchasing power, abstracting detailed currency and basic logistics costs.
* **Scale:** Tracked as small integers (e.g., starting 3 WP). Avoids large numbers.
* **Conceptual Baseline:** 1 WP notionally equivalent to the value of a substantial quantity of a universal commodity (e.g., bulk refined fuel shipment).
* **Usage:**
    * **Major Costs:** Purchasing Assets (ships, modules, property), significant services (major repairs, hiring specialists), large bribes.
    * **Bulk Goods:** Acquiring large quantities of trade goods or restocking abstracted operational supplies (if needed beyond Upkeep).
    * **Upkeep:** Periodic WP cost required when the **World Event Tick** occurs, representing abstracted fuel, supplies, maintenance, crew costs, etc. Cost scales based on assets/circumstances.
    * **Routine Expenses:** Minor costs (docking fees, meals, small ammo) are generally *not* tracked via WP unless WP is critically low (near 0), implying inability to cover basics.
* **Gaining WP:** Mission rewards, selling valuable assets/cargo/data, Goal completion.
* **Low WP Consequences:** Inability to pay Upkeep leads to negative effects (debt, asset degradation, forced risky actions). Difficulty affording even routine items may trigger Action Checks.

## 6. Action Approach

* **Concept:** Player declaration (`Act Risky` or `Act Cautiously`) before an applicable Action Check, influencing outcome nature/severity.
* **Function:** Directs resolution to different outcome interpretations based on the achieved result tier (Crit/SwC/Fail). Does *not* change the roll or Thresholds.
* **Approaches:**
    * **`Act Risky`:** Aims for maximum gain/speed; potential for greater rewards on success, harsher consequences on failure.
    * **`Act Cautiously`:** Prioritizes safety/reliability; outcomes focus on minimizing loss, less spectacular successes, less severe failures (often involving TU delays).
* **Application:** Specific outcome branches defined in Module GDDs or Event System entries.

## 7. Focus Points (FP) (Meta-Resource)

* **Concept:** Spendable resource representing luck, determination, or narrative agency.
* **Gaining:** +1 FP on Action Check **Critical Success** (≥ 14).
* **Losing:** **Reset FP to 0** on Action Check **Failure** (< 10). *(Subject to tuning)*.
* **Maximum Cap:** Low cap (e.g., 3).
* **Spending:** Always player choice when available.
    * **Narrative Boost:** Before Action Check, spend 1-3 FP for +1 per point to roll total.
    * **Simulation Boost:** Upon entering Module instance, spend 1 FP for persistent passive benefit during that instance.
