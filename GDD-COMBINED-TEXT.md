--- Start of ./0.1-GDD-Main.md ---

# GDTLancer - Main GDD

**Version:** 1.8
**Date:** August 1, 2025
**Author:** Roal-Yr

## 0. Introduction

* **Game Title:** GDTLancer (Working Title)
* **Logline:** A multi-platform space adventure RPG where player and AI actions shape a living world. Blends sandbox simulation with narrative mechanics.
* **Genre:** 3D Space Adventure, RPG, Sandbox, Simulation.
* **Theme:** Emergent stories from a simulated world; pragmatic, function-first sci-fi. Focus on managing risk, time, and resources.
* **Target Audience:** Fans of Space Sims (Elite, Freelancer), Sandbox RPGs (Mount & Blade), and Narrative TTRPGs (Stars Without Number, Ironsworn).
* **Platforms:**
    * Primary Digital: PC (Godot 3).
    * Secondary Digital: Mobile (J2ME-style).
    * Analogue: Standalone TTRPG ruleset.
* **Unique Selling Points:**
    * Emergent stories driven by agent actions.
    * A living world that evolves over time.
    * Play on PC, mobile, or as a tabletop RPG.
    * Unique low-poly 3D art style.
    * Uncover world history through gameplay.

## 1. Glossary

* **Action Approach:** Player's stance (`Act Risky` or `Act Cautiously`) that influences an action's outcome.
* **Action Check:** The core dice roll: `3d6 + Modifier`.
* **Agent:** An active entity pursuing goals (Player or NPC).
* **Asset:** A significant non-consumable item (ship, module, gear).
* **Asset Progression:** A meta-progression system where players invest resources (WP, TU) and complete objectives to acquire new assets.
* **Chronicle:** The system that logs major world events and actions.
* **Contact:** An abstract NPC the player interacts with via menus to gain missions, information, and build relationships.
* **Faction:** A distinct political or corporate entity in the game world with which the player can gain or lose standing.
* **Focus Points (FP):** A resource spent to improve an Action Check result.
* **G-Stasis Cradle:** In-lore tech that allows pilots to survive high-G maneuvers.
* **Goal System:** System for tracking Agent objectives.
* **Lancer Doctrine:** The cultural doctrine of non-destructive ship combat, born from scarcity of materials and personnel.
* **Module:** A set of mechanics for a specific activity (e.g., Combat, Mining).
* **Pragmatic Aesthetics:** Function-first ship design philosophy.
* **Reputation:** A narrative stat tracking the player's professional standing (e.g., "Dependable," "Opportunist").
* **Ship Quirk:** A negative trait an asset can acquire due to damage or failed actions, often imposing a mechanical penalty.
* **Time Clock:** Tracks time. When full, it triggers a World Event Tick.
* **Time Unit (TU):** An abstract unit of time. Actions cost TUs.
* **Wealth Points (WP):** Abstract resource for major purchases, representing an agent's economic power.
* **World Event Tick:** Triggered by the Time Clock; advances the world simulation state.
* **World State:** All data representing the current status of the game world.

## 2. Game Pillars

* **Living World:** The world evolves based on the actions of all agents and the passage of time.
* **Emergent Narrative:** Stories emerge naturally from the simulation and player choices.
* **Meaningful Progression:** Progress by improving skills, completing goals, acquiring assets, and building wealth.
* **Simple, Consistent Rules:** Core mechanics are unified and easy to learn.
* **Player Driven:** Players direct the experience by managing risks, time, and resources.

## 3. Core Gameplay Design

* **3.1. Philosophy:** A simulation-first design. Players interact with game modules (e.g., Piloting, Combat) and make meaningful choices about risk and resource management.
* **3.2. Gameplay Modules:** Game activities, such as:
    * Piloting & Travel
    * Combat (Ship)
    * Trading
    * Interaction (Social)
    * Mining & Repair
    * Investigation & Exploration
* **3.3. Core Loop:** Players use modules for activities. Key actions require a check, influenced by the player's chosen risk level (`Risky` / `Cautious`). The outcome affects the world and the player's resources (FP, WP, TU).

## 4. Development Framework

* **4.1. Structure:** Development is organized by Layers (complexity), Modules (activities), and Systems (cross-cutting rules).
* **4.2. Development Layers:**
    * **Layer 1 (Core):** Basic module function and core mechanics.
    * **Layer 2 (Narrative):** Goal/Event systems and narrative outcomes.
    * **Layer 3 (Simulation):** NPC agent simulation and world evolution.
    * **Layer 4 (Legacy):** Faction mechanics and long-term consequences.
* **4.3. Phased Plan:**
    * **Phase 1 (Core Loop):** Establish a playable "vertical slice" of the game. Includes basic Piloting, Combat, and Trading modules and their supporting systems.
    * **Phase 2 (Narrative):** Add Mining/Repair; integrate Layer 2 systems.
    * **Phase 3 (Living World):** Add Investigation; begin Layer 3 simulation.

## 5. Art & Audio

* **Visuals:** "Neo-Retro 3D" - low-poly, hard-edged models with modern lighting, inspired by early 3D graphics.
* **Audio:** Minimalist, functional sound effects and atmospheric music that supports the tone of pragmatic space travel.
* **UI/UX:** A clean, non-intrusive UI that clearly communicates game state and choices. Easy to learn but provides depth for experienced players.

## 6. Technical

* **Engine:** Godot 3 (Primary), with a parallel J2ME-style version for mobile.
* **Analogue:** A parallel tabletop RPG design using the same core mechanics.
* **Modularity:** A modular architecture to ensure systems are independent and maintainable.

--- Start of ./0.2-GDD-Main-Sayings.md ---

# GDTLancer - Mottos & Sayings

**Version:** 1.4
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 6.1-GDD-Lore-Background.md (v1.5)

## 1. Purpose

This document lists mottos for the game and in-world sayings that reflect the culture of Opulence. These phrases should inform character dialogue and ambient storytelling.

## 2. Game Motto (Development Ethos)

* **"GDTLancer: Delivered as Designed."**
    *(This is an external motto for the development team, reflecting a commitment to the GDD's scope.)*

## 3. In-Lore Sayings & Mottos

These phrases reflect the pragmatic, resilient, and resourceful culture of the people of Opulence.

* "Waste not, want not."
    *(The most common adage, deeply ingrained in the culture.)*

* "The Vessel endures; so must we."
    *(A foundational saying, referencing the endurance of The Pillar.)*

* "Measure the cost, master the consequence."
    *(Reflects a cultural focus on calculated risk-taking.)*

* "Every component has a purpose."
    *(Highlights the importance of efficiency, repair, and modularity.)*

* "A broken tool teaches a lesson."
    *(A practical view on failure as a learning opportunity.)*

* "Skill carves status; action defines worth."
    *(The core of their meritocratic society.)*

* "Good salvage makes good neighbors."
    *(A cynical but common phrase related to resource acquisition.)*

* "The void yields to the prepared."
    *(Emphasizes the value of foresight and expertise.)*

* "No return, only the path forward."
    *(A reminder of their one-way journey and focus on the future.)*

--- Start of ./1.1-GDD-Core-Systems.md ---

# GDTLancer - Core Systems (Phase 1)

**Version:** 1.2
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 5.1-GDD-Module-Piloting.md (v1.6), 5.2-GDD-Module-Combat.md (v1.4), 5.3-GDD-Module-Trading.md (v1.1)

## 1. Overview

This document defines the core, cross-cutting gameplay systems required to support the Phase 1 modules (Piloting, Combat, Trading). The definitions and terminology herein are designed to align with the existing project codebase to ensure consistency between design and implementation.

## 2. System Definitions

### System 1: Core Mechanics API
* **Code Reference:** `autoload/CoreMechanicsAPI.gd`
* **Core Responsibility:** To serve as a centralized, global authority for resolving the game's fundamental TTRPG-style dice rolls.
* **Phase 1 Functionality:**
    * Must provide a single, globally accessible function: `perform_action_check(module_modifier, focus_points_spent)`.
    * This function must handle the `3d6` roll, apply the provided modifier and focus point bonus, and return a dictionary containing the final result and outcome tier (e.g., "CritSuccess", "Failure").
* **Interactions:**
    * **Called By:** Any module's "Narrative Action" mode (Piloting, Combat, Trading).
    * **Reads:** `Constants.gd` for outcome thresholds.

### System 2: Event System
* **Code Reference:** `core/systems/event_system.gd` (logic) and `autoload/EventBus.gd` (signaling).
* **Core Responsibility:** To generate and trigger in-game events that transition the player from one gameplay mode to another (e.g., from Free Flight to a Combat Challenge).
* **Phase 1 Functionality:**
    * Must be able to trigger a basic combat encounter event while the player is in the `Free Flight` piloting mode.
    * For Phase 1, this can be implemented as a simple timer that, on expiring, has a chance to fire an "ambush_imminent" signal on the `EventBus`.
* **Interactions:**
    * **Reads:** Player state (e.g., currently in `Free Flight`).
    * **Writes:** Emits signals to the `EventBus` that other systems (like a future "Encounter Manager" or the `WorldManager`) can listen for.

### System 3: Time System
* **Code Reference:** (New System to be created)
* **Core Responsibility:** To manage the passage of abstract game time (`Time Units` or `TU`) and its consequences.
* **Phase 1 Functionality:**
    * Must maintain a global `Time Clock` variable that tracks the current number of `TU`s.
    * Must provide a function to add `TU` to the `Time Clock`.
    * When the `Time Clock` reaches its maximum value, it must:
        1.  Emit a `world_event_tick_triggered` signal on the `EventBus`.
        2.  Call the `Character System` to deduct the periodic `WP` Upkeep cost.
        3.  Reset the `Time Clock` to zero.
* **Interactions:**
    * **Interacts With:**
        * `Piloting Module`: Free Flight mode will call the function to add `TU`.
        * `Trading Module`: Actions like `Seek Rare Goods` will add `TU`.
        * `Character System`: To apply the `WP` Upkeep cost.
        * `EventBus`: To announce the `World Event Tick`.

### System 4: Character System
* **Code Reference:** `core/systems/character_system.gd`
* **Core Responsibility:** To track and manage the core narrative stats, skills, and social standing for the player agent.
* **Phase 1 Functionality:**
    * Must track the player's current **Wealth Points (WP)** and **Focus Points (FP)**.
    * Must provide functions to safely add or subtract `WP` and `FP`.
    * Must contain the player's skill values: `Piloting Skill`, `Tactics Skill`, `Trading Skill`.
    * Must manage the data for narrative stubs, including the player's overall `Reputation` and their `Faction Standing` with various groups.
    * Must have a function to handle the `Upkeep Cost` deduction when called by the `Time System`.
* **Interactions:**
    * **Interacts With:**
        * `Trading Module`: To modify the player's `WP` total.
        * `Combat/Piloting Modules`: To retrieve skill values for calculating `Module Modifiers`.
        * `Time System`: Receives the call to deduct `WP` for upkeep.
        * `GameStateManager`: Provides player stat data for saving and loading.

### System 5: Inventory System
* **Code Reference:** (New System to be created)
* **Core Responsibility:** To manage the contents of an agent's cargo hold.
* **Phase 1 Functionality:**
    * Must define a basic data structure for a commodity (e.g., a `Resource` with properties for ID, name, base value).
    * Must maintain a list or dictionary of commodities currently held by the player.
    * Must provide functions to `addItem(item, quantity)` and `removeItem(item, quantity)`.
    * All inventory modifications must respect the `Cargo Capacity` stat of the player's ship.
* **Interactions:**
    * **Interacts With:**
        * `Trading Module`: The Trade Interface will call this system's functions to modify the player's inventory during transactions.
        * `Asset System`: To retrieve the player ship's `Cargo Capacity`.

### System 6: Asset System
* **Code Reference:** `core/systems/asset_system.gd`
* **Core Responsibility:** To track and manage an agent's major, non-consumable assets (specifically the ship in Phase 1) and their associated stats and conditions.
* **Phase 1 Functionality:**
    * Must define a basic data structure for a Ship Asset (e.g., a `Resource`) that contains all relevant stats.
    * Must maintain a reference to the player's currently active ship asset.
    * Must provide getter functions for other systems to query the current ship's stats (e.g., `get_player_ship_stat("CargoCapacity")`).
    * Must manage the data for the **Ship Quirks** narrative stub, including a list of active quirks on the player's ship.
* **Interactions:**
    * **Interacts With:**
        * `Inventory System`: Provides the `Cargo Capacity` stat.
        * `Combat Module`: Provides stats like `Hull Integrity`, `Shields`, and `Weapon Systems`.
        * `Piloting Module`: Provides stats like `Mass`, `Agility`, and `Thruster Power`.

--- Start of ./1.2-GDD-Core-Cellular-Automata.md ---

# GDTLancer - Cellular Automata Implementation

**Version:** 1.1
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 1.1-GDD-Core-Systems.md (v1.2), 6.1-GDD-Lore-Background.md (v1.5), 6.3-GDD-Narrative-Borders.md (v1.0)

## 1. Overview & Philosophy

This document outlines the implementation of Cellular Automata (CA) as a core technology for driving the "living world" and "emergent narrative" pillars of GDTLancer.

The core philosophy is that CA are not player-facing minigames, but background simulation engines. The player influences these simulations indirectly through their standard gameplay actions, and the results are presented back to them through intuitive, diegetic means such as changing maps, narrative descriptions, dialogue, and evolving gameplay opportunities. This approach ensures the player is aware of their impact on the world without breaking immersion with raw data or overly complex interfaces.

## 2. Phase 1 Implementation Approach

For the Phase 1 demo, all CA implementations will be lightweight "stubs" designed to hint at their future depth.
* They will primarily be advanced by the **`World Event Tick`**.
* They will be influenced by the outcomes of the player's **Narrative Actions**, which are resolved by the **`CoreMechanicsAPI`**.
* Their results will be exposed through existing or simple new UI elements, dialogue, and contextual gameplay changes.

## 3. Catalogue of CA Implementations

### World & Faction Simulation

#### 1. Strategic Map
* **Description:** A high-level CA where each cell represents a major location in the sector. The simulation models the ebb and flow of faction control, pirate activity, and economic stability over time.
* **Phase 1 Stub:** The simulation runs in the background, seeded by player actions (e.g., completing faction contracts, defeating pirates). It modifies a simple set of "World Stat" variables.
* **Player Access / Feedback:** A dedicated **"Sector Intel Map"** screen in the UI. This map displays locations with colored overlays representing the dominant faction's influence. After a `World Event Tick`, the player can see these colored borders subtly shift. A side panel displays the abstracted world stats as text, such as `Pirate Activity: Declining` or `Economic Outlook: Growing`.

#### 2. Supply & Demand Flow
* **Description:** A layer on the Strategic Map CA that models the propagation of resource needs and surpluses across the sector.
* **Phase 1 Stub:** Player trading actions (e.g., selling a large amount of cargo) change the state of a location's commodity (e.g., from `Normal` to `Surplus`). This state then spreads to neighboring locations over subsequent `World Event Ticks`.
* **Player Access / Feedback:** The **"Station Bulletin Board"** UI. The player does not see the raw data but instead reads narrative rumors generated by the simulation's state: *"Market chatter indicates a major surplus of Scrap Metal at Scrapyard Station."* This provides actionable intelligence that feels organic.

### Gameplay & Exploration Mechanics

#### 3. System Surveying (Anomaly Mapping)
* **Description:** A temporary, mini-CA that simulates the exploration and analysis of a volatile, uncharted cosmic anomaly, reflecting the lore surrounding "The Anomaly".
* **Phase 1 Stub:** Unlocked by an "Explorer-class" ship. The `Chart Anomaly` Narrative Action triggers a fire-and-forget simulation that runs for a set amount of Time Units.
* **Player Access / Feedback:** A stylized **"Probe Data Report"** received as an in-game message. It displays a static, graphical snapshot of the anomaly's final state, accompanied by a narrative summary: *"Survey complete. The anomaly contains a high concentration of stable exotic particles. Data sold for +15 WP."*

#### 4. Salvage Analysis
* **Description:** A temporary mini-CA representing the complex process of sifting through salvaged wreckage for usable technology, reinforcing the lore of iterative engineering.
* **Phase 1 Stub:** Triggered by an `Analyze Salvage` Narrative Action after combat. A background simulation runs to determine what can be successfully reverse-engineered.
* **Player Access / Feedback:** A narrative **"Workshop Analysis Report"** appears in the Hangar UI. It does not show the simulation, only the outcome: *"Analysis of the salvaged pirate vessel was successful. Our technicians have isolated a schematic for a more efficient engine manifold. **Progress made on 'Prospector Ship' Acquisition Project.**"*

### Social & Narrative Dynamics

#### 5. Influence Network
* **Description:** A non-spatial CA that models how information, rumors, and reputation propagate through the player's network of NPC Contacts.
* **Phase 1 Stub:** The state of "knowing" something (e.g., `Knows Player's Good Deed`) spreads from one Contact to their allies during `World Event Ticks`.
* **Player Access / Feedback:** Contextual dialogue. The player experiences this when a Contact references information they couldn't have known firsthand: *"I was talking to Officer Kai. He mentioned you handled that pirate situation quite well. I like that."* This makes the social world feel interconnected and alive.

#### 6. Ideological Alignment
* **Description:** A location-based CA where social cliques shift their ideological stance (e.g., Procedural vs. Pragmatic) based on world events and the player's actions.
* **Phase 1 Stub:** The player's `Risky` vs. `Cautious` action approaches push the alignment of relevant cliques.
* **Player Access / Feedback:** Environmental storytelling through the **type of contracts available**. A pragmatically-aligned station will offer more legally-gray but high-paying jobs, while a procedurally-aligned one will offer lawful but less lucrative contracts. The player feels their influence through the opportunities presented to them.

#### 7. Rivalry & Alliance Network
* **Description:** A CA modeling the evolving relationships *between* NPCs, creating a dynamic web of friends and rivals.
* **Phase 1 Stub:** Player actions, especially in "Contact Dilemma" events, can change the state of the link between two NPCs from `Neutral` to `Rivalry` or `Alliance`.
* **Player Access / Feedback:** Conflicting gameplay opportunities. When the player accepts a mission from Contact A, a competing mission from their rival, Contact B, may become unavailable, with a message explaining the conflict of interest. This makes social navigation a tangible, strategic choice.

#### 8. Trust & Deception Flow
* **Description:** A layer on the Influence Network where information is treated as an entity with a `Trustworthiness` score that can decay or be corrupted as it spreads.
* **Phase 1 Stub:** Rumors generated by the Supply & Demand CA are tagged with a trust level based on their source and how many "hops" they've made through the Influence Network.
* **Player Access / Feedback:** Simple UI tags on the **"Rumor Mill"**. Information is clearly marked as `[Verified Intel]`, `[Market Rumor]`, or `[Unconfirmed Hearsay]`. The player learns who to trust and can use a `Social Skill` check to `Verify Hearsay`, turning intel into a resource to be managed.

#### 9. Personal Goal Progression
* **Description:** A CA that tracks an individual NPC Contact's progress towards a personal ambition.
* **Phase 1 Stub:** The CA slowly ticks an NPC's `GoalProgress` variable. The player's actions can provide large boosts to this progress.
* **Player Access / Feedback:** The **"Contact Dossier" UI**. After discovering a goal, the player sees it listed with a simple progress bar. The completion of the goal is communicated via a direct, personal message from the NPC, which provides a clear narrative conclusion and a unique reward.

#### 10. Favor & Obligation Network
* **Description:** A CA that tracks a social currency of favors and debts between the player and NPCs.
* **Phase 1 Stub:** Player actions can create a positive (owed a favor) or negative (owe a favor) state on their link with a Contact.
* **Player Access / Feedback:** A contextual UI option. When making a difficult `Action Check`, a button may appear: **`[Call in Favor (Auto-Success)]`**. Conversely, a mission from a Contact the player owes may be flagged as: *"Declining this contract will significantly damage your standing with this contact."* This makes social currency a tangible, spendable resource.

--- Start of ./1-GDD-Core-Mechanics.md ---

# GDTLancer - Core Mechanics

**Version:** 1.5
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8)

## 1. Purpose

This document defines the game's core rules for resolving actions and managing key resources. These mechanics are used across all gameplay modules.

## 2. Action Check

Used for any action where the outcome is uncertain.

* **Core Mechanic:** `3d6 + Module Modifier`
* **Module Modifier:** `Relevant Skill + Asset Modifier +/- Situational Modifiers`
* **Thresholds:** The roll's total determines the quality of the outcome.
    * **Critical Success (14+):** The action succeeds exceptionally well, providing a bonus.
    * **Success (10-13):** The action succeeds as intended.
    * **Failure (<10):** The action fails, often with a complication.

## 3. Action Approach

A choice the player makes *before* rolling to influence the nature of the outcome.

* **Act Cautiously:** Prioritizes safety. A failure is less severe (e.g., lost time instead of damage), but a success offers no special bonus.
* **Act Risky:** Aims for a greater reward. A success is more effective or profitable, but a failure is more severe (e.g., critical damage instead of minor trouble).

## 4. Core Resources

These are the primary abstract resources players manage throughout the game.

### 4.1. Focus Points (FP)

* **What it is:** Represents an agent's mental energy, luck, or willpower.
* **How it works:** Spend FP *before* an Action Check to add a +1 bonus to the roll per point spent.
* **How to gain:** Earned by completing goals, roleplaying well, or through specific actions and outcomes.

### 4.2. Wealth Points (WP)

* **What it is:** An abstract resource representing significant economic power. It is not granular cash, but a measure of major purchasing power.
* **How it works:** Used to buy ships and modules, pay for major repairs, and cover the periodic Upkeep cost.
* **How to gain:** Earned from completing jobs, selling valuable assets (salvage, data), and achieving major goals.

### 4.3. Time Units (TU)

* **What it is:** An abstract measure of time. Most significant actions, like traveling, repairing, or undertaking a mission, cost TUs.
* **How it works:** Spending TU advances the **Time Clock**. When the clock fills, a **World Event Tick** occurs, advancing the world simulation.
* **Significance:** Time is a critical resource. The world changes and evolves independently of the player. Spending time on one opportunity means others may be lost.

--- Start of ./2.1-GDD-Development-Phase1-Scope.md ---

# GDTLancer - Phase 1 Scope & Goals

**Version:** 1.1
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 1.1-GDD-Core-Systems.md (v1.2), 4.3-GDD-Analogue-Phase1-Scope.md (v1.1), 5.1-GDD-Module-Piloting.md (v1.6), 5.2-GDD-Module-Combat.md (v1.4), 5.3-GDD-Module-Trading.md (v1.1)

## 1. Phase 1 Vision: "The First Contract" Demo

The singular goal of Phase 1 is to produce a playable, high-quality "vertical slice" of GDTLancer. This demo must establish the game's core identity by showcasing the unique blend of skill-based simulation and consequential, TTRPG-style narrative mechanics.

This initial build will focus on creating a complete and compelling, if small, player experience. It must prove that the core gameplay loops are engaging and that the foundation for the game's deeper, emergent narrative systems is sound. This version serves as the game's debut and must feel cohesive and purposeful.

## 2. Core Player Experience

In the Phase 1 demo, the player will:
* Start the game with a standard, pre-owned ship and a small amount of starting capital (WP).
* Engage with a small cast of named **Contacts** at stations to acquire contracts, building their **Relationship** score with them.
* Take on contracts from different **Factions**, which will affect their **Faction Standing**.
* Execute contracts by using the **Trading Module** to buy and sell a limited variety of commodities.
* Fly their ship in a `Free Flight` mode using the **Piloting Module**, spending **Time Units (TU)** and paying periodic `Upkeep` costs.
* Potentially face hostile NPCs in skill-based **Combat Challenges**, where victory or defeat has consequences.
* Resolve key moments—finalizing a trade, escaping a battle, docking at a station—by making **Narrative Actions** whose outcomes can grant rewards, affect their **Reputation**, or even add negative **Ship Quirks** to their vessel.
* Use their earned WP to invest in the **Asset Progression** system, working towards the tangible, long-term goal of acquiring a new, more capable ship that may unlock new gameplay opportunities.

## 3. Scope of Work: Included Components

### Modules
* **Piloting Module (v1.6):** The complete three-mode system for flight.
* **Combat Module (v1.4):** The core combat loop with hull-only targeting.
* **Trading Module (v1.1):** The core economic loop with static markets.

### Core Systems
* Core Mechanics API
* Event System
* Time System
* Character System
* Inventory System
* Asset System

### Narrative Stubs (Phase 1 Implementation)
* **Chronicle Stub ("Sector Stats"):** Tracks and displays the player's statistical impact on the game world.
* **Contact System:** Manages the player's relationships with a small cast of abstract NPCs.
* **Reputation Ledger:** A single stat tracking the player's professional standing.
* **Faction Standing:** A simple system tracking the player's standing with two distinct factions.
* **Ship Quirks:** A system for adding negative traits to a ship based on gameplay events.

## 4. Minimal Content Asset Checklist

* **Scenes:**
    * A functional **Main Menu** scene with "New Game" and "Quit" options.
    * A main **Game Scene** that hosts all managers, the player, the world, and the UI.
    * One playable **Zone Scene** containing at least two distinct station locations for trade.
* **Assets & Content:**
    * **Player Ships:** The starting ship and one additional, unlockable ship via the Asset Progression system.
    * **NPC Ship:** One hostile ship type for combat encounters.
    * **Commodities:** 3-5 unique commodity types.
    * **UI:** A functional Main HUD and menu-based interfaces for Trade, Contracts, Hangar/Asset Progression, and Contact/Faction info.
    * **Narrative:** 2-3 named Contacts and 2 named Factions for the player to interact with.

## 5. Phase 1 Development Milestones

### Milestone 1: Foundational Systems
* [ ] Implement the **Time, Character, Asset, and Inventory Systems** to their required Phase 1 functionality.
* [ ] Implement the data structures for all narrative stubs (e.g., the dictionaries for Reputation, Faction Standing; the list for Ship Quirks).
* [ ] Ensure the **Core Mechanics API** is functional and accessible.

### Milestone 2: The Player in the World
* [ ] The player can be spawned into the Zone Scene in their starting ship.
* [ ] The **Piloting Module**'s `Free Flight` mode is fully functional.
* [ ] The Main HUD is implemented, displaying basic ship status.
* [ ] Implement basic UI screens to display narrative stub info (Reputation, Sector Stats, Contact Dossier, Faction Standing).
* [ ] The **Time System** is connected to flight, consuming TU and triggering WP Upkeep.

### Milestone 3: The Economic Loop
* [ ] The **Trading Module** is implemented, allowing the player to buy and sell commodities.
* [ ] The contract board is functional, allowing players to accept and complete simple delivery contracts.
* [ ] Trading narrative actions are implemented, correctly affecting the **Contact System** and **Faction Standing**.

### Milestone 4: The Combat Loop & Asset Progression
* [ ] The **Event System** can successfully trigger a combat encounter.
* [ ] The **Combat Module**'s `Combat Challenge` is functional (targeting, weapons, damage).
* [ ] Implement the trigger logic for adding **Ship Quirks** based on combat damage or failed pilot actions.
* [ ] Combat narrative actions are implemented, correctly affecting **Reputation** and **Faction Standing**.
* [ ] The **Asset Progression** "Hangar" UI is implemented, allowing players to invest WP toward acquiring the second ship.

### Milestone 5: Cohesion & "First Contract" Polish
* [ ] Create a simple, guided "first contract" that introduces the player to all core loops (Trade, Fly, Fight, Narrative Actions).
* [ ] Ensure a clean gameplay flow from the Main Menu to the end of the first contract.
* [ ] Perform a final balancing pass on WP rewards, upkeep costs, and Action Check difficulties.
* [ ] Final bug fixing to ensure a stable and playable demo experience.

--- Start of ./2-GDD-Development-Challenges.md ---

# GDTLancer - Development Challenges

**Version:** 1.3
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8)

## 1. Overview

This document lists key development challenges for GDTLancer to help with planning and risk management. Identifying these issues early allows for proactive problem-solving.

## 2. Core Design Challenges

### Challenge: Emergent Narrative Complexity
The goal of a 'living world' with emergent stories is difficult. The main challenge is making sure the stories are coherent and engaging, not random and repetitive.

* **Mitigation Strategies:**
    * **Phased Rollout:** Introduce agent complexity and simulation depth gradually over several development phases.
    * **Clear NPC Logic:** Give NPCs clear goal-selection rules (heuristics) to guide their behavior toward believable actions.
    * **Use the Chronicle:** The Chronicle system will log major events, allowing agents to react to them and create a more connected narrative.

### Challenge: Balancing Agency and Simulation
The game needs to let players feel impactful without allowing them to easily break or exploit the world simulation.

* **Mitigation Strategies:**
    * **Abstracted Resources:** Using abstract systems like Wealth Points (WP) and Time Units (TU) provides a layer of economic balancing.
    * **Soft Gates:** Guide players with narrative and economic challenges (e.g., needing a specific ship part for Asset Progression, high upkeep costs) rather than restrictive invisible walls.

## 3. Mechanical Challenges

### Challenge: Meaningful Risky/Cautious Outcomes
The `Act Risky` / `Act Cautiously` mechanic needs many unique and interesting outcomes to be effective. This is a large content creation task.

* **Mitigation Strategies:**
    * **Systemic Outcomes:** Focus on outcomes that affect game systems (e.g., damaging a component and adding a Ship Quirk, gaining a contact, alerting a faction) instead of just static text results.
    * **Templated Outcomes:** Create templates for outcomes that can be easily adapted to different situations.

## 4. Technical Challenges

### Challenge: Simulation Performance
Simulating many agents, each with individual goals and states, is CPU-intensive and must be carefully managed.

* **Mitigation Strategies:**
    * **AI Level of Detail (LOD):** Agents far from the player will use a simplified simulation loop, reducing computational load.
    * **Process in Ticks:** Process major, non-urgent simulation changes during 'World Event Ticks' rather than in real-time.

### Challenge: Transmedia Consistency
Keeping the PC, mobile, and tabletop versions consistent requires significant design discipline and maintenance effort.

* **Mitigation Strategies:**
    * **Single Source of Truth:** The GDDs will serve as the master design source for all versions of the game.
    * **Focus on the Core Experience:** Each version should capture the core gameplay loop and feel, even if specific features differ. The mobile version will naturally be the most simplified.

--- Start of ./3-GDD-Architecture-Coding.md ---

# GDTLancer - Coding Standards & Architecture Guide

**Version:** 1.6
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8)

## 1. Purpose

This document outlines the agreed-upon coding style conventions and core architectural patterns for the Godot Engine (v3.x) implementation of GDTLancer. Adhering to these principles aims to improve code readability, maintainability, modularity, and reusability across the project's different platforms and development phases.

## 2. Engine & Language

* **Engine:** Godot Engine v3.x.
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

* **Tooling:** The project uses the **Godot Unit Test (GUT)** framework for writing and running unit tests.
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

--- Start of ./4.1-GDD-Analogue-Setup.md ---

# GDTLancer Analogue Version Setup

**Version:** 1.3
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 1-GDD-Core-Mechanics.md (v1.5)

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
    * **Purpose:** Provides spatial context for navigation, exploration, and world state.
    * **Content:** Systems, points of interest, routes (with segment costs in **Time Units (TU)**, descriptors), hazards. Space for player annotations.
    * **Format:** Pre-generated maps, pointcrawls, or hex grids.

* **3.2. Character Sheet:**
    * **Purpose:** Tracks core Agent identity, capabilities, narrative state, and key meta-resources.
    * **Content:** Name, Description, Base Skills (for calculating Module Modifiers), Current/Max **Focus Points (FP)**, Current **Wealth Points (WP)**, **Time Clock** (e.g., 8 segments for tracking TU), XP/Progression track, Active Goals list, inventory/cargo summary, status effects.

* **3.3. Asset/Module Sheet(s):**
    * **Purpose:** Represents owned Assets and provides context for enabled Gameplay Modules.
    * **Format:** Double-sided sheet/card per major Asset or small booklet.
    * **Content:**
        * **Asset Side:** Asset Name, Description/Image, Key Stats (e.g., Hull Max, Shield Max, Cargo Capacity), `Asset Difficulty` scores, Enabled Modules list, Asset condition track.
        * **Module Side(s):** For each enabled Module: Module Name, Relevant Skill reference, Calculated **Module Modifier** space (`Skill + Asset Difficulty = ___`), **Integrated Outcome Table** (Summary + Event Ref Code for Risky/Cautious), Asset Variations, Module-Specific Resource Tracks (if any).

* **3.4. Universal Mechanics Reference:**
    * **Purpose:** Quick rules lookup.
    * **Content:** Action Check summary (3d6+Mod vs 10/14), Focus Point rules, Action Approach definitions (`Risky`/`Cautious`), basic Time Clock/World Event Tick overview, basic WP usage overview.

* **3.5. Module Event Booklet(s)/Reference(s):**
    * **Purpose:** Provides detailed outcomes for Event Reference Codes from Asset/Module sheets.
    * **Structure:** Organized by Module, indexed by Event Ref Code (e.g., `C-SWC-PILOT`).
    * **Content:** Descriptions, mechanical effects (stat changes, WP costs/rewards, **TU additions for delays**, new checks required, module switches, status effects), d6 sub-tables.

* **3.6. Tokens/Trackers:**
    * **Purpose:** Physical representation for fluctuating values.
    * **Examples:** Tokens/dice for Focus Points, Wealth Points, Hull/Shield points; a marker for the **Time Clock**; markers for Progress Tracks and map position.

## 4. Gameplay Flow Summary

1.  **Consult Map & Character Sheet:** Determine location, goals, resources (FP, WP), Time Clock status.
2.  **Choose Action & Engage Module:** Decide action (e.g., Travel). Select relevant **Asset/Module Sheet**. Note **Module Modifier**.
3.  **Declare Action & Approach:** State action (e.g., `Undertake Journey` segment) & declare `Act Risky` or `Act Cautiously`.
4.  **Make Action Check:** Roll 3d6 + Mod + FP bonus. Compare to Thresholds.
5.  **Find Outcome:** Use **Integrated Outcome Table** on **Asset/Module Sheet**. Note summary & **Event Reference Code**.
6.  **Resolve Outcome:** Look up Code in **Module Event Booklet**. Apply effects: update Character Sheet (**FP**, **WP**, Goals, status), **advance Time Clock (+TU)**, potentially trigger new checks or module transitions.
7.  **Check Time Clock:** If Time Clock fills, resolve **World Event Tick** (See Section 5).
8.  **Update State:** Mark map position, etc. Repeat from Step 1/2.

## 5. World Evolution ("World Event Tick")

* Simulates dynamic world changes in the Analogue Version. Triggered when the **Time Clock** on the Character Sheet fills.
* **Resolution:** Typically involves consulting Event System tables/procedures for background events AND requiring the player to pay an **Upkeep Cost in WP** representing abstract operational expenses (fuel, supplies, maintenance) accrued over that time period. Failure to pay Upkeep has consequences. The Time Clock then resets.

--- Start of ./4.2-GDD-Analogue-Setup-Formatting.md ---

# GDTLancer Analogue Version - Setup & Formatting Guide

**Version:** 1.2
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 1-GDD-Core-Mechanics.md (v1.5), 4.1-GDD-Analogue-Setup.md (v1.3)

## 1. Purpose

This document details the recommended physical layout, content organization, and formatting principles for the printed materials used in the Analogue (Tabletop RPG) version of GDTLancer. The aim is to ensure clarity, ease of use, and efficient information access during play, supporting the game's modular design.

## 2. General Formatting Principles

* **Paper Size:** Primarily target A4/Letter for main sheets (Character, Map) and A5/Half-Letter for reference cards/booklets where practical.
* **Layout:** Utilize clean, readable fonts (e.g., sans-serif 10-12pt for body text, larger for headings). Employ clear headings, logical information grouping (using boxes or sections), and sufficient white space.
* **Tracking Methods:** Standardized methods for tracking dynamic values:
    * **Linear Progress Tracks:** (e.g., Goal Progress, Time Clock) Use tracks printed along a reinforced edge of the relevant sheet, marked with **paperclip sliders**. Typically 8-10 segments.
    * **Point Pools:** (e.g., Focus Points, Wealth Points, Hull/Shields) Use marked boxes `[ ]` or dedicated areas for writing the current value with pencil or erasable marker. Small pools like Focus Points (FP) can use check-boxes `[ ] [ ] [ ]`.
    * **Notes & Dynamic Stats:** Use pencil or erasable markers for temporary notes, status effects, or calculated values like the Module Modifier.
* **Modularity:** Design sheets to function together. Information should be located where it's most relevant contextually. Minimize redundant information.

## 3. Component Layouts

* **3.1 Character Sheet Layout:** (Primary Sheet, e.g., A4/Letter)
    * **Section 1: Agent Identification:** Character Name, Pronouns, Concept/Background Summary, Player Name.
    * **Section 2: Core Skills/Stats:** List base Skill values (e.g., Piloting: `[+X]`, Tech: `[+Y]`, Social: `[+Z]`).
    * **Section 3: Meta-Resources & Condition:**
        * Focus Points (FP): Track (e.g., `FP: [ ] [ ] [ ]` Max 3).
        * Wealth Points (WP): Box for current value `WP: [ ___ ]`.
    * **Section 4: Time & World State:**
        * **Time Clock Track:** Linear track (e.g., 8 segments: `[ ][ ][ ][ ][ ][ ][ ][ ] TU`) along one reinforced edge for a paperclip slider.
    * **Section 5: Active Goals/Vows:**
        * Area to list 2-3 active Goals. For each: Goal Name/Objective, **Progress Track** (linear track, e.g., 10 segments `[ ][ ]...[ ]`) along a reinforced edge for a paperclip slider.
    * **Section 6: Status & Notes:** Area for temporary status effects, campaign notes, quick inventory reference, contacts.

* **3.2 Map Sheet(s) Layout:** (A4/Letter or larger, potentially foldable)
    * **Main Area:** Visual map (pointcrawl, hex, sector chart) showing locations, routes (with TU costs), known hazards, faction territories. Clear Key/Legend.
    * **Annotation Space:** Margins or dedicated areas for player notes, marking current location, drawing discovered routes.

* **3.3 Asset/Module Sheet Layout:** (A5/Half-Letter card/sheet, likely double-sided, one per major Asset)
    * **Side 1: Asset Details:**
        * Header: Asset Name & Type (e.g., Ship: Wayfarer Freighter).
        * Visual: Image/Icon (Optional).
        * Description: Brief flavor text.
        * Core Stats: Hull `[ ]/[Max]`, Shields `[ ]/[Max]`, Cargo Capacity `[X]`, etc. Relevant **`Asset Difficulty`** scores (e.g., Piloting: -3, Combat: -4).
        * Enabled Modules: List of Gameplay Modules this Asset grants access to.
        * Condition/Notes: Track damage, quirks, modifications specific to this Asset.
    * **Side 2: Enabled Module Details**:
        * Header: Module Name (e.g., Piloting & Travel).
        * **Modifier Calc:** `Uses Skill: [e.g., Piloting]` | `Asset Difficulty: [-3]` | `Current Skill: [+_]` | **`Module Modifier = [___]`** (Space for player to calculate & write).
        * **Action Outcome Summary:** The compact table referencing Risky/Cautious outcomes:
            ```
            | Result      | Cautious Outcome / Ref Code | Risky Outcome / Ref Code |
            |-------------|-----------------------------|--------------------------|
            | Crit (14+)  | Stable Success+ / C-CRIT-PILOT| Major Success++ / R-CRIT-PILOT|
            | Succ (10-13)| Success + Minor Cost / C-SWC-PILOT | Success + Notable Cost / R-SWC-PILOT|
            | Fail (<10)  | Fail + Minor Setback / C-FAIL-PILOT | Fail + Major Conseq. / R-FAIL-PILOT |
            ```
        * **Module Mechanics:** Brief summary of key module actions (e.g., `Undertake Journey`, `Fast Transit` TU costs).

* **3.4 Universal Mechanics Reference Layout:** (A5/Half-Letter card or separate A4 sheet)
    * **Action Check:** Flowchart or steps (Roll 3d6 + Mod + FP -> Compare vs 10/14).
    * **Focus Points:** Gain/Loss rules, Spending options.
    * **Action Approaches:** Definitions of `Act Risky` / `Act Cautiously`.
    * **Time Clock & World Event Tick:** Summary of how TU are tracked and what happens when the clock fills (Tick -> Event + WP Upkeep -> Reset).

* **3.5 Module Event Booklet(s)/Reference(s) Layout:** (Booklet, multi-page A5/Half-Letter, or cards)
    * **Organization:** Clearly titled by Module (e.g., "Piloting & Travel Events"). Entries organized and indexed by **Event Reference Code**.
    * **Content per Entry:** Reference Code, Brief Narrative Flavor, Specific Mechanical Effects (WP cost/gain, TU add, damage, status effects, etc.).

## 4. Information Flow Example

Player decides to `Undertake Journey`. They grab their **Ship Asset Sheet**, look at the Piloting section, calculate the `Module Modifier` using their **Character Sheet**'s Piloting Skill and the ship's `Asset Difficulty`. They declare `Act Cautiously`. They roll 3d6, potentially spend FP, and add the Module Modifier. They check the result and find the outcome summary and Ref Code on the **Asset/Module Sheet**'s table. They look up the Ref Code in the **Piloting Event Booklet**, apply the detailed effects, and mark TU on the **Character Sheet**'s Time Clock.

--- Start of ./4.3-GDD-Analogue-Phase1-Scope.md ---

# GDTLancer - Analogue Version: Phase 1 Scope & Goals

**Version:** 1.2
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 1-GDD-Core-Mechanics.md (v1.5), 1.1-GDD-Core-Systems.md (v1.2), 4.1-GDD-Analogue-Setup.md (v1.3), 4.2-GDD-Analogue-Setup-Formatting.md (v1.2)

## 1. Phase 1 Vision: "The First Contract" Quickstart PDF

The primary goal for the analogue version in Phase 1 is to produce a complete, playable, and publishable **"Quickstart"** or **"Starter Set"** in PDF format. This product will serve as a self-contained introduction to the GDTLancer tabletop experience for solo or group play.

This document will teach the core rules and allow players to experience the fundamental gameplay loop of taking contracts, traveling through space, resolving encounters, and managing resources. It will establish the core feeling of the game on paper and serve as the foundation for all future analogue expansions.

## 2. Core Player Experience (Analogue)

In a typical session of the Phase 1 Quickstart, the player(s) will:
* Start with a pre-generated **Character Sheet** and the starting **Ship Asset Sheet**.
* Consult the **Scenario Booklet** to choose a contract and identify their starting location on the Sector Map.
* Spend **Time Units (TU)** to travel between locations, marking their progress on the **Time Clock** track.
* Potentially roll on an **Encounter Table** during travel, which may lead to a combat scene or another narrative dilemma.
* Resolve all uncertain situations using the core **Action Check** mechanic.
* Interact with named **Contacts** described in the booklet, making choices that affect their **Relationship** score.
* Complete contracts for different **Factions**, altering their **Faction Standing**.
* See their **Reputation** change based on the outcomes and approaches of their Narrative Actions.
* Risk having negative **Ship Quirks** added to their ship sheet on a failed check.
* Track the changing state of the sector via the **Sector Stats** tracker.
* Manage their **Wealth Points (WP)**, balancing contract rewards against the periodic `Upkeep Cost` triggered by the Time Clock.

## 3. Scope of Work: Required PDF Components

The final PDF product must contain the following printable materials:

* **Quickstart Rulebook:** A short booklet explaining the core rules: Action Checks, Action Approaches, FP, WP, TU, the Time Clock, and the phased gameplay loop.
* **Printable Character Sheet:** A sheet with fields for skills, FP, WP, and tracks for the Time Clock, Reputation, and Faction Standing.
* **Printable Ship Asset Sheet:** A sheet for the starting ship, detailing its stats and providing a dedicated space to write in `Ship Quirks`.
* **Introductory Scenario Booklet:** The main content piece, containing:
    * A starter **Sector Map** with 2-3 locations.
    * A list of 3-5 introductory contracts.
    * A travel encounter table.
    * A list of 2-3 **Contacts** with space to track relationship scores.
    * A tracker for the **Sector Stats** (Chronicle Stub).
    * All necessary **Outcome Tables** for the Phase 1 Narrative Actions.
    * Stat blocks for 1-2 types of hostile NPC ships.
* **Universal Reference Sheet:** A one-page summary of rules and Action Check outcomes.

## 4. Minimal Content Requirements

* **Rules:** The final, concise text for all core mechanics.
* **Sheets:** One pre-generated character and one starting ship must be fully statted out.
* **Narrative Content:** All contracts, encounter table entries, location descriptions, Contact bios, and—most importantly—the detailed outcome text for all Narrative Actions must be written.

## 5. Analogue Development Milestones

### Milestone 1: Rules & Layout Finalization
* [ ] Write the final, edited rules text for the Quickstart Rulebook.
* [ ] Design the definitive visual layout and formatting for all printable sheets, ensuring they are clear and intuitive for tabletop play.

### Milestone 2: Core Content Creation
* [ ] Create the pre-generated starting player character and their backstory.
* [ ] Finalize the stats for the starting player ship and the hostile NPC ship(s).
* [ ] Design and draw the starter Sector Map.

### Milestone 3: Scenario & Outcome Writing
* [ ] Write the descriptions for the starter locations, Contacts, and available contracts.
* [ ] Write all entries for the Travel Encounter Table.
* [ ] **(Primary Task)** Write the detailed, narrative outcome descriptions for every possible result (Crit Success, Success, Failure) for both `Risky` and `Cautious` approaches for all Phase 1 Narrative Actions.

### Milestone 4: PDF Assembly & Finalization
* [ ] Assemble all designed sheets and written content into a single, cohesive PDF document.
* [ ] Write a "How to Play" introduction and a "Welcome to GDTLancer" preface for the booklet.
* [ ] Perform a final proofreading and editing pass on the entire document.
* [ ] Export the final, publishable Quickstart PDF.

--- Start of ./5.1-GDD-Module-Piloting.md ---

# GDTLancer - Piloting Module

**Version:** 1.7
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 1.1-GDD-Core-Systems.md (v1.2)

## 1. Overview

This document defines the core mechanics of the Piloting Module. Its purpose is to govern all ship movement and its interaction with the core game loop. The module is divided into three distinct functional modes, designed to create a clear separation between low-stress travel, skill-based challenges, and narrative resolution.

## 2. Development Phase 1 Focus

This design is scoped specifically for **Phase 1 (Core Loop)**. The primary goal is to establish the fundamental flight model and the gameplay loop of transitioning between the three modes. Advanced features and a wider variety of challenges and narrative actions are planned for subsequent phases.

## 3. Mode 1: Free Flight

This is the default mode for intra-system travel, acting as the connective tissue between points of interest.

* **Purpose:** To allow players to move around a sector map in a low-stress, self-directed manner.
* **Mechanics:**
    * **Control Scheme:** Player has direct control over their ship using the core "boost and drift" flight model.
    * **Resource Costs:**
        * This mode continuously advances the **Time Clock** at a standard rate, consuming **Time Units (TU)**.
        * It does not have a direct Wealth Point cost, but the time spent contributes to the periodic **Upkeep Cost** in **Wealth Points (WP)**.
    * **Event Triggering:** While in Free Flight, the **Event System** can trigger encounters (e.g., distress call, pirate ambush). A triggered event will seamlessly transition the player into a **Flight Challenge**.

## 4. Mode 2: Flight Challenge

This mode represents self-contained, objective-based scenarios that test the player's skill.

* **Purpose:** To provide a pure, skill-based test of the player's piloting and combat abilities without interruption from abstract mechanics.
* **Mechanics:**
    * **Trigger:** Initiated by an event from Free Flight or by accepting a mission that requires a specific objective to be met.
    * **Objective-Based:** Each challenge has a clear, binary success condition. Examples for Phase 1 include:
        * `Destroy all hostile targets.`
        * `Survive for a specific duration.`
        * `Reach a specific coordinate.`
    * **Pure Skill:** Success or failure is determined entirely by the player's real-time performance. There are **no** `Action Checks` during a Flight Challenge.
    * **Ship Performance:** A ship's stats directly affect its handling, speed, and durability within the challenge.

## 5. Mode 3: Narrative Action

This mode is the TTRPG-style resolution step that occurs *after* a Flight Challenge is successfully completed.

* **Purpose:** To resolve the consequences, quality of success, and narrative fallout of the preceding skill-based challenge.
* **Mechanics:**
    * **Trigger:** Player-initiated command selected from a menu after the "CHALLENGE COMPLETE" condition is met.
    * **Core Mechanic:** Utilizes the standard `3d6 + Module Modifier` **Action Check** to determine the outcome.
    * **Consequences:** The result of the roll determines the strategic consequences. These outcomes can directly interact with stub systems, such as adding a negative "Ship Quirk" to the player's vessel on a failure, or affecting their "Reputation" based on their approach.
    * **Essential Phase 1 Actions:**
        * **Perform Evasive Departure:** Used after winning a combat encounter to determine if the getaway was clean. A failure could result in being tracked or damaging a component, potentially adding a "Ship Quirk."
        * **Execute Precision Arrival:** Used after reaching a destination to determine the quality of the docking. A failure could result in minor ship damage and add a Quirk like "Jammed Landing Gear."

## 6. Required Phase 1 Systems & Stats

* **Required Agent Stats (from Character System):**
    * `Piloting Skill`: The base value used to calculate the `Module Modifier` for Narrative Actions.
* **Required Ship Stats (from Asset System):**
    * `Mass`: Affects inertia and drift.
    * `Agility`: Affects turn rate and responsiveness.
    * `Thruster Power`: Affects acceleration and top speed.
* **Core System Integration:**
    * **Time System:** Must be advanced by Free Flight mode.
    * **Event System:** Required to trigger the transition from Free Flight to a Flight Challenge.
    * **Core Mechanics API:** The core function used to resolve all Narrative Actions.
    * **Asset System:** Provides the ship stats that influence flight performance.
    * **Character System:** Provides the skill stats for Narrative Action checks.

--- Start of ./5.2-GDD-Module-Combat.md ---

# GDTLancer - Combat Module

**Version:** 1.5
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 1.1-GDD-Core-Systems.md (v1.2), 5.1-GDD-Module-Piloting.md (v1.7)

## 1. Overview

This document defines the mechanics for ship-to-ship conflict. The module is designed to work in concert with the Piloting Module, structuring combat encounters into a distinct skill-based challenge followed by a narrative resolution.

## 2. Development Phase 1 Focus

This design is scoped for **Phase 1 (Core Loop)**. The focus is on establishing the fundamental mechanics of combat: targeting, applying damage, and clear victory conditions. Advanced features like specific sub-system targeting, electronic warfare, or complex weapon types are planned for later phases.

## 3. Mode 1: Combat Challenge

This mode represents the direct, real-time engagement between vessels. It is a self-contained test of the player's combat and piloting skill.

* **Purpose:** To provide pure, skill-based ship-to-ship fighting without interruption from abstract mechanics.
* **Mechanics:**
    * **Trigger:** Initiated by an event from Free Flight (e.g., ambush) or by accepting a mission that requires combat.
    * **Core Gameplay:** Players have direct control over their ship's movement and weapon systems. The core gameplay loop involves maneuvering, aiming, and firing to deplete the enemy's Hull Integrity.
    * **Targeting:** For Phase 1, targeting is limited to the enemy ship's main hull.
    * **Objective:** The challenge is successfully completed when all designated hostile targets are neutralized (Hull Integrity reaches 0).
    * **Consequences of Damage:** Taking significant hull damage during the challenge, even if victorious, can result in a new "Ship Quirk" being added to the player's vessel.
    * **Pure Skill:** Success in this mode is determined solely by player performance. There are **no** `Action Checks` during the Combat Challenge.

## 4. Mode 2: Narrative Action

This is the resolution step that occurs after the Combat Challenge is won. It determines the consequences and potential rewards of the engagement.

* **Purpose:** To resolve the strategic and narrative fallout of a battle.
* **Mechanics:**
    * **Trigger:** Player-initiated command selected from a menu after the last enemy ship is neutralized.
    * **Core Mechanic:** Utilizes the standard `3d6 + Module Modifier` **Action Check** to determine the outcome.
    * **Consequences:** Outcomes from these actions are a primary driver for the narrative stub systems. Results can directly modify the player's "Reputation," their standing with various "Factions," and the sector's "World Stats" in the Chronicle.
    * **Essential Phase 1 Actions:**
        * **Assess the Aftermath:** A general-purpose action to evaluate the battlefield. A success might reveal that the defeated ships belonged to a known pirate faction, improving your standing with a security faction. A failure might reveal that the fight was witnessed by a neutral party who reports your aggression, lowering your reputation.
        * **Claim Wreckage:** A specific attempt to salvage components from a disabled ship. A success yields a valuable asset or adds to `WP`. A `Risky` approach might yield more `WP` but lower your reputation ("Opportunist"). A failure could mean the wreckage is too unstable and explodes.

## 5. Required Phase 1 Systems & Stats

* **Required Agent Stats (from Character System):**
    * `Tactics Skill`: The base value used to calculate the `Module Modifier` for combat-related Narrative Actions.
* **Required Ship Stats (from Asset System):**
    * `Hull Integrity`: The ship's health.
    * `Shields`: A regenerating layer of defense that absorbs damage before Hull Integrity.
    * `Weapon Systems`: Defines damage output, range, and rate of fire for equipped weapons.
* **Core System Integration:**
    * **Event System:** To initiate combat encounters.
    * **Time System:** Combat Challenges and subsequent actions consume **Time Units (TU)**.
    * **Core Mechanics API:** To resolve Narrative Actions.
    * **Asset System:** Provides the ship's combat stats.
    * **Character System:** Provides the skill stats for Narrative Action checks.

--- Start of ./5.3-GDD-Module-Trading.md ---

# GDTLancer - Trading Module

**Version:** 1.2
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 1.1-GDD-Core-Systems.md (v1.2)

## 1. Overview

This document defines the mechanics for all economic activities, including the buying and selling of commodities and the management of contracts. The primary function of this module is to provide the core loop for accumulating **Wealth Points (WP)**.

## 2. Development Phase 1 Focus

This design is scoped for **Phase 1 (Core Loop)**. The goal is to establish a minimal, functional economic loop. This includes basic commodities, static markets, and a simple interface for transactions. Dynamic economies, complex trade routes, and crafting are planned for later phases.

## 3. Core Mechanic: The Trade Interface

The primary interaction in the Trading Module is UI-based. This interface is the hub for all market and contract activity.

* **Purpose:** To allow players to manage their cargo, accept contracts, and execute transactions.
* **Mechanics:**
    * **Trigger:** Player docks at a location with a market and selects the "Market" or "Contracts" option.
    * **Market Gameplay:** A menu-driven interface displays the player's cargo, the station's inventory, and the current buy/sell prices for commodities. The player can execute buy and sell orders.
    * **Contract Gameplay:** A separate tab on the interface lists available contracts. For Phase 1, these are simple delivery contracts. Contracts will be flagged with a Faction owner.
    * **Economic Loop:** The goal is to buy commodities at a low price and sell them for a higher price, or to complete contracts, generating a net profit in `WP`.

## 4. Narrative Actions in Trading

These actions introduce skill, chance, and social interaction into trading, making it more than just a spreadsheet. They are the primary method for improving relationships with contacts and factions.

* **Purpose:** To provide opportunities for players to create their own advantages in the market through risk and social skill.
* **Mechanics:**
    * **Trigger:** Player-initiated special commands available within the Trade Interface.
    * **Core Mechanic:** Utilizes the standard `3d6 + Module Modifier` **Action Check** to resolve the outcome.
    * **Consequences:** Outcomes directly affect the player's relationships and standing. A successful negotiation might improve your relationship with a `Contact`, while failing a contract can damage your `Faction Standing` and `Reputation`.
    * **Essential Phase 1 Actions:**
        * **Negotiate Bulk Deal:** When buying or selling a large quantity of goods, perform this check to get a better price. This is framed as an interaction with a specific `Contact`. A success provides a `WP` bonus and may increase your `Relationship` with them. A failure can result in a worse price and a damaged relationship.
        * **Seek Rare Goods:** Perform this check to find unlisted opportunities. A success might reveal a rare commodity, offered as a "tip-off" from a friendly `Contact`. A failure consumes **Time Units (TU)** with no result.

## 5. Required Phase 1 Systems & Stats

* **Required Agent Stats (from Character System):**
    * `Trading Skill`: The base value used to calculate the `Module Modifier` for trading-related Narrative Actions.
* **Required Ship Stats (from Asset System):**
    * `Cargo Capacity`: Determines the maximum number of commodity units the ship can hold.
* **Required Commodity Stats:**
    * `Item ID`: A unique identifier.
    * `Name`: The display name of the commodity.
    * `Base Value`: The baseline price used for market calculations.
* **Core System Integration:**
    * **Character System:** Manages the player's `WP` total and `Trading Skill`. It is also the hub for `Reputation` and `Faction Standing` stubs.
    * **Inventory System:** Stores and manages player-owned commodities.
    * **Asset System:** Provides the ship's `Cargo Capacity`.
    * **Time System:** Actions like `Seek Rare Goods` consume `TU`.
    * **Core Mechanics API:** Resolves all Narrative Actions.
    * **Contact System:** The trading interface will be a primary point of interaction with Contacts.

--- Start of ./6.1-GDD-Lore-Background.md ---

# GDTLancer - Lore & Background

**Version:** 1.6
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 1-GDD-Core-Mechanics.md (v1.5)

## 1. Overview

This document outlines the foundational lore for the GDTLancer universe. This history informs game mechanics, dialogue, design, and technology. The game takes place in **Sectors**, which can be a star system or other distinct region, keeping travel distances manageable.

## 2. The Exodus and The Pillar

* **Origin:** The people of the Opulence system descend from groups who left Earth centuries ago.
* **The Pillar:** Their generation ship, "The Pillar," was built for a multi-century journey, prioritizing durability and self-sufficiency.
* **Functionality:** The Pillar is a rotating cylinder that generates sub-1g gravity. Its fully enclosed systems maintained a controlled, low-pressure atmosphere and a closed-loop ecosystem.
* **Purpose:** The exodus was a one-way trip to establish a new, autonomous civilization, away from Earth's conflicts and ecological issues.

## 3. The Anomaly and Arrival

* **Interstellar Transit:** The voyage ended after passing through a spatio-temporal distortion known as "the Anomaly."
* **Dislocation:** The Anomaly caused an uncontrolled spatial displacement, throwing The Pillar into an uncharted region of space. A temporal shift is also suspected.
* **Arrival:** The Pillar eventually stopped near a G-type star, where the "Opulence" system was settled.
* **Resource Shift:** Opulence is rich in energy, but raw matter for construction and repair is scarce. This scarcity defines the system's economy and culture.

## 4. Post-Arrival: Shaping a Civilization

* **Present Timeline:** The game is set 50-70 years after The Pillar's arrival. "Founders" (born on The Pillar) are elders in their 70s-90s. The "Voyagers" (the first generation born in Opulence) are adults in their 50s-70s and form the backbone of society. Younger generations are now often born in newer habitats off-Pillar.
* **The Pillar's Enduring Role:** The Pillar was repurposed into the system's central hub for energy collection, refining, fabrication, and knowledge archival. It remains the primary deep-space port.
* **Initial Expansion:** Early efforts focused on building survey vessels and automated mining tools. Asteroid mining established material self-sufficiency, allowing for the construction of smaller satellite habitats.

## 5. The People of Opulence: Generations & Adaptation

* **Founders:** This older generation holds the memory of the long voyage. They are seen as experienced, patient, and detail-oriented, valuing established procedures and knowledge preservation.
* **Voyagers:** The first generation born in Opulence is pragmatic and resourceful, shaped by energy abundance and matter scarcity. They focus on practical expansion and resource acquisition.
* **Population Value:** Each individual is highly valued due to historical population limits and a continued scarcity of skilled labor. This underlies the game's focus on meaningful agent interactions.
* **Physiological Legacy:** Centuries in a controlled environment have led to subtle physiological differences, such as a preference for lower-G and better tolerance for minor radiation, which are considered normal.

## 6. Culture of Pragmatism & Resilience

* **Environmental Disposition:** Planetary surfaces are not feared, but seen as inefficient and resource-intensive to settle compared to asteroids and void habitats, which offer better environmental control.
* **Core Values:** The culture values pragmatism, utilitarianism, and self-sufficiency. Resourcefulness and efficiency are highly respected. "Waste not, want not" is a common adage.
* **Social Structure:** Family units are often based on mutual support and contribution. Meritocracy based on practical skills is central to social standing.
* **Internal Conflict and Resolution:** Competition over resources, trade routes, or patents is common. Destructive warfare is avoided due to its high cost. Disputes are resolved through negotiation, arbitration, or structured "trials" to preserve assets and personnel.
* **The 'Lancer' Combat Doctrine:** When disputes escalate, they are handled through specialized ship-to-ship engagements designed for controlled neutralization, not destruction.
    * **Melee Focus:** The core of this doctrine, the "Lancer" paradigm, emphasizes close-quarters combat using durable industrial tools (lances, grapples, rams). This conserves matter and allows for asset recovery.
    * **Reclaimable Projectiles:** Projectile weapons are rare and typically designed to be recoverable. They are used strategically to disable or capture.
    * **Limited Casualties:** The goal is to disable, capture, or compel surrender, reflecting the high value of pilots and their ships.

## 7. Technology, Expansion & Human Interface

* **Technological Evolution:** Technology is an iteration of The Pillar's original systems, emphasizing reliability, modularity, and efficiency.
* **Research Focus:** Key development areas include robotics, small vessel design, efficient fabrication, asteroid mining, and advanced propulsion.
* **Exploration & Settlement:** Exploration is driven by practical needs for resources and outpost locations. Settlements are utilitarian void habitats or modified asteroids.

### 7.1. G-Stasis Cradle

* **Purpose:** A standard system in all high-performance ships that allows pilots to withstand extreme G-forces.
* **Components:** A mechanical and bio-support system including an Exo-Harness, Active Contour Bladders for bracing, a Pressurized Breathing System, and Neuro-Biological Support for chemical and neural assistance.

## 8. Naming Conventions (Outline)

* **Cultural Synthesis:** Names reflect a blend of diverse Earth cultures from The Pillar's journey.
* **Given Names:** A mix of traditional Earth names, often simplified. New names may emerge from significant events.
* **Surnames:** Can be inherited Earth names or functional names reflecting ancestral roles (e.g., "Engineer-Chang," "Pilot-Nia").
* **Language:** A practical and direct creole lingua franca with heavy technical jargon.

## 9. Ambient Lore Implementation Goal

The player experiences this history through its consequences on game mechanics, dialogue, and design, minimizing direct exposition in favor of "showing, not telling."

--- Start of ./6.2-GDD-Lore-Player-Onboarding.md ---

# GDTLancer - Player Onboarding

**Version:** 1.2
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 1-GDD-Core-Mechanics.md (v1.5), 6.1-GDD-Lore-Background.md (v1.6)

## 1. Purpose and Goals

This document outlines the player's first 30-60 minutes of gameplay. The goal is to introduce core systems smoothly without being overwhelming.

* **Teach Core Mechanics:** Introduce Action Checks, the `Risky`/`Cautious` system, and core resources (FP, WP, TU).
* **Show the Gameplay Loop:** Demonstrate how to accept a goal, travel, perform actions, and receive a reward.
* **Introduce the Setting:** Convey the pragmatic culture, resource scarcity, and the "Lancer" combat mindset through action.
* **Provide a Clear Next Step:** End the tutorial with a clear, player-driven objective.

## 2. Onboarding Philosophy

* **Guided, Not Forced:** Give the player a clear starting goal within a small, controlled area, but allow for experimentation.
* **Learn by Doing:** Introduce mechanics as they are needed. Explain the Action Check when the player first needs to make one.
* **Contextual Introduction:** Frame the tutorial within a simple story that organically reveals aspects of the game's lore and culture.

## 3. Onboarding Scenario: "The First Contract"

This scenario introduces the player to the game's core loop and establishes their place in the world.

* **Setup:** The player is a new pilot with a basic, second-hand ship, docked at a small habitat. Their mentor, a senior 'Voyager' engineer, guides them through their first official contract. This immediately grounds the player in the generational lore.

* **Step 1: The Mentor & The Goal**
    * The Mentor NPC gives the player a simple contract: retrieve a specific, salvageable component from a nearby, stable debris field.
    * **Introduces:** The Goal System, basic dialogue interaction.

* **Step 2: Travel & Time**
    * The mentor instructs the player to fly to the debris field. The flight is short and direct.
    * **Introduces:** Basic Piloting controls, the concept of spending Time Units (TU), and the Time Clock.

* **Step 3: The First Action Check**
    * At the debris field, the player must scan for the component. This is their first **Action Check**.
    * **Introduces:** The Action Check mechanic, the `Risky`/`Cautious` choice, and the use of Focus Points (FP).

* **Step 4: A Minor Complication**
    * The component is found, but it's stuck under a larger piece of debris. The player must use their ship's manipulator arm to carefully pry it loose. This requires another Action Check.
    * **Introduces:** How tools are used to solve problems; reinforces the Action Check mechanic.

* **Step 5: Controlled Conflict**
    * On the return trip, a lone scavenger in a poorly-maintained ship intercepts them and demands the component. This is a controlled combat tutorial.
    * The mentor advises the player to disable the scavenger's ship (reduce its hull to zero) without completely destroying it, calling annihilation "wasteful."
    * **Introduces:** The Combat Module, targeting the enemy hull, and the core principle of the Lancer Doctrine (avoiding destruction to preserve assets).

* **Step 6: The Reward & Next Steps**
    * The player returns the component to the mentor. They receive their first **Wealth Point (WP)** as payment.
    * The mentor congratulates them and points them to the station's job board, explaining how to find new contracts.
    * **Introduces:** The Wealth (WP) resource and the systems for finding new, player-driven goals. The tutorial is now complete, and the player is free to choose their next action.

--- Start of ./6-GDD-Lore-Narrative-Borders.md ---

# GDTLancer - Narrative Borders of the Simulation

**Version:** 1.1
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 6.1-GDD-Lore-Background.md (v1.6)

## 1. Purpose & Philosophy

This document defines the high-level narrative and thematic constraints—the "borders"—within which the game's simulation must operate. The goal is to guide the emergent narrative so that it consistently reinforces the core themes of the GDTLancer universe.

Our design philosophy is that **the simulation serves the narrative, not the other way around.** We are not creating a scientifically accurate, open-ended universe simulation. We are creating a powerful, thematically-focused story generator. These borders ensure that the stories it generates are always grounded in the game's established lore and core pillars.

## 2. The Core Narrative Borders

These principles must be applied to the design of all game systems, from agent AI to event generation.

### Border 1: Preservation of Assets

* **Lore Justification:** The culture of Opulence was forged by the scarcity of complex materials and skilled personnel. Every ship is a significant investment, and every skilled pilot is a nearly irreplaceable resource. This led to the creation of the Lancer Doctrine, which prizes neutralization and capture over outright destruction.
* **Mechanical Implementation:**
    * **High Cost of Destruction:** Systems must be designed so that the total destruction of a ship is the least profitable and most consequence-heavy outcome of combat. It should result in minimal WP gain, significant Reputation loss, and potential negative Faction Standing changes.
    * **Rewarding Disablement:** Conversely, disabling a ship to allow for salvage (`Claim Wreckage`) or compelling a surrender must always be the most mechanically and narratively rewarding path.
    * **NPC Behavior:** The logic for NPC agents must reflect this. Most NPCs will default to disabling tactics. Only specific, defined groups (e.g., fanatical outlaws, non-human threats) would ever favor wanton destruction, making them feel truly alien to the setting's culture.

### Border 2: Pragmatic Agent Behavior

* **Lore Justification:** The people of Opulence are pragmatic, utilitarian, and focused on managing risk, time, and resources. Their actions are driven by logical needs and calculated goals, not chaos.
* **Mechanical Implementation:**
    * **Goal-Oriented AI:** The `Goal System` for NPCs must be built on heuristics, not pure randomness. A trading agent will seek to maximize profit. A pirate agent will seek to acquire wealth with the least possible risk.
    * **Systemic Pressures:** The core game loops and resource sinks (like the `Time System`'s `Upkeep Cost`) must apply to NPCs as well as the player, ensuring they operate under the same pragmatic pressures.

### Border 3: Contained Scale

* **Lore Justification:** Common Faster-Than-Light travel does not exist. The game's story is focused on the dense, personal, and political dynamics within a single star system or a small cluster of them (a "Sector").
* **Mechanical Implementation:**
    * **Sector-Based World:** The game world must be structured as a series of discrete, high-detail sectors, not a seamless galaxy.
    * **Relevant Events:** The `Event System` and `Chronicle` must prioritize generating and logging events that are local and relevant to the player. The "living world" should feel immediate and present, not like a distant, abstract simulation.

### Border 4: A Human-Centric Universe

* **Lore Justification:** The game's narrative is fundamentally about humanity—specifically, the descendants of The Pillar—and how they've adapted.
* **Mechanical Implementation:**
    * **Agent Focus:** The simulation must be focused on the interactions between human agents and their factions. The vast majority of generated events should relate to trade, politics, piracy, personal relationships, and discovery.
    * **The Alien is Alien:** True alien life, cosmic horrors, or spatio-temporal anomalies (like "the Anomaly" in the backstory) must be treated as rare, significant, and narratively impactful. The simulation should not be populated with a menagerie of random sci-fi creatures and phenomena; this preserves their thematic weight.

--- Start of ./7.1-GDD-Assets-Ship-Design.md ---

# GDTLancer - Ship Design Philosophy

**Version:** 1.4
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 6.1-GDD-Lore-Background.md (v1.6)

## 1. Overview

This document outlines the design philosophy for all ships in GDTLancer. It aims to balance in-game lore with the need for clear and engaging ship designs. The core principle is **Pragmatic Aesthetics**: function dictates form.

## 2. Core Principles

* **Pragmatic Aesthetics:** Designs prioritize function, reliability, and modularity. Born from a culture of resource scarcity and engineering pragmatism, a ship's look should communicate its purpose. Ornamentation is rare and seen as wasteful.
* **Modular Design:** Ships are built from modular components (thrusters, cockpits, cargo bays, weapon mounts). This makes them easier to repair, upgrade, and customize, reinforcing the setting's iterative approach to technology.
* **"Lived-In" Feel:** Ships should look used and maintained, not pristine. Scratches, patch repairs, and external modifications show a history of use. Designs may be asymmetrical if it serves a functional purpose.

## 3. The Lancer Combat Doctrine

The Lancer Doctrine is a combat philosophy born from the dual scarcities of raw matter and skilled personnel. Its primary goal is not destruction, but the controlled neutralization of an opponent to capture assets and preserve life. This doctrine directly shapes the design and function of all combat-capable ships.

* **Close-Quarters Engagement:** The doctrine favors close-range combat where precision is possible. This minimizes wasted energy and allows for the use of durable, low-cost tools. Ship designs often feature heavy forward armor and reinforced frames.
* **Adapted Industrial Tools (Melee):** Instead of disposable ammunition, combat often relies on adapted industrial equipment like reinforced drills, cutting lances, and grappling arms. These tools are used to disable key ship systems like thrusters or power plants.
* **Recoverable Projectiles:** When ranged attacks are necessary, they use recoverable munitions. Examples include tethered harpoons, capture nets, or non-explosive kinetic slugs designed to be retrieved after a fight.
* **Asset Preservation:** The ultimate goal is to disable, not destroy. A disabled ship can be claimed, its pilot captured, and its cargo seized. This approach avoids the immense waste of destroying a valuable vessel and its skilled operator.

## 4. Ship Classes & Roles

Ship classes are defined by their intended role within the Lancer Doctrine. Many dedicated combat ships are heavily modified versions of standard industrial frames.

* **Lancer:** A close-quarters specialist designed to disable enemy vessels using adapted tools. Heavily armored in the front to protect it on approach.
* **Striker:** Utilizes recoverable projectiles like harpoons or kinetic slugs to cripple targets from a short distance before closing in or retreating.
* **Bastion:** A durable, heavily armored ship, often used for defense or to anchor a formation. May carry capture-oriented tools like nets or tractor beams.
* **Skirmisher:** A fast ship that excels at flanking and disabling specific external modules like thrusters or sensors. Lightly armored but hard to hit.
* **Industrial/Civilian:** Freighters, miners, tugs, and survey ships. Typically armed only for defense, but their sturdy frames are often the starting point for combat conversions.

## 5. Visual Language

The visual design should consistently reinforce the core principles.

* **Exposed Components:** Functional parts like pipes, heat sinks, and power conduits are often visible, showcasing the ship's mechanical nature.
* **Hard Edges:** Designs favor function-driven angles and simple geometric shapes over complex, organic curves.
* **Materiality:** Materials look real and functional—dented steel, welded plates, composite patches. Textures should emphasize function and wear.
* **Lighting:** Lighting is functional, used for visibility on viewports, docking guides, and warning indicators.
* **Color & Decals:** Color and decals identify faction and ownership, not for pure decoration. They are often applied practically, like stenciled serial numbers or faction logos.

--- Start of ./7-GDD-Assets-Style.md ---

# GDTLancer - General Asset & Style Guide

**Version:** 1.0
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 6.1-GDD-Lore-Background.md (v1.6), 7.1-GDD-Assets-Ship-Design.md (v1.4)

## 1. Overview & Core Philosophy

This document defines the overarching artistic, audio, and user interface style for all assets in GDTLancer. The goal is to create a cohesive and distinct identity that reinforces the game's core themes of pragmatism, function-first design, and a unique "Neo-Retro" aesthetic.

* **Neo-Retro 3D:** The primary visual style is inspired by the limitations and aesthetics of early 3D graphics (mid-to-late 1990s), but executed with modern rendering techniques like dynamic lighting and shaders. This is not a pixel-perfect retro emulation, but an interpretation of that style.
* **Pragmatic Aesthetics:** Form always follows function. Every element in the game world, from a ship's hull to a UI button, should look like it was designed for a purpose, not for decoration. This reflects the utilitarian culture of Opulence.

## 2. Visual Style

### 2.1. 3D Models & Texturing
* **Geometry:** Models must be low-poly with clean, hard edges. Beveling should be used sparingly to catch light, but complex, smooth curves and subdivision surfaces are to be avoided. The silhouette should be clear and readable.
* **Texturing:** Photorealistic textures are forbidden. Surfaces should primarily use flat colors, simple gradients, or subtle, procedurally generated noise patterns. Textures should define material type (e.g., matte metal, rubberized composite) rather than intricate surface detail.
* **Wear and Tear:** Details like scratches, weld lines, and patch repairs should be added as simple decals or vertex color variations, not complex, high-resolution texture maps. The goal is to suggest a history of use, not to simulate realistic decay.

### 2.2. Environments
* **Space:** The void of space should be dark and minimalist. The sense of scale and movement is conveyed through simple, billboard-style star sprites and multi-layered dust particle effects.
* **Nebulae & Phenomena:** Large environmental features like nebulae should be stylized, using simple geometry with volumetric shaders or layered, transparent sprites rather than photorealistic clouds.
* **Structures:** Stations and habitats follow the same pragmatic design as ships: functional, modular, and often asymmetrical. Lighting is utilitarian, used for navigation, docking bays, and warning signals.

### 2.3. UI / UX
* **Philosophy:** The UI is a functional tool, not a decorative overlay. It must be clean, non-intrusive, and highly readable.
* **Layout:** Use a grid-based layout with clear information hierarchy. Group related elements logically.
* **Visuals:** Elements should be composed of simple, 2D vector-style lines and shapes. Buttons are functional rectangles or squares. Icons are simple and symbolic.
* **Typography:** Use a clean, sans-serif font (like Roboto Condensed) for all text to ensure maximum readability.
* **Color Palette:** The UI uses a mostly monochromatic palette (dark backgrounds, light grey or off-white text). Bright, saturated colors (cyan, yellow, red) are used exclusively for highlights, alerts, and critical information to draw the player's attention.

## 3. Audio Style

### 3.1. Sound Effects (SFX)
* **Philosophy:** Sounds are functional feedback. They should be clear, distinct, and immediately communicate what is happening.
* **Style:** SFX should have a slightly synthesized, "lo-fi" quality to match the neo-retro aesthetic. Avoid cinematic, high-fidelity explosions and impacts. Think more of the satisfying "thunks," "beeps," and "hums" of classic sci-fi. Thruster sounds should be a low, functional rumble, not a dramatic roar.

### 3.2. Music
* **Philosophy:** Music provides atmosphere, not overt emotional direction. It should support the feeling of isolation and pragmatic work in space.
* **Style:** The soundtrack should be minimalist and ambient. Expect long, evolving synthesizer pads, simple arpeggios, and a generally low-key, atmospheric tone. Music should swell subtly during moments of tension (like combat) but should not become an epic, orchestral score.

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

**Version:** 1.1
**Date:** August 1, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.8), 3-GDD-Architecture-Coding.md (v1.4)

## 1. Purpose

This document defines the standard priming prompt to be used when initiating a new chat session with an AI assistant for the development of GDTLancer. Its purpose is to clearly establish the project context, the expected collaborative paradigm, defined roles, and the iterative workflow, ensuring efficient and targeted AI assistance aligned with the project's goals and standards.

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
    * Handling the "manufacturing" of code according to the project's established coding standards and architectural patterns (e.g., use of Autoloads, EventBus, Resources as defined in `3-GDD-Architecture-Coding.md`).
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

* [**0.1-GDD-Main.md**](./0.1-GDD-Main.md): The central Game Design Document outlining the overall vision, game pillars, development framework (Layers, Modules, Systems), phased plan, and summaries of core concepts. (Reviewed: v1.8, 2025-08-01)
* [**0.2-GDD-Main-Sayings.md**](./0.2-GDD-Main-Sayings.md): Lists key mottos for the game's branding and ethos, alongside in-game lore-wise sayings. (Reviewed: v1.4, 2025-08-01)

### 1. Core Systems & Mechanics

* [**1-GDD-Core-Mechanics.md**](./1-GDD-Core-Mechanics.md): Details the fundamental, universal mechanics: the **Action Check** (3d6+Mod resolution), **Focus Points (FP)**, and the **Action Approach** system (`Act Risky`/`Act Cautiously`). (Reviewed: v1.5, 2025-08-01)
* [**1.1-GDD-Core-Systems.md**](./1.1-GDD-Core-Systems.md): Defines the cross-cutting gameplay systems required for Phase 1, including the `Core Mechanics API`, `Event System`, `Time System`, `Character System`, `Inventory System`, and `Asset System`. (Reviewed: v1.2, 2025-08-01)
* [**1.2-GDD-Core-Cellular-Automata.md**](./1.2-GDD-Core-Cellular-Automata.md): Outlines the philosophy and catalogue of Cellular Automata implementations used to drive the living world and emergent narrative systems. (Reviewed: v1.1, 2025-08-01)

### 2. Development Planning

* [**2-GDD-Development-Challenges.md**](./2-GDD-Development-Challenges.md): Identifies and acknowledges the primary challenges and inherent risks associated with the development of GDTLancer. (Reviewed: v1.3, 2025-08-01)
* [**2.1-GDD-Development-Phase1-Scope.md**](./2.1-GDD-Development-Phase1-Scope.md): The master document for the Phase 1 "First Contract" demo, defining the core player experience, included components, content requirements, and development milestones. (Reviewed: v1.1, 2025-08-01)

### 3. Development Architecture

* [**3-GDD-Architecture-Coding.md**](./3-GDD-Architecture-Coding.md): Outlines the coding style conventions, architectural patterns, and development philosophy for the Godot implementation. (Reviewed: v1.4, 2025-08-01)

### 4. Analogue Version

* [**4.1-GDD-Analogue-Setup.md**](./4.1-GDD-Analogue-Setup.md): Describes the recommended physical components and general organization for playing the tabletop RPG version. (Reviewed: v1.3, 2025-08-01)
* [**4.2-GDD-Analogue-Setup-Formatting.md**](./4.2-GDD-Analogue-Setup-Formatting.md): Specifies the detailed layout, content areas, and formatting for the physical sheets used in the analogue version. (Reviewed: v1.2, 2025-08-01)
* [**4.3-GDD-Analogue-Phase1-Scope.md**](./4.3-GDD-Analogue-Phase1-Scope.md): The master document for the Phase 1 Analogue "Quickstart PDF", defining its vision, required components, and development milestones. (Reviewed: v1.2, 2025-08-01)

### 5. Gameplay Modules

* [**5.1-GDD-Module-Piloting.md**](./5.1-GDD-Module-Piloting.md): Specific design details for the Piloting & Travel gameplay module, covering `Free Flight`, `Flight Challenges`, and `Narrative Actions`. (Reviewed: v1.7, 2025-08-01)
* [**5.2-GDD-Module-Combat.md**](./5.2-GDD-Module-Combat.md): Details the mechanics for ship-to-ship conflict, including `Combat Challenges` and post-battle `Narrative Actions`. (Reviewed: v1.5, 2025-08-01)
* [**5.3-GDD-Module-Trading.md**](./5.3-GDD-Module-Trading.md): Details the mechanics for the economic loop, including the `Trade Interface` and trading-related `Narrative Actions`. (Reviewed: v1.2, 2025-08-01)

### 6. Lore & Player Experience

* [**6-GDD-Lore-Narrative-Borders.md**](./6-GDD-Lore-Narrative-Borders.md): Defines the thematic and narrative constraints that guide the game's simulation to ensure lore-adherence. (Reviewed: v1.1, 2025-08-01)
* [**6.1-GDD-Lore-Background.md**](./6.1-GDD-Lore-Background.md): Outlines the foundational lore, history of humanity's journey, "The Pillar," the "Opulence" system, and core cultural traits. (Reviewed: v1.6, 2025-08-01)
* [**6.2-GDD-Lore-Player-Onboarding.md**](./6.2-GDD-Lore-Player-Onboarding.md): Details the "First Contract" tutorial scenario for introducing players to core mechanics and the setting. (Reviewed: v1.2, 2025-08-01)

### 7. Assets and Style

* [**7-GDD-Assets-Style.md**](./7-GDD-Assets-Style.md): Defines the core "Neo-Retro 3D" style for all game assets, including models, environments, UI, and audio. (New: v1.0, 2025-08-01)
* [**7.1-GDD-Assets-Ship-Design.md**](./7.1-GDD-Assets-Ship-Design.md): Defines the core design principles for ships, including "Pragmatic Aesthetics" and the "Lancer" combat doctrine. (Reviewed: v1.4, 2025-08-01)

### Meta & Legal

* [**LICENSE**](./LICENSE): Contains the licensing information for this documentation project.
* [**AI-ACKNOWLEDGEMENT.md**](./AI-ACKNOWLEDGEMENT.md): Details regarding the use of AI assistance during the generation and refinement of this documentation.
* [**AI-PRIMING.md**](./AI-PRIMING.md): Defines the standard priming prompt to be used when initiating a new chat session with an AI assistant. (Reviewed: v1.1, 2025-08-01)

## All pages in a single file

* [**GDD-COMBINED-TEXT.md**](./GDD-COMBINED-TEXT.md): Contains a consolidated version of all documentation pages.

---

This documentation is a living project and currently under active development.
