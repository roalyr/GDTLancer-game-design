<!--
PROJECT: GDTLancer
MODULE: TACTICAL_TODO.md
STATUS: [Level 1 - Design Contract]
TRUTH_LINK: TRUTH_GDD-REVISION-LEDGER.md § REV_007, REV_008; TRUTH_PROJECT.md § Workflow And Scope Boundary
LOG_REF: 2026-06-13 07:45:00
-->

## CURRENT GOAL: Trading Module and Core Systems Dual-Currency Alignment

- TARGET_SCOPE: Align the Trading Module (`5.3-GDD-Module-Trading.md`) and Core Systems (`1.1-GDD-Core-Systems.md`) with the approved dual-currency system (electronic credits + physical specie) and trust-gated transaction routing doctrine (REV_007/REV_008). This resolves the outdated "Cash" terminology, updates stateless system APIs to use credits/specie, and documents how the trade interface handles payment instrument resolution.

- TARGET_FILES:
  - `1.1-GDD-Core-Systems.md` — Character System APIs and CharacterTemplate properties still reference legacy `cash` and `add_cash`/`subtract_cash`. Must be updated to `credits` and reference `commodity_specie` inventory tracking.
  - `5.3-GDD-Module-Trading.md` — Overview, core mechanics, and stats tables still use legacy "Cash" terminology and cargo-space assumptions. Must be updated to reflect electronic credits (outside matter budget, no cargo footprint) and physical specie (cargo commodity, inside matter budget).

- TRUTH_RELIANCE:
  - `TRUTH_GDD-REVISION-LEDGER.md § REV_007` — Dual-currency definitions, credit limits, and specie physical cargo characteristics.
  - `TRUTH_GDD-REVISION-LEDGER.md § REV_008` — Trust-gated routing resolving credit vs specie transactions using affinity score against `CREDIT_TRUST_THRESHOLD`.
  - `0.1-GDD-Main.md § 2` — Glossary definitions of Cash, Electronic Credits, and Physical Specie.

- DESIGN_CONSTRAINTS:
  - File names unchanged; no new GDD files created.
  - Retain standard page headers (Title, Version bumped, Date updated to 2026-06-13, Related Documents) on all modified files.
  - All modified files must get a UNIVERSAL HEADER (HTML comment) with version bump.
  - Cross-references must use the `See X.Y-GDD-*.md Section N` pattern.
  - Parity principle: economic mechanics must apply equally to player and NPC agents.

- OUT_OF_SCOPE:
  - Codebase modifications (GDD-only milestone).
  - Editing gameplay modules other than `5.3` (e.g., no edits to `5.1` or `5.2`).
  - Rewriting topology or map generation rules.

- PREAPPROVED_ADJACENT_FILES:
  - `README.md` — only if index version updates are needed.

- VERIFICATION_PLAN:
  - Verify all relative links in edited sections are valid.
  - Confirm `1.1-GDD-Core-Systems.md` no longer has legacy `cash` or `add_cash`/`subtract_cash` references in character systems or templates.
  - Confirm `5.3-GDD-Module-Trading.md` distinguishes clearly between credits and specie in the trade loop, pricing, and stats sections.
  - Confirm version/date headers updated on both files.

- ATOMIC_TASKS:
  - [x] TASK_1: Update `1.1-GDD-Core-Systems.md` Character System section — replace `cash` and `add_cash`/`subtract_cash` APIs with `credits` and `add_credits`/`subtract_credits` APIs. Update CharacterTemplate properties list to use `credits: int` instead of `cash: int`. Add a note referencing that physical specie is tracked as a standard cargo item via the Inventory System. Bump version to 5.1, date to 2026-06-13, and add the Universal Header.
  - [x] TASK_2: Update `5.3-GDD-Module-Trading.md` Section 1 (Overview) and Section 2 (Core Mechanic) — replace legacy "Cash" terms with dual-currency credits and physical specie. Explain that electronic credits have no cargo footprint, while physical specie occupies cargo space. Document the trust-gated transaction routing where affinity score vs `CREDIT_TRUST_THRESHOLD` determines the payment instrument.
  - [x] TASK_3: Update `5.3-GDD-Module-Trading.md` Section 5 (Required Phase 1 Stats) — update ship properties (cargo capacity fits specie, not credits) and system references (credits and specie instead of cash). Bump version to 3.1, date to 2026-06-13, and add the Universal Header.
  - [x] TASK_4: Update `README.md` index references if version numbers appear in index entries.
  - [x] VERIFICATION: Verify relative file link resolution; verify complete removal of legacy cash APIs from `1.1`; verify consistent usage of credits vs specie in `5.3`; check headers and timestamps.
