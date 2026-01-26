# GDTLancer - Core Mechanics

**Version:** 2.0
**Date:** January 26, 2026
**Related Documents:** 0.1-GDD-Main.md (v2.0)

## 1. Purpose

This document defines the game's core rules for resolving actions and managing key resources. These mechanics are used across all gameplay modules.

## 2. Action Check

Used for any action where the outcome is uncertain.

* **Core Mechanic:** `3d6 + Module Modifier`
* **Module Modifier:** `Relevant Skill + Asset Modifier +/- Situational Modifiers`
* **Thresholds (Neutral):** The roll's total determines the quality of the outcome.
    * **Critical Success (15+):** The action succeeds exceptionally well, providing a bonus.
    * **Success with Complication (11-14):** The action succeeds as intended, possibly with a minor complication.
    * **Failure (<11):** The action fails, often with a complication.
* **Note:** Thresholds vary by Action Approach. See Section 3.

## 3. Action Approach

A choice the player makes *before* rolling to influence the nature of the outcome.

* **Act Cautiously:** Prioritizes safety. A failure is less severe (e.g., lost time instead of damage), but a success offers no special bonus.
* **Act Risky:** Aims for a greater reward. A success is more effective or profitable, but a failure is more severe (e.g., critical damage instead of minor trouble).

### 3.1. Approach Thresholds

| Approach | Success With Complication | Critical Success |
|----------|---------------------------|------------------|
| Cautious | ≥10 | ≥14 |
| Neutral | ≥11 | ≥15 |
| Risky | ≥12 | ≥16 |

### 3.2. Platform Differences

* **Analogue:** Player always chooses Risky or Cautious before every Action Check.
* **Digital:** Approach choice is only prompted for **High-Stakes** actions. Narrative and Mundane actions use **Neutral** thresholds automatically. See `0.1-GDD-Main.md` Section 7 for Action Stakes classification.

## 4. Core Resources

These are the primary abstract resources players manage throughout the game.

### 4.1. Focus Points (FP) — *Analogue Only*

* **What it is:** Represents an agent's mental energy, luck, or willpower.
* **How it works:** Spend FP *before* an Action Check to add a +1 bonus to the roll per point spent.
* **How to gain:** Earned by completing goals, roleplaying well, or through specific actions and outcomes.
* **Digital Note:** FP is not used in the digital version. Dynamic gameplay and player skill/dexterity implicitly represent focus and engagement.

### 4.2. Wealth Points (WP) / Credits

* **What it is:** An abstract resource representing significant economic power. It is not granular cash, but a measure of major purchasing power.
* **How it works:** Used to buy ships and modules, pay for major repairs, and cover the periodic Upkeep cost.
* **How to gain:** Earned from completing jobs, selling valuable assets (salvage, data), and achieving major goals.
* **Platform Differences:**
    * **Analogue:** Uses abstract Wealth Points (WP).
    * **Digital:** Uses **Credits** (more granular currency). Internally may use conversion factor (e.g., 1 WP ≈ 1000 Credits) for design consistency.

### 4.3. Time Units (TU) / Real-Time Clock

* **What it is:** A measure of time for significant actions like traveling, repairing, or undertaking a mission.
* **How it works:** Spending time advances the **Time Clock**. When the clock fills, a **World Event Tick** occurs, advancing the world simulation.
* **Significance:** Time is a critical resource. The world changes and evolves independently of the player. Spending time on one opportunity means others may be lost.
* **Platform Differences:**
    * **Analogue:** Uses abstract Time Units (TU). Actions have explicit TU costs. Time Clock is a physical track.
    * **Digital:** Uses **real-time clock**. World Event Ticks occur at fixed real-time intervals (configurable, e.g., every 60 seconds of gameplay).
