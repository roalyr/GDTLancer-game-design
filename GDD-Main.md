# GDTLancer: Generative Dynamic Transmedia Lancer - Game Design Document

**Version:** 1.6
**Date:** April 3, 2025
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
