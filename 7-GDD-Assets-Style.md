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
