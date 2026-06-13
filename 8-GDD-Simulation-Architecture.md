<!--
PROJECT: GDTLancer
MODULE: 8-GDD-Simulation-Architecture.md
STATUS: [Level 2 - Implementation]
TRUTH_LINK: TRUTH_GDD-REVISION-LEDGER.md § REV_001
LOG_REF: 2026-06-13 22:15:00
-->

# GDTLancer - Simulation Architecture

**Version:** 2.6
**Date:** 2026-06-13
**Related Documents:** [0.1-GDD-Main.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/0.1-GDD-Main.md) (v4.11), [1-GDD-Core-Mechanics.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/1-GDD-Core-Mechanics.md) (v5.6), [1.1-GDD-Core-Systems.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/1.1-GDD-Core-Systems.md) (v5.7), [1.2-GDD-Core-Cellular-Automata.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/1.2-GDD-Core-Cellular-Automata.md) (v2.1), [3-GDD-Architecture-Coding.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/3-GDD-Architecture-Coding.md) (v3.3), [7.1-GDD-Assets-Ship-Design.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/7.1-GDD-Assets-Ship-Design.md) (v4.2)

---

## 1. Overview

This document defines GDTLancer's simulation as a **layered, data-driven architecture**. The purpose is to cleanly isolate the **Physical world** from the **Systemic logic** and **Cognitive agents**, enabling each layer to be tuned, tested, and extended independently.

The simulation operates on four distinct layers, processed sequentially each tick:

1. **The World** — Static, handcrafted physical foundation. Changes only between content updates.
2. **The Grid** — Dynamic systemic state driven by Cellular Automata and tick-based rules. Reacts to Agent activity and World constraints.
3. **The Agents** — Cognitive entities (player and NPCs) that read the Grid, maintain internal knowledge, and act upon the world.
4. **The Chronicle** — An output layer that captures events, chains causality, and translates raw simulation data into player-facing narrative.

This separation allows difficulty tuning (e.g., harsher environmental hazards, faster resource depletion) by adjusting World or Grid parameters without touching Agent AI logic.

### 1.1. Relationship to Existing Architecture

This document provides the **conceptual simulation model** that the game systems and save state implement. It represents the design intent mapping of how the environment, economic layers, characters, and narrative chronicle interact dynamically.

### 1.2. Relationship to Cellular Automata

The Grid layer is the primary consumer of the Cellular Automata (CA) systems. The CA networks (strategic maps, supply and demand flows, social networks) are the systemic engines driving Grid transitions each simulation tick.

### 1.3. Governing Invariants (Conservation Axioms)

The simulation is governed by conservation laws that ensure internal consistency and prevent unbounded growth or creation-from-nothing. These axioms act as strict constraints on system design:

* **Axiom 1 — Conservation of Matter:** The total extractable matter in the universe is finite, fixed at world initialization, and distributed across the resource maps. Matter cycle is closed: extraction → refinement → use → degradation → diffuse potential → re-extraction. Organized matter (wrecks, debris) degrades back into raw potential.
* **Axiom 2 — Conservation of Population:** The universe is seeded with a fixed initial human population. Changes (immigration, emigration, death) are driven by economic and resource conditions, not spawn probability. Hostiles (drones, fauna) are tracked via global population integrals capped by carrying capacity.
* **Axiom 3 — Material Basis of Value:** Economic value is represented qualitatively, mapping character wealth to social and economic status: player wealth is tracked via three qualitative Wealth Tiers (Broke, Comfortable, Wealthy) with associated tracks, while NPCs use status tags (POOR, ADEQUATE, RICH) for accounting. Transactions settle via ledger entries that consume physical materials and energy, not virtual bank balances.
* **Axiom 4 — Thermodynamic Arrow:** Reversing entropy (repairs, construction) requires both physical materials and energy inputs. Structures and ships passively degrade over time without active maintenance. Primary energy sources (stellar radiation, nuclear fuels) act as the external gradient driving economic activity.
* **Axiom 5 — Causality and Information Locality:** Effects have traceable causes. Information propagates locally (no instant global knowledge), and internal knowledge snapshots decay and become stale without active maintenance.

> [!NOTE]
> **Qualitative Runtime Constraint:** These axioms serve as core design intent constraints. The live runtime enforces these qualitatively via tag propagation and bounded-occurrence loops (e.g., tag transitions, cargo tags) rather than real-time numeric stockpile bookkeeping ([REV_001](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/TRUTH_GDD-REVISION-LEDGER.md#L28)).

---

## 2. Layer 1: The World (Physical Foundation)

The World layer contains static, handcrafted data defining the physical constraints of the universe. This data is read-only at runtime and changes only via content updates.

* **Topology Map:** Defines the spatial layout and connection network between sectors. Structurally modeled as a nested 4-tier celestial hierarchy (Stellar Systems → Planets → Moons → Deep Space POIs) designed as a flat graph for gameplay simplicity ([REV_005](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/TRUTH_GDD-REVISION-LEDGER.md#L72)).
* **Environmental Hazard Map:** Defines cosmic radiation levels, thermal background temperatures (which determine the heat dissipation ceiling for ship radiators), and gravity well thrust penalties near planets.
* **Resource Potential Map:** Defines where raw mineral deposits and propellant feedstocks exist. These values are mutated at runtime as extraction depletes them and degradation returns diffuse materials to the local sector.

---

## 3. Layer 2: The Grid (Systemic CA Layers)

The Grid contains the dynamic simulation state updated each World Event Tick by Cellular Automata and agent activity.

* **Resource Availability:** Stockpile levels of propellant, consumables, and energy at locations, depleted by agent consumption and replenished by extraction or supply runs.
* **Power Load:** Balance of energy generation versus demand at persistent locations, triggering brownouts and service cost penalties when demand exceeds output capacity.
* **Dominion & Security:** Maps of faction influence, security levels, and pirate activity, determining patrol frequency and encounter rates.
* **Market Pressure:** Derived price adjustments for trade items and services based on physical supply/demand imbalances relative to population density.
* **Maintenance Pressure (Entropy):** Wear-and-tear rates on assets driven by environmental harshness (radiation, thermal extremes), necessitating physical repair materials.
* **Inventory Flow:** Physical inventories of cargo commodities stored at locations that agents buy and sell, directly reflecting local resource depletion.
* **Wreck & Debris Lifecycle:** Persistence of disabled ships as salvageable wrecks that slowly degrade and return their mass to the local Resource Potential Map.

---

## 4. Layer 3: The Agents (Cognitive & Social Data)

Agents are active entities (both player and NPCs) that perceive the Grid, maintain internal states, and select goals.

* **Spatial & Physical State:** The agent's current sector location, hull integrity, active resource reserves (propellant, consumables, energy), qualitative wealth tier/progress track, fleet assets, and current ship thermal load.
* **Operational Attributes:** Skill modifiers that determine success probability and complication risk for piloting, combat, and trading Narrative Actions.
* **Knowledge Snapshot:** A personal, potentially outdated copy of Grid data (commodity prices, security, influence) representing the agent's belief state, which decays over time.
* **Social Graph:** Standing levels with factions, individual character affinities, and specific sentiment tags (e.g., Grudges, Favors) that drive NPC goals and player interactions.
* **Goal Priority Queue:** Ranked objectives dictated by personality archetypes, following a default hierarchy of: Survival → Personal Goals → Faction Duty → Opportunism.
* **Narrative Inventory:** A memory buffer of witnessed or received event packets that agents can trade or relay.

---

## 5. Layer 4: The Chronicle (Output Layer)

The Chronicle translates raw simulation events into player-facing narrative, acting as the narrative wrapper of the sandbox.

* **Event Buffer:** Logged records of actor activities, targets, locations, and outcomes (success, failure, critical states) generated each tick.
* **Causality Chain:** Logical links connecting effects to prior events (e.g., linking price spikes to freighter losses) to calculate significance scores and surface meaningful news.
* **Rumor Engine:** Translation system that converts raw event logs into player-facing rumors and news items, tag-gated by source reliability and proximity.
* **Knowledge Decay:** Algorithmic degradation that introduces noise and inaccuracy to an agent's knowledge snapshot for sectors they have not visited recently.

---

## 6. Bridge Systems

Cross-cutting mechanics that connect World physical constraints to Agent behaviors through Grid state changes.

* **Heat Sink System:** Calculates net heat change each tick based on thermal energy generated by active modules (propulsion, tools) versus maximum environment heat dissipation. Overheating triggers efficiency penalties, system shutdowns, or hull damage.
* **Entropy System:** Applies environmental wear to active and docked ships based on local entropy rates. Reversing degradation requires docked maintenance consuming physical materials from station stockpiles and local power grid energy.
* **Agent Knowledge Refresh:** Automatically updates an agent's knowledge snapshot for their current sector, while decaying knowledge of distant sectors by applying stale-data noise.

---

## 7. Simulation Tick Sequence

Each World Event Tick processes the simulation layers sequentially to maintain data consistency:

```
WORLD EVENT TICK SEQUENCE
═════════════════════════

1. WORLD LAYER (Read-Only Reference)
   └── Static data maps are available for lookups.

2. GRID LAYER (CA Processing)
   └── Run extraction → run supply/demand → update faction strategic maps →
       calculate power loads → derive market prices → progress wreck decay lifecycles.

3. BRIDGE SYSTEMS (Cross-Layer Processing)
   └── Run Heat Sink logic → apply passive Entropy wear → decay distant Agent knowledge.

4. AGENT LAYER (Decision & Action)
   └── NPC goal prioritizations and action choices resolve; Player actions execute.

5. CHRONICLE LAYER (Event Capture & News)
   └── Buffer tick events → trace causality chains → run Rumor Engine formatting →
       distribute rumors to agent memories based on proximity.
```

---

## 8. Difficulty Tuning via Layer Levers

Game difficulty can be adjusted globally by altering parameters at specific layers without impacting other systems:

| Tuning lever | Affected Layer | Effect |
|:---|:---|:---|
| **Harsher Environment** | World | Increases radiation, heat, and gravity penalty, restricting route planning. |
| **Resource Scarcity** | World / Grid | Lowers starting raw materials, increases price volatility and faction friction. |
| **Faster Entropy** | Grid / Bridge | Increases environmental ship wear and repair material costs. |
| **Information Fog** | Agent / Chronicle | Accelerates knowledge decay, increasing trade and navigation risks. |
| **Social Volatility** | Agent | Amplifies standing changes, making NPC relations shift rapidly. |
| **Hostile Density** | Global | Increases hostile carrying capacities, resulting in more frequent threats. |

---

## 9. Phase 1 Implementation Scope

In Phase 1, the simulation operates on lightweight stubs consistent with the core vertical slice:

* **World:** 6–9 handcrafted sectors, static hazard values, and a simplified static total matter budget.
* **Grid:** Stockpiles increment/decrement directly based on transactions, prices are modified by simple linear deltas, and power/maintenance are static constants. Wrecks persist indefinitely until salvaged.
* **Agents:** Player wealth tiers and tracks are fully active; NPCs use simplified status tags, basic goal queues, and actual Grid data mixed with random noise to simulate knowledge.
* **Chronicle:** Events are buffered and formatted into simple templated text. Causality chain tracking is deferred.
* **Bridge Systems:** Heat is a binary check, environmental entropy is minimal, and repairs consume fixed material quantities. Ship quirks and component wear tracking are deferred.
