# GDTLancer: Generative Dynamic Transmedia Lancer - Game Design Document

**Version:** 1.5
**Date:** April 2, 2025
**Author:** Roal-Yr

## 0. Introduction

* **Game Title:** GDTLancer (Working Title, Acronym: **Generative Dynamic Transmedia** Lancer)
* **Logline:** A multi-platform space adventure RPG blending sandbox simulation with TTRPG-inspired narrative mechanics, set in a distinct stylized sci-fi universe where player choice and AI actions shape a living world.
* **Genre:** 3D Space Adventure, RPG, Sandbox, Simulation, TTRPG-Hybrid.
* **Theme:** Emergent narrative, story-driven world simulation, hard sci-fi aesthetics with space fantasy elements. Player agency in choosing narrative engagement and risk level.
* **Target Audience:** Fans of Sci-Fi, Space Sims (Elite, Freelancer), Sandbox RPGs (Mount & Blade), Narrative Games, emergent simulations (Dwarf Fortress, EVE Online), and TTRPGs (Stars Without Number, Ironsworn/Starforged).
* **Platforms:**
    * Primary Digital: Godot 4 (PC/Mobile). Distinct Neo-Retro 3D visuals.
    * Secondary Digital: Godot 3 (Lower spec), J2ME (Simplified, turn-based). Minimalist wireframe visuals.
    * Analogue: Standalone TTRPG ruleset.
* **Unique Selling Points:**
    * Deep emergent narrative driven by unified agent mechanics.
    * Living world simulation shaped by agent actions.
    * Transmedia approach (full 3D, minimalist mobile, TTRPG).
    * Distinct Neo-Retro 3D Visual Style and accessible gameplay focused on player choice.
    * Investigable world history via the Chronicle System.

## 1. Glossary

* **Action Approach:** Player's declared stance (`Act Risky` or `Act Cautiously`) when performing an action resolved via Action Check, influencing the potential outcomes.
* **Action Check:** Core dice roll mechanic (3d6 + Mod ≥ Thresholds). *Detailed in Core Mechanics Design.*
* **Agent:** Active entity pursuing goals (Player or NPC).
* **Analogue Version:** Parallel tabletop RPG ruleset.
* **Asset System:** Gameplay System managing non-consumable items (ships, gear, property) that enable Gameplay Modules and may provide Module Variations.
* **Character System:** Gameplay System managing Agent skills, progression, core stats, and potentially inventory.
* **Chronicle System:** Gameplay System logging significant Agent actions and World State changes for player review via an in-game interface.
* **Event System (Oracle Lite):** Gameplay System generating unexpected narrative events and complications, often with mechanical hooks.
* **Focus Points (FP):** Primary meta-resource spent *before* an Action Check (1-3 FP for +1 per point) or to gain persistent module buffs. *Detailed in Core Mechanics Design.*
* **Gameplay Layer (Vertical Development):** A set of mechanics serving a specific function across multiple modules (e.g., Simulation Layer, Narrative Layer). Each Layer will have a dedicated GDD page.
* **Gameplay Module (Horizontal Development):** Distinct set of mechanics for a specific activity loop (e.g., Combat Module, Travel Module). Each Module will have a dedicated GDD page.
* **Gameplay System (Depth Development):** A specific cross-cutting ruleset managing a core aspect of the game (e.g., Event System, Goal System). Each System will have a dedicated GDD page.
* **Goal System (Vows Lite):** Gameplay System for tracking Agent objectives and their progress via Progress Tracks.
* **Module Modifier:** The primary situational modifier used in an Action Check, derived from Relevant Skill + Asset Difficulty. Varies per Module and Asset used.
* **Neo-Retro 3D:** Primary visual style: minimalist, hard-edged 3D, solid colors, potentially dithered/posterized lighting.
* **Phase:** A defined development milestone targeting the implementation and integration of a specific set of Modules, Layers, and Systems.
* **Progress Track:** Visual representation of goal completion, used by the Goal System.
* **Trigger Action:** A specific module action or situation requiring resolution via an Action Check due to inherent risk or uncertainty.
* **World Map System:** Gameplay System managing spatial representation, navigation data, points of interest across different scales.
* **World State:** Data representing the current status of factions, economies, discoveries, etc.

## 2. Game Pillars & Vision

* **Living World:** Universe evolves independently via Agent actions and systemic interactions. Dynamic World State.
* **Emergent Narrative:** Stories arise naturally from gameplay systems, Agent choices, and events.
* **Meaningful Progression:** Advancement tied to both simulation skill/assets and narrative achievements/skills.
* **Unified & Accessible Mechanics:** Core rules apply consistently to Player and NPCs. "Easy to learn, hard to master."
* **Balanced Gameplay & Player Agency:** Prioritizes a simulation foundation enhanced by narrative mechanics. Empowers players to choose their level of narrative engagement and their approach to risk (`Act Risky` / `Act Cautiously`).

## 3. Core Gameplay Design

* **3.1. Gameplay Philosophy:** The game provides robust simulation within distinct Gameplay Modules. Narrative mechanics layer onto this simulation to handle specific uncertainties, decisions, and abstractions. Players actively choose their approach to risk and narrative depth moment-to-moment.
* **3.2. Gameplay Modules (Horizontal Axis):** Structures activities into modules enabled by Assets.
    * **Planned Modules:** Piloting & Travel, Combat (Ship), Trading, Interaction (Docked/Social), Mining, Repair, Investigation, Exploration/Scanning. *(List subject to refinement)*.
    * **Asset Interaction:** Assets grant access to Modules. Asset type/quality determines the `Asset Difficulty` component of the Module Modifier and may provide minor Module Variations.
    * **Core Loop:** Engage Module (via Asset) -> Perform Simulation Actions -> Encounter/Choose Trigger Action -> **Declare Action Approach (`Risky`/`Cautious`, if applicable)** -> Resolve via Action Check (influenced by Module Modifier, FP Spend) -> Consult Appropriate Outcome Branch (Risky/Cautious) -> Apply Results -> Gain/Lose Resources (incl. FP, WP) -> Update Statistics/Progress -> Choose Next Action/Module.
* **3.3. Core Mechanics Resolution:**
    * **Overview:** Resolving Trigger Actions uses core systems detailed in the **"Core Mechanics Design"** document. Key factors determining success and consequences are:
        * **Base Roll:** 3d6 dice.
        * **Module Modifier:** Reflects Agent proficiency with the specific Asset within the active Module (`Relevant Skill + Asset Difficulty`).
        * **Focus Point (FP) Spend:** Player choice *before rolling* (spend 1-3 FP for +1 per point) to influence the numerical result.
        * **Action Approach (`Risky`/`Cautious`):** Player declaration *before rolling* (where applicable) that determines *which set of outcomes or severity scale* is used based on the roll result (Crit Success / SwC / Failure). Risky approaches generally offer higher potential rewards but carry harsher penalties, while Cautious approaches offer more stability and less severe failures.
        * **Threshold Comparison:** The final modified roll vs. standard Thresholds (Fail < 10, SwC 10-13, Crit ≥ 14).
    * **Simulation vs. Narrative Resolution:** Simulation is default. Optional abstracted narrative resolution (e.g., Fast Transit) exists for some modules, likely inheriting the Risk/Caution approach of the initiating action.

## 4. Development Framework & Phased Plan

* **4.1. Development Axes:** Development structured along Modules (Horizontal), Layers (Vertical), and Systems (Depth).
* **4.2. Development Layers Defined:**
    * **Layer 1: Core Simulation & Mechanics:** Basic module function, controls, Action Check, FP/WP mechanics, Module Modifiers, Action Approaches.
    * **Layer 2: Narrative Integration:** Goal/Event System integration, Narrative Rewards, optional abstractions, defining Risky/Cautious outcome branches.
    * **Layer 3: World & Agency Simulation:** NPC Agent simulation using Layers 1&2, World State evolution, Chronicle System updates.
    * **Layer 4: Meta-Progression & Legacy:** Deeper progression, long-term rewards, faction mechanics, Legacy system.
* **4.3. Key Cross-Cutting Systems Defined:** Interact across Modules and Layers. Each will have a dedicated design page.
    * Event System
    * Goal System
    * Progression & Reward System
    * Chronicle System
    * Asset System
    * Character System
    * World Map System
    * *(Later)* Faction System, Economy System, Legacy System, etc.
* **4.4. Phased Release Plan (Tentative Targets):** Phases define integrated milestones.
    * **Phase 1 (Core Loop Foundation):**
        * *Modules:* Piloting & Travel (Basic), Combat (Ship - Basic), Trading (Basic Docked Interaction/UI).
        * *Layers:* Layer 1 fully implemented for Phase 1 modules (incl. Action Approach choice).
        * *Systems:* Event System (Basic tables/triggers with simple Risky/Cautious outcome differentiation), Goal System (Basic tracking for player). Implement basic Asset/Character/Map/WP systems needed for Layer 1.
        * *Goal:* Testable build: core flight, combat, trade; Action Check/FP/WP loop; functional Action Approach choice impacting outcomes; rudimentary goal/event prompts.
    * **Phase 2 (Narrative & Abstraction):**
        * *Modules:* Refine Phase 1; Add Mining, Repair (Basic).
        * *Layers:* Layer 2 implemented for Phase 1 & 2 modules (Rewards, Goal progress linked, Events have structured outcomes, abstractions like Fast Transit, fleshed-out Risky/Cautious branches).
        * *Systems:* Refine Event/Goal Systems; Implement basic Progression System (XP affecting Character System skills); Refine Asset System (Module Variations).
        * *Goal:* Purposeful gameplay loop with narrative drivers, rewards, abstractions, meaningful risk/reward choices.
    * **Phase 3 (Living World Basics):**
        * *Modules:* Refine existing; Add Investigation/Scanning (Basic).
        * *Layers:* Layer 3 implementation started (Basic NPC agents using Layers 1&2, rudimentary World State changes, Analogue World Tick).
        * *Systems:* Implement basic Chronicle System. Refine existing systems.
        * *Goal:* World shows signs of independent activity and history tracking.
    * **Later Phases:** Implement Layer 4. Scale up Agent simulation. Deepen World State. Fully develop Systems. Add content.

## 5. Art & Audio Direction

* **5.1. Primary Visual Style (Godot 4): "Neo-Retro 3D"** (Minimalist, hard-edged 3D, solid colors, stylized lighting).
* **5.2. Secondary Visual Style (J2ME): "Minimalist Wireframe"** (Low-detail wireframes, color gradients).
* **5.3. Environment Design:** Stylized space vistas. Gameplay scale. Strong lighting/composition.
* **5.4. Audio:** Functional, minimalist sound design. Clear feedback. Atmospheric/generative music.

## 6. UI/UX Principles

* **Minimalism:** Clean, non-intrusive UI.
* **Clarity:** Player understands Module, actions, resources (FP, WP), context for Action Checks, chosen Action Approach, potential outcomes.
* **Accessibility:** "Easy to learn, hard to master." Tutorials/contextual help. Visual/text options.
* **Dynamic Camera:** Effective camera work in 3D during non-interactive moments.

## 7. Technical Considerations

* **7.1. Engine:** Godot 4 (Primary), Godot 3 / J2ME (Exploratory/Constraint).
* **7.2. Optimization:** High priority. Crucial for Agent/World simulation (abstraction/LOD).
* **7.3. Analogue Version:** Parallel design. Relies on Action Checks, Narrative Systems, Action Approaches. Uses "World Event Tick".
* **7.4. Modularity:** Design Layers, Modules, and Systems with clear interfaces for phased development, testing, and cross-platform adaptation.

