<!--
PROJECT: GDTLancer
MODULE: 6-GDD-Lore-Narrative-Borders.md
STATUS: [Level 2 - Implementation]
TRUTH_LINK: TRUTH_GDD-REVISION-LEDGER.md § REV_001
LOG_REF: 2026-06-13 23:57:00
-->

# GDTLancer - Narrative Borders of the Simulation

**Version:** 2.2
**Date:** 2026-06-13
**Related Documents:** [6.1-GDD-Lore-Background.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/6.1-GDD-Lore-Background.md) (v2.6), [8-GDD-Simulation-Architecture.md](file:///home/roalyr/Software_archive/Games/GDTLancer-game-design/8-GDD-Simulation-Architecture.md) (v2.8)

## 1. Purpose

Defines the thematic constraints — the "borders" — within which the simulation operates. The simulation serves the narrative: it is a thematically-focused story generator, not an open-ended universe simulation. These borders ensure emergent stories are grounded in established lore.

## 2. The Core Narrative Borders

### Border 1: Preservation of Assets
* **Lore:** Scarcity of complex materials and skilled personnel → the **Preservation Convention** prizes neutralization and capture over destruction.
* **Mechanical:** Destruction = least profitable, most consequence-heavy outcome (minimal salvage, Reputation loss, negative Faction Standing). Disablement/capture = most rewarding path — disabled ships become salvageable wrecks with their full inventory (**Axiom 1**, `8-GDD` Section 3.7). NPC agents default to disabling tactics; only defined outlier groups (fanatical outlaws, rogue fauna, etc) favor destruction.

### Border 2: Pragmatic Agent Behavior
* **Lore:** Pragmatic, utilitarian culture focused on managing risk, time, and resources.
* **Mechanical:** Agent Goal System (`8-GDD` Section 4.6) uses heuristics, not randomness. Trading agents maximize profit; pirate agents minimize risk. Entropy and resource sinks apply equally to NPCs.

### Border 3: Contained Scale
* **Lore:** No common FTL travel. Focus on dense, personal dynamics within a single sector.
* **Mechanical:** World structured as discrete, high-detail sectors (World layer, `8-GDD` Section 2). Events and Chronicle prioritize local, player-relevant content.

### Border 4: A Human-Centric Universe
* **Lore:** Narrative is about humanity — colonists and explorers adapting to their sector.
* **Mechanical:** Simulation focuses on Agent interactions: trade, politics, piracy, relationships, discovery. Alien life / anomalies are rare and narratively significant — preserves their thematic weight.
