<!--
PROJECT: GDTLancer
MODULE: TACTICAL_TODO.md
STATUS: [Level 1 - Design Contract]
TRUTH_LINK: TRUTH_PROJECT.md § Workflow And Scope Boundary; TRUTH_PROJECT.md § Agent Parity Principle
LOG_REF: 2026-06-13 14:40:00
-->

## CURRENT GOAL: Qualitative Wealth Tiers and Tracks Integration

- TARGET_SCOPE: Replace the numeric wallet currency model (cash/credits) for the player with a 3-tier qualitative progression track system (Broke: 0–10, Comfortable: 0–10, Wealthy: 0–10) across all relevant GDD files. The player's wealth status determines commercial Action Check modifiers, purchase eligibility, and recovery states, aligning the player's experience with the simulation's qualitative tags while preserving the physical specie barter standard.

- TARGET_FILES:
  - `0.1-GDD-Main.md` — Glossary and introductory sections still refer to numeric electronic credits/cash. Glossary must be updated to define the 3-tier Wealth Tiers/Tracks and specify their relationship to physical specie.
  - `1-GDD-Core-Mechanics.md` — Core Resources (Section 6) and Failure & Recovery (Section 7) sections still describe numeric Cash, recovery costs, and zero-wealth states. Must be updated to the qualitative track mechanics.
  - `1.1-GDD-Core-Systems.md` — Character System APIs and CharacterTemplate properties still reference credits-based numeric integers. Must be updated to wealth progress/tier tracks and properties.
  - `5.3-GDD-Module-Trading.md` — Overview, core mechanics, and stats tables still reference credit-accumulation and pricing models. Must be updated to reflect qualitative wealth progression transactions.
  - `8-GDD-Simulation-Architecture.md` — Axiom 3 (Conservation of Value) and Section 4.1 (Agent parameters table) still use numeric cash/credits tracking. Must be aligned with the qualitative wealth tier standard.

- TRUTH_RELIANCE:
  - `TRUTH_GDD-REVISION-LEDGER.md § REV_001` — Qualitative simulation substrate is canonical.
  - `TRUTH_GDD-REVISION-LEDGER.md § REV_007` — Physical specie remains the matter-conserved cargo standard for low-trust or unaligned transactions.

- DESIGN_CONSTRAINTS:
  - File names unchanged; no new GDD files created.
  - Standard page headers must be preserved with updated version numbers (bumped to the next minor version) and date set to 2026-06-13.
  - Universal headers must be updated or added at the top of every modified file.
  - Parity principle: player wealth status tiers map directly to NPC qualitative status tags (e.g. Broke maps to POOR, Comfortable to ADEQUATE, Wealthy to RICH).

- OUT_OF_SCOPE:
  - Codebase modifications (GDD-only milestone).
  - Editing gameplay modules other than `5.3` and the minor recovery references in `5.2`.

- PREAPPROVED_ADJACENT_FILES:
  - `5.2-GDD-Module-Combat.md` — Update ship salvage and recovery reference in Section 3.
  - `6.1-GDD-Lore-Background.md` — Update high travel cost references in Section 2.
  - `6.2-GDD-Lore-Player-Onboarding.md` — Update tutorial reward references in Section 3.
  - `2.1-GDD-Development-Phase1-Scope.md` — Update Phase 1 starting wealth and UI milestones.
  - `3-GDD-Architecture-Coding.md` — Update code example calls (`CharacterSystem` APIs) in Section 2.3.
  - `README.md` — Update version markers in index if necessary.

- VERIFICATION_PLAN:
  - Verify all relative links in edited sections are valid.
  - Confirm complete removal of numeric credit/cash wallet variables on the player character sheet.
  - Confirm the 0–10 tracks (`Broke`, `Comfortable`, `Wealthy`) and their Action Check modifiers (-2, +0, +2) are defined consistently across `1` and `5.3`.
  - Confirm specie remains functional as physical cargo items that interact with the wealth tracks.

- ATOMIC_TASKS:
  - [x] TASK_1: Update `0.1-GDD-Main.md` — revise glossary entries for Cash and Electronic Credits to document their deprecation/replacement by the 3-tier wealth tracks; add glossary entries for "Wealth Tiers" and "Wealth Tracks". Update Section 3.1 to frame wealth qualitatively. Bump version to 4.2.
  - [x] TASK_2: Update `1-GDD-Core-Mechanics.md` — rewrite Section 6.1 (Cash/Currency) to define the three wealth tiers (Broke, Comfortable, Wealthy), their 0–10 tracks, and Action Check modifiers. Update Section 7 (Failure & Recovery) to reference qualitative wealth status (e.g., recovery cost consumes wealth progress, stranded/broke states). Bump version to 5.1.
  - [x] TASK_3: Update `1.1-GDD-Core-Systems.md` — replace Character System credits APIs with `gain_wealth_progress`, `lose_wealth_progress`, `get_wealth_tier`, and `get_wealth_progress`. Update CharacterTemplate properties to use `wealth_tier` and `wealth_progress`. Bump version to 5.2.
  - [x] TASK_4: Update `5.3-GDD-Module-Trading.md` — rewrite overview, economic loop, pricing, and stats to use wealth progress/tiers. Document how buying/selling commodities and physical specie cargo affects the wealth tracks. Bump version to 3.2.
  - [x] TASK_5: Update `8-GDD-Simulation-Architecture.md` — align Axiom 3 (Conservation of Value) with the qualitative player wealth tracks and NPC status tags. Update the Agent parameters table to replace `credits`/`cash_reserves` with `wealth_tier` and `wealth_progress`. Bump version to 2.2.
  - [x] TASK_6: Update adjacent files (`5.2`, `6.1`, `6.2`, `2.1`, `3`) to replace references to cash/credits with qualitative wealth progress or physical specie.
  - [x] VERIFICATION: Check link integrity and verify complete consistency of the qualitative wealth model.
