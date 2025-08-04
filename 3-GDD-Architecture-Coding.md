# GDTLancer - Coding Standards & Architecture Guide

**Version:** 1.7
**Date:** August 4, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8)

## 1. Purpose

This document outlines the agreed-upon coding style conventions and core architectural patterns for the Godot Engine (v3.x) implementation of GDTLancer. Adhering to these principles aims to improve code readability, maintainability, modularity, and reusability across the project's different platforms and development phases.

## 2. Engine & Language

* **Engine:** Godot Engine v3.x.
* **GUT version:**  7.4.3
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
* **Export Variables:** Only use `export var` for defining data in template files (e.g., Resources deriving from `AgentTemplate`). Variables within standard node logic scripts should typically not be exported unless necessary for editor tweaking during development; prefer initialization via an `initialize()` method.
* **Naming Conventions:** Follow standard Godot GDScript conventions:
    * `snake_case` for variables and function names (e.g., `max_move_speed`, `_physics_process`). Use a leading underscore `_` for "private" methods or variables.
    * `PascalCase` for class names (if using `class_name`) and node names in the scene tree (e.g., `AgentContainer`).
    * `snake_case` for signals to maintain consistency with Godot's built-in signals and the project's `EventBus` (e.g., `agent_spawned`).
    * `ALL_CAPS_SNAKE_CASE` for constants (`const`).
* **Comments:** Use `#` for comments. Write comments to explain the *why* behind non-obvious code, not just *what* the code does.

## 5. Architectural Patterns & Practices

* **Autoload Singletons:** Utilize sparingly for truly global services:
    * `Constants`: Global constants (paths, names, tuning).
    * `GlobalRefs`: Holds references to unique, essential nodes/managers.
    * `EventBus`: Central signal dispatcher for decoupled communication.
    * `CoreMechanicsAPI`: Centralized functions for core rule resolution.
    * `GameStateManager`: Centralized save/load logic.
    * Other major systems should generally start as regular Nodes to control initialization order.
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
    * **Core Systems & APIs:** Any autoload singleton with internal logic (e.g., `CoreMechanicsAPI`, `GameStateManager`) and any core system (e.g., `Time System`, `Inventory System`) must have a corresponding test script.
    * **Complex Components:** Any component with significant, self-contained logic (e.g., `PIDController`, `MovementSystem`, `NavigationSystem`) must be tested.
    * **Utility Scripts:** Any general-purpose utility scripts must be tested to ensure reliability.
* **What Not to Test:**
    * **UI Scripts:** Scripts that primarily manage UI nodes and visual state are better suited for manual, integration testing.
    * **Simple "Glue" Scripts:** Scripts that primarily delegate commands or connect signals without complex internal logic do not require unit tests.
* **Best Practices:**
    * **Location:** Test scripts must be located in the `tests/` directory, mirroring the structure of the main project (e.g., the test for `core/systems/agent_spawner.gd` is located at `tests/core/systems/test_agent_spawner.gd`).
    * **Isolation:** Tests must be independent. Use GUT's `before_each()` and `after_each()` methods to set up and tear down the test environment for each test function, preventing side effects.
    * **Mocking:** When testing a script that depends on other complex nodes or systems, use mock objects (doubles) to isolate the unit under test.

## 8. System Implementation Checklist & Data Flow

This section provides a generalized checklist for creating new gameplay systems to ensure they integrate correctly with the project's architecture.

### 8.1. General Principles

* **Single Responsibility:** A system should manage one domain of the game (e.g., Time, Character Stats, Inventory). If a system grows too complex, refactor it into smaller, more focused systems or components.
* **Event-Driven Communication:** Systems should react to game events by listening to signals on the `EventBus`. They should announce their own significant state changes by emitting signals on the `EventBus`. This keeps systems decoupled.
* **Data Authority:** Each system is the single source of truth for the data it manages. All modifications to a system's data must be done through its public API (its functions), never by directly changing its variables from the outside.

### 8.2. System Script Checklist

When creating a new system (e.g., `new_system.gd`):

1.  **File Location & Node Setup:**
    * [ ] Place the script in `core/systems/`.
    * [ ] The script should `extend Node`.
    * [ ] The system should be added as a child of the `WorldManager` node in `main_game_scene.tscn`.

2.  **Initialization (`_ready()`):**
    * [ ] Register the system with `GlobalRefs` so other parts of the game can access it (e.g., `GlobalRefs.set_new_system(self)`).
    * [ ] Connect to any necessary signals on the `EventBus` that this system needs to react to. This is the primary way systems listen for game-wide events.
        ```gdscript
        # Example: In _ready() of your new system
        EventBus.connect("day_passed", self, "_on_day_passed")
        EventBus.connect("game_loaded", self, "_on_game_loaded")
        ```

3.  **State Management:**
    * [ ] All internal state variables (the data the system manages) must be prefixed with an underscore (e.g., `_current_player_wp`).

4.  **Public API (Functions):**
    * [ ] **Action Methods:** Create functions to modify the system's internal state (e.g., `add_wp(amount)`, `add_time_units(units)`). These are the only valid ways to change the system's data.
    * [ ] **Getter Methods:** Create functions to provide read-only access to state (e.g., `get_wp()`, `get_current_tu()`).
    * [ ] **Data Protection:** If a getter returns a `Dictionary` or `Array`, it **must** return a copy by using `.duplicate(true)`. This prevents external scripts from getting a reference and modifying the data directly.
        ```gdscript
        # GOOD: Returns a safe copy
        func get_player_data() -> Dictionary:
            return _player_data.duplicate(true)

        # BAD: Returns a direct reference, allowing external modification
        func get_player_data_bad() -> Dictionary:
            return _player_data
        ```

5.  **Persistence (Save/Load):**
    * [ ] Implement a `get_save_data() -> Dictionary` function. This function must gather all of the system's state variables into a single dictionary and return it.
    * [ ] Implement a `load_save_data(data: Dictionary)` function. This function takes a dictionary and restores the system's internal state from it.
    * [ ] Implement an `_on_game_loaded(save_data: Dictionary)` signal handler. This handler is called when the `game_loaded` signal is emitted. It is responsible for finding its specific chunk of data within the larger `save_data` dictionary and passing it to its own `load_save_data` function.

### 8.3. Data Flow for Save & Load

The `GameStateManager` orchestrates the process, but does not know the internal details of any system.

**Saving Process:**

1.  `GameStateManager.save_game()` is called.
2.  `GameStateManager` creates an empty `save_data` dictionary.
3.  `GameStateManager` iterates through its list of known systems (via `GlobalRefs`). For each system (e.g., `GlobalRefs.character_system`), it calls `get_save_data()`.
4.  The returned data dictionary from each system is added to the main `save_data` dictionary under a unique key (e.g., `save_data["character_state"] = ...`).
5.  `GameStateManager` writes the final, complete `save_data` dictionary to a file.

**Loading Process:**

1.  `GameStateManager.load_game()` is called.
2.  `GameStateManager` reads the entire `save_data` dictionary from a file.
3.  `GameStateManager` emits the `game_loaded` signal on the `EventBus`, passing the entire `save_data` dictionary as the payload.
4.  **Every system** that needs to load data listens for the `game_loaded` signal.
5.  When the signal is received, each system's `_on_game_loaded` handler inspects the payload, finds its specific data chunk (e.g., `save_data["character_state"]`), and passes that chunk to its own `load_save_data` method to restore its internal state.
