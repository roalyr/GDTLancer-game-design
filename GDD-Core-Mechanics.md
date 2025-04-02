# GDTLancer Core Mechanics Design

**Version:** 1.1
**Date:** April 2, 2025
**Related Documents:** GDTLancer Main GDD v1.5

## 1. Purpose

This document defines the fundamental, universally applied mechanics used throughout GDTLancer for resolving actions with uncertain outcomes and managing player agency via meta-resources. These mechanics provide a consistent foundation across all Gameplay Modules, Systems, and Layers.

## 2. Action Check

* **Purpose:** The fundamental mechanic for determining the outcome when an Agent attempts a **Trigger Action** – a specific action or reaction within a Gameplay Module where success is uncertain and failure has meaningful consequences.
* **Core Mechanic:** `3d6 + Module Modifier ≥ Thresholds` (Roll-Over system).
    * An Agent rolls three standard six-sided dice (3d6).
    * The relevant **Module Modifier** (see Section 3) for the current context is added to the sum of the dice.
    * **Focus Points (FP)** may be spent before the roll to further modify the total (see Section 5).
    * The final total is compared against defined Thresholds.
* **Standard Thresholds:** (Default values, potentially tunable per situation/difficulty)
    * **Failure:** Total < 10
    * **Success with Complication (SwC):** Total 10 – 13
    * **Critical Success:** Total ≥ 14
* **Outcome Summary:**
    * **Critical Success:** The action succeeds exceptionally well. Outcome details determined by chosen **Action Approach** (See Section 4) and specific action context. Typically grants +1 FP.
    * **Success with Complication:** The action succeeds, but with a cost or partial effect. Outcome details determined by chosen **Action Approach** and context.
    * **Failure:** The action fails. A negative consequence occurs. Outcome details determined by chosen **Action Approach** and context. Typically resets FP to 0.

## 3. Modifiers

* **Purpose:** Represent an Agent's proficiency and situational factors influencing their chance of success on an Action Check.
* **Primary Type: Module Modifier**
    * This is the main modifier applied to the Action Check roll.
    * It reflects the Agent's effectiveness with the currently active **Asset** within the current **Gameplay Module**.
    * **Derivation:** Calculated based on factors defined elsewhere (typically `Relevant Agent Skill + Asset Difficulty`). The specific calculation method belongs in the Character/Asset System design. The Module or Asset definition will specify which skills/stats are relevant.
    * **Contextual Value:** The value of the Module Modifier changes depending on the active Module and the Asset being used.
* **Situational Modifiers:** Temporary bonuses or penalties (+1/-1, rarely +/-2) might occasionally be applied from specific game effects (e.g., environmental conditions, temporary buffs/debuffs, outcomes of previous actions), but the Module Modifier is the core value.

## 4. Action Approach

* **Concept:** A declaration made by the player *before* making an applicable Action Check, indicating their stance towards risk for that specific action. This choice influences the *nature and severity* of the potential outcomes.
* **Function:** Declaring an Approach (`Act Risky` or `Act Cautiously`) does **not** change the dice roll, the Module Modifier, or the Thresholds. It directs the resolution to a different set or interpretation of outcomes based on the achieved result tier (Crit Success, SwC, Failure).
* **Approaches:**
    * **`Act Risky`**
        * **Intent:** Pushing limits, prioritizing maximum effect, speed, or potential gain over safety.
        * **General Outcome Flavor:** Critical Successes yield greater rewards or more significant positive effects. Successes with Complication might still achieve considerable progress but potentially invoke notable costs. Failures result in more severe negative consequences, setbacks, or damage.
    * **`Act Cautiously`**
        * **Intent:** Prioritizing safety, minimizing potential downsides, being thorough, accepting potentially slower or less impactful results.
        * **General Outcome Flavor:** Critical Successes provide reliable, positive results but perhaps less spectacular gains. Successes with Complication focus on mitigating harm or achieving the core goal with minimal negative fallout (potentially less progress). Failures result in less severe consequences (e.g., delay, wasted resources, minor setbacks rather than catastrophe).
* **Application:** The specific outcome details for each Approach + Result Tier combination are defined within the relevant Gameplay Module actions or Event System entries. Not all Action Checks may offer this choice; some situations might inherently demand a specific approach.

## 5. Focus Points (FP) (Meta-Resource)

* **Concept:** A spendable resource representing an Agent's luck, preparedness, determination, or narrative agency.
* **Gaining Focus:** Typically gain +1 FP upon achieving a **Critical Success** (≥ 14) on an Action Check.
* **Losing Focus:** Typically **Reset FP to 0** upon suffering a **Failure** (< 10) on an Action Check. *(Subject to tuning)*.
* **Maximum Cap:** Low cap (e.g., 3), preventing excessive accumulation.
* **Spending Focus:** Always an Agent's (Player's) choice when available.
    * **Narrative Boost (Instant):** Declare *before* making an Action Check. Spend 1, 2, or 3 FP to add +1 per point spent to the roll total. (Cannot spend more FP than currently held). This directly influences the chance of hitting different result tiers (Crit/SwC/Fail).
    * **Simulation Boost (Persistent):** Declare *upon entering* a specific Gameplay Module instance. Spend 1 FP to gain a defined passive benefit related to that module for its duration (effect ends when module instance concludes or is significantly interrupted).

