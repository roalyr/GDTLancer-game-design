--- Start of ./0.1-GDD-Main.md ---

# GDTLancer: Generative Dynamic Transmedia Lancer - Game Design Document

**Version:** 1.7
**Date:** May 16, 2025
**Author:** Roal-Yr

## 0. Introduction

* **Game Title:** GDTLancer (Working Title, Acronym: **Generative Dynamic Transmedia** Lancer)
* **Logline:** A multi-platform space adventure RPG blending sandbox simulation with TTRPG-inspired narrative mechanics, set in a distinct stylized sci-fi universe where player choice, AI actions, and the passage of time shape a living world.
* **Genre:** 3D Space Adventure, RPG, Sandbox, Simulation, TTRPG-Hybrid.
* **Theme:** Emergent narrative, story-driven world simulation, hard sci-fi aesthetics with space fantasy elements. Player agency in choosing narrative engagement, risk level, and managing time/wealth.
* **Target Audience:** Fans of Sci-Fi, Space Sims (Elite, Freelancer), Sandbox RPGs (Mount & Blade), Narrative Games, emergent simulations (Dwarf Fortress, EVE Online), and TTRPGs (Stars Without Number, Ironsworn/Starforged).
* **Platforms:**
    * Primary Digital: Godot 3 (PC/Mobile). Distinct Neo-Retro 3D visuals.
    * Secondary Digital: J2ME (Simplified, turn-based). Minimalist wireframe visuals.
    * Analogue: Standalone TTRPG ruleset.
* **Unique Selling Points:**
    * Deep emergent narrative driven by unified agent mechanics.
    * Living world simulation shaped by agent actions and time progression.
    * Transmedia approach (full 3D, minimalist mobile, TTRPG).
    * Distinct Neo-Retro 3D Visual Style and accessible gameplay.
    * Investigable world history via the Chronicle System.

## 1. Glossary

* **Action Approach:** Player's declared stance (`Act Risky` or `Act Cautiously`) influencing Action Check outcome interpretation.
* **Action Check:** Core dice roll mechanic (3d6 + Mod ≥ Thresholds). *Detailed in Core Mechanics Design.*
* **Agent:** Active entity pursuing goals (Player or NPC).
* **Analogue Version:** Parallel tabletop RPG ruleset.
* **Asset System:** Gameplay System managing non-consumable items (ships, gear, property).
* **Character System:** Gameplay System managing Agent skills, progression, core stats.
* **Chronicle System:** Gameplay System logging significant Agent actions and World State changes.
* **Event System (Oracle Lite):** Gameplay System generating unexpected narrative events and complications.
* **Focus Points (FP):** Primary meta-resource spent to influence Action Checks or gain persistent module buffs. *Detailed in Core Mechanics Design.*
* **Gameplay Layer (Vertical Development):** Functional layer across modules (e.g., Simulation Layer). Each Layer gets a GDD page.
* **Gameplay Module (Horizontal Development):** Mechanics for a specific activity loop (e.g., Combat Module). Each Module gets a GDD page.
* **Gameplay System (Depth Development):** Cross-cutting ruleset (e.g., Event System). Each System gets a GDD page.
* **Goal System (Vows Lite):** Gameplay System for tracking Agent objectives via Progress Tracks.
* **Module Modifier:** Primary situational modifier for an Action Check (`Relevant Skill + Asset Difficulty`).
* **Neo-Retro 3D:** Primary visual style (minimalist, hard-edged 3D).
* **Phase:** A defined development milestone targeting specific Modules, Layers, and Systems.
* **Progress Track:** Visual representation of goal completion.
* **Time Clock:** Abstract tracker for time passing, marked in Time Units (TU). Filling the clock triggers a World Event Tick. *Detailed in Core Mechanics Design.*
* **Time Unit (TU):** Abstract unit of time marked on the Time Clock by actions/events. *Detailed in Core Mechanics Design.*
* **Trigger Action:** High-stakes action requiring an Action Check.
* **Wealth Points (WP):** Abstract measure of significant economic resources/purchasing power. Used for major costs and upkeep. *Detailed in Core Mechanics Design.*
* **World Event Tick:** Event triggered when the Time Clock fills, advancing world state and potentially costing WP Upkeep. *Detailed in Core Mechanics Design & Event System.*
* **World Map System:** Gameplay System managing spatial representation and navigation data.
* **World State:** Data representing the current status of the game world.

## 2. Game Pillars & Vision

* **Living World:** Universe evolves via Agent actions, time progression (**World Event Ticks**), and systemic interactions. Dynamic World State.
* **Emergent Narrative:** Stories arise naturally from gameplay systems, Agent choices, and events.
* **Meaningful Progression:** Advancement tied to simulation skill/assets, narrative achievements/skills, and managing **Wealth**.
* **Unified & Accessible Mechanics:** Core rules apply consistently. "Easy to learn, hard to master."
* **Balanced Gameplay & Player Agency:** Simulation foundation enhanced by narrative mechanics. Player chooses engagement level and risk approach (`Act Risky`/`Act Cautiously`). Meaningful choices about spending **Time (TU)** and **Wealth (WP)**.

## 3. Core Gameplay Design

* **3.1. Gameplay Philosophy:** Provides robust simulation within Gameplay Modules. Narrative mechanics layer onto this. Players choose their approach to risk, narrative depth, and resource management (FP, WP, TU).
* **3.2. Gameplay Modules (Horizontal Axis):** Structures activities enabled by Assets.
    * **Planned Modules:** Piloting & Travel, Combat (Ship), Trading, Interaction (Docked/Social), Mining, Repair, Investigation, Exploration/Scanning. *(List subject to refinement)*.
    * **Asset Interaction:** Assets enable Modules, influence Module Modifiers via `Asset Difficulty`, may add Module Variations.
    * **Core Loop:** Engage Module -> Perform Simulation Actions -> Encounter/Choose Trigger Action -> Declare Action Approach -> Resolve via Action Check (influenced by Mod, FP) -> Consult Outcome Branch -> Apply Results -> Gain/Lose Resources (**FP, WP**), **Advance Time Clock (TU)** -> Update Stats/Progress -> Choose Next Action/Module.
* **3.3. Core Mechanics Resolution:**
    * **Overview:** Core systems governing actions, resources, and time are detailed in the **"Core Mechanics Design"** document. Key components influencing resolution include:
        * **Action Check:** (3d6 + Module Modifier vs Thresholds).
        * **Focus Points (FP):** Spend 1-3 pre-roll for +1/pt bonus or for persistent buffs.
        * **Action Approach:** (`Risky`/`Cautious`) Declaration modifying outcome interpretation.
        * **Time Clock (TU):** Actions and outcomes advance the clock towards World Event Ticks.
        * **Wealth Points (WP):** Used for major costs and periodic upkeep potentially triggered by World Event Ticks.
    * **Simulation vs. Narrative Resolution:** Simulation is default. Optional abstracted narrative resolution exists for some modules.

## 4. Development Framework & Phased Plan

* **4.1. Development Axes:** Modules (Horizontal), Layers (Vertical), Systems (Depth).
* **4.2. Development Layers Defined:**
    * **Layer 1: Core Simulation & Mechanics:** Basic module function, controls, Action Check, FP/WP/TU mechanics, Module Modifiers, Action Approaches.
    * **Layer 2: Narrative Integration:** Goal/Event System integration, Narrative Rewards, optional abstractions, Risky/Cautious outcome branches.
    * **Layer 3: World & Agency Simulation:** NPC Agent simulation, World State evolution, Chronicle System updates, World Event Tick resolution.
    * **Layer 4: Meta-Progression & Legacy:** Deeper progression, long-term rewards, faction mechanics, Legacy system.
* **4.3. Key Cross-Cutting Systems Defined:** Each gets dedicated design page.
    * Event System
    * Goal System
    * Progression & Reward System
    * Chronicle System
    * Asset System
    * Character System
    * World Map System
    * *(Later)* Faction System, Economy System (interacting heavily with WP), Legacy System, etc.
* **4.4. Phased Release Plan (Tentative Targets):**
    * **Phase 1 (Core Loop Foundation):**
        * *Modules:* Piloting & Travel (Basic), Combat (Ship - Basic), Trading (Basic Docked Interaction/UI).
        * *Layers:* Layer 1 implemented for Phase 1 modules.
        * *Systems:* Implement basic Asset/Character/Map Systems. Implement core Action Check, FP, WP, and Time Clock mechanics. Basic Event/Goal triggers & tracking.
        * *Goal:* Testable build demonstrating core loop with functional core mechanics, resource tracking (FP, WP, TU), and Action Approach choice.
    * **Phase 2 (Narrative & Abstraction):**
        * *Modules:* Refine Phase 1; Add Mining, Repair (Basic).
        * *Layers:* Layer 2 implemented (Rewards, Goal progress linked, structured Event outcomes, abstractions like Fast Transit, Risky/Cautious branches fleshed out).
        * *Systems:* Refine Event/Goal Systems; basic Progression System; refine Asset System. Define World Event Tick content & basic WP Upkeep.
        * *Goal:* Purposeful loop with narrative drivers, rewards, abstractions, meaningful choices, basic world pulse.
    * **Phase 3 (Living World Basics):**
        * *Modules:* Refine existing; Add Investigation/Scanning (Basic).
        * *Layers:* Layer 3 implementation started (Basic NPCs using Layers 1&2, World State changes, Analogue World Tick refinement).
        * *Systems:* Basic Chronicle System; Refine Upkeep costs.
        * *Goal:* World shows independent activity and history tracking.
    * **Later Phases:** Implement Layer 4. Scale up Agent sim. Deepen World State & Systems. Add content.

## 5. Art & Audio Direction

* **5.1. Primary Visual Style (Godot 3): "Neo-Retro 3D"**
* **5.2. Secondary Visual Style (J2ME): "Minimalist Wireframe"**
* **5.3. Environment Design:** Stylized space vistas. Gameplay scale. Lighting/composition focus.
* **5.4. Audio:** Functional, minimalist sound. Clear feedback. Atmospheric/generative music.

## 6. UI/UX Principles

* **Minimalism:** Clean, non-intrusive UI.
* **Clarity:** Player understands Module, actions, resources (FP, WP, TU/Time Clock), Checks, Approach, outcomes.
* **Accessibility:** Easy learning curve. Tutorials/contextual help. Visual/text options.
* **Dynamic Camera:** Effective camera work in 3D.

## 7. Technical Considerations

* **7.1. Engine:** Godot 3 (Primary), J2ME (Exploratory/Constraint).
* **7.2. Optimization:** High priority, esp. for Agent/World simulation.
* **7.3. Analogue Version:** Parallel design. Relies on core mechanics & narrative systems. Uses "World Event Tick" (driven by Time Clock, costs WP Upkeep).
* **7.4. Modularity:** Design Layers, Modules, Systems with clear interfaces.

--- Start of ./0.2-GDD-Mottos-Sayings.md ---

# GDTLancer - Mottos & Sayings

**Version:** 1.1
**Date:** May 16, 2025
**Related Documents:** GDTLancer Main GDD v1.7, 6.1-GDD-Lore-Background.md v1.3

## 1. Purpose

This document lists potential mottos for the GDTLancer game itself (for branding and thematic encapsulation) and a selection of in-game, lore-wise mottos and sayings that reflect the culture, history, and beliefs of the inhabitants as per the suggested Lore.

## 2. Game Motto (Branding & Ethos)

These mottos aim to capture the unique promise and development philosophy of GDTLancer:

1.  **"GDTLancer: Delivered as Designed."** (Directly references the commitment to delivering on the GDD, no empty promises, scoped design, challenges acknowledged)

## 3. Lore-Wise Mottos

These phrases reflect the Lore (for loading screen, etc.):

* "The Vessel endures; so must we."
* "Our home is the journey; our strength, the bond."
* "Every cycle, every gram, every action counts."
* "Measure the cost, master the consequence."
* "Sustenance is resilience; starvation, the final failure."
* "We honor the past by building the future."
* "Endurance is the first virtue, foresight the second."
* "Conservation today ensures continuation tomorrow."
* "Matter is means; expansion is imperative."
* "A calculated risk is a claim on what's next."
* "The void yields to the prepared and the persistent."
* "Skill carves status, action defines worth."
* "No return, only the myriad paths forward."
* "Regret is a luxury abandoned."
* "From shared hardship, shared strength is forged."
* "The only true borders are the limits of our hull and our ingenuity."

---

--- Start of ./1-GDD-Core-Mechanics.md ---

# GDTLancer Core Mechanics Design

**Version:** 1.3
**Date:** May 16, 2025
**Related Documents:** GDTLancer Main GDD v1.7

## 1. Purpose

This document defines the fundamental, universally applied mechanics used throughout GDTLancer for resolving actions, managing core resources (Focus, Wealth, Time), pacing events, and guiding player agency. These mechanics provide a consistent foundation across all Gameplay Modules, Systems, and Layers.

## 2. Action Check

* **Purpose:** The fundamental mechanic for determining the outcome when an Agent attempts a **Trigger Action** – where success is uncertain and failure has meaningful consequences.
* **Core Mechanic:** `3d6 + Module Modifier ≥ Thresholds` (Roll-Over system).
    * Roll 3d6.
    * Add the relevant **Module Modifier** (See Section 3).
    * **Focus Points (FP)** may be spent before the roll to modify the total (See Section 7).
    * Compare final total against defined Thresholds.
* **Standard Thresholds:** (Default values, tunable)
    * **Failure:** Total < 10
    * **Success with Complication (SwC):** Total 10 – 13
    * **Critical Success:** Total ≥ 14
* **Outcome Summary:**
    * **Critical Success:** Action succeeds exceptionally well. Outcome details influenced by **Action Approach** (See Section 6) and context. Typically grants +1 FP. May impact **Time Clock** or **WP**.
    * **Success with Complication:** Action succeeds, but with a cost/partial effect. Outcome details influenced by **Action Approach** and context. May impact **Time Clock** or **WP**.
    * **Failure:** Action fails with negative consequences. Outcome details influenced by **Action Approach** and context. Typically resets FP to 0. May impact **Time Clock** or **WP**.

## 3. Modifiers

* **Purpose:** Represent Agent proficiency and situational factors influencing Action Check success chance.
* **Primary Type: Module Modifier**
    * Main modifier applied to the Action Check roll.
    * Reflects Agent effectiveness with the active **Asset** within the current **Gameplay Module**.
    * **Derivation:** Calculated from `Relevant Agent Skill + Asset Difficulty` (details in Character/Asset Systems).
    * **Contextual Value:** Changes based on active Module and Asset.
* **Situational Modifiers:** Temporary +/- 1 (rarely +/- 2) from specific effects may occasionally apply.

## 4. Time Clock & Time Units (TU)

* **Purpose:** Tracks the abstract passage of time, paces gameplay, and triggers background world events. Replaces granular timekeeping (hours/days) and direct tracking of basic consumables like fuel/supplies for operational pacing.
* **Unit:** Time Unit (TU). Represents an abstract block of significant activity time.
* **Tracking:** Via the **Time Clock**, a segmented track (e.g., 8 segments). Mark off segments as TU are spent.
* **Gaining/Spending TU:**
    * Travel segments (`Undertake Journey`, `Fast Transit` segment equivalents) cost a base amount of TU (e.g., +1 TU per segment).
    * Downtime activities (repair, research) have defined TU costs.
    * Certain **Action Check** outcomes, especially **Cautious** Complications or Failures, add +TU (representing delays, careful work).
* **World Event Tick:**
    * **Trigger:** Occurs automatically when the Time Clock fills completely.
    * **Effects:**
        1. Resolves background world events/Agent progress via the **Event System**.
        2. Requires the Player/Agent to pay **WP Upkeep** (see Section 5).
        3. Resets the Time Clock to 0.
    * **Frequency:** The rate depends on how quickly actions consuming TU are performed. Fast Transit rapidly advances the clock.

## 5. Wealth Points (WP)

* **Purpose:** Represents an Agent's significant economic resources and purchasing power, abstracting detailed currency and basic logistics costs.
* **Scale:** Tracked as small integers (e.g., starting 3 WP). Avoids large numbers.
* **Conceptual Baseline:** 1 WP notionally equivalent to the value of a substantial quantity of a universal commodity (e.g., bulk refined fuel shipment).
* **Usage:**
    * **Major Costs:** Purchasing Assets (ships, modules, property), significant services (major repairs, hiring specialists), large bribes.
    * **Bulk Goods:** Acquiring large quantities of trade goods or restocking abstracted operational supplies (if needed beyond Upkeep).
    * **Upkeep:** Periodic WP cost required when the **World Event Tick** occurs, representing abstracted fuel, supplies, maintenance, crew costs, etc. Cost scales based on assets/circumstances.
    * **Routine Expenses:** Minor costs (docking fees, meals, small ammo) are generally *not* tracked via WP unless WP is critically low (near 0), implying inability to cover basics.
* **Gaining WP:** Mission rewards, selling valuable assets/cargo/data, Goal completion.
* **Low WP Consequences:** Inability to pay Upkeep leads to negative effects (debt, asset degradation, forced risky actions). Difficulty affording even routine items may trigger Action Checks.

## 6. Action Approach

* **Concept:** Player declaration (`Act Risky` or `Act Cautiously`) before an applicable Action Check, influencing outcome nature/severity.
* **Function:** Directs resolution to different outcome interpretations based on the achieved result tier (Crit/SwC/Fail). Does *not* change the roll or Thresholds.
* **Approaches:**
    * **`Act Risky`:** Aims for maximum gain/speed; potential for greater rewards on success, harsher consequences on failure.
    * **`Act Cautiously`:** Prioritizes safety/reliability; outcomes focus on minimizing loss, less spectacular successes, less severe failures (often involving TU delays).
* **Application:** Specific outcome branches defined in Module GDDs or Event System entries.

## 7. Focus Points (FP) (Meta-Resource)

* **Concept:** Spendable resource representing luck, determination, or narrative agency.
* **Gaining:** +1 FP on Action Check **Critical Success** (≥ 14).
* **Losing:** **Reset FP to 0** on Action Check **Failure** (< 10). *(Subject to tuning)*.
* **Maximum Cap:** Low cap (e.g., 3).
* **Spending:** Always player choice when available.
    * **Narrative Boost:** Before Action Check, spend 1-3 FP for +1 per point to roll total.
    * **Simulation Boost:** Upon entering Module instance, spend 1 FP for persistent passive benefit during that instance.

--- Start of ./2-GDD-Development-Challenges.md ---

# GDTLancer - Development Challenges & Risks

**Version:** 1.1
**Date:** May 16, 2025
**Related Documents:** GDTLancer Main GDD v1.7, Core Mechanics Design v1.3, Phased Plan (Section 4 in GDD-Main)

## 1. Purpose

This document identifies and acknowledges the primary challenges and inherent risks associated with the development of GDTLancer. Its purpose is to maintain awareness of these potential difficulties throughout the development lifecycle, informing planning, prioritization, and potential mitigation strategies. Recognizing these challenges upfront allows for a more realistic approach to development scheduling and scope management.

## 2. Core Challenges & Risks

Based on the project's ambitious scope and design goals, the following key challenges are recognized:

* **2.1. Scope & Ambition vs. Resources:**
    * **Challenge:** The project's vision encompasses a multi-platform release (Godot 3 PC/Mobile, J2ME, Analogue TTRPG), deep world simulation, emergent narrative mechanics, and a broad set of sandbox gameplay modules. This represents a significant undertaking, particularly given current solo development resources.
    * **Status:** This high level of ambition is a known factor tied directly to the core vision of GDTLancer and is accepted at this stage. The phased development plan aims to manage this scope iteratively.

* **2.2. Core Simulation Complexity ("Living World"):**
    * **Challenge:** Implementing a convincing and performant "Living World" where AI agents pursue their own goals using player-facing mechanics (Action Checks, WP/FP/TU management), significantly impact the game state (factions, economy), and generate a persistent history (Chronicle System) is technically and computationally demanding.
    * **Status:** Achieving this is a core design pillar, planned primarily for implementation in Layers 3 and 4. Significant design and development effort is anticipated.

* **2.3. Emergent Narrative Depth:**
    * **Challenge:** Designing the Event System ("Oracle Lite") and Goal System ("Vows Lite") to produce genuinely *emergent*, *coherent*, and *engaging* narratives, rather than simply sequences of random events or basic objective tracking, requires substantial design effort and content creation (e.g., detailed, interconnected event tables and goal frameworks).
    * **Status:** The foundation is based on proven TTRPG concepts, but realizing their full potential for emergent storytelling in a simulated environment is a key challenge.

* **2.4. Transmedia Implementation & Consistency:**
    * **Challenge:** Ensuring a consistent core GDTLancer experience and mechanical feel across vastly different platforms (full 3D Godot, minimalist J2ME, tabletop Analogue) is difficult. Maintaining feature parity and adapting interfaces appropriately requires careful design for each platform.
    * **Status:** The J2ME version poses a particular challenge. Its final form is still under consideration, potentially leaning towards a 2D implementation more closely aligned with the abstracted mechanics of the Analogue version to manage complexity and maintain thematic consistency.

* **2.5. System/Module Definition & Integration:**
    * **Challenge:** Many core gameplay modules (Combat, Trading, Interaction, etc.) and cross-cutting systems (Event, Goal, Character, Asset, Economy, Faction, etc.) are listed in the design but are currently placeholders or under concurrent development. Designing these complex systems and ensuring they integrate seamlessly with each other and the core mechanics is a major ongoing task.
    * **Status:** These components are acknowledged as Work-In-Progress, being developed iteratively alongside the core engine implementation.

* **2.6. Resource Balancing (WP/TU):**
    * **Challenge:** The core resource loops involving Wealth Points (WP) and Time Units (TU) – including WP Upkeep costs triggered by the Time Clock – require careful balancing. Tuning acquisition rates, costs, and upkeep calculations is essential to create the intended gameplay feel (meaningful economic pressure, appropriate world pacing) without being overly punishing or trivial.
    * **Status:** Achieving the right balance will necessitate extensive playtesting once the foundational systems and core gameplay loops are implemented.

* **2.7. Action Approach Implementation:**
    * **Challenge:** The effectiveness of the `Act Risky` / `Act Cautiously` mechanic depends entirely on the quality and distinctiveness of the outcome branches defined within the Event System for relevant actions. Crafting consistently meaningful, well-balanced variations for Critical Success, Success with Complication, and Failure across numerous scenarios demands significant design attention.
    * **Status:** The importance of this aspect for player agency is recognized and will be a focus during Event System content creation.

## 3. Mitigation & Approach Summary

The primary approach to managing these challenges involves:

* **Iterative Development:** Following the Phased Plan outlined in the Main GDD to build complexity incrementally, starting with core mechanics and loops.
* **Concurrent Design:** Developing core systems and modules in parallel where feasible, focusing on clear interfaces.
* **Prioritization:** Focusing development effort on core features required for each phase.
* **Flexibility:** Being open to adapting aspects of the design (e.g., J2ME approach) based on development realities.
* **Testing & Tuning:** Allocating specific time for balancing core mechanics and resource loops once functional prototypes are available.
* **Acceptance:** Acknowledging that the high ambition is part of the project's identity and requires sustained effort.

## 4. Living Document

This document is intended to be a living reference. It will be updated periodically as development progresses, challenges are overcome, mitigation strategies evolve, or new risks are identified.

--- Start of ./3-GDD-Coding-Architecture.md ---

# GDTLancer - Coding Standards & Architecture Guide

**Version:** 1.2
**Date:** May 16, 2025
**Related Documents:** GDTLancer Main GDD v1.7

## 1. Purpose

This document outlines the agreed-upon coding style conventions and core architectural patterns for the Godot Engine (v3.x) implementation of GDTLancer. Adhering to these principles aims to improve code readability, maintainability, modularity, and reusability across the project's different platforms and development phases.

## 2. Engine & Language

* **Engine:** Godot Engine v3.x (Targeting 3.6+ recommended for latest features within v3).
* **Renderer:** GLES2 backend (prioritizing performance and compatibility across target platforms, aligning with the Neo-Retro 3D visual style).
* **Language:** GDScript (using static typing hints where beneficial for clarity and error detection, e.g., `func my_func(param: String) -> bool:`).

## 3. Core Philosophy

* **Keep It Simple (KISS):** While aiming for depth, prefer simpler implementations where possible. Avoid over-engineering, especially in early phases. Favor clarity over excessive abstraction if it doesn't provide significant benefit. (e.g., Merging movement into the main agent script initially).
* **Modularity:** Structure the project and code logically around distinct responsibilities using the established framework:
    * **Gameplay Modules (Horizontal):** Self-contained activity loops (Piloting, Combat, etc.).
    * **Gameplay Layers (Vertical):** Functional implementations across modules (Simulation, Narrative, Agency, Progression).
    * **Gameplay Systems (Depth):** Cross-cutting rulesets managing specific domains (Events, Goals, Assets, etc.).
    * **Refactor for Clarity:** As functionality grows, proactively refactor large scripts that handle multiple responsibilities. Aim to split scripts when they significantly exceed approximately **300 lines** of code, breaking them down into smaller, focused components (Nodes with attached scripts) where appropriate (see Component Pattern).
* **Simulation Foundation + Narrative Layer:** Build core gameplay around simulation within modules. Layer narrative mechanics (Action Checks, Focus, Events, Goals) on top to handle uncertainty, abstraction, and story progression.
* **Player Agency:** Empower players with choices regarding risk vs. reward (Action Approaches), engagement level (manual vs. abstracted actions), and resource management (FP, WP, Time).
* **Reusability:** Design core components (base agent scripts, systems, potentially UI elements) to be reusable across different contexts. Leverage Godot's scene instancing and Resource system.
* **Decoupling:** Minimize hard dependencies between different systems and modules. Utilize the global `EventBus` for signaling events and state changes. Use `GlobalRefs` only for accessing essential, unique managers or nodes.

## 4. Code Formatting Standards

* **Automatic Formatting:** Use **`gdformat`** consistently to ensure uniform code style. Configure your editor or use pre-commit hooks to apply `gdformat` automatically.
* **Indentation:** Configure `gdformat` (or editor fallback) to use **Tabs** for indentation. (Godot Editor: `Editor -> Editor Settings -> Text Editor -> Indentation -> Type: Tabs`).
* **Line Length:** Configure `gdformat` (or editor fallback) for a maximum line length of approximately **100 characters**. `gdformat` will handle breaking lines logically.
* **Conditional Statements (`if`/`elif`/`else`):** **No Lumping.** `gdformat` enforces this standard. Statements controlled by a conditional must start on a new line, properly indented.
* **Naming Conventions:** Follow standard Godot GDScript conventions (enforced by `gdformat` where possible):
    * `snake_case` for variables and function names (e.g., `max_move_speed`, `_physics_process`). Use a leading underscore `_` for "private" methods or variables intended for internal use within the script.
    * `PascalCase` for class names (if using `class_name`), node names in the scene tree, and signal names defined within scripts (though `EventBus` signals use snake_case following convention for built-in signals).
    * `ALL_CAPS_SNAKE_CASE` for constants (`const`).
* **Comments:** Use `#` for comments. Write comments to explain the *why* behind non-obvious code, complex algorithms, or important design decisions, not just *what* the code does. Remove redundant or commented-out code sections once they are no longer needed.
* **Export Variables:** Only use `export var x` notation for defining data in templates (e.g., Resources deriving from a base script like `AgentTemplate`). Variables within standard node logic scripts should typically not be exported unless necessary for editor tweaking during development; prefer initialization via `initialize()` methods.

## 5. Architectural Patterns & Practices

* **Autoload Singletons:** Utilize sparingly for truly global services:
    * `Constants`: Global constants (paths, names, tuning).
    * `GlobalRefs`: Holds references to unique, essential nodes/managers (Player, Camera, WorldManager, key Systems). Nodes register themselves here. Access via `GlobalRefs.node_name`.
    * `EventBus`: Central signal dispatcher for decoupled communication between systems/modules.
    * `CoreMechanicsAPI`: Centralized functions for core rule resolution (e.g., `perform_action_check`).
    * `GameStateManager`: Centralized save/load logic.
    * Other major systems (`EventSystem`, `GoalSystem`, etc.) should generally start as regular Nodes managed within the main scene tree to control initialization order, promoting to Autoload only if strictly necessary later.
* **Component Pattern:** Use child Nodes with attached scripts to encapsulate distinct functionalities (e.g., `MovementSystem`, `NavigationSystem`). This aids modularity and adheres to the script splitting guideline.
* **Resource Templates (`.tres`):** Use custom `Resource` scripts (`extends Resource`, `class_name`) to define data structures (e.g., `AgentTemplate`). Create `.tres` files based on these scripts in the `assets/data/templates/` folder. Initialize objects using these loaded Resource objects rather than large hardcoded Dictionaries in scripts.
* **Scene Instancing:** Leverage Godot's scene instancing for creating Agents (e.g., `npc_agent.tscn` instances `agent.tscn`), loading Zones, assembling complex UI elements, etc.
* **Scene/Folder Structure:** Adhere to the defined project structure (`core`, `modules`, `scenes/zones`, `assets/data`, etc.) to maintain organization. Follow conventions for node structure within key scenes (e.g., Agent scenes contain "AgentBody" KinematicBody + component nodes; Zone scenes contain "AgentContainer").
* **Decoupling:** Prioritize communication via `EventBus` signals over direct node calls where feasible. Use `GlobalRefs` primarily to *obtain* references needed to call specific methods or connect signals, not for widespread direct state manipulation from unrelated scripts.
* **Initialization:** Prefer initializing node properties via an `initialize(config)` method called *after* the node is instanced and added to the tree, passing necessary configuration data (often loaded from a `.tres` template Resource). Fetch required node references (`get_node`, etc.) within `initialize` or `_ready` as appropriate based on when the references are needed (fetch in `initialize` if needed during initialization itself, otherwise `_ready` is generally safer).
* **Global Sequence Logging:** Implement high-level `print` statements in key initialization points (e.g., Autoload `_ready`, `WorldManager` start/zone load stages, `AgentBody` initialize) to provide a comprehensible overview of the game startup and loading sequence. Use a consistent prefix for these logs (e.g., `WM:`, `Sys:`, `Agent:`) and consider simple step counters (like `WM: 1/X - Action`) for clarity. Avoid excessively detailed logging at this global level.

--- Start of ./4.1-GDD-Analogue-Setup.md ---

# GDTLancer Analogue Version Setup

**Version:** 1.2
**Date:** May 16, 2025
**Related Documents:** GDTLancer Main GDD v1.7, Core Mechanics Design v1.3, Module/System GDDs (as developed)

## 1. Overview & Philosophy

This document outlines the standard physical components and recommended setup for playing the Analogue (Tabletop RPG) version of GDTLancer. The goal is to deliver the core GDTLancer experience – balancing simulation abstraction with narrative mechanics, player agency, and emergent storytelling – using tabletop materials.

The Analogue version relies on narrative resolution mechanics (`Action Checks`, `Event System`) and abstract resource management (**Time Clock**, **WP**) rather than detailed simulation. Gameplay typically proceeds in turns or abstract time intervals.

## 2. Required Components

A typical solo or group session requires the following physical components per player or shared:

1.  **Dice:** At least three standard six-sided dice (3d6).
2.  **Character Sheet(s):** One per player character.
3.  **Map Sheet(s):** Represents the known space environment.
4.  **Asset/Module Sheet(s):** Representing key owned Assets (ships, major equipment).
5.  **Universal Mechanics Reference:** A concise rules summary sheet.
6.  **Module Event Booklet(s)/Reference(s):** Detailed outcome tables for specific Gameplay Modules.
7.  **Tokens/Trackers:** For managing variable values like Focus Points, Wealth Points, the Time Clock, Hull/Shield integrity, etc.

## 3. Component Details & Organization

* **3.1. Map Sheet(s):**
    * **Purpose:** Provides spatial context for navigation, exploration, world state.
    * **Content:** Systems, points of interest, routes (with segment costs in **Time Units (TU)**, descriptors), hazards. Space for player annotations.
    * **Format:** Pre-generated maps, pointcrawls, hex grids; potentially multiple scales.

* **3.2. Character Sheet:**
    * **Purpose:** Tracks core Agent identity, capabilities, narrative state, and key meta-resources.
    * **Content:** Name, Description, Base Skills (for calculating Module Modifiers), Current/Max **Focus Points (FP)**, Current **Wealth Points (WP)**, **Time Clock** (e.g., 8 segments for tracking TU), XP/Progression track, Active Goals list, inventory/cargo summary, status effects.

* **3.3. Asset/Module Sheet(s):**
    * **Purpose:** Represents owned Assets and provides context for enabled Gameplay Modules.
    * **Format:** Double-sided sheet/card per major Asset or small booklet.
    * **Content:**
        * **Asset Side:** Asset Name, Description/Image, Key Stats (e.g., Hull Max, Shield Max, Cargo Capacity), `Asset Difficulty` scores, Enabled Modules list, Asset condition track. *(No Fuel/Supply Max here)*.
        * **Module Side(s):** For each enabled Module: Module Name, Relevant Skill reference, Calculated **Module Modifier** space (`Skill + Asset Difficulty = ___`), **Integrated Outcome Table** (Summary + Event Ref Code for Risky/Cautious), Asset Variations, Module-Specific Resource Tracks (if any, e.g., special ammo). *(No direct Fuel/Supply cost references here)*.

* **3.4. Universal Mechanics Reference:**
    * **Purpose:** Quick rules lookup.
    * **Content:** Action Check summary (3d6+Mod vs 10/14), Focus Point rules, Action Approach definitions (`Risky`/`Cautious`), basic Time Clock/World Event Tick overview, basic WP usage overview.

* **3.5. Module Event Booklet(s)/Reference(s):**
    * **Purpose:** Provides detailed outcomes for Event Reference Codes from Asset/Module sheets.
    * **Structure:** Organized by Module, indexed by Event Ref Code (e.g., `C-SWC-PILOT`).
    * **Content:** Descriptions, mechanical effects (stat changes, WP costs/rewards, **TU additions for delays**, new checks required, module switches, status effects), d6 sub-tables. *(Outcomes focus on narrative/mechanical impact rather than just fuel loss)*.

* **3.6. Tokens/Trackers:**
    * **Purpose:** Physical representation for fluctuating values.
    * **Examples:** Tokens/dice for Focus Points, Wealth Points, Hull/Shield points; a marker for the **Time Clock**; markers for Progress Tracks and map position.

## 4. Gameplay Flow Summary

1.  **Consult Map & Character Sheet:** Determine location, goals, resources (FP, WP), Time Clock status.
2.  **Choose Action & Engage Module:** Decide action (e.g., Travel). Select relevant **Asset/Module Sheet**. Note **Module Modifier**.
3.  **Declare Action & Approach:** State action (e.g., `Undertake Journey` segment) & declare `Act Risky` or `Act Cautiously`.
4.  **Make Action Check:** Roll 3d6 + Mod + FP bonus. Compare to Thresholds. Consult **Universal Mechanics Reference** if needed.
5.  **Find Outcome:** Use **Integrated Outcome Table** on **Asset/Module Sheet**. Note summary & **Event Reference Code**.
6.  **Resolve Outcome:** Look up Code in **Module Event Booklet**. Apply effects: update Character Sheet (**FP**, **WP**, Goals, status), **advance Time Clock (+TU)**, potentially trigger new checks or module transitions.
7.  **Check Time Clock:** If Time Clock fills, resolve **World Event Tick** (See Section 5).
8.  **Update State:** Mark map position, etc. Repeat from Step 1/2.

## 5. World Evolution ("World Event Tick")

* Simulates dynamic world changes in the Analogue Version. Triggered when the **Time Clock** on the Character Sheet fills.
* **Resolution:** Typically involves consulting Event System tables/procedures for background events AND requiring the player to pay an **Upkeep Cost in WP** representing abstract operational expenses (fuel, supplies, maintenance) accrued over that time period. Failure to pay Upkeep has consequences. The Time Clock then resets.

--- Start of ./4.2-GDD-Analogue-Setup-Formatting.md ---

# GDTLancer Analogue Version - Setup & Formatting Guide

**Version:** 1.1
**Date:** May 16, 2025
**Related Documents:** GDTLancer Main GDD v1.7, Core Mechanics Design v1.3, Analogue Setup v1.2, Module/System GDDs

## 1. Purpose

This document details the recommended physical layout, content organization, and formatting principles for the printed materials used in the Analogue (Tabletop RPG) version of GDTLancer. The aim is to ensure clarity, ease of use, and efficient information access during play, supporting the game's modular design.

## 2. General Formatting Principles

* **Paper Size:** Primarily target A4/Letter for main sheets (Character, Map) and A5/Half-Letter for reference cards/booklets where practical. A bound A5 notepad format is a potential alternative structure.
* **Layout:** Utilize clean, readable fonts (e.g., sans-serif 10-12pt for body text, larger for headings). Employ clear headings, logical information grouping (using boxes or sections), and sufficient white space.
* **Tracking Methods:** Standardized methods for tracking dynamic values:
    * **Linear Progress Tracks:** (e.g., Goal Progress, Time Clock) Use tracks printed along a reinforced (clear tape recommended) edge of the relevant sheet, marked with **paperclip sliders**. Typically 8-10 segments.
    * **Point Pools:** (e.g., Focus Points, Wealth Points, Hull/Shields) Use marked boxes `[ ]` or dedicated areas for writing the current value with pencil or erasable marker (if using laminated sheets/protectors). Small pools like Focus Points (FP) can use check-boxes `[ ] [ ] [ ]`.
    * **Notes & Dynamic Stats:** Use pencil or erasable markers for temporary notes, status effects, or calculated values like the Module Modifier.
* **Modularity:** Design sheets to function together. Information should be located where it's most relevant contextually (e.g., core character stats on Character Sheet, operational modifiers on Asset/Module Sheets). Minimize redundant information.

## 3. Component Layouts

* **3.1 Character Sheet Layout:** (Primary Sheet, e.g., A4/Letter)
    * **Section 1: Agent Identification:** Character Name, Pronouns, Concept/Background Summary, Player Name.
    * **Section 2: Core Skills/Stats:** List base Skill values (e.g., Piloting: `[+X]`, Tech: `[+Y]`, Social: `[+Z]`, etc.). These are the foundation for calculating Module Modifiers.
    * **Section 3: Meta-Resources & Condition:**
        * Focus Points (FP): Track (e.g., `FP: [ ] [ ] [ ]` Max 3).
        * Wealth Points (WP): Box for current value `WP: [ ___ ]`.
        * Condition/Stress Track (Optional, if added later).
    * **Section 4: Time & World State:**
        * **Time Clock Track:** Linear track (e.g., 8 segments: `[ ][ ][ ][ ][ ][ ][ ][ ] TU`) along one reinforced edge for a paperclip slider. Label clearly.
    * **Section 5: Progression:**
        * XP Track or Milestone list/checkboxes.
        * Notes area for earned Perks/Assets summary (names only).
    * **Section 6: Active Goals/Vows:**
        * Area to list 2-3 active Goals. For each: Goal Name/Objective, Rank (optional), **Progress Track** (linear track, e.g., 10 segments `[ ][ ]...[ ]`) along a reinforced edge for a paperclip slider.
    * **Section 7: Status & Notes:** Area for temporary status effects, campaign notes, quick inventory reference (non-Asset items), contacts.

* **3.2 Map Sheet(s) Layout:** (A4/Letter or larger, potentially foldable)
    * **Main Area:** Visual map (pointcrawl, hex, sector chart) showing locations, routes (with TU costs), known hazards, faction territories. Clear Key/Legend.
    * **Annotation Space:** Margins or dedicated areas for player notes, marking current location, drawing discovered routes, tracking local threats/opportunities.

* **3.3 Asset/Module Sheet Layout:** (A5/Half-Letter card/sheet, likely double-sided, one per major Asset)
    * **Side 1: Asset Details:**
        * Header: Asset Name & Type (e.g., Ship: Wayfarer Freighter).
        * Visual: Image/Icon (Optional).
        * Description: Brief flavor text.
        * Core Stats: Hull `[ ]/[Max]`, Shields `[ ]/[Max]`, Cargo Capacity `[X]`, etc. Relevant **`Asset Difficulty`** scores (e.g., Piloting: -3, Combat: -4).
        * Enabled Modules: List of Gameplay Modules this Asset grants access to.
        * Condition/Notes: Track damage, quirks, modifications specific to this Asset.
    * **Side 2: Enabled Module Details** (Sections repeated or expanded as needed):
        * Header: Module Name (e.g., Piloting & Travel).
        * **Modifier Calc:** `Uses Skill: [e.g., Piloting]` | `Asset Difficulty: [-3]` | `Current Skill: [+_]` | **`Module Modifier = [___]`** (Space for player to calculate & write).
        * **Action Outcome Summary:** The compact table referencing Risky/Cautious outcomes:
            ```
            | Result      | Cautious Outcome / Ref Code | Risky Outcome / Ref Code |
            |-------------|-----------------------------|--------------------------|
            | Crit (14+)  | Stable Success+ / C-CRIT-PILOT| Major Success++ / R-CRIT-PILOT|
            | SwC (10-13) | Success + Minor Cost / C-SWC-PILOT | Success + Notable Cost / R-SWC-PILOT|
            | Fail (<10)  | Fail + Minor Setback / C-FAIL-PILOT | Fail + Major Conseq. / R-FAIL-PILOT |
            ```
        * **Module Mechanics:** Brief summary of key module actions (e.g., `Undertake Journey`, `Fast Transit` TU costs).
        * **Asset Variations:** List special bonuses/actions *this Asset* provides *in this Module*.
        * **Module Resources:** Tracks for specific ammo, charges, etc. (if applicable).

* **3.4 Universal Mechanics Reference Layout:** (A5/Half-Letter card or separate A4 sheet)
    * **Action Check:** Flowchart or steps (Roll 3d6 + Mod + FP -> Compare vs 10/14).
    * **Focus Points:** Gain/Loss rules, Spending options (Narrative Boost, Sim Boost).
    * **Action Approaches:** Definitions of `Act Risky` / `Act Cautiously` and their general impact on outcome severity.
    * **Time Clock & World Event Tick:** Summary of how TU are tracked and what happens when the clock fills (Tick -> Event + WP Upkeep -> Reset).
    * **Wealth Points:** Brief definition and primary uses (Upkeep, Major Costs).
    * *(Optional)* Basic status effect definitions.

* **3.5 Module Event Booklet(s)/Reference(s) Layout:** (Booklet, multi-page A5/Half-Letter, or cards)
    * **Organization:** Clearly titled by Module (e.g., "Piloting & Travel Events"). Entries organized and indexed by **Event Reference Code** (e.g., `C-SWC-PILOT`, `R-FAIL-PILOT`).
    * **Content per Entry:**
        * Reference Code.
        * Brief Narrative Flavor text expanding on the summary.
        * Specific Mechanical Effects (WP cost/gain, TU add, Hull/Shield damage, status effect applied, next Action Check required, Module switch, roll on d6 sub-table).
        * Clear distinction between Cautious and Risky versions where applicable. Use formatting (bolding, lists) for clarity.

## 4. Information Flow Example

Player decides to `Undertake Journey` (Piloting Module action). They grab their **Ship Asset Sheet**, look at the Piloting section (Side 2), calculate the `Module Modifier` using their **Character Sheet**'s Piloting Skill and the ship's `Asset Difficulty`. They declare `Act Cautiously`. They roll 3d6, potentially spend FP (tracked on Character Sheet), add the Module Modifier. They check the result against thresholds (from **Universal Ref**). They find the outcome summary and Ref Code on the **Asset/Module Sheet**'s table. They look up the Ref Code in the **Piloting Event Booklet**, apply the detailed effects, mark TU on the **Character Sheet**'s Time Clock, and potentially update the **Map Sheet**.

--- Start of ./5.1-GDD-Module-Piloting.md ---

# GDTLancer Module Design: Piloting & Travel

**Version:** 1.4
**Date:** May 16, 2025
**Related Documents:** GDTLancer Main GDD v1.7, Core Mechanics Design v1.3

## 1. Purpose & Scope

* **Module Name:** Piloting & Travel
* **Purpose:** Governs Agent ship movement within and between systems, supporting direct simulation control and abstracted narrative resolution. Manages the passage of abstract time during travel.
* **Scope:** Initiating/executing travel, navigation, hazard avoidance, advancing the Time Clock, resolving travel-related events. Excludes detailed combat maneuvering (Combat Module) and specific docking interactions (Interaction Module). Direct resource costs for travel are handled abstractly via the global WP Upkeep system triggered by the Time Clock.

## 2. Core Activities

* **Manual Flight:** Direct, real-time control of the ship (digital primary). Advances Time Clock at a baseline rate or during specific actions.
* **Abstracted Travel:** Narrative resolution for journeys using `Undertake Journey` or `Fast Transit`. Directly advances the Time Clock.

## 3. Manual Flight Mode

* **Description:** Simulation-focused flight allowing direct player control. Success primarily depends on player skill and ship performance stats. Default for detailed in-system activity (digital).
* **Narrative Integration:** Specific high-stakes moments (**Trigger Actions**) prompt resolution via the core **Action Check**. Player typically declares an **Action Approach** (`Act Risky`/`Act Cautiously`). Resolution uses Action Check (3d6 + Mod + FP) vs Thresholds, consulting appropriate outcome branch. Outcomes impact game state, potentially add **Time Units (TU)** to the Time Clock (especially Cautious delays/complications).
* **Focus Use:** **Focus Points (FP)** spent before Action Checks or for instant simulation boosts.
* **Time Cost:** Engaging in detailed manual flight for significant durations advances the **Time Clock** at a default rate (TBD) or specific actions might add TU.

## 4. Abstracted Travel Modes (Introduction)

* **Concept:** Methods for resolving travel narratively, offering choices in pacing and engagement. Primary travel methods in the Analogue Version. Directly impact the **Time Clock**. Specific mechanics detailed in Section 5.
* **Modes:** `Undertake Journey` (segment-by-segment) and `Fast Transit` (single-roll skip).

## 5. Module-Specific Mechanics

These mechanics resolve abstracted travel using the core Action Check system, incorporating Action Approaches and directly interfacing with the Time Clock.

* **5.1. `Undertake Journey` (Segment-by-Segment Resolution)**
    * **Purpose:** Standard abstracted travel, higher fidelity/event density.
    * **Trigger:** Resolving travel one segment at a time.
    * **Mechanic:** Player declares **Action Approach** (`Act Risky`/`Cautiously`) for the segment. Make one **Action Check** (3d6 + Piloting Mod + FP spend vs. Thresholds) per segment. Resolve outcome sequentially.
    * **Time Cost:** Each segment **adds +1 TU (base)** to the **Time Clock**. Cautious Complications or specific events may add additional TU.
    * **Outcomes & Events:** Roll result + Approach determines outcome via **Event System**. Risky approach trends toward more extreme positive/negative events; Cautious towards stability and potential TU delays. Failure typically interrupts journey and triggers Major Complication/Event.
* **5.2. `Fast Transit` (Single-Roll Skip)**
    * **Purpose:** Optional fast-forward mechanic for speed over detail.
    * **Trigger:** Player chooses to resolve an entire multi-segment route with one roll.
    * **Mechanic:** Player declares **Action Approach** (`Act Risky`/`Cautiously`). Make **one** **Action Check** (3d6 + Piloting Mod + FP spend vs. Thresholds) for the entire journey. Difficulty may adjust based on route.
    * **Time Cost:** Immediately **add +1 TU per segment skipped** to the **Time Clock** upon initiation. This may trigger one or more **World Event Ticks** (and associated WP Upkeep demands) upon resolution.
    * **Outcomes & Events:** Compressed results via **Event System**, severity influenced by Approach. Crit = clean arrival (+Focus). SwC = arrival + summarized Minor Comp. Failure = journey interrupted by Major Failure Event en route (+Lose Focus).

## 6. Module-Specific Progression (TBD)

* *(To Be Defined)* Potential for improving Piloting Mod, unlocking travel-related Asset Variations, tracking travel achievements (via global Progression System).

## 7. Key Mechanics Utilized (Global)

* **Action Check System:** Resolves Trigger Actions and Abstracted Travel.
* **Action Approach System:** Modifies outcome interpretation (`Risky`/`Cautious`).
* **Focus System (FP):** Provides agency via roll influence and buffs.
* **Time Clock System (TU):** Paces gameplay, triggers World Event Ticks. Advanced by travel and actions within this module.
* **Wealth Point System (WP):** Covers major costs; periodic Upkeep triggered by World Event Ticks covers abstract operational costs. Not directly spent *per segment* here.
* **Event System:** Provides narrative/mechanical outcomes for travel events/complications.

## 8. Interface with Other Systems/Modules

* **Transitions:** Enters/Exits from space scenes, docking (Interaction Module).
* **Triggers:** Can trigger Combat, Repair, Investigation based on Event System outcomes.
* **Outputs:** Advances Time Clock. Feeds data to Progression System (XP) and Chronicle System (history logging). Triggers World Event Ticks indirectly via Time Clock.

## 9. Analogue Version Notes

* Manual flight moments resolved via Action Checks with chosen Action Approach.
* Core travel uses player choice of **`Undertake Journey`** (segment-by-segment, advancing TU Clock each segment) or **`Fast Transit`** (single roll, advancing TU Clock upfront for all segments).
* Map essential. Track **Time Clock** and **WP** (for Upkeep during World Event Ticks). Relies on Event System tables/booklets.

## 10. UI/UX Notes (Digital)

* Clear mode indication (Manual/Abstracted).
* HUD for flight data & ship status. Map interface for route plotting.
* Clear prompts for Action Checks including **Action Approach choice**.
* UI for abstracted travel progress/outcomes. Visible **Focus Point** meter & spending options. Visible **Time Clock** progress. **WP** balance visible (likely global UI).

--- Start of ./6.1-GDD-Lore-Background.md ---

# GDTLancer - Lore & Background

**Version:** 1.3
**Date:** May 16, 2025
**Related Documents:** GDTLancer Main GDD v1.7, Core Mechanics Design v1.3

## 1. Overview

This document outlines the foundational lore and background history for the GDTLancer universe. The intent is for this history to primarily inform game mechanics, character dialogue, environmental design, technological limitations, and societal norms, allowing the player to experience its consequences organically rather than through direct exposition. The primary gameplay space is divided into **Sectors**, which can encompass one or more star systems, nebulae, or distinct regions thereof, designed to keep travel distances and times manageable.

## 2. Origins & Departure from Earth

* **Ancestry:** The current inhabitants of the **Opulence** system are descendants of various refugee groups from a future Earth. Their primary vessel, a massive generation ship, is known as **"The Keystone."**
* **Departure Era:** The exodus from Earth occurred in waves, primarily during the early-to-mid 2100s. Various disaffected minorities, persecuted groups, and those seeking to escape specific regional strife or ecological pressures departed at different times, in different ships. The Keystone was one such major effort.
* **Earth's Status:** Earth itself was not destroyed or universally collapsed. It continued its typical cycles of regional decline and prosperity, conflict and cooperation, as has often been the case for human civilization. For the departed parties aboard The Keystone, Earth became a distant memory, a point of origin they had no intention (or capability) of returning to, largely irrelevant to their current existence, separated by vast distances of space and potentially time.
* **Mission Imperative:** The voyage of The Keystone was fundamentally a flight to find a new, safe home, away from terrestrial persecution and hardship. It was a "one-way trip" driven by the need for survival and self-determination, not by a grand design of exploration or colonial ambition from a unified Earth.

## 3. The Keystone (Generation Ship)

* **Design Philosophy:** A colossal, monolithic vessel, engineered for extreme durability and the ultra-reliability of its core systems, intended to function autonomously for centuries if needed.
* **Structural Integrity:** The Keystone was heavily shielded to withstand the anticipated rigors of long-duration interstellar travel.
* **Artificial Gravity:** Designed as a massive cylinder, The Keystone spun along its axis to generate a consistent, sub-1g gravitational environment.
* **Internal Environment:** Featured a fully enclosed, self-sustaining ecosystem. There were no external windows or standard hatches to the void. The internal atmosphere was maintained at a minimal, yet safe, low pressure.
* **Propulsion System:** Utilized rudimentary, automated, "set-and-forget" Sub-Light Travel (STL) engines, designed for a multi-century coasting journey.

## 4. The Interstellar Journey & The Looming Anomaly

* **The Anomaly's Shadow:** Approximately one century before The Keystone was directly impacted, a vast and inexplicable spatio-temporal distortion—later simply termed "the Anomaly"—was detected far along its projected path. Its immense scale and unusual properties (a slow, gradual warping of space-time, exhibiting characteristics akin to an incredibly diffuse and large-scale stable wormhole or a region of fundamentally altered cosmic fabric) became sources of intense study and growing apprehension.
* **Generations in Preparation:** Several generations aboard The Keystone were born and raised with the knowledge of the impending encounter. While its precise effects remained unpredictable, contingency planning, targeted research into theoretical physics, advanced sensor technology, and structural reinforcement became paramount. However, no prediction accurately foresaw the ultimate consequence of the transit—a massive, uncontrolled spatial displacement.
* **Trials and Tribulations:** The voyage was characterized by systemic issues:
    * Slow degradation of non-critical systems.
    * Imbalances within the closed-loop ecosystem, leading to a persistent, low-level fear of starvation and a deep cultural respect for food and all life-sustaining resources.
    * Miscalculations regarding long-term resource consumption.
    * Accumulated human error in maintenance.
    * Constant, low-level radiation exposure (cryosleep was not viable).
    * Despite these, core systems (hull, spin gravity, primary life support) remained intact.
* **Population Dynamics (Journey):** A natural, gradual reduction in population occurred due to resource limitations and the harsh realities of the journey.
* **Knowledge Management (Journey):**
    * **Preservation Focus:** A fanatical dedication to preserving and improving *survival-critical* knowledge (engineering, life support, fabrication, closed-loop agriculture, Anomaly data).
    * **Knowledge Attrition:** Much of Earth's general cultural, historical, and non-critical scientific knowledge became fragmented or lost.

## 5. The Anomaly Transit & Arrival in Opulence

* **The Slow Transit:** The Keystone's passage through the Anomaly was not a rapid event but a protracted transit that may have lasted decades. The effects of traversing this region of distorted space-time were subtle from within, with no immediate, violent stresses.
* **The Great Leap & Uncharted Space:** Upon exiting the Anomaly, The Keystone found itself flung across an unknown and vast cosmic distance into an entirely uncharted region of space, far from any known star charts. There is a lingering uncertainty about a potential temporal displacement as well.
* **New Anchor - Opulence System:** The Keystone's systems eventually brought the vessel to a halt near a G-type star within a new system, subsequently named **"Opulence"** due to the star's abundant energy output.
* **Primary Post-Arrival Scarcity:** Energy was plentiful, but *matter* (raw materials for repairs, expansion, new vessels) was critically scarce.

## 6. Post-Arrival: Transformation & Initial Strides in Opulence

* **The Keystone's New Role:** The Keystone began a slow process of self-transformation, recycling non-essential sections.
    * It became the central hub for energy collection, refining, fabrication, knowledge archival (especially Anomaly data), and education.
* **Early Fleet & Automation:** The first new constructions were small survey/prospecting vessels and automated mining machinery.
* **First Successes & Sustainability:** Initial successes involved asteroid mining, replenishing internal stocks, and achieving basic self-sustainability.

## 7. The People: Generations, Adaptation & Society

* **The "Founders":** This cohort consists of those born during the latter journey stages or early Opulence period. They focus on The Keystone's integrity, Anomaly research, education, strategic planning, and knowledge preservation. They often favor cautious approaches, potentially granting gameplay bonuses to `Act Cautiously` options.
* **The "Voyagers":** This is the first generation largely born and raised within Opulence, experiencing energy abundance but matter scarcity. They are somewhat established, with a foundational understanding of their new environment.
    * **Driving Motivation:** To establish a permanent, thriving, resilient, and *space-bound* civilization, emphasizing outward expansion for resources, habitat diversification, and system redundancy.
    * **Primary Focus:** Exploration of Opulence and nearby sectors, asteroid surveying/mining, establishing outposts. A key long-term goal is understanding the Anomaly to potentially develop controlled FTL travel (e.g., jump gates) for inter-sector expansion.
* **Population Dynamics (Post-Arrival):** Slowly expanding, but overall population remains scarce, placing high value on each individual. This fosters in-depth character interactions and simulations (akin to Dwarf Fortress), where NPCs have significant agency and can impact the world.
* **Core Physiological Adaptations:**
    * **Radiation Resistance:** Enhanced biological resistance to radiation.
    * **Low-Pressure Acclimatization:** Adaptation to sustained very low atmospheric pressure.
    * **Gravity Attunement:** Physiology tuned to The Keystone's sub-1g gravity.
    * **Specialized Digestion:** Efficiently processes recycled/limited diets.
    * **Sensory Attunement:** Senses attuned to enclosed, artificial environments.

## 8. Core Psychology & Culture

* **Environmental Dispositions:**
    * Profound agoraphobia (fear of open, unbounded spaces, especially planetary surfaces) and claustrophilia (need for enclosure).
* **Habitat Philosophy:** Planets are generally viewed as terrifying, resource-intensive, and hostile or irrelevant; their extensive exploration or settlement is not a cultural priority. Space (asteroids, void habitats) is the only viable environment.
* **Behavioral Traits & Values:**
    * Generational trauma from Earthly persecution and the journey's hardships (including fear of starvation) has instilled a "one-way trip" resolve and a deep-seated need for self-sufficiency, control, and order.
    * Extreme pragmatism and utilitarianism.
    * High respect for food and all life-sustaining resources.
    * Reverence for practical knowledge, engineering, resource management, systemic redundancy, diversification of efforts, and sustainable existence.
    * Strong emphasis on knowledge sharing within trusted communal/clan units.
* **Societal Structure & Relationships:**
    * Traditional Earth-based notions of monogamy are not strictly relevant; familial and sexual ties are often more fluid and diverse, fostering a less rivalry-prone and possessive mindset in personal relationships (though not necessarily regarding resources or trust).
    * Meritocracy is a cornerstone: skills, contributions, and trustworthiness define an individual's standing far more than gender, orientation, or ancestry. Prejudice, if it exists, tends to target perceived uselessness, lack of contribution, or breaches of communal trust.
* **Outlook & Conflict:**
    * **Interpersonal Conflict:** Direct, violent conflict between individuals or groups within the Opulence civilization is heavily taboo and extremely rare, a consequence of population scarcity and the absolute necessity of cooperation for survival.
    * **Ritualized Combat:** When disputes cannot be resolved through other means, or for maintaining combat readiness, highly ritualized, (usually) non-lethal ship-based duels might occur. These are expensive undertakings, designed to minimize loss of life and precious matter. They often eschew projectiles in favor of mounted melee weapons (lances, cutting beams, rams) – hinting at the "Lancer" aspect – to prevent matter dispersion. Duels to the death are exceptionally rare and typically a matter of last resort for unforgivable crimes against the community. There are no massive fleet-on-fleet engagements.
    * **External Threats:** Projectile weapons (often reusable like harpoons, kinetic impactors, or javelins) are maintained and considered less resource-intensive for potential defense against unknown external threats or for "hunting" spacebourne lifeforms (purpose: defense and scarce minerals collection).

## 9. Technology & Expansion

* **Technological Foundation:** Rooted in The Keystone's "humble but ultra-reliable" original technology, now being iteratively improved.
* **Technological Focus:** Robotics, small vessel design, fabrication, asteroid mining/processing, and the critical study of the Anomaly for breakthroughs in propulsion and spatial manipulation.
* **Exploration Style:** Purpose-driven (resources, outpost locations, Anomaly research), not idle curiosity. Procedurally generated "dungeon-like" space pockets might represent unstable Anomaly echoes or newly discovered resource fields.
* **Settlement Strategy:** Expanding network of small, enclosed, defensible outposts (asteroid-based or bespoke void habitats).

## 10. Names, Surnames, and Languages (Outline)

* **Cultural Melting Pot:** The generations aboard The Keystone, originating from diverse refugee groups, would have led to a blending of terrestrial cultures, languages, and naming conventions.
* **Naming Conventions:**
    * **Given Names:** Likely a mix of traditional names from various Earth cultures, perhaps shortened or phonetically altered over time. New names might also have emerged, inspired by significant events, revered individuals on The Keystone, or even technical components.
    * **Surnames/Family Names:** Could be a mix of inherited Earth surnames, names adopted based on an ancestor's role or achievement on The Keystone (e.g., "Hydroponics-Zhang," "Engineer-Kovalenko," "Spinner-Nia"), or identifiers linked to their original departure group/ship (if multiple groups merged onto The Keystone). Clan-like structures might use shared identifiers.
* **Language:** A lingua franca would have likely developed – a creole or simplified trade language based on dominant languages from the original refugee groups, heavily infused with technical jargon related to The Keystone's operation and space travel. Original Earth languages might exist in fragmented forms, preserved within families or for archival/cultural purposes.
* **(Further details and specific name/language tables to be developed later.)**

## 11. Ambient Lore Implementation Goal

The player should experience the *results* and *consequences* of this historical background through:
* **Game Mechanics:** Scarcity models, resource types, ship capabilities, upgrade paths.
* **Character Dialogue:** NPC attitudes, generational differences, common parlance.
* **Environmental Design:** The look and feel of The Keystone, outposts, and ship interiors.
* **Technological Limitations:** Reflecting their evolutionary path and current research.
* **Societal Norms & Faction Beliefs:** How groups interpret their history and envision the future.
Direct exposition should be minimized in favor of "showing, not telling."

--- Start of ./6.2-GDD-Player-Onboarding.md ---

# GDTLancer - Player Onboarding Design

**Version:** 1.0
**Date:** May 16, 2025
**Related Documents:** GDTLancer Main GDD v1.7, UI/UX Principles (Section 6 in GDD-Main), Core Mechanics Design v1.3

## 1. Purpose & Challenge

* **Purpose:** This document outlines the strategy and considerations for player onboarding in GDTLancer, aiming to smoothly introduce players to the game's various interconnected systems and mechanics.
* **Challenge - Information Density:** GDTLancer features a rich set of mechanics (Gameplay Modules, Development Layers, Core Systems like Events & Goals, resources like Focus Points, Wealth Points, Time Units, and core resolution mechanics like Action Checks and Action Approaches). While this depth is a core design goal, presenting it all at once can be overwhelming for new players, potentially hindering their engagement and enjoyment.

## 2. Guiding Principles for Onboarding

The onboarding process will adhere to the following principles, aligning with the UI/UX Principles (GDD-Main, Section 6) that emphasize clarity and accessibility:

* **Gradual Introduction:** Core systems and mechanics will be introduced sequentially, not simultaneously. Each new element should build upon previously understood concepts.
* **Contextual Learning ("Just-in-Time Teaching"):** Mechanics and systems will be taught when they become directly relevant to the player's current situation, goals, or available actions. Avoid front-loading all information.
* **Learn by Doing:** Prioritize interactive tutorials, guided first experiences, and simple introductory tasks over passive text dumps or lengthy unskippable cutscenes.
* **Layered Complexity:** Allow players to engage with the basic functionality of a system first. Advanced options, strategic depth, and intricate inter-system synergies can be revealed or unlocked later, or be opt-in for players seeking mastery.
* **Clear & Immediate Feedback:** The UI/UX must provide clear, concise, and immediate feedback for player actions and the status of relevant systems (e.g., changes in FP, WP, Time Clock progression).
* **Reinforcement & Repetition:** Provide opportunities for players to safely practice and reinforce learned mechanics in low-stakes environments before they become critical.
* **Optional Depth & Player Pacing:** While core concepts are essential, deep mastery of all system interplays should be optional for basic game progression and enjoyment, rewarding players who invest more time in understanding. Players should feel a degree of control over the pace of learning.
* **Minimal Hand-Holding Post-Introduction:** While initial guidance is crucial, the onboarding should aim to empower players to explore and experiment independently once core concepts are grasped.

## 3. Onboarding Phases & Strategies

The onboarding process will be woven into the early stages of gameplay, likely corresponding with the player character's initial experiences as a "Voyager."

* **Phase 1: Core Piloting & Resource Awareness (First Hour)**
    * **Introduction:** Basic 3D ship movement and controls (Manual Flight).
    * **First System Introduced:** The **Time Clock** and **Time Units (TU)**, introduced via initial short-range travel or simple tasks that consume time.
    * **First Action:** A very simple, low-stakes **Trigger Action** that introduces the concept of an **Action Check** (perhaps without modifiers initially, or with a clearly explained, fixed positive modifier).
    * **First Meta-Resource:** Introduction to **Focus Points (FP)** and their basic use in boosting an Action Check. The FP gain/loss cycle should be experienced early.
    * **UI/UX Focus:** Clear HUD elements for ship status, TU/Time Clock, and FP. Contextual tooltips for these elements on their first appearance.
    * **Example Scenario:** A "maiden voyage" or a simple delivery task within a safe, contained area of the Opulence system, perhaps guided by a Founder NPC or a senior Voyager.

* **Phase 2: Understanding Consequences & Choices (Hours 1-3)**
    * **Introduction:** The **Action Approach** system (`Act Risky` / `Act Cautiously`) introduced in a scenario with clear branching outcomes.
    * **Module Modifiers:** The concept of skills and asset difficulties influencing the `Module Modifier` is introduced as the player undertakes slightly more complex tasks or acquires their first basic asset/upgrade.
    * **Second Meta-Resource:** Introduction to **Wealth Points (WP)** through a significant first reward or a necessary major expenditure (e.g., critical ship component, essential data).
    * **Event System Teaser:** A simple, impactful event (from the Event System) occurs, perhaps as a direct consequence of an Action Check, demonstrating how the world can react unexpectedly.
    * **Goal System Introduction:** The player is given their first clear short-term **Goal** (via the Goal System), with a visible **Progress Track**.
    * **UI/UX Focus:** Clear presentation of Action Check outcomes, Action Approach choices, WP balance, and active goals.

* **Phase 3: Broader Systems & World Interaction (Hours 3+)**
    * **World Event Tick:** The player experiences their first **World Event Tick** after the Time Clock fills, including the associated **WP Upkeep** cost. This naturally introduces the longer-term economic pressures.
    * **Introduction to Other Modules:** As goals and opportunities arise, the player is guided towards new Gameplay Modules (e.g., basic Trading, Mining, or responding to a distress signal leading to a simple Combat encounter). Each new module will have its own mini-tutorial or guided experience.
    * **Chronicle System Introduction:** The player discovers how to access or is shown the Chronicle System, seeing their (and perhaps other Agents') significant actions logged.
    * **Deeper System Interactions:** Contextual hints or advanced tutorials can start to explain how systems like Events, Goals, and Agent actions influence each other and the World State.
    * **Lore Integration:** Information from the Lore & Background GDD is revealed organically through dialogue, environmental details, and system behaviors rather than info-dumps.

## 4. Specific Onboarding Techniques

* **Interactive Checklists/Tutorial Pop-ups:** Non-intrusive, dismissible prompts that guide the player through their first interaction with a new UI element or mechanic.
* **"Show, Don't Just Tell" Scenarios:** Craft early game situations or mini-quests that inherently require the use of a specific mechanic to succeed, making the learning process part of the gameplay.
* **Mentorship Dialogue:** Short, contextual dialogue from key NPCs (e.g., a Founder mentor, a fellow Voyager) offering advice or explaining a new concept as it becomes relevant.
* **Glossary/Codex:** An in-game accessible reference for all key terms, mechanics, and lore snippets the player has encountered, as per GDD-Main UI/UX Principles.
* **Visual Cues:** Highlighting relevant UI elements when a new system is introduced or becomes critical.
* **Safe Failure States:** Early tutorials should allow for "failure" (e.g., failing an Action Check) without overly punitive consequences, allowing players to learn from mistakes. The outcome should clearly explain *why* a failure occurred.

## 5. Onboarding & Game Layers

The game's layered development approach (GDD-Main, Section 4.2) naturally supports a layered onboarding:

* **Layer 1 Mechanics (Core Simulation & Mechanics):** Will form the bulk of initial onboarding.
* **Layer 2 Mechanics (Narrative Integration):** Introduced once the player has a grasp of basic actions and resource management.
* **Layer 3 Mechanics (World & Agency Simulation):** The impact of these (NPC actions, World State changes) will become apparent more gradually as the player spends more time in the game, rather than being explicitly taught as a "system" the player must manage directly from the start.

## 6. Iteration & Player Feedback

The onboarding process will require significant iteration and playtesting. Feedback from new players will be crucial in refining the pacing, clarity, and effectiveness of the tutorial systems. The goal is to make the rich mechanics of GDTLancer accessible and engaging, not a barrier to entry.

--- Start of ./AI-ACKNOWLEDGEMENT.md ---

## Acknowledgement of AI Assistance

This project utilizes generative AI technologies as a tool to enhance developer productivity during its development. The core functionality, architecture, and final decisions remain the product of human engineering and review.

**Scope of AI Use:**

* **Code Generation and Refinement:** AI assistance was used to generate, refactor, and optimize code snippets.
* **Documentation:** AI tools assisted in drafting, structuring, summarizing, and refining project documentation (such as README files, guides, code comments, and API documentation). While AI provided initial drafts or suggestions, the final documentation content has been reviewed and edited by the development team for accuracy and clarity.
* **Exclusion of Embedded Assets:** No AI-generated creative assets (e.g., images, audio, user-interface text intended for direct display *within* the application) are incorporated into the production version of this software.
* **Repository Artefacts:** Any other AI-generated assets potentially present in the repository were either:
    * Used as temporary placeholders during development and have since been removed or replaced, or
    * Created prior to the formalization of this acknowledgement and are not intended for production use or distribution.
* **Models and Data:** All AI models used were either publicly available or trained exclusively on permissively licensed data.

**Human Oversight:**

All AI-generated contributions, whether code or documentation, are subject to human review, modification, and approval before being integrated into the project. The ultimate responsibility for the software and its documentation lies with the human development team.

**Licensing:**

This project is licensed under the [GNU General Public License v3.0 (GPLv3)](https://www.gnu.org/licenses/gpl-3.0.en.html).

**Note:** The use of the GPLv3 license predates the integration of AI development tools into this project's workflow.

--- Start of ./AI-PRIMING.md ---

# GDTLancer AI Collaboration Priming Prompt

**Version:** 1.0
**Date:** April 26, 2025
**Related Documents:** GDTLancer Main GDD v1.6, GDD-Coding-Architecture

## 1. Purpose

This document defines the standard priming prompt to be used when initiating a new chat session with an AI assistant (like Gemini) for the development of GDTLancer. Its purpose is to clearly establish the project context, the expected collaborative paradigm, defined roles, and the iterative workflow, ensuring efficient and targeted AI assistance aligned with the project's goals and standards.

## 2. Standard Priming Prompt Text

*(Use the following text block as the initial prompt in a new AI chat session dedicated to GDTLancer development.)*

---

For Gemini,

This chat session is dedicated to the collaborative development of a game project, **GDTLancer**.

### 2.1. Project Overview

GDTLancer is a multi-platform space adventure RPG being built in Godot Engine 3. The core vision involves blending sandbox simulation with TTRPG-inspired emergent narrative mechanics to create a living, dynamic universe. My immediate focus is on developing a robust and well-structured game framework according to the Game Design Documents (GDDs), which I can later fill with specific content and assets, similar to modding an existing game.

### 2.2. Provided Context

Shortly, I will upload several text files containing the project's context. These will include:
* The combined Game Design Documents (`GDD-COMBINED-TEXT.md`) outlining the vision, mechanics, architecture, and planned systems/modules.
* A text dump of the current project file/directory structure (`.PROJECT_DUMP_TEXT_ENHANCED_TREE.txt`).
* Text dumps of the existing GDScript code (`.PROJECT_DUMP_TEXT_GD.txt`), resource files (`.PROJECT_DUMP_TEXT_TRES.txt`), and scene structures (`.PROJECT_DUMP_TEXT_TSCN.txt`).
Please use these files as the primary source of truth for the project's current state and design intent.

### 2.3. Our Collaboration Paradigm & Roles

I want us to work together in a specific way:
* **My Role (User):** I will act as the project architect and director. I will focus on the high-level picture, define the goals based on the GDD, provide guidance, validate your suggestions against the overall design, and make final decisions. I am less focused on writing detailed code line-by-line.
* **Your Role (Gemini):** I want to rely on you as an implementation assistant. Please help me by:
    * Suggesting concrete implementation approaches and code structures when I'm unsure where to start.
    * Drafting initial versions of GDScript functions, classes, or entire system scripts based on my goals and the GDD.
    * Handling the "manufacturing" of code according to the project's established coding standards and architectural patterns (e.g., use of Autoloads, EventBus, Resources as defined in `GDD-Coding-Architecture.md`).
    * Explaining the drafted code and suggesting refinements.
    * Helping identify potential issues or inconsistencies.

### 2.4. Workflow

Our workflow will be iterative:
1.  I will state a high-level goal (e.g., "Implement the basics of the Event System").
2.  You will suggest an approach and/or draft the initial code structure/functions.
3.  I will review your suggestions/drafts, ask questions, and provide feedback or refinement requests.
4.  We will refine the code together. For general discussion, code drafting, and providing context, we will use the main chat.
5.  Do not use Canvas feature.

---

Please confirm you understand this collaborative approach and are ready to begin once I've uploaded the context files.

--- End of Priming Prompt Text ---

--- Start of ./README.md ---

# GDTLancer Game Design Documentation

![Banner](./Banner.png)

This repository contains the Game Design Documentation (GDD) for **GDTLancer: Generative Dynamic Transmedia Lancer**.

GDTLancer is envisioned as a multi-platform space adventure RPG blending sandbox simulation with TTRPG-inspired emergent narrative mechanics. It aims to create a living world shaped by the actions of both the player and AI agents, with a distinct neo-retro visual style and a focus on player agency in choosing their approach to risk and narrative engagement.

The main repository for the game project itself can be found at:
[https://github.com/roalyr/GDTLancer](https://github.com/roalyr/GDTLancer)

---

## Documentation Pages

This documentation is organized into several key areas:

### 0. Core Vision & Introduction

* [**0.1-GDD-Main.md**](./0.1-GDD-Main.md): The central Game Design Document outlining the overall vision, game pillars, development framework (Layers, Modules, Systems), phased plan, and summaries of core concepts. (Reviewed: v1.7, 2025-05-16)
* [**0.2-GDD-Mottos-Sayings.md**](./0.2-GDD-Mottos-Sayings.md): Lists key mottos for the game's branding and ethos, alongside in-game lore-wise sayings. (New: v1.1, 2025-05-16)

### 1. Core Systems & Mechanics

* [**1-GDD-Core-Mechanics.md**](./1-GDD-Core-Mechanics.md): Details the fundamental, universal mechanics: the **Action Check** (3d6+Mod resolution), **Focus Points (FP)** meta-resource, and the **Action Approach** system (`Act Risky`/`Act Cautiously`). (Reviewed: v1.3, 2025-05-16)

### 2. Development & Architecture

* [**2-GDD-Development-Challenges.md**](./2-GDD-Development-Challenges.md): Identifies and acknowledges the primary challenges and inherent risks associated with the development of GDTLancer. (Reviewed: v1.1, 2025-05-16)
* [**3-GDD-Coding-Architecture.md**](./3-GDD-Coding-Architecture.md): Outlines the coding style conventions, architectural patterns (Autoloads, Components, Resources, Scene Structure), and development philosophy for the Godot implementation. (Reviewed: v1.2, 2025-05-16)

### 3. Analogue Version

* [**4.1-GDD-Analogue-Setup.md**](./4.1-GDD-Analogue-Setup.md): Describes the recommended physical components and general organization for playing the tabletop RPG version. (Reviewed: v1.2, 2025-05-16)
* [**4.2-GDD-Analogue-Setup-Formatting.md**](./4.2-GDD-Analogue-Setup-Formatting.md): Specifies the detailed layout, content areas, and formatting for the physical sheets used in the analogue version. (Reviewed: v1.1, 2025-05-16)
* *(Placeholder for Analogue-specific rules variants or system documents)*

### 4. Gameplay Modules

* [**5.1-GDD-Module-Piloting.md**](./5.1-GDD-Module-Piloting.md): Specific design details for the Piloting & Travel gameplay module, covering manual flight integration and abstracted travel mechanics (`Undertake Journey`, `Fast Transit`). (Reviewed: v1.4, 2025-05-16)
* *(Placeholder for future module design documents, e.g., Combat, Trading, etc.)*

### 5. Lore & Player Experience

* [**6.1-GDD-Lore-Background.md**](./6.1-GDD-Lore-Background.md): Outlines the foundational lore, history of humanity's journey, "The Keystone," the "Opulence" system, and core cultural/physiological traits. (Reviewed: v1.3, 2025-05-16)
* [**6.2-GDD-Player-Onboarding.md**](./6.2-GDD-Player-Onboarding.md): Details the strategy for player onboarding, addressing information density and the gradual introduction of game mechanics. (New: v1.0, 2025-05-16)

### Meta & Legal

* [**LICENSE**](./LICENSE): Contains the licensing information for this documentation project.
* [**AI-ACKNOWLEDGEMENT.md**](./AI-ACKNOWLEDGEMENT.md): Details regarding the use of AI assistance during the generation and refinement of this documentation.
* [**AI-PRIMING.md**](./AI-PRIMING.md): Defines the standard priming prompt to be used when initiating a new chat session with an AI assistant.

## All pages in a single file

* [**GDD-COMBINED-TEXT.md**](./GDD-COMBINED-TEXT.md): If you need all pages in a single file.

---

This documentation is a living project and currently under active development.

---

## Draft README for Main Game Repository (`roalyr/GDTLancer`)

*(This section contains the planned README content for the main game implementation repository. It will be moved there once the relevant branch is updated.)*

# GDTLancer: Generative Dynamic Transmedia Lancer

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

**GDTLancer** is a multi-platform space adventure RPG combining sandbox simulation with TTRPG-inspired emergent narrative mechanics. Explore a living, dynamic universe where your actions, and those of AI agents, shape the course of history.

This project aims to create a unique experience blending the freedom of classic space sims with the deep, player-driven stories found in tabletop roleplaying games, all presented in a distinct neo-retro 3D visual style.

**Current Status:** Undergoing refactoring.

### Core Concepts & Features (Based on Design):

* **Living Universe:** A persistent world simulated dynamically, where NPC agents pursue their own goals using the same core mechanics as the player, influencing factions, economies, and discoveries.
* **Emergent Narrative:** Stories evolve organically from the interplay of game systems, agent actions, and generated events, rather than following rigid plots.
* **Hybrid Gameplay:** Engage in direct simulation gameplay (piloting, combat, trading) within distinct **Gameplay Modules**. High-stakes actions are resolved via an **Action Check** (3d6+Modifier), influenced by **Focus Points (FP)**.
* **Player Agency:** Choose your level of engagement – focus on simulation modules or narrative systems. Manage risk by declaring an **Action Approach** (`Act Risky` or `Act Cautiously`) for key actions, influencing potential outcomes. Set long-term goals via the Goal System.
* **Transmedia Vision:** Planned versions include:
    * Primary PC/Mobile build (Godot Engine 3).
    * Simplified J2ME version (turn-based, wireframe).
    * Analogue Tabletop RPG ruleset.
* **Neo-Retro Aesthetics:** Distinctive visual style using minimalist 3D, hard edges, solid colors, and stylized lighting.
* **Chronicle System:** Uncover the generated history of the world through an in-game interface logging significant player and NPC actions.

### Design Documentation

The detailed design principles, mechanics, and development plan for GDTLancer reside in its dedicated documentation repository:
**[GDTLancer Game Design Documentation](https://github.com/roalyr/GDTLancer-game-design)**

### Technology

* Primary Engine: **Godot Engine 3**

### License

This project (the Godot 3 implementation source code and associated assets within this repository) is intended to be licensed under the **GNU General Public License v3.0 or later (GPL-3.0-or-later)**. Please see the LICENSE file in the repository root for the full license text once added.

* The J2ME version will also use GPLv3.
* The Analogue TTRPG version materials, developed in a separate repository, are intended to be licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0).

### Contributions

* Currently solo development.

---
