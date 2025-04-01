# GDTLancer Game Design Documentation

![Banner](./Banner.png)

This repository contains the Game Design Documentation (GDD) for **GDTLancer: Generative Dynamic Transmedia Lancer**.

GDTLancer is envisioned as a multi-platform space adventure RPG blending sandbox simulation with TTRPG-inspired emergent narrative mechanics. It aims to create a living world shaped by the actions of both the player and AI agents, with a distinct neo-retro visual style and a focus on player agency.

The main repository for the game project itself can be found at:
[https://github.com/roalyr/GDTLancer](https://github.com/roalyr/GDTLancer)

---

## Documentation Pages

This documentation is organized into several key areas:

### Main Document

* [**GDD-Main.md**](./GDD-Main.md): The central Game Design Document outlining the overall vision, game pillars, development framework (Layers, Modules, Systems), phased plan, and summaries of core concepts.

### Core Systems

* [**GDD-Core-Mechanics.md**](./GDD-Core-Mechanics.md): Details the fundamental, universal mechanics used across the game, including the Action Check (dice resolution), the Focus meta-resource, and Universal Narrative Moves (`Face Danger`, `Secure an Advantage`, etc.).

### Gameplay Modules

* [**GDD-Module-Piloting.md**](./GDD-Module-Piloting.md): Specific design details for the Piloting & Travel gameplay module, covering manual flight integration and abstracted travel mechanics (`Undertake Journey`, `Fast Transit`).
* *(Placeholder for future module design documents, e.g., Combat, Trading, etc.)*

### Meta & Legal

* [**LICENSE**](./LICENSE): Contains the licensing information for this documentation project.
* [**AI-ACKNOWLEDGEMENT.md**](./AI-ACKNOWLEDGEMENT.md): Details regarding the use of AI assistance during the generation and refinement of this documentation.

---

This documentation is a living project and currently under active development.

---
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
* **Hybrid Gameplay:** Engage in direct simulation gameplay (piloting, combat, trading) enhanced by narrative mechanics (Action Checks using 3d6+Mod, the 'Focus' resource) for high-stakes moments and abstracted actions.
* **Player Agency:** Choose your level of engagement – focus on optimizing your ship and "playing the numbers" in simulation modules, or delve deeper into narrative choices, goal-setting (Vows Lite), and interpreting world events.
* **Transmedia Vision:** Planned versions include:
    * Primary PC/Mobile build (Godot Engine 4).
    * Simplified J2ME version (turn-based, wireframe).
    * Analogue Tabletop RPG ruleset.
* **Neo-Retro Aesthetics:** Distinctive visual style using minimalist 3D, hard edges, solid colors, and stylized lighting.
* **Chronicle System:** Uncover the generated history of the world through an in-game interface logging significant player and NPC actions.

### Design Documentation

The detailed design principles, mechanics, and development plan for GDTLancer reside in its dedicated documentation repository:
**[GDTLancer Game Design Documentation](https://github.com/roalyr/GDTLancer-game-design)**

### Technology

* Primary Engine: **Godot Engine 4**

### License

This project (the Godot 4 implementation source code and associated assets within this repository) is intended to be licensed under the **GNU General Public License v3.0 or later (GPL-3.0-or-later)**. Please see the LICENSE file in the repository root for the full license text once added.

* The J2ME version, will also use GPLv3.
* The Analogue TTRPG version materials, likely developed in a separate repository, are intended to be licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0).

### Contributions

* Currently solo development.

---
