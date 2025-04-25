# GDTLancer - Coding Standards & Architecture Guide

**Version:** 1.0
**Date:** April 3, 2025
**Related Documents:** GDTLancer Main GDD v1.6

## 1. Purpose

This document outlines the agreed-upon coding style conventions and core architectural patterns for the Godot Engine (v3.x) implementation of GDTLancer. Adhering to these principles aims to improve code readability, maintainability, modularity, and reusability across the project's different platforms and development phases.

## 2. Engine & Language

* **Engine:** Godot Engine v3.x (Targeting 3.6+ recommended for latest features within v3).
* **Renderer:** GLES2 backend (prioritizing performance and compatibility across target platforms, aligning with the Neo-Retro 3D visual style).
* **Language:** GDScript (using static typing hints where beneficial for clarity and error detection, e.g., `func my_func(param: String) -> bool:`).

## 3. Core Philosophy

* **Keep It Simple (KISS):** While aiming for depth, prefer simpler implementations where possible. Avoid over-engineering, especially in early phases. Favor clarity over excessive abstraction if it doesn't provide significant benefit. (e.g., Merging movement into `agent.gd`).
* **Modularity:** Structure the project and code logically around distinct responsibilities using the established framework:
    * **Gameplay Modules (Horizontal):** Self-contained activity loops (Piloting, Combat, etc.).
    * **Gameplay Layers (Vertical):** Functional implementations across modules (Simulation, Narrative, Agency, Progression).
    * **Gameplay Systems (Depth):** Cross-cutting rulesets managing specific domains (Events, Goals, Assets, etc.).
* **Simulation Foundation + Narrative Layer:** Build core gameplay around simulation within modules. Layer narrative mechanics (Action Checks, Focus, Events, Goals) on top to handle uncertainty, abstraction, and story progression.
* **Player Agency:** Empower players with choices regarding risk vs. reward (Action Approaches), engagement level (manual vs. abstracted actions), and resource management (FP, WP, Time).
* **Reusability:** Design core components (base agent scripts, systems, potentially UI elements) to be reusable across different contexts. Leverage Godot's scene instancing and Resource system.
* **Decoupling:** Minimize hard dependencies between different systems and modules. Utilize the global `EventBus` for signaling events and state changes. Use `GlobalRefs` only for accessing essential, unique managers or nodes.

## 4. Code Formatting Standards

* **Indentation:** Use **Tabs** consistently for all indentation. (Configure Godot editor: `Editor -> Editor Settings -> Text Editor -> Indentation -> Type: Tabs`).
* **Line Length:** Aim for a maximum line length of approximately **80-100 characters** where practical. Break longer lines logically (e.g., after operators, commas, before parameters) to improve readability.
* **Conditional Statements (`if`/`elif`/`else`):** **No Lumping.** The statement(s) controlled by a conditional must start on a new line, properly indented.
    * *Correct:*
        ```gdscript
        if condition:
        	do_something()
        	do_something_else()
        elif other_condition:
        	do_other_thing()
        else:
        	do_fallback()
        ```
    * *Incorrect:* `if condition: do_something()` or `if condition: do_something(); return`
* **Naming Conventions:** Follow standard Godot GDScript conventions:
    * `snake_case` for variables and function names (e.g., `max_move_speed`, `_physics_process`). Use a leading underscore `_` for "private" methods or variables intended for internal use within the script.
    * `PascalCase` for class names (if using `class_name`), node names in the scene tree, and signal names defined within scripts (though `EventBus` signals use snake\_case following convention for built-in signals).
    * `ALL_CAPS_SNAKE_CASE` for constants (`const`).
* **Comments:** Use `#` for comments. Write comments to explain the *why* behind non-obvious code, complex algorithms, or important design decisions, not just *what* the code does. Remove redundant or commented-out code sections once they are no longer needed.

## 5. Architectural Patterns & Practices

* **Autoload Singletons:** Utilize sparingly for truly global services:
    * `Constants`: Global constants (paths, names, tuning).
    * `GlobalRefs`: Holds references to unique, essential nodes/managers (Player, Camera, WorldManager, key Systems). Nodes register themselves here. Access via `GlobalRefs.node_name`.
    * `EventBus`: Central signal dispatcher for decoupled communication between systems/modules.
    * `CoreMechanicsAPI`: Centralized functions for core rule resolution (e.g., `perform_action_check`).
    * `GameStateManager`: Centralized save/load logic.
    * Other major systems (`EventSystem`, `GoalSystem`, etc.) should generally start as regular Nodes managed within the main scene tree to control initialization order, promoting to Autoload only if strictly necessary later.
* **Component Pattern:** Use for highly reusable, distinct functionalities applicable to multiple node types (e.g., potentially Health, Inventory later). However, for core agent functionality (like movement), merging into the main agent script (`agent.gd`) is preferred for Phase 1 simplicity (KISS).
* **Resource Templates (`.tres`):** Use custom `Resource` scripts (`extends Resource`, `class_name`) to define data structures (e.g., `AgentTemplate`). Create `.tres` files based on these scripts in the `assets/data/templates/` folder. Initialize objects using these loaded Resource objects rather than large hardcoded Dictionaries in scripts.
* **Scene Instancing:** Leverage Godot's scene instancing for creating Agents (e.g., `npc_agent.tscn` instances `agent.tscn`), loading Zones, assembling complex UI elements, etc.
* **Scene/Folder Structure:** Adhere to the defined project structure (`core`, `modules`, `scenes/zones`, `assets/data`, etc.) to maintain organization. Follow conventions for node structure within key scenes (e.g., Agent scenes contain "AgentBody" KinematicBody + Controller node; Zone scenes contain "AgentContainer").
* **Decoupling:** Prioritize communication via `EventBus` signals over direct node calls where feasible. Use `GlobalRefs` primarily to *obtain* references needed to call specific methods or connect signals, not for widespread direct state manipulation from unrelated scripts.
* **Initialization:** Prefer initializing node properties via an `initialize(config)` method called after the node is instanced and added to the tree, passing necessary configuration data (often loaded from a `.tres` template Resource). Avoid heavy reliance on `export` variables directly within complex scene logic scripts (exports are fine for basic scenes or Resources themselves).
