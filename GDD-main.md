# GDTLancer: Generative Dynamic Transmedia Lancer - Game Design Document

**Version:** 1.4
**Date:** April 2, 2025
**Author:** Roal-Yr

## 0. Introduction

* **Game Title:** GDTLancer (Working Title, Acronym: **Generative Dynamic Transmedia** Lancer)
* **Logline:** A multi-platform space adventure RPG blending sandbox simulation with TTRPG-inspired narrative mechanics, set in a distinct stylized sci-fi universe where player and AI actions shape a living world.
* **Genre:** 3D Space Adventure, RPG, Sandbox, Simulation, TTRPG-Hybrid.
* **Theme:** Emergent narrative, story-driven world simulation, hard sci-fi aesthetics with space fantasy elements. Player agency in choosing narrative engagement level.
* **Target Audience:** Fans of Sci-Fi, Space Sims (Elite, Freelancer), Sandbox RPGs (Mount & Blade), Narrative Games, emergent simulations (Dwarf Fortress, EVE Online), and TTRPGs (Stars Without Number, Ironsworn/Starforged).
* **Platforms:**
    * Primary Digital: Godot 4 (PC/Mobile). Distinct Neo-Retro 3D visuals.
    * Secondary Digital: Godot 3 (Lower spec), J2ME (Simplified, turn-based). Minimalist wireframe visuals.
    * Analogue: Standalone TTRPG ruleset.
* **Unique Selling Points:**
    * Deep emergent narrative via unified player/AI mechanics.
    * Living world simulation shaped by agent actions.
    * Transmedia approach (full 3D, minimalist mobile, TTRPG).
    * Distinct Neo-Retro 3D Visual Style and accessible gameplay.
    * Investigable world history via the Chronicle System's output.

## 1. Glossary

* **Action Check:** Core dice roll mechanic (3d6 + Mod ≥ Thresholds). *Detailed in Core Mechanics Design.*
* **Agent:** Active entity pursuing goals (Player or NPC).
* **Analogue Version:** Parallel tabletop RPG ruleset.
* **Focus:** Meta-resource spent to influence Action Checks or gain temporary advantages. *Detailed in Core Mechanics Design.*
* **Gameplay Layer (Vertical Development):** A set of mechanics serving a specific function across multiple modules (e.g., Simulation Layer, Narrative Layer). Each Layer will have a dedicated GDD page.
* **Gameplay Module (Horizontal Development):** Distinct set of mechanics for a specific activity loop (e.g., Combat Module, Travel Module). Each Module will have a dedicated GDD page.
* **Gameplay System (Depth Development):** A specific cross-cutting ruleset managing a core aspect of the game (e.g., Event System, Goal System). Each System will have a dedicated GDD page.
* **Neo-Retro 3D:** Primary visual style: minimalist, hard-edged 3D, solid colors, potentially dithered/posterized lighting.
* **Phase:** A defined development milestone targeting the implementation and integration of a specific set of Modules, Layers, and Systems.
* **Progress Track:** Visual representation of goal completion.
* **Trigger Action:** High-stakes action requiring an Action Check. *Detailed in Core Mechanics Design.*
* **Universal Narrative Moves:** Core set of named actions (e.g., `Face Danger`) resolved via Action Check, applicable contextually across modules. *Defined in Core Mechanics Design.*
* **World State:** Data representing the current status of the game world.

## 2. Game Pillars & Vision

* **Living World:** Universe evolves independently via Agent actions and systemic interactions. Dynamic World State.
* **Emergent Narrative:** Stories arise naturally from gameplay systems, Agent choices, and events.
* **Meaningful Progression:** Advancement tied to both simulation skill and narrative achievements.
* **Unified & Accessible Mechanics:** Core rules apply consistently to Player and NPCs. "Easy to learn, hard to master."
* **Balanced Gameplay & Player Agency:** Prioritizes a simulation foundation enhanced by narrative mechanics. Allows players to choose their level of narrative engagement.

## 3. Core Gameplay Design

* **3.1. Gameplay Philosophy:** The game provides robust simulation within distinct Gameplay Modules. Narrative mechanics layer onto this simulation to handle specific uncertainties, decisions, abstractions, and drive story. Players choose their level of narrative engagement.
* **3.2. Gameplay Modules (Horizontal Axis):** Structures activities into modules.
    * **Planned Modules:** Piloting & Travel, Combat (Ship), Trading, Interaction (Docked/Social), Mining, Repair, Investigation, Exploration/Scanning. *(List subject to refinement)*.
    * **Characteristics:** Clear entry/exit; specific activity focus; utilizes specific & shared resources; resolution via simulation and/or narrative mechanics; clear UI context.
    * **Core Loop:** Engage Module -> Perform Simulation Actions -> Encounter/Choose Trigger Action -> Resolve via Action Check -> Gain/Lose Resources (incl. Focus) -> Update Statistics/Progress -> Choose Next Action/Module.
* **3.3. Core Mechanics (Foundation for Layers):**
    * **Overview:** The game utilizes a set of core, universal mechanics for action resolution and player agency. **These are defined in detail in the dedicated "Core Mechanics Design" document.** Key components include:
        * The **Action Check:** The primary method for resolving uncertain Trigger Actions using 3d6 + Modifier vs. Thresholds.
        * **Focus:** A spendable meta-resource allowing players to influence Action Checks or gain temporary simulation buffs.
        * **Universal Narrative Moves:** A set of broadly applicable actions like `Face Danger`, `Secure an Advantage`, and `Gather Information` resolved via Action Checks.
    * **Simulation vs. Narrative Resolution:** Standard module actions primarily use simulation. Optional abstracted narrative resolution (like Fast Transit) is available for certain modules, offering players a choice between detailed engagement and efficiency.

## 4. Development Framework & Phased Plan

*(This section replaces the old Phase breakdown)*

* **4.1. Development Axes:** Development is structured along three axes:
    * **Modules (Horizontal):** Building specific activity loops (Travel, Combat, etc.).
    * **Layers (Vertical):** Implementing functional layers across modules (Simulation -> Narrative -> Agency -> Progression).
    * **Systems (Depth):** Developing cross-cutting rulesets (Events, Goals, etc.).
* **4.2. Development Layers Defined:**
    * **Layer 1: Core Simulation & Mechanics:** Basic module function, direct controls, core mechanics implementation (Action Check, Focus).
    * **Layer 2: Narrative Integration:** Goal/Event System hooks, Narrative Rewards, optional abstractions.
    * **Layer 3: World & Agency Simulation:** NPC Agent simulation, World State evolution, Chronicle System updates.
    * **Layer 4: Meta-Progression & Legacy:** Deeper progression, long-term rewards, Legacy system.
* **4.3. Key Cross-Cutting Systems Defined:** These systems interact across Modules and Layers. Each will have a dedicated design page.
    * Event System (Oracle Lite)
    * Goal System (Vows Lite)
    * Progression & Reward System
    * Chronicle System (Logs significant events for player review)
    * *(Later)* Faction System, Economy System, Legacy System, etc.
* **4.4. Phased Release Plan (Tentative Targets):** Phases define integrated milestones across Modules, Layers, and Systems.
    * **Phase 1 (Core Loop Foundation):**
        * *Modules:* Piloting & Travel (Basic), Combat (Ship - Basic), Trading (Basic Docked Interaction/UI).
        * *Layers:* Layer 1 fully implemented for Phase 1 modules.
        * *Systems:* Event System (Basic tables/triggers), Goal System (Basic tracking).
        * *Goal:* Testable build: core flight, combat, trade; Action Check/Focus loop; rudimentary goal/event prompts.
    * **Phase 2 (Narrative & Abstraction):**
        * *Modules:* Refine Phase 1; Add Mining, Repair (Basic).
        * *Layers:* Layer 2 implemented for Phase 1 & 2 modules (Rewards, Goal progress linked, Events have structured outcomes, abstractions like Fast Transit).
        * *Systems:* Refine Event/Goal Systems; Implement basic Progression System.
        * *Goal:* Purposeful gameplay loop with narrative drivers, rewards, abstractions.
    * **Phase 3 (Living World Basics):**
        * *Modules:* Refine existing; Add Investigation/Scanning (Basic).
        * *Layers:* Layer 3 implementation started (Basic NPC agents, rudimentary World State changes, Analogue World Tick).
        * *Systems:* Implement basic Chronicle System. Refine existing systems.
        * *Goal:* World shows signs of independent activity and history tracking.
    * **Later Phases:** Implement Layer 4. Scale up Agent simulation. Deepen World State. Fully develop Systems. Add content.

## 5. Art & Audio Direction

* **5.1. Primary Visual Style (Godot 4): "Neo-Retro 3D"**
    * Minimalist, hard-edged 3D models; clean geometric forms. Solid colors, potentially dithered/posterized lighting. Non-photorealistic. Prioritizes clarity, performance, composition. Function-driven designs.
* **5.2. Secondary Visual Style (J2ME): "Minimalist Wireframe"**
    * Low-detail wireframes; color gradients for depth. Inspired by classic vector graphics. For extreme performance limits, potentially turn-based.
* **5.3. Environment Design:** Stylized space vistas (nebulae, asteroids); avoid empty black void. Gameplay scale. Strong lighting and composition.
* **5.4. Audio:** Functional, minimalist sound design. Clear feedback. Atmospheric, potentially generative music.

## 6. UI/UX Principles

* **Minimalism:** Clean, non-intrusive UI. Clear information hierarchy.
* **Clarity:** Player understands current Module, actions, Focus status, context for Checks/Events.
* **Accessibility:** "Easy to learn, hard to master." Tutorials/contextual help. Visual/text options.
* **Dynamic Camera:** Effective camera work in 3D during non-interactive moments.

## 7. Technical Considerations

* **7.1. Engine:** Godot 4 (Primary), Godot 3 / J2ME (Exploratory/Constraint).
* **7.2. Optimization:** High priority. Crucial for Agent/World simulation (abstraction/LOD needed).
* **7.3. Analogue Version:** Parallel design. Relies on Action Checks, Narrative Systems. Uses "World Event Tick" for world evolution abstraction.
* **7.4. Modularity:** Design Layers, Modules, and Systems with clear interfaces for phased development, testing, and cross-platform adaptation.

