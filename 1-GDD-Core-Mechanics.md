<!--
PROJECT: GDTLancer
MODULE: 1-GDD-Core-Mechanics.md
STATUS: [Level 2 - Implementation]
TRUTH_LINK: TRUTH_GDD-REVISION-LEDGER.md § REV_001
LOG_REF: 2026-06-13 19:50:00
-->

# GDTLancer - Core Mechanics

**Version:** 5.6
**Date:** 2026-06-13
**Related Documents:** [0.1-GDD-Main.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/0.1-GDD-Main.md) (v4.11), [8-GDD-Simulation-Architecture.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/8-GDD-Simulation-Architecture.md) (v2.5)

## 1. Purpose

Defines the universal rules for resolving actions and managing core resources. Used across all gameplay modules.

## 2. Action Categories

Player actions fall into two distinct categories:

### 2.1. Skill Actions (Real-Time)

Actions resolved by real-time player performance. The outcome is authoritative — no dice roll overrides it.

* **Examples:** Ship combat, flight challenges, manual docking.
* **Outcome:** Determined entirely by player skill and ship stats during the real-time gameplay segment.

### 2.2. Narrative Actions (Dice-Resolved)

Actions resolved by the Action Check mechanic. Used for social, economic, and situational decisions where the outcome depends on character capability rather than player reflexes.

* **Examples:** Negotiations, trade deals, information gathering, post-event assessments.
* **Outcome:** `3d6 + Module Modifier` against thresholds.
* **Presentation:** Implicit (auto-resolved, result shown as toast/log) or Explicit (full dice UI with Approach choice), depending on Action Stakes.

### 2.3. Special Followup Triggers

A Skill Action may trigger a Narrative Action *only* when a significant followup decision presents itself — e.g., deciding what to do with wreckage after a combat victory. The Skill Action outcome stands; the Narrative Action resolves the *consequence choice*, not the skill performance.

## 3. Action Check

Used for Narrative Actions with an uncertain outcome.

* **Core Mechanic:** `3d6 + Module Modifier`
* **Module Modifier:** `Relevant Skill + Equipment Modifier +/- Situational Modifiers`

### 3.1. Thresholds

| Approach | Success With Complication | Critical Success |
|----------|---------------------------|------------------|
| Cautious | ≥10 | ≥14 |
| Neutral | ≥11 | ≥15 |
| Risky | ≥12 | ≥16 |

**Failure:** Any roll below the Success threshold.

## 4. Action Approach

A choice made *before* rolling that shifts the risk/reward curve. Only offered for **High-Stakes** Narrative Actions.

* **Act Cautiously:** Failure is less severe; success offers no bonus.
* **Act Risky:** Success is more rewarding; failure is more severe.

## 5. Action Stakes (Digital)

Narrative Actions are classified by stakes tier (hardcoded in `action_*.tres` templates):

| Stakes | UI | Approach Choice | Dice Display |
|--------|-----|-----------------|--------------|
| **High-Stakes** | Full modal | Yes (Risky/Cautious) | Animated roll |
| **Narrative** | Brief toast | No (Neutral auto) | Quick toast |
| **Mundane** | Log only | No (Neutral auto) | Hidden |

## 6. Core Resources

### 6.1. Wealth Tiers & Tracks (Personal Wealth)

* Personal wealth is represented by three qualitative **Wealth Tiers**: **Broke**, **Comfortable**, and **Wealthy**.
* Each tier contains a 0–10 **Wealth Track** representing the player's progression within that tier.
* **Gaining Wealth:** Gaining rewards or completing transport/delivery contracts increments progress on the current track. Reaching 10 on the current track promotes the player to 0 of the next higher tier (Broke 10 → Comfortable 0).
* **Spending Wealth:** Repairing assets, purchasing ship equipment, or paying recovery costs decrements progress. Dropping below 0 demotes the player to 10 of the next lower tier (Comfortable 0 → Broke 10).
* **Action Check Modifiers:** The active Wealth Tier applies a modifier to commercial and social Action Checks:
  - **Broke:** -2 modifier. Refined metals/commodities are expensive; agents are suspicious of your insolvency.
  - **Comfortable:** +0 modifier. Standard pricing and relationship reactions.
  - **Wealthy:** +2 modifier. Better leverage in negotiations; elite service access.
* **Personal Wealth Progression:** Fulfilling contracts directly updates the player's active wealth track progress based on the Contract Value Class (Low, Mid, High) of the task completed (see [5.3-GDD-Module-Trading.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/5.3-GDD-Module-Trading.md) Section 2).

### 6.2. Time

* Real-time clock. World Event Ticks fire at `Constants.TIME_TICK_INTERVAL_SECONDS`.
* Time is a critical resource — the world evolves independently of the player.
* Each tick triggers: Grid CA updates (including extraction from finite Resource Potential Map) → Bridge Systems (entropy, heat) → Agent processing → Chronicle capture.

## 7. Failure & Recovery

Loss is **substantial but not terminal** — part punishment, part opportunity.

### 7.1. Ship Disabled (Hull → 0)

<!-- Reimplementation postponed -->

### 7.2. Resource Depletion

<!-- Reimplementation postponed -->

### 7.3. True Game Over

True game over requires a **convergence of multiple failures** — not a single bad roll or fight. The player must reach a state where recovery paths are exhausted (e.g., disabled with Broke at 0 progress, hostile standings with all factions, no Contacts willing to help). This is intentionally difficult to achieve.

