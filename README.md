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
