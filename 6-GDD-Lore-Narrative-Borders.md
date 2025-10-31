# GDTLancer - Narrative Borders of the Simulation

**Version:** 1.2
**Date:** October 31, 2025
**Related Documents:** 0.1-GDD-Main.md (v1.9), 6.1-GDD-Lore-Background.md (v1.7)

## 1. Purpose & Philosophy

This document defines the high-level narrative and thematic constraints—the "borders"—within which the game's simulation must operate. The goal is to guide the emergent narrative so that it consistently reinforces the core themes of the GDTLancer universe.

Our design philosophy is that **the simulation serves the narrative, not the other way around.** We are not creating a scientifically accurate, open-ended universe simulation. We are creating a powerful, thematically-focused story generator. These borders ensure that the stories it generates are always grounded in the game's established lore and core pillars.

## 2. The Core Narrative Borders

These principles must be applied to the design of all game systems, from agent AI to event generation.

### Border 1: Preservation of Assets

* **Lore Justification:** The culture of the sector's colonists was forged by the scarcity of complex materials and skilled personnel. Every ship is a significant investment, and every skilled pilot is a nearly irreplaceable resource. This led to the creation of the **Preservation Convention**, which prizes neutralization and capture over outright destruction.
* **Mechanical Implementation:**
    * **High Cost of Destruction:** Systems must be designed so that the total destruction of a ship is the least profitable and most consequence-heavy outcome of combat. It should result in minimal WP gain, significant Reputation loss, and potential negative Faction Standing changes.
    * **Rewarding Disablement:** Conversely, disabling a ship to allow for salvage (`Claim Wreckage`) or compelling a surrender must always be the most mechanically and narratively rewarding path.
    * **NPC Behavior:** The logic for NPC agents must reflect this. Most NPCs will default to disabling tactics. Only specific, defined groups (e.g., fanatical outlaws, sociopaths) would ever favor wanton destruction, making them feel truly alien to the setting's culture.

### Border 2: Pragmatic Agent Behavior

* **Lore Justification:** The people of the sector are pragmatic, utilitarian, and focused on managing risk, time, and resources. Their actions are driven by logical needs and calculated goals, not chaos.
* **Mechanical Implementation:**
    * **Goal-Oriented AI:** The `Goal System` for NPCs must be built on heuristics, not pure randomness. A trading agent will seek to maximize profit. A pirate agent will seek to acquire wealth with the least possible risk.
    * **Systemic Pressures:** The core game loops and resource sinks (like the `Time System`'s `Upkeep Cost`) must apply to NPCs as well as the player, ensuring they operate under the same pragmatic pressures.

### Border 3: Contained Scale

* **Lore Justification:** Common Faster-Than-Light travel does not exist. The game's story is focused on the dense, personal, and political dynamics within a single star system or a small cluster of them (a "Sector").
* **Mechanical Implementation:**
    * **Sector-Based World:** The game world must be structured as a series of discrete, high-detail sectors, not a seamless galaxy.
    * **Relevant Events:** The `Event System` and `Chronicle` must prioritize generating and logging events that are local and relevant to the player. The "living world" should feel immediate and present, not like a distant, abstract simulation.

### Border 4: A Human-Centric Universe

* **Lore Justification:** The game's narrative is fundamentally about humanity—specifically, the early colonists and explorers of this sector—and how they've adapted.
* **Mechanical Implementation:**
    * **Agent Focus:** The simulation must be focused on the interactions between human agents and their factions. The vast majority of generated events should relate to trade, politics, piracy, personal relationships, and discovery.
    * **The Alien is Alien:** True alien life, cosmic horrors, or spatio-temporal anomalies must be treated as rare, significant, and narratively impactful. The simulation should not be populated with a menagerie of random sci-fi creatures and phenomena; this preserves their thematic weight.
