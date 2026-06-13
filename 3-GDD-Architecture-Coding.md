<!--
PROJECT: GDTLancer
MODULE: 3-GDD-Architecture-Coding.md
STATUS: [Level 2 - Implementation]
TRUTH_LINK: TRUTH_GDD-REVISION-LEDGER.md § REV_001
LOG_REF: 2026-06-13 23:57:00
-->

# GDTLancer - Coding Standards & Architecture Guide

**Version:** 3.4
**Date:** 2026-06-13
**Related Documents:** [0.1-GDD-Main.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/0.1-GDD-Main.md) (v4.13), [8-GDD-Simulation-Architecture.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/8-GDD-Simulation-Architecture.md) (v2.8)

## 1. Engine & Language

* **Engine:** Godot Engine v3.x
* **GUT version:** 7.4.3
* **Renderer:** GLES2 (performance & compatibility)
* **Language:** GDScript (static typing hints where beneficial)

## 2. Core Philosophy

* **KISS:** Prefer simpler implementations. Clarity over excessive abstraction.
* **Modularity:** Split scripts exceeding ~300 lines. Structure around:
    * **Modules** (horizontal activity loops): Piloting, Contracting, Contacts.
    * **Systems** (cross-cutting rulesets): Events, Goals, Assets, etc.
* **Simulation Foundation + Narrative Layer:** Build core gameplay around simulation. Layer narrative mechanics (Action Checks, Events, Goals) on top.
* **Reusability:** Leverage Godot scene instancing and Resources.
* **Decoupling:** Minimize hard dependencies. Use `EventBus` for signaling. Use `GlobalRefs` only for essential unique managers.
* **Adhere to architecture.** No redundant code. Follow established patterns (Autoloads, Resources, data-logic separation).

## 3. Code Formatting

* **Formatter:** `gdformat` for uniform style.
* **Indentation:** Tabs.
* **Line Length:** ~100 characters max.
* **Conditionals:** No single-line `if` lumping — body on new indented line.
* **`export var`:** Only in template files (e.g., `AgentTemplate`). Logic scripts use `initialize()`.
* **Naming:**
    * `snake_case` — variables, functions, signals. Leading `_` for private.
    * `PascalCase` — class names, scene tree node names.
    * `ALL_CAPS_SNAKE_CASE` — constants.
* **Comments:** Explain *why*, not *what*.

## 4. Autoload Singletons

| Autoload | Role |
|----------|------|
| `Constants` | Global constants (paths, names, tuning) |
| `GlobalRefs` | References to unique managers/nodes |
| `EventBus` | Central signal dispatcher |
| `CoreMechanicsAPI` | Core rule resolution functions |
| `GameStateManager` | Save/load logic |
| `GameState` | **Single source of truth** for all persistent data — backing store for all four simulation layers (`8-GDD`) |
| `TemplateDatabase` | Caches loaded `.tres` templates on startup |

## 5. Stateless Systems Architecture

**`GameState` is the Source of Truth.** All dynamic, persistent game data lives here: World data (Layer 1), Grid state (Layer 2), Agent data (Layer 3), Chronicle events (Layer 4).

**Systems are Stateless APIs.** Core systems in `core/systems/` are `Node` scripts parented under `WorldManager`. They hold no data. Each provides a clean API that reads/writes `GameState`.

* Example: `CharacterSystem.gain_wealth_progress(uid, amount)` retrieves the character from `GameState.characters`, modifies `wealth_progress`, emits signal on `EventBus`.
* Getters returning `Dictionary` or `Array` **must** return `.duplicate(true)` copies.
* Systems react to and emit signals via `EventBus` (e.g., `_on_world_event_tick`, `player_wealth_changed`).

### System Checklist (New System)
1. Place in `core/systems/`, `extends Node`, child of `WorldManager`.
2. Register with `GlobalRefs` in `_ready()`.
3. Connect to required `EventBus` signals.
4. **No persistent state variables** — read/write `GameState` only.
5. Action methods modify `GameState`; getter methods return safe copies.

## 6. Resource Templates

* Custom `Resource` scripts (`extends Resource`, `class_name`) define data structures.
* Template definitions: see `1.1-GDD-Core-Systems.md` Section 5.
* **Action Templates:** `action_*.tres` files include `stakes` property (`HIGH_STAKES`, `NARRATIVE`, `MUNDANE`) determining UI behavior.

## 7. Physics Abstraction

* **Movement:** Reverted to rigid-body physics due to complications with slide-and-rotate system. 
* **PID Controllers:** Reusable `PIDController` class for goal-oriented behaviors (navigation, camera).

## 8. Save & Load

`GameStateManager` serializes/deserializes `GameState` directly.

**Save:** `save_game(slot_id)` → `_serialize_game_state()` builds `save_data` dict from `GameState` → writes to file.

**Load:** `load_game(slot_id)` → reads `save_data` → `_deserialize_and_apply_game_state()` clears and repopulates `GameState` → emits `game_state_loaded` signal. UI refreshes by pulling from system APIs.

## 9. Unit Testing (GUT 7.4.3)

### Test Priorities
* **Required:** Core Systems/APIs, complex components (`PIDController`, `MovementSystem`, `NavigationSystem`), utility scripts.
* **Not Required:** UI scripts, simple glue/delegation scripts.

### Practices
* Tests in `tests/` directory mirroring project structure.
* Independent tests — use `before_each()`/`after_each()` for setup/teardown.
* Mock complex dependencies with doubles.

## 10. Component Pattern

* Child Nodes with attached scripts encapsulate distinct functionality (e.g., `MovementSystem`, `NavigationSystem`).
* Scene instancing for Agents, Zones, UI assembly.
* Initialize via `initialize(config)` **after** node is added to tree.
