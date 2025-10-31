# GDTLancer - Coding Standards & Architecture Guide

**Version:** 1.8
**Date:** October 31, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.9)

## 1. Purpose

This document outlines the agreed-upon coding style conventions and core architectural patterns for the Godot Engine (v3.x) implementation of GDTLancer. Adhering to these principles aims to improve code readability, maintainability, modularity, and reusability across the project's different platforms and development phases.

## 2. Engine & Language

* **Engine:** Godot Engine v3.x.
* **GUT version:** 7.4.3
* **Renderer:** GLES2 backend (prioritizing performance and compatibility).
* **Language:** GDScript (using static typing hints where beneficial for clarity).

## 3. Core Philosophy

* **Keep It Simple (KISS):** Prefer simpler implementations where possible. Favor clarity over excessive abstraction if it doesn't provide significant benefit.
* **Modularity:** Structure the project and code logically around distinct responsibilities using the established framework:
    * **Gameplay Modules (Horizontal):** Self-contained activity loops (Piloting, Combat, etc.).
    * **Gameplay Layers (Vertical):** Functional implementations across modules (Simulation, Narrative, etc.).
    * **Gameplay Systems (Depth):** Cross-cutting rulesets managing specific domains (Events, Goals, Assets, etc.).
    * **Refactor for Clarity:** Proactively refactor large scripts that handle multiple responsibilities. Aim to split scripts when they significantly exceed approximately **300 lines** of code, breaking them down into smaller, focused components.
* **Simulation Foundation + Narrative Layer:** Build core gameplay around simulation within modules. Layer narrative mechanics (Action Checks, Focus, Events, Goals) on top to handle uncertainty, abstraction, and story progression.
* **Player Agency:** Empower players with choices regarding risk vs. reward, engagement level, and resource management.
* **Reusability:** Design core components to be reusable across different contexts. Leverage Godot's scene instancing and Resource system.
* **Decoupling:** Minimize hard dependencies between different systems and modules. Utilize the global `EventBus` for signaling events and state changes. Use `GlobalRefs` only for accessing essential, unique managers or nodes.
* **Adhering strictly to the project's established architecture.** This includes coding standards, modularity, data-logic separation (as seen in the project files), and using established patterns (e.g., Autoloads, Resources). Avoid creating redundant code or duplicating existing functionality.

## 4. Code Formatting Standards

* **Automatic Formatting:** Use **`gdformat`** consistently to ensure uniform code style.
* **Indentation:** Use **Tabs** for indentation.
* **Line Length:** A maximum line length of approximately **100 characters**.
* **Conditional Statements (`if`/`elif`/`else`): No Lumping.** As a manual standard, statements controlled by a conditional must always start on a new, properly indented line. The `gdformat` tool should be configured to enforce this, but the primary responsibility lies with the developer to write pristine, readable code.
* **Export Variables:** Only use `export var` for defining data in template files (e.g., `AgentTemplate`). Variables within standard node logic scripts should typically not be exported unless necessary for editor tweaking during development; prefer initialization via an `initialize()` method.
* **Naming Conventions:** Follow standard Godot GDScript conventions:
    * `snake_case` for variables and function names (e.g., `max_move_speed`, `_physics_process`). Use a leading underscore `_` for "private" methods or variables.
    * `PascalCase` for class names (if using `class_name`) and node names in the scene tree (e.g., `AgentContainer`).
    * `snake_case` for signals to maintain consistency with Godot's built-in signals and the project's `EventBus` (e.g., `agent_spawned`).
    * `ALL_CAPS_SNAKE_CASE` for constants (`const`).
* **Comments:** Use `#` for comments. Write comments to explain the *why* behind non-obvious code, not just *what* the code does.

## 5. Architectural Patterns & Practices

* **Autoload Singletons:** Utilize for truly global services and data:
    * `Constants`: Global constants (paths, names, tuning).
    * `GlobalRefs`: Holds references to unique, essential nodes/managers.
    * `EventBus`: Central signal dispatcher for decoupled communication.
    * `CoreMechanicsAPI`: Centralized functions for core rule resolution.
    * `GameStateManager`: Centralized save/load logic.
    * `GameState`: **Primary Source of Truth for all persistent data.** Holds all dynamic game state (characters, inventories, world time, etc.).
    * `TemplateDatabase`: Caches all loaded `.tres` templates on startup.
* **Component Pattern:** Use child Nodes with attached scripts to encapsulate distinct functionalities (e.g., `MovementSystem`, `NavigationSystem`).
* **Resource Templates (`.tres`):** Use custom `Resource` scripts (`extends Resource`, `class_name`) to define data structures (e.g., `AgentTemplate`). Initialize objects using these loaded Resource objects.
* **Scene Instancing:** Leverage Godot's scene instancing for creating Agents, loading Zones, and assembling UI.
* **Initialization:** Prefer initializing node properties via an `initialize(config)` method called *after* the node is added to the tree.

## 6. Physics Abstraction & Implementation

The game does not use a traditional rigid-body physics engine for ship movement. Instead, it "fakes physics" through a set of state-based rules and interpolation.

* **Core Method:** The primary method for all movement is `KinematicBody.move_and_slide()`. The velocity vector passed to this function is managed by the agent's component scripts.
* **Technical Components:**
    * **Linear Interpolation (`lerp`):** The `linear_interpolate()` function is used extensively for smooth acceleration, deceleration, and braking.
    * **PID Controllers:** A reusable `PIDController` class is employed for complex, goal-oriented behaviors that require smoothly reaching and maintaining a target state without overshoot, such as in navigation and camera control.

## 7. Unit Testing & Quality Assurance

To ensure the reliability of core systems and prevent regressions, a test-driven approach is encouraged for crucial, self-contained scripts.

* **Tooling:** The project uses the **Godot Unit Test (GUT) 7.4.3** framework for writing and running unit tests.
* **Testing Priorities (Crucial Scripts):** Unit tests are required for:
    * **Core Systems & APIs:** Any autoload singleton with internal logic (e.g., `CoreMechanicsAPI`, `GameStateManager`) and any core system (e.g., `TimeSystem`, `InventorySystem`) must have a corresponding test script.
    * **Complex Components:** Any component with significant, self-contained logic (e.g., `PIDController`, `MovementSystem`, `NavigationSystem`) must be tested.
    * **Utility Scripts:** Any general-purpose utility scripts must be tested to ensure reliability.
* **What Not to Test:**
    * **UI Scripts:** Scripts that primarily manage UI nodes and visual state are better suited for manual, integration testing.
    * **Simple "Glue" Scripts:** Scripts that primarily delegate commands or connect signals without complex internal logic do not require unit tests.
* **Best Practices:**
    * **Location:** Test scripts must be located in the `tests/` directory, mirroring the structure of the main project (e.g., the test for `core/systems/agent_system.gd` is located at `tests/core/systems/test_agent_spawner.gd`).
    * **Isolation:** Tests must be independent. Use GUT's `before_each()` and `after_each()` methods to set up and tear down the test environment for each test function, preventing side effects.
    * **Mocking:** When testing a script that depends on other complex nodes or systems, use mock objects (doubles) to isolate the unit under test.

## 8. System Implementation & Data Flow (Stateless Architecture)

This section defines the project's core data flow, which is based on **stateless systems** and a **centralized state object**.

### 8.1. General Principles

* **`GameState` is the Source of Truth:** The `GameState.gd` autoload singleton is the **single source of truth** for all dynamic, persistent game data. This includes `GameState.characters`, `GameState.inventories`, `GameState.current_tu`, etc.
* **Systems are Stateless APIs:** Core systems (e.g., `CharacterSystem`, `InventorySystem`, `TimeSystem`) are `Node` scripts located in `core/systems/` and parented under `WorldManager`. They are **stateless**. They do not hold their own data.
* **Systems Provide Logic:** A system's job is to provide a clean, logical API (a set of functions) that reads from and writes to the `GameState`.
    * **Example:** `CharacterSystem.add_wp(uid, amount)` is a function that retrieves the correct character from `GameState.characters`, modifies its `wealth_points` property, and (if it's the player) emits a signal on the `EventBus`. The `CharacterSystem` itself does not store the `wealth_points`.
* **Event-Driven Communication:** Systems should react to game events by listening to signals on the `EventBus` (e.g., `_on_world_event_tick`). They announce significant state changes by emitting signals on the `EventBus` (e.g., `player_wp_changed`).

### 8.2. System Script Checklist (Stateless)

When creating a new system (e.g., `new_system.gd`):

1.  **File Location & Node Setup:**
    * [ ] Place the script in `core/systems/`.
    * [ ] The script should `extend Node`.
    * [ ] The system should be added as a child of the `WorldManager` node in `main_game_scene.tscn`.

2.  **Initialization (`_ready()`):**
    * [ ] Register the system with `GlobalRefs` so other parts of the game can access its API (e.g., `GlobalRefs.set_new_system(self)`).
    * [ ] Connect to any necessary signals on the `EventBus` that this system needs to react to (e.g., `EventBus.connect("world_event_tick_triggered", self, "_on_world_event_tick")`).

3.  **State Management:**
    * [ ] **DO NOT** store persistent state variables in the system script. All persistent data must be read from and written to the `GameState` autoload.

4.  **Public API (Functions):**
    * [ ] **Action Methods:** Create functions that modify data within `GameState` (e.g., `add_wp(uid, amount)`). These are the only valid ways to change game state.
    * [ ] **Getter Methods:** Create functions that provide read-only access to data from `GameState` (e.g., `get_wp(uid)`).
    * [ ] **Data Protection:** If a getter returns a `Dictionary` or `Array` from `GameState`, it **must** return a copy by using `.duplicate(true)`. This prevents external scripts from getting a reference and modifying the data directly, bypassing the system's API.
        ```gdscript
        # GOOD: Returns a safe copy
        func get_player_data() -> Dictionary:
        	if GameState.characters.has(GameState.player_character_uid):
        		return GameState.characters[GameState.player_character_uid].duplicate(true)
        	return {}

        # BAD: Returns a direct reference, allowing external modification
        func get_player_data_bad() -> Dictionary:
        	return GameState.characters[GameState.player_character_uid]
        ```

### 8.3. Data Flow for Save & Load

The `GameStateManager.gd` autoload handles all save/load logic. It directly serializes and deserializes the `GameState` autoload.

**Saving Process:**

1.  `GameStateManager.save_game(slot_id)` is called.
2.  `GameStateManager` calls its internal `_serialize_game_state()` function.
3.  This function manually builds a `save_data` dictionary by pulling all necessary data *directly from `GameState`* (e.g., `save_data["current_tu"] = GameState.current_tu`).
4.  It uses helper functions like `_serialize_resource_dict()` to handle complex data like `GameState.characters`.
5.  `GameStateManager` writes the final, complete `save_data` dictionary to a file.

**Loading Process:**

1.  `GameStateManager.load_game(slot_id)` is called.
2.  `GameStateManager` reads the entire `save_data` dictionary from a file.
3.  It calls its internal `_deserialize_and_apply_game_state(save_data)`.
4.  This function clears the live `GameState` (e.g., `GameState.characters.clear()`) and repopulates it with the data from the `save_data` dictionary.
5.  After data is restored, `GameStateManager` emits `EventBus.emit_signal("game_state_loaded")`.
6.  Any UI elements or other nodes that need to refresh their display (like the `MainHUD`) listen for the `game_state_loaded` signal and then pull the new data from `GameState` using the (stateless) system APIs.
