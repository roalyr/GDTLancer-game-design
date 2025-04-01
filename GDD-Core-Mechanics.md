# GDTLancer Core Mechanics Design

**Version:** 1.0
**Date:** April 1, 2025
**Related Documents:** GDTLancer Main GDD v1.4

## 1. Purpose

This document defines the core, universally applied mechanics used throughout GDTLancer for resolving actions with uncertain outcomes and managing player agency via meta-resources. These mechanics provide a consistent foundation across all Gameplay Modules, Systems, and Layers for both digital and analogue versions.

## 2. Action Check

* **Purpose:** The fundamental mechanic for determining the outcome when an Agent (Player or NPC) attempts a **Trigger Action** – a task where success is uncertain and failure has consequences.
* **Core Mechanic:** `3d6 + Modifier ≥ Thresholds` (Roll-Over system).
    * An Agent rolls three standard six-sided dice (3d6).
    * The relevant Modifier (see Section 3) is added to the sum of the dice.
    * The total is compared against defined Thresholds.
* **Standard Thresholds:** (Default values, potentially tunable per situation/difficulty)
    * **Failure:** Total < 10
    * **Success with Complication:** Total 10 – 13
    * **Critical Success:** Total ≥ 14
* **Outcome Summary:**
    * **Critical Success:** The action succeeds exceptionally well, often yielding a bonus effect or advantage. Typically grants Focus.
    * **Success with Complication:** The action succeeds, but at a cost – a minor negative consequence, partial success, unintended side effect, delay, or resource expenditure occurs. Does not grant or cost Focus typically.
    * **Failure:** The action fails. A negative consequence occurs, potentially significant. Typically results in losing Focus.

## 3. Modifiers

* **Purpose:** Represent an Agent's inherent capabilities (stats, skills) or temporary situational factors influencing their chance of success on an Action Check.
* **Source:** Primarily derived from Agent stats or specific skill ratings relevant to the action being attempted (e.g., Piloting, Tech, Social). Situational factors (equipment, environment, preparation) might grant temporary modifiers in specific cases.
* **Application:** Added directly to the sum of the 3d6 roll before comparing to Thresholds.
* **Typical Range:** Base modifiers from stats/skills generally range from +0 to +3 initially.

## 4. Focus (Meta-Resource)

* **Concept:** A spendable resource representing an Agent's luck, preparedness, determination, or narrative agency, allowing them to influence outcomes.
* **Gaining Focus:** Typically gain +1 Focus upon achieving a **Critical Success** (≥ 14) on an Action Check. Other specific game events or rewards might occasionally grant Focus.
* **Losing Focus:** Typically **Reset Focus to 0** upon suffering a **Failure** (< 10) on an Action Check. *(This reset mechanic makes Focus valuable and its loss significant; subject to tuning)*. Specific events might also cost Focus.
* **Maximum Cap:** Agents have a maximum Focus cap, initially low (e.g., 3). This prevents hoarding and encourages tactical spending.
* **Spending Focus:** Spending Focus is always an Agent's (primarily Player's) choice when available.
    * **Narrative Boost (Instant):** Declare *before* making an Action Check. Spend 1, 2, or 3 Focus points to add +1 per point spent to the subsequent roll total (e.g., spending 2 Focus adds +2 to the roll). Cannot spend more Focus than currently held or the maximum cap allows per roll if limited.
    * **Simulation Boost (Persistent):** Declare *upon entering* a specific Gameplay Module instance (e.g., starting a mining session, initiating combat). Spend 1 Focus to gain a defined passive benefit related to that module for its duration. Requires clear UI indication; effect ends when the module instance concludes.

## 5. Universal Narrative Moves

* **Concept:** A core set of named actions representing common approaches to overcoming challenges or interacting with the world, applicable across various Gameplay Modules. They are resolved using the **Action Check** mechanic, with the specific Modifier determined by the context. (Distinct from Module-Specific Mechanics defined within Module GDDs).
* **Core Moves:**
    * **`Face Danger`**
        * **Trigger:** Acting under pressure, reacting to immediate threats, pushing through hazardous situations, resisting adverse effects. The default move for risky actions not covered by others.
        * **Modifier:** Contextual (Piloting for dodging, Tech for system strain, Athletics for physical danger, Resolve for resisting fear/coercion, etc.).
        * **Outcomes:** Standard Action Check results (Crit Success, Success w/ Comp, Failure) determine success level and consequences relevant to the specific danger.
    * **`Secure an Advantage`**
        * **Trigger:** Proactive effort to gain a better position, prepare for a future action, create an opportunity, or gather leverage before acting decisively.
        * **Modifier:** Contextual (Sensors for scanning, Piloting for positioning, Social for schmoozing, Tech for prepping gear, etc.).
        * **Outcomes (Example):**
            * *Crit Success (≥ 14):* Gain +2 **Advantage Tokens**. Gain +1 Focus.
            * *Success w/ Comp (10-13):* Gain +1 **Advantage Token**.
            * *Failure (< 10):* Effort fails, potentially with minor cost/complication. Lose Focus.
        * **Advantage Token:** A spendable token granting +1 to a *future related* Action Check roll. Max hold limit might apply.
    * **`Gather Information`**
        * **Trigger:** Actively seeking hidden or non-obvious knowledge – scanning, investigating, researching, asking questions, observing closely.
        * **Modifier:** Contextual (Sensors, Investigation, Social, Streetwise, Tech, etc.).
        * **Outcomes:** Standard Action Check results determine the quality, completeness, and potential cost/consequences of the information obtained (e.g., Success w/ Comp might yield partial info or attract attention).

* **Application Notes:** The specific triggers, applicable modifiers, and detailed consequences/complications for these moves within different Gameplay Modules should be outlined in the respective Module GDD pages. This section defines their core universal function.

