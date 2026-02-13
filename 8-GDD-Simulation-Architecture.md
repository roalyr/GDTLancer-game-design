# GDTLancer - Simulation Architecture

**Version:** 2.0
**Date:** February 13, 2026
**Related Documents:** `0.1-GDD-Main.md` (v4.0), `1-GDD-Core-Mechanics.md` (v5.0), `1.1-GDD-Core-Systems.md` (v5.0), `1.2-GDD-Core-Cellular-Automata.md` (v2.0), `3-GDD-Architecture-Coding.md` (v3.0), `7.1-GDD-Assets-Ship-Design.md` (v4.0)

---

## 1. Overview

This document defines GDTLancer's simulation as a **layered, data-driven architecture**. The purpose is to cleanly isolate the **Physical world** from the **Systemic logic** and **Cognitive agents**, enabling each layer to be tuned, tested, and extended independently.

The simulation operates on four distinct layers, processed sequentially each tick:

1. **The World** — Static, handcrafted physical foundation. Changes only between content updates.
2. **The Grid** — Dynamic systemic state driven by Cellular Automata and tick-based rules. Reacts to Agent activity and World constraints.
3. **The Agents** — Cognitive entities (player and NPCs) that read the Grid, maintain internal knowledge, and act upon the world.
4. **The Chronicle** — An output layer that captures events, chains causality, and translates raw simulation data into player-facing narrative.

This separation allows difficulty tuning (e.g., harsher environmental hazards, faster resource depletion) by adjusting World or Grid parameters **without touching Agent AI logic**.

### 1.1. Relationship to Existing Architecture

This document does **not** replace the existing stateless systems architecture defined in `3-GDD-Architecture-Coding.md`. Rather, it provides a **conceptual simulation model** that the existing `GameState`, `EventBus`, and stateless systems implement. Each data parameter defined below maps to a concrete field in `GameState` or a stateless system API.

### 1.2. Relationship to Cellular Automata

The Grid layer is the primary consumer of the CA implementations defined in `1.2-GDD-Core-Cellular-Automata.md`. The CA systems (Strategic Map, Supply & Demand Flow, Influence Network, etc.) are the **engines** that drive Grid state transitions each World Event Tick.

### 1.3. Governing Invariants (Conservation Axioms)

The simulation is governed by conservation laws that ensure internal consistency and prevent unbounded growth or creation-from-nothing. Every system design must satisfy these axioms. They are not gameplay features — they are **constraints on what systems are allowed to do**. Any proposed mechanic that violates an axiom must be redesigned until it complies.

**Axiom 1 — Conservation of Matter.** The total extractable matter in the universe is finite, fixed at world initialization, and distributed across the Resource Potential Map (Section 2.3). Matter can be extracted, refined, transferred, degraded, or lost — but never created. Station restocking draws from local extraction or supply chain imports, not from an external reservoir. When organized matter reaches a fully degraded state (debris, wreckage, trace elements), it returns to the Resource Potential Map as diffuse, low-grade resource potential. The matter cycle is closed: extraction → refinement → use → degradation → diffuse potential → (re-)extraction.

**Axiom 2 — Conservation of Population.** The universe is seeded with a fixed initial population of human agents. Population changes (death, arrival, departure) are driven by integral economic and resource conditions across the world — not by spawn probability. Non-human hostiles (feral drones, alien fauna) are tracked as **global population integrals** bounded by a carrying capacity derived from sector conditions — not as individual CA tokens. No entity appears from vacuum; every agent present is accounted for by the population budget.

**Axiom 3 — Material Basis of Value.** Economic value is denominated in physical commodities — standardized refined metals and rare materials ("Cash"). There is no fiat currency; the total monetary mass equals the total physical resource mass allocated as medium of exchange. In-faction transactions use **Loyalty Points (LP)** — a finite, contribution-tracked internal credit system per faction. Repairs, services, and construction consume physical materials and energy, not abstract numbers.

**Axiom 4 — Thermodynamic Arrow.** In the absence of energy input, all organized structures degrade toward disorder. Entropy is monotonically non-decreasing in closed subsystems. Reversing entropy (repair, construction, refinement) requires both physical material **and** energy input. Primary energy sources (stellar radiation, nuclear fuel reserves) are treated as inexhaustible within the game's timescale — they are the external heat bath that prevents total heat death and provides the energy gradient driving all economic activity.

**Axiom 5 — Causality and Information Locality.** Effects have traceable causes (Chronicle, Section 5). Information propagates at finite speed (tick-based, proximity-based). Knowledge degrades without active maintenance — survey, exploration, and communication have real costs in time, energy, and resources. No agent has access to information it has not observed, been told, or inferred.

---

## 2. Layer 1: The World (Physical Foundation)

The World layer contains **static, handcrafted data** that defines the physical constraints of the game universe. This data is read-only at runtime and changes only via content updates or new game initialization. It is the "terrain" upon which the simulation operates.

### 2.1. Topology Map

The spatial layout of the game universe.

| Parameter | Type | Description | Source |
|-----------|------|-------------|--------|
| `sector_id` | `String` | Unique identifier for each sector/location. | Handcrafted |
| `connections` | `Array<String>` | List of `sector_id`s reachable from this sector (jump-gates, transit routes). | Handcrafted |
| `station_ids` | `Array<String>` | List of station/habitat identifiers present in this sector. | Handcrafted |
| `sector_type` | `String` | Classification: `"hub"`, `"frontier"`, `"deep_space"`, `"hazard_zone"`. | Handcrafted |

### 2.2. Environmental Hazard Map

Persistent physical conditions that impose operational costs on any entity present. These create **permanent friction** that shapes route planning, ship loadout choices, and economic geography.

| Parameter | Type | Description | Source |
|-----------|------|-------------|--------|
| `radiation_level` | `float` | Ambient cosmic/solar radiation intensity (0.0 = safe, 1.0 = lethal). Interacts with hull `radiation_shielding_factor` (`7.1-GDD-Assets-Ship-Design.md`, Radiation Protection). | Handcrafted |
| `thermal_background_k` | `float` | Ambient temperature in Kelvin. Determines the **Heat Dissipation Ceiling** — the maximum rate at which any entity can radiate waste heat. Near-star sectors have high values (poor dissipation); deep-space sectors have low values (excellent dissipation). Interacts with cooling systems (`7.1-GDD-Assets-Ship-Design.md`, Cooling Systems). | Handcrafted |
| `gravity_well_penalty` | `float` | A thrust/propellant multiplier for departure and station-keeping near planetary bodies or stations (1.0 = no penalty, 2.0 = double propellant cost). Affects agent `propellant_reserves`. | Handcrafted |

### 2.3. Resource Potential Map (Finite Matter Budget)

The universe's total matter budget. This map defines **where** extractable resources exist and at what density. Unlike other World data, Resource Potential values are **mutable at runtime** — extraction depletes them, and degradation of organized matter (wrecks, debris, abandoned stockpiles) slowly returns diffuse material to the local potential. This is the only World-layer data that changes at runtime, enforcing **Axiom 1** (Conservation of Matter).

The sum of all `mineral_density` and `propellant_sources` values across all sectors, plus all matter currently in refined/manufactured form (ships, equipment, cargo, Cash, station stockpiles), equals a **constant total** initialized at world creation.

| Parameter | Type | Description | Source |
|-----------|------|-------------|--------|
| `mineral_density` | `float` | Extractable mineral potential (0.0–1.0). Depleted by mining; replenished slowly by matter degradation (wrecks → debris → diffuse minerals). | Handcrafted seed; mutated by extraction and degradation |
| `energy_potential` | `float` | Solar/thermal energy availability (0.0–1.0). Effectively inexhaustible within game timescale (**Axiom 4**). Affects solar panel output and local energy costs. | Derived from `thermal_background_k` and star proximity |
| `propellant_sources` | `float` | Refinable propellant feedstock (ice, hydrogen, etc.) (0.0–1.0). Depleted by extraction; replenished slowly by outgassing and matter degradation. | Handcrafted seed; mutated by extraction and degradation |

---

## 3. Layer 2: The Grid (Systemic CA Layers)

The Grid is the **dynamic simulation state**. It is updated each **World Event Tick** by CA rules and Agent activity. Grid data is the primary input for Agent decision-making and the Chronicle's narrative generation. All Grid data lives in `GameState` and is manipulated by stateless systems.

### 3.1. Resource Availability

Real-time levels of consumable resources at each location. Depleted by Agent activity; replenished **only** by extraction from the Resource Potential Map (Section 2.3) or import via CA-driven supply chains (**Axiom 1**). Extraction reduces the corresponding World-layer potential value.

| Parameter | Type | Description | Updated By |
|-----------|------|-------------|------------|
| `propellant_supply` | `float` | Current propellant stock available for purchase at this location (0.0 = depleted, 1.0 = fully stocked). | Extraction from `propellant_sources`, Agent trade actions |
| `consumables_supply` | `float` | Current life-support consumables available (food, air, water). Depleted by docked agents, replenished by extraction and supply runs. | Extraction, Agent consumption |
| `energy_supply` | `float` | Current available energy at this station/location grid. Energy is derived from inexhaustible sources (**Axiom 4**) but limited by local infrastructure capacity. | Power Load rules, Agent activity |

### 3.2. Power Load Layer

A real-time balance of energy generation versus systemic draw at persistent locations (stations, habitats).

| Parameter | Type | Description | Updated By |
|-----------|------|-------------|------------|
| `station_power_output` | `float` | Total energy generation capacity of the station/habitat. | Static per station (World data) |
| `station_power_draw` | `float` | Current aggregate power demand from docked agents, active systems, and services. | Agent docking/undocking, service usage |
| `power_load_ratio` | `float` | Derived: `station_power_draw / station_power_output`. When > 1.0, triggers **brownout effects**: increased service costs, slower repairs, reduced market availability. | Derived each tick |

### 3.3. Dominion & Stability

CA-driven maps of Faction influence and security levels. These determine encounter frequency (drawn from global hostile population integrals, **Axiom 2**), contract availability, and NPC behavior.

| Parameter | Type | Description | Updated By |
|-----------|------|-------------|------------|
| `faction_influence` | `Dictionary<String, float>` | Map of `faction_id` → influence score (0.0–1.0) for this sector. Highest score = dominant faction. | Strategic Map CA, Agent faction actions |
| `security_level` | `float` | Aggregate safety rating (0.0 = lawless, 1.0 = heavily patrolled). Determines hostile encounter frequency (drawn from global non-human hostile population integral) and patrol presence. | Derived from dominant faction influence + pirate activity |
| `pirate_activity` | `float` | Current level of pirate/hostile presence (0.0–1.0). Increases when security drops; decreases when agents complete bounty/patrol goals. | Strategic Map CA, Agent combat actions |

### 3.4. Market Pressure

Derived economic data calculating local price adjustments based on physical supply/demand imbalances.

| Parameter | Type | Description | Updated By |
|-----------|------|-------------|------------|
| `commodity_price_deltas` | `Dictionary<String, float>` | Map of `commodity_id` → price multiplier relative to `base_value`. Derived from local `Resource Availability` vs. local population/demand. E.g., `{"scrap_metal": 0.8, "refined_ore": 1.4}`. | Supply & Demand CA each tick |
| `population_density` | `float` | Relative population at this location (0.0–1.0). Drives demand side of Market Pressure. | Derived from docked Persistent Agents + station base population |
| `service_cost_modifier` | `float` | Multiplier applied to repair, refueling, and maintenance costs at this location. Affected by `power_load_ratio`, `consumables_supply`, and `security_level`. | Derived each tick |

### 3.5. Maintenance Pressure (Entropy Layer)

A decay layer representing systemic wear-and-tear on persistent assets (**Axiom 4**). Creates ongoing resource demand via environmental hull degradation. Reversing this degradation (repair) requires physical materials drawn from station stockpiles plus energy — not abstract currency.

| Parameter | Type | Description | Updated By |
|-----------|------|-------------|------------|
| `local_entropy_rate` | `float` | A location-specific modifier to how fast assets degrade. Harsh environments (high radiation, thermal extremes) increase this. Stations with good maintenance facilities reduce it. | Derived from World hazards + station services |
| `maintenance_cost_modifier` | `float` | Multiplier applied to the base degradation rate of assets at this location. Higher entropy = faster wear. | Derived from `local_entropy_rate` |
| `repair_material_cost` | `float` | Physical material units consumed per unit of hull integrity restored. Drawn from local `commodity_stockpiles`. | Derived from ship class + damage severity |

### 3.6. Inventory Flow

Tracks the physical location of commodity stockpiles. Market Pressure (3.4) reacts to the **delta** between actual physical stock and local demand, not abstract values. All matter in this layer is conserved (**Axiom 1**).

| Parameter | Type | Description | Updated By |
|-----------|------|-------------|------------|
| `commodity_stockpiles` | `Dictionary<String, int>` | Map of `commodity_id` → physical unit count at this location. This is the **actual inventory** that agents buy from and sell to. | Agent trade actions, local extraction from Resource Potential Map |
| `stockpile_capacity` | `int` | Maximum total commodity units this location can store. | Static per station (World data) |
| `extraction_rate` | `Dictionary<String, float>` | Map of `commodity_id` → units extracted per World Event Tick from the local Resource Potential Map. Extraction **depletes** the corresponding World-layer value. When potential reaches 0.0, extraction halts. | Derived from `mineral_density`/`propellant_sources` × station infrastructure |

### 3.7. Wreck & Debris Lifecycle

When a ship is disabled (hull → 0), it persists in the sector as a **salvageable wreck** containing its cargo and equipment. Wrecks are subject to entropy degradation (**Axiom 4**). This enforces the matter cycle: organized matter → wreck → debris → diffuse resource potential.

| Parameter | Type | Description | Updated By |
|-----------|------|-------------|------------|
| `wreck_integrity` | `float` | Structural condition of the wreck (1.0 = freshly disabled, 0.0 = fully degraded). | Entropy System (6.2) each tick |
| `wreck_inventory` | `Dictionary` | Cargo and equipment aboard at time of disablement. Salvageable while `wreck_integrity` > 0. | Frozen at disablement; depleted by salvage actions |
| `debris_return_rate` | `float` | When `wreck_integrity` reaches 0.0, remaining material mass is added back to the local `mineral_density` in the Resource Potential Map as diffuse low-grade potential. | Entropy System |

---

## 4. Layer 3: The Agents (Cognitive & Social Data)

Agents are cognitive entities — both the player and all NPCs — that perceive the Grid, maintain internal state, and take actions. Agent data is the domain of the `Character System`, `Agent System`, and `Asset System` as defined in `1.1-GDD-Core-Systems.md`.

The universe is seeded with a **fixed initial population** of human agents (**Axiom 2**). Population changes are driven by integral economic conditions (resource depletion → emigration; prosperity → immigration), not spawn dice. Non-human hostiles (feral drones, alien fauna) are tracked as global population integrals bounded by carrying capacity, not individual CA tokens.

### 4.1. Spatial & Physical State

The agent's current physical situation in the world.

| Parameter | Type | Description | System Owner |
|-----------|------|-------------|--------------|
| `current_sector_id` | `String` | The sector/location where the agent currently resides. | Agent System |
| `hull_integrity` | `float` | Current structural health of the agent's active ship (0.0 = disabled). | Asset System |
| `propellant_reserves` | `float` | Current propellant in the agent's ship tanks. Consumed by movement; affected by `gravity_well_penalty`. | Asset System (via `7.1-GDD-Assets-Ship-Design.md`, Propellant Storage) |
| `energy_reserves` | `float` | Current stored energy (battery/supercapacitor charge). Consumed by active systems. | Asset System (via `7.1-GDD-Assets-Ship-Design.md`, Energy Storage) |
| `consumables_reserves` | `float` | Current life-support consumables aboard. Depleted over time; replenished at stations. | Asset System (via `7.1-GDD-Assets-Ship-Design.md`, Life Support) |
| `cash_reserves` | `float` | Physical commodity money (refined metals) carried or stored. The agent's liquid wealth (**Axiom 3**). | Character System |
| `fleet_ships` | `Array<String>` | Ship IDs owned by this agent beyond their active ship. Docked ships incur entropy and docking costs. Agents can sell, gift, or assign ships to other agents. | Asset System |
| `current_heat_level` | `float` | Current thermal load on the ship. Accumulates from high-energy actions; dissipates based on cooling systems and `thermal_background_k`. | Asset System (via `7.1-GDD-Assets-Ship-Design.md`, Cooling Systems) |

### 4.2. Operational Capacity (Attributes)

Skill modifiers that determine success probability and complication risk for Narrative Actions. Only skills with active Phase 1 use are included — no placeholder stubs.

| Parameter | Type | Description | System Owner |
|-----------|------|-------------|--------------|
| `skill_piloting` | `int` | Modifies piloting-related Action Checks. | Character System |
| `skill_combat` | `int` | Modifies combat-related Action Checks. | Character System |
| `skill_trading` | `int` | Modifies trading and social Action Checks. | Character System |

### 4.3. Maintenance State (Deferred)

Ship Quirks, component wear tracking, and derived performance modifiers are **deferred** to a later development phase. The entropy system (`8-GDD` Section 3.5) provides the data foundation; the Maintenance State will consume it when implemented.

**Future parameters:** `ship_quirks`, `component_wear`, `propellant_efficiency_modifier`, `power_output_modifier`.

### 4.4. Knowledge Snapshot (Internal Map)

Each agent maintains a **personal, potentially outdated** copy of Grid data. This is the agent's "belief state" — what they *think* the world looks like. This is critical for NPC decision-making and for the player's information asymmetry.

| Parameter | Type | Description | System Owner |
|-----------|------|-------------|--------------|
| `known_grid_state` | `Dictionary` | A snapshot of Grid data (commodity prices, security levels, faction influence) as the agent last observed it. Keyed by `sector_id`. | Agent System |
| `knowledge_timestamps` | `Dictionary<String, int>` | Map of `sector_id` → the `tick_count` when this agent's knowledge of that sector was last updated. Used for Knowledge Decay. | Agent System |
| `knowledge_decay_rate` | `float` | A per-agent parameter controlling how fast their internal map becomes unreliable. Higher values = faster decay, forcing more active information gathering. | Character System (derived from skills/traits) |

**Knowledge Update Rules:**
- **Proximity:** An agent's `known_grid_state` for their `current_sector_id` is automatically refreshed to match actual Grid data each tick.
- **Comm-Link:** Agents can exchange knowledge snapshots during social interactions, updating each other's internal maps (but with potential Trust & Deception filtering — see `1.2-GDD-Core-Cellular-Automata.md`, CA #5).
- **Rumor Engine:** Agents can acquire partial, potentially inaccurate knowledge via the Chronicle's Rumor Engine (Section 5.3).

### 4.5. Social Graph

Relationship data that drives NPC behavior and player narrative.

| Parameter | Type | Description | System Owner |
|-----------|------|-------------|--------------|
| `faction_standings` | `Dictionary<String, float>` | Map of `faction_id` → standing score (-1.0 hostile to 1.0 allied). | Character System |
| `character_standings` | `Dictionary<int, float>` | Map of agent `uid` → personal affinity score (-1.0 to 1.0). Tracks grudges and favors at the individual level. | Character System |
| `sentiment_tags` | `Dictionary<int, Array<String>>` | Map of agent `uid` → list of sentiment qualifiers (e.g., `["owes_favor", "witnessed_betrayal", "trade_partner"]`). Provides richer context than a single float. | Agent System |

### 4.6. Goal Priority Queue

A ranked list of the agent's current objectives that dictates how they respond to Grid data and events.

| Parameter | Type | Description | System Owner |
|-----------|------|-------------|--------------|
| `goal_queue` | `Array<Dictionary>` | Ordered list of goal objects. Each goal has: `goal_id` (String), `priority` (int), `progress` (float 0.0–1.0), `target_data` (Dictionary). Higher priority goals are pursued first. | Agent System / Character System |
| `goal_archetype` | `String` | The agent's dominant behavioral archetype derived from personality traits: `"survival_first"`, `"profit_seeker"`, `"faction_loyalist"`, `"thrill_seeker"`. Determines how goals are prioritized when conflicts arise. | Derived from `personality_traits` |

**Priority Hierarchy (Default):**
1. **Survival** — Maintain hull integrity, propellant, consumables above critical thresholds.
2. **Personal Goal** — Pursue the agent's current primary objective (from `goal_queue`).
3. **Faction Duty** — Respond to faction-level directives.
4. **Opportunism** — React to local Grid conditions for profit or advantage.

### 4.7. Narrative Inventory

A queue of witnessed or received events that the agent can trade, relay, or act upon.

| Parameter | Type | Description | System Owner |
|-----------|------|-------------|--------------|
| `event_memory` | `Array<Dictionary>` | List of Event Packets (see Section 5.1) this agent has witnessed or received. Each entry includes the packet data plus a `trust_level` and `received_tick`. | Agent System |
| `max_memory_slots` | `int` | Maximum number of event packets the agent retains. Oldest/lowest-trust entries are discarded when full. | Character System (derived from skills) |

---

## 5. Layer 4: The Chronicle (Output Layer)

The Chronicle captures, stores, and translates simulation events into player-facing narrative. It is the bridge between the raw simulation and the player's experience.

### 5.1. Event Buffer

Raw event data generated during each simulation tick.

| Parameter | Type | Description | Generated By |
|-----------|------|-------------|--------------|
| `actor_uid` | `int` | The agent who performed the action. | All systems |
| `action_id` | `String` | The type of action performed (e.g., `"trade_sell"`, `"combat_disable"`, `"dock"`, `"undock"`). | All systems |
| `target_uid` | `int` or `null` | The agent or entity the action was performed upon (if applicable). | All systems |
| `target_sector_id` | `String` | The sector where the action occurred. | All systems |
| `tick_count` | `int` | The World Event Tick when this event occurred. | Time System |
| `outcome` | `String` | Result classification: `"critical_success"`, `"success"`, `"failure"`, `"critical_failure"`. | CoreMechanicsAPI |
| `metadata` | `Dictionary` | Action-specific data (e.g., `{"commodity": "scrap_metal", "quantity": 50, "price": 120}`). | Originating system |

### 5.2. Causality Chain

Metadata within Event Packets that links effects to their causes, enabling the Rumor Engine to produce **actionable intelligence** rather than disconnected flavor text.

| Parameter | Type | Description | Generated By |
|-----------|------|-------------|--------------|
| `cause_event_id` | `String` or `null` | Reference to a prior Event Packet that directly caused this event. E.g., a `"price_spike"` event references the `"freighter_destroyed"` event that triggered it. | Originating system |
| `causal_chain_depth` | `int` | How many links back this event's causal chain extends. Used to prioritize high-impact, deeply-rooted events for narrative generation. | Derived |
| `significance_score` | `float` | A heuristic score (0.0–1.0) indicating how "newsworthy" this event is. Derived from causal chain depth, involved agent importance (Persistent vs. Temporary), and economic impact. | Derived |

### 5.3. Rumor Engine

A translation layer that converts Event Buffer packets into player-facing text based on the player's current knowledge state.

| Parameter | Type | Description | Consumer |
|-----------|------|-------------|----------|
| `rumor_text` | `String` | The generated player-facing text describing the event in narrative terms. | UI: Bulletin Boards, NPC Dialogue |
| `trust_tag` | `String` | Reliability classification: `"verified_intel"`, `"market_rumor"`, `"unconfirmed_hearsay"`. Derived from source agent's `character_standings`, number of relay hops, and Trust & Deception CA (`1.2-GDD-Core-Cellular-Automata.md`, CA #5). | UI: Rumor Mill |
| `relevance_filter` | `Dictionary` | Conditions under which this rumor should be shown to the player: `{"sector_ids": [...], "faction_ids": [...], "min_significance": 0.3}`. | UI filtering logic |

### 5.4. Knowledge Decay

A parameter that reduces the accuracy of an agent's Knowledge Snapshot (Section 4.4) over time, forcing active participation in the Rumor Engine.

| Parameter | Type | Description | Updated By |
|-----------|------|-------------|------------|
| `decay_function` | `String` | The mathematical model for decay: `"linear"` or `"exponential"`. | Configurable per difficulty |
| `decay_threshold_ticks` | `int` | Number of ticks after which knowledge begins to decay. Below this, knowledge is considered "fresh". | Configurable |
| `stale_data_penalty` | `float` | The maximum inaccuracy introduced to an agent's `known_grid_state` when knowledge is fully decayed. E.g., a commodity price known at 100 Cash with a 0.3 penalty could be reported as anywhere from 70–130. | Derived from `knowledge_decay_rate` × elapsed ticks |

---

## 6. Bridge Systems

These are cross-cutting simulation mechanics that span multiple layers, connecting World constraints to Agent behavior through Grid state.

### 6.1. Heat Sink System

Connects World environmental data to Agent physical state via a continuous heat accumulation/dissipation model.

**Inputs:**
- **World:** `thermal_background_k` (determines maximum dissipation rate ceiling).
- **Agent:** Cooling system stats (`heat_dissipation_mw` from `7.1-GDD-Assets-Ship-Design.md`, Cooling Systems).
- **Agent:** Activity level (engines, combat tools, industrial tools all generate heat).

**Process (each tick):**
1. Calculate `heat_generated` from all active agent systems (engines, tools, power plant waste heat).
2. Calculate `max_dissipation` = `min(cooling_system_capacity, environment_dissipation_ceiling)`.
   - `environment_dissipation_ceiling` is derived from `thermal_background_k`: lower ambient temperature → higher ceiling.
3. Calculate `net_heat_change` = `heat_generated - max_dissipation`.
4. Update Agent's `current_heat_level += net_heat_change`.

**Consequences:**
- `current_heat_level` > **Warning Threshold:** Performance penalties (reduced engine efficiency, weapon cooldown increase).
- `current_heat_level` > **Critical Threshold:** System shutdowns, forced cooldown period.
- `current_heat_level` > **Emergency Threshold:** Hull damage risk.

### 6.2. Entropy System

The Maintenance Pressure layer (Grid 3.5) applies passive environmental wear to persistent assets (**Axiom 4**). The world degrades ships through environmental conditions. Reversing this degradation requires physical materials + energy at a maintenance facility (**Axiom 3**).

**Process (each World Event Tick):**
1. For each Agent's active ship, apply `local_entropy_rate` from Grid as a slow degradation factor to `hull_integrity`.
2. For each Agent's docked fleet ships (`fleet_ships`), apply a reduced but non-zero entropy rate. Fleet growth is self-limiting — more ships = more aggregate degradation cost.
3. Harsh environments (high radiation, thermal extremes) increase degradation rate.
4. Stations with maintenance facilities reduce or halt degradation for docked agents.
5. When `hull_integrity` drops below thresholds, performance penalties apply (reduced speed, handling).
6. Repair consumes physical materials from station `commodity_stockpiles` (Grid 3.6) and energy. No materials available = no repair.

**Phase 1:** Entropy is a stub constant. Hull degradation from environment is minimal; combat is the primary damage source. Repair costs a fixed material amount from station stockpile.

### 6.3. Component Degradation Loop (Deferred)

Ship Quirk generation via component wear is deferred. The Entropy System (6.2) and Maintenance Pressure layer (3.5) provide the data foundation for future implementation. See Section 4.3.

### 6.4. Agent Knowledge Refresh

Connects Grid state to Agent Knowledge Snapshot.

**Process (each World Event Tick):**
1. For each Agent, refresh `known_grid_state[current_sector_id]` with actual Grid data.
2. For all other sectors in `known_grid_state`:
   - Calculate `ticks_since_update = current_tick - knowledge_timestamps[sector_id]`.
   - If `ticks_since_update > decay_threshold_ticks`: apply `stale_data_penalty` noise to stored values.
3. Discard entries where `ticks_since_update` exceeds a maximum retention threshold.

---

## 7. Simulation Tick Sequence

Each **World Event Tick** processes the layers in a defined order to ensure data consistency:

```
WORLD EVENT TICK SEQUENCE
═════════════════════════

1. WORLD LAYER (Read-Only)
   └── No processing. Static data is simply available for reference.

2. GRID LAYER (CA Processing)
   ├── 2a. Run extraction: transfer matter from Resource Potential Map
   │   to Resource Availability / commodity_stockpiles (3.1, 3.6)
   ├── 2b. Run Supply & Demand CA → update Resource Availability (3.1)
   ├── 2c. Run Strategic Map CA → update Dominion & Stability (3.3)
   ├── 2d. Calculate Power Load ratios (3.2)
   ├── 2e. Derive Market Pressure from Resource Availability + Population (3.4)
   ├── 2f. Process Wreck & Debris lifecycle (3.7): degrade wrecks,
   │   return fully degraded matter to Resource Potential Map
   └── 2g. Calculate Maintenance Pressure from World hazards (3.5)

3. BRIDGE SYSTEMS (Cross-Layer Processing)
   ├── 3a. Heat Sink System: Update all Agent heat levels (6.1)
   ├── 3b. Entropy System: Apply environmental wear to active ships
   │   and fleet ships (6.2)
   └── 3c. Knowledge Refresh: Update Agent knowledge snapshots (6.4)

4. AGENT LAYER (Decision & Action)
   ├── 4a. NPC Goal Evaluation: Each NPC reads their known_grid_state
   │   and re-evaluates goal priorities.
   ├── 4b. NPC Action Selection: Each NPC selects and executes
   │   their highest-priority feasible action.
   └── 4c. Player actions are processed as they occur (real-time).

5. CHRONICLE LAYER (Event Capture)
   ├── 5a. Collect all Event Packets generated during this tick
   │   into the Event Buffer.
   ├── 5b. Tag Causality Chains on new events.
   ├── 5c. Calculate Significance Scores.
   ├── 5d. Run Rumor Engine: Generate player-facing text for
   │   qualifying events.
   └── 5e. Distribute Event Packets to Agent Narrative Inventories
       (based on proximity and comm-links).
```

---

## 8. Difficulty Tuning via Layer Parameters

A key benefit of this architecture is that game difficulty can be adjusted by modifying parameters at specific layers without cascading changes:

| Difficulty Lever | Layer | Parameters Affected | Effect |
|-----------------|-------|---------------------|--------|
| **Harsher Environment** | World | `radiation_level`, `thermal_background_k`, `gravity_well_penalty` | Higher environmental wear, restricted route options |
| **Resource Scarcity** | World / Grid | `mineral_density`, `propellant_sources` initial values, `extraction_rate` | Finite matter depletes faster; higher prices, more competition |
| **Faster Entropy** | Grid / Bridge | `local_entropy_rate` | Faster hull degradation from environment; higher repair material costs |
| **Information Fog** | Agent / Chronicle | `knowledge_decay_rate`, `decay_threshold_ticks` | Staler data, more reliance on Rumor Engine, more risk in decision-making |
| **Social Volatility** | Agent | NPC `personality_traits` ranges | More unpredictable NPC behavior, faster-shifting alliances |
| **Hostile Density** | Global | Non-human hostile carrying capacity | More frequent combat encounters |
| **Population Pressure** | Agent | Initial population count, immigration/emigration thresholds | More/fewer competing human agents |

---

## 9. Phase 1 Implementation Scope

For Phase 1, the simulation layers are implemented as **lightweight stubs** consistent with the approach in `1.2-GDD-Core-Cellular-Automata.md`:

| Layer | Phase 1 Scope |
|-------|---------------|
| **World** | 6–9 handcrafted sectors with static `radiation_level`, `thermal_background_k`, `gravity_well_penalty`. Resource Potential Map uses simple fixed values representing a **finite total matter budget**. |
| **Grid** | Resource Availability uses simple increment/decrement per trade action, sourced from extraction (depletes Resource Potential Map). Dominion uses fixed starting values modified by player actions. Market Pressure uses static base prices with CA-driven `commodity_price_deltas` as modifiers: `price = base_value × (1.0 + price_delta)`. Power Load and Maintenance Pressure are stub constants. Wreck lifecycle is stub (wrecks persist until salvaged or despawned). |
| **Agents** | Player has full physical state tracking including `cash_reserves` and `fleet_ships`. Ships use hull+slot model (`7.1-GDD`). NPCs have simplified state: `current_sector_id`, `hull_integrity`, `cash_reserves`, basic `goal_queue` with 1–2 goals. Persistent Agents have social layer overlay (personality, interaction depth) operating independently from CA token. Knowledge Snapshot is a stub (NPCs use actual Grid data with a random noise factor). Fixed initial population of human agents (**Axiom 2**). Non-human hostiles tracked as global count with simple carrying capacity. |
| **Chronicle** | Event Buffer captures key player actions. Causality Chain is stub (no chaining, events are independent). Rumor Engine generates simple templated text from Event Packets. |
| **Bridge Systems** | Heat Sink is simplified to a binary check (overheating Y/N). Entropy System is stub (minimal environmental hull degradation). Repair consumes fixed material amount from station stockpile. Ship Quirks and Component Degradation are deferred. Knowledge Refresh is stub. |

---

## 10. Future Phase Expansions

| Phase | Additions |
|-------|-----------|
| **Phase 2** | Full CA-driven Supply & Demand with extraction-based restocking (Axiom 1). Inventory Flow with physical stockpile tracking. Power Load active simulation. Mining/Industrial module feeds into Resource Availability (depletes Resource Potential Map). Contract system overlay. Wreck & Debris lifecycle with full matter-cycle accounting. |
| **Phase 3** | Full Agent Knowledge Snapshots with proper decay. NPC Goal Priority Queue with dynamic re-evaluation. Causality Chains in Chronicle. Rumor Engine with Trust tagging. Ship Quirks and Component Degradation loop active. Population dynamics (immigration/emigration driven by economic integrals). |
| **Phase 4** | Social Graph sentiment tags. Narrative Inventory trading between agents. Full Heat Sink thermodynamic model. Maintenance Pressure with location-specific entropy rates. Loyalty Points system per faction. |
