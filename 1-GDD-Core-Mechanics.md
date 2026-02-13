# GDTLancer - Core Mechanics

**Version:** 5.0
**Date:** February 13, 2026
**Related Documents:** `0.1-GDD-Main.md` (v4.0), `8-GDD-Simulation-Architecture.md`

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

### 6.1. Cash (Hard Currency)

* Physical commodity money — standardized refined metal units. There is no fiat currency (**Axiom 3**, `8-GDD` Section 1.3).
* Total Cash in the universe is finite and materially grounded: the monetary mass equals the physical resource mass allocated as medium of exchange.
* Used for inter-faction and universal trade: ships, equipment, repairs (which consume materials from station stockpiles), and services.
* Earned from trade (buying/selling commodities), salvage (reclaiming disabled ships and their cargo), and goal completion rewards.
* Cash can be physically carried (in cargo) or stored at stations. Cargo Cash is at risk during combat.

### 6.2. Loyalty Points (LP)

* Per-faction contribution credit. Earned by completing faction-aligned work (contracts, reputation milestones).
* Spent at faction-specific services: discounted repairs, exclusive equipment, priority docking, faction intel.
* Finite supply per faction per period — tracked by player contribution, not infinitely farmable.
* **Phase 1:** LP is a stub counter. Displayed in Contact/Faction panels but with limited spending options.

### 6.3. Time

* Real-time clock. World Event Ticks fire at `Constants.TIME_TICK_INTERVAL_SECONDS`.
* Time is a critical resource — the world evolves independently of the player.
* Each tick triggers: Grid CA updates (including extraction from finite Resource Potential Map) → Bridge Systems (entropy, heat) → Agent processing → Chronicle capture.

## 7. Failure & Recovery

Loss is **substantial but not terminal** — part punishment, part opportunity.

### 7.1. Ship Disabled (Hull → 0)

* Ship is disabled, not destroyed (Preservation Convention).
* The disabled ship persists in the sector as a **salvageable wreck** (`8-GDD` Section 3.7) containing its cargo and equipment.
* Player is recovered to the nearest station. Recovery costs Cash (proportional to distance) or may be free if a Contact intervenes.
* **Salvage:** Any agent (including the player, if they return) can attempt to claim or repair the wreck. If you can repair it, it's yours. Wrecks degrade over time via entropy — unclaimed wrecks eventually become debris, returning matter to the Resource Potential Map.
* **Opportunity:** Recovery event may trigger unique Narrative Actions (rescued by a Contact, indebted to a faction, discovered something during drift).

### 7.2. Resource Depletion

* **Cash at 0:** Player can still fly and trade but cannot purchase services or equipment. NPCs may offer emergency work (low-pay, high-risk goals). Salvage is always available as a recovery path.
* **Propellant at 0:** Ship is stranded. Distress beacon triggers a recovery event (see 7.1).

### 7.3. True Game Over

True game over requires a **convergence of multiple failures** — not a single bad roll or fight. The player must reach a state where recovery paths are exhausted (e.g., disabled with zero Cash, hostile standings with all factions, no Contacts willing to help). This is intentionally difficult to achieve.

* **Phase 1:** True game over is not implemented. Player is always recoverable via mentor NPC or emergency bailout.
