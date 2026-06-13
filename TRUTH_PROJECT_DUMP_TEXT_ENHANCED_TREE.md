.
├── archive
│   ├── .antigravityignore
│   ├── locations
│   │   ├── sector_system_cob.tres
│   │   ├── sector_system_ebreeta.tres
│   │   ├── sector_system_lywin.tres
│   │   └── sector_system_vidr.tres
│   └── python_sandbox_simulation
│       ├── autoload
│       │   ├── constants.py
│       │   ├── game_state.py
│       │   └── __init__.py
│       ├── core
│       │   ├── __init__.py
│       │   └── simulation
│       │       ├── affinity_matrix.py
│       │       ├── agent_layer.py
│       │       ├── bridge_systems.py
│       │       ├── chronicle_layer.py
│       │       ├── grid_layer.py
│       │       ├── __init__.py
│       │       ├── simulation_engine.py
│       │       └── world_layer.py
│       ├── database
│       │   ├── __init__.py
│       │   └── registry
│       │       ├── __init__.py
│       │       └── template_data.py
│       ├── diagnostic.py
│       ├── __init__.py
│       ├── main.py
│       ├── tests
│       │   ├── __init__.py
│       │   └── test_affinity.py
│       └── tools
│           └── universe_generator_legacy
│               ├── palettes.py
│               ├── universe_generator.py
│               ├── universe_presets.py
│               └── universe_test_presets.py
├── assets
│   ├── art
│   │   ├── effects
│   │   │   ├── particle_dust_material.tres
│   │   │   └── particle_quad.tres
│   │   ├── environments
│   │   │   └── global_environment.tres
│   │   ├── materials
│   │   │   ├── scene_materials
│   │   │   │   ├── star_1_corona.tres
│   │   │   │   ├── star_1_sprite.tres
│   │   │   │   └── star_1_surface.tres
│   │   │   ├── test_solid_frame.tres
│   │   │   ├── test_solid_glow.tres
│   │   │   ├── test_solid_panel_2.tres
│   │   │   ├── test_solid_panel_3.tres
│   │   │   └── test_solid_panel.tres
│   │   ├── shaders
│   │   │   ├── complex_solid_cloud_inside_NLP.gdshader
│   │   │   ├── complex_solid_cloud_NLP.gdshader
│   │   │   ├── complex_transparent_cloud_NLP.gdshader
│   │   │   ├── simple_glow_NLP.gdshader
│   │   │   ├── simple_solid_NLP.gdshader
│   │   │   ├── star_corona_NLP.gdshader
│   │   │   ├── star_sprite.gdshader
│   │   │   └── star_surface_NLP.gdshader
│   │   ├── textures
│   │   │   ├── procedural_textures
│   │   │   │   └── normal
│   │   │   │       └── global_nebulas_1.tres
│   │   │   └── sbs-noise_texture_pack-512x512
│   │   │       ├── bw_noise
│   │   │       │   ├── Cracks 1 - 512x512.png
│   │   │       │   ├── Cracks 2 - 512x512.png
│   │   │       │   ├── Cracks 3 - 512x512.png
│   │   │       │   ├── Craters 14 - 512x512.png
│   │   │       │   ├── Craters 1 - 512x512.png
│   │   │       │   ├── Craters 7 - 512x512.png
│   │   │       │   ├── Craters 9 - 512x512.png
│   │   │       │   ├── Grainy 11 - 512x512.png
│   │   │       │   ├── Grainy 12 - 512x512.png
│   │   │       │   ├── Grainy 13 - 512x512.png
│   │   │       │   ├── Manifold 11 - 512x512.png
│   │   │       │   ├── Marble 14 - 512x512.png
│   │   │       │   ├── Marble 1 - 512x512.png
│   │   │       │   ├── Marble 3 - 512x512.png
│   │   │       │   ├── Melt 14 - 512x512.png
│   │   │       │   ├── Melt 3 - 512x512.png
│   │   │       │   ├── Melt 5 - 512x512.png
│   │   │       │   ├── Milky 11 - 512x512.png
│   │   │       │   ├── Milky 13 - 512x512.png
│   │   │       │   ├── Milky 6 - 512x512.png
│   │   │       │   ├── Streak 1 - 512x512.png
│   │   │       │   ├── Streak 4 - 512x512.png
│   │   │       │   ├── Super Perlin 11 - 512x512.png
│   │   │       │   ├── Super Perlin 13 - 512x512.png
│   │   │       │   ├── Super Perlin 9 - 512x512.png
│   │   │       │   ├── Turbulence 13 - 512x512.png
│   │   │       │   ├── Turbulence 3 - 512x512.png
│   │   │       │   ├── Turbulence 6 - 512x512.png
│   │   │       │   ├── Turbulence 9 - 512x512.png
│   │   │       │   └── Voronoi 8 - 512x512.png
│   │   │       └── normal_maps
│   │   │           ├── Cracks 1 - 512x512.png
│   │   │           ├── Cracks 2 - 512x512.png
│   │   │           ├── Cracks 3 - 512x512.png
│   │   │           ├── Craters 14 - 512x512.png
│   │   │           ├── Craters 1 - 512x512.png
│   │   │           ├── Craters 7 - 512x512.png
│   │   │           ├── Craters 9 - 512x512.png
│   │   │           ├── Grainy 11 - 512x512.png
│   │   │           ├── Grainy 12 - 512x512.png
│   │   │           ├── Grainy 13 - 512x512.png
│   │   │           ├── Manifold 11 - 512x512.png
│   │   │           ├── Marble 14 - 512x512.png
│   │   │           ├── Marble 1 - 512x512.png
│   │   │           ├── Marble 3 - 512x512.png
│   │   │           ├── Melt 14 - 512x512.png
│   │   │           ├── Melt 3 - 512x512.png
│   │   │           ├── Melt 5 - 512x512.png
│   │   │           ├── Milky 11 - 512x512.png
│   │   │           ├── Milky 13 - 512x512.png
│   │   │           ├── Milky 6 - 512x512.png
│   │   │           ├── Streak 1 - 512x512.png
│   │   │           ├── Streak 4 - 512x512.png
│   │   │           ├── Super Perlin 11 - 512x512.png
│   │   │           ├── Super Perlin 13 - 512x512.png
│   │   │           ├── Super Perlin 9 - 512x512.png
│   │   │           ├── Turbulence 13 - 512x512.png
│   │   │           ├── Turbulence 3 - 512x512.png
│   │   │           ├── Turbulence 6 - 512x512.png
│   │   │           ├── Turbulence 9 - 512x512.png
│   │   │           └── Voronoi 8 - 512x512.png
│   │   └── ui
│   │       ├── class_labels
│   │       │   ├── class_centered_growing_label.odg
│   │       │   └── class_centered_growing_label.svg
│   │       ├── controls
│   │       │   ├── bracket_targeting.dxf
│   │       │   ├── bracket_targeting.png
│   │       │   ├── bracket_targeting_selected.dxf
│   │       │   ├── bracket_targeting_selected.png
│   │       │   ├── button_approach.dxf
│   │       │   ├── button_approach.png
│   │       │   ├── button_attack.dxf
│   │       │   ├── button_camera.dxf
│   │       │   ├── button_camera.png
│   │       │   ├── button_character.png
│   │       │   ├── button_close.dxf
│   │       │   ├── button_close.png
│   │       │   ├── button_debug.dxf
│   │       │   ├── button_debug.png
│   │       │   ├── button_dock.dxf
│   │       │   ├── button_dock.png
│   │       │   ├── button_flee.dxf
│   │       │   ├── button_flee.png
│   │       │   ├── button_free_flight.dxf
│   │       │   ├── button_free_flight.png
│   │       │   ├── button_info.dxf
│   │       │   ├── button_interaction.dxf
│   │       │   ├── button_interaction.png
│   │       │   ├── button_interact.png
│   │       │   ├── button_options.dxf
│   │       │   ├── button_options.png
│   │       │   ├── button_orbit.dxf
│   │       │   ├── button_orbit.png
│   │       │   ├── button_placeholder.png
│   │       │   ├── button_planet.dxf
│   │       │   ├── button_planet.png
│   │       │   ├── button_ship.dxf
│   │       │   ├── button_ship.png
│   │       │   ├── button_stop.dxf
│   │       │   ├── button_stop.png
│   │       │   ├── button_structure.dxf
│   │       │   ├── button_structure.png
│   │       │   ├── button_system.dxf
│   │       │   ├── button_system.png
│   │       │   ├── button_ui_opacity.dxf
│   │       │   ├── button_ui_opacity.png
│   │       │   ├── _placeholder_map.png
│   │       │   ├── projected_targets
│   │       │   │   ├── projected_target_bracket_background.tres
│   │       │   │   ├── projected_target_bracket_normal.tres
│   │       │   │   └── projected_target_bracket_selected.tres
│   │       │   ├── slider_horizontal.dxf
│   │       │   ├── slider_tick.dxf
│   │       │   ├── slider_tick.png
│   │       │   ├── slider_vert.dxf
│   │       │   └── slider_vert.png
│   │       └── main_menu
│   │           ├── button_exit_game.dxf
│   │           ├── button_exit_game.png
│   │           ├── button_load_game.dxf
│   │           ├── button_load_game.png
│   │           ├── button_save_game.dxf
│   │           ├── button_save_game.png
│   │           ├── button_settings.dxf
│   │           ├── button_settings.png
│   │           ├── button_start_new_game.dxf
│   │           └── button_start_new_game.png
│   ├── fonts
│   │   └── Roboto_Condensed
│   │       └── static
│   │           ├── RobotoCondensed-Bold.ttf
│   │           ├── RobotoCondensed-Light.ttf
│   │           └── RobotoCondensed-Regular.ttf
│   ├── models
│   │   ├── nebulas
│   │   │   ├── nebula_1.blend
│   │   │   ├── nebula_1.blend1
│   │   │   ├── nebula_1.glb
│   │   │   ├── nebula_2.blend
│   │   │   ├── nebula_2.blend1
│   │   │   ├── nebula_2.glb
│   │   │   ├── nebula_3.blend
│   │   │   ├── nebula_3.blend1
│   │   │   ├── nebula_3.glb
│   │   │   ├── nebula_4.blend
│   │   │   ├── nebula_4.glb
│   │   │   └── spheroid.glb
│   │   ├── ships
│   │   │   ├── Phoenix.glb
│   │   │   ├── Ship modules.glb
│   │   │   └── Spinal-ortho.glb
│   │   └── sprites
│   │       ├── Solar_sprite.glb
│   │       ├── Star_sprite_double.glb
│   │       ├── Star_sprite_double_large.glb
│   │       ├── Star_sprite_double_wide.glb
│   │       ├── Star_sprite_simple.glb
│   │       ├── Star_sprite_square.glb
│   │       └── Star_sprite_square_wide.glb
│   └── themes
│       └── main_theme.tres
├── database
│   ├── definitions
│   │   ├── action_template.gd
│   │   ├── agent_template.gd
│   │   ├── asset_commodity_template.gd
│   │   ├── asset_module_template.gd
│   │   ├── asset_ship_template.gd
│   │   ├── asset_template.gd
│   │   ├── character_template.gd
│   │   ├── contract_template.gd
│   │   ├── faction_template.gd
│   │   ├── location_template.gd
│   │   ├── template.gd
│   │   └── utility_tool_template.gd
│   └── registry
│       ├── actions
│       │   └── action_default.tres
│       ├── agents
│       │   ├── npc_default.tres
│       │   ├── npc_hostile_default.tres
│       │   ├── persistent_ada.tres
│       │   ├── persistent_crow.tres
│       │   ├── persistent_juno.tres
│       │   ├── persistent_kai.tres
│       │   ├── persistent_milo.tres
│       │   ├── persistent_nova.tres
│       │   ├── persistent_nyx.tres
│       │   ├── persistent_orin.tres
│       │   ├── persistent_rex.tres
│       │   ├── persistent_siv.tres
│       │   ├── persistent_vera.tres
│       │   ├── persistent_vex.tres
│       │   ├── persistent_zara.tres
│       │   └── player_default.tres
│       ├── assets
│       │   ├── commodities
│       │   │   ├── commodity_contraband.tres
│       │   │   ├── commodity_default.tres
│       │   │   ├── commodity_food.tres
│       │   │   ├── commodity_fuel.tres
│       │   │   ├── commodity_luxury.tres
│       │   │   ├── commodity_ore.tres
│       │   │   ├── commodity_scrap.tres
│       │   │   ├── commodity_specie.tres
│       │   │   └── commodity_tech.tres
│       │   ├── modules
│       │   │   └── module_default.tres
│       │   └── ships
│       │       ├── ship_default.tres
│       │       └── ship_hostile_default.tres
│       ├── characters
│       │   ├── character_ada.tres
│       │   ├── character_crow.tres
│       │   ├── character_default.tres
│       │   ├── character_juno.tres
│       │   ├── character_kai.tres
│       │   ├── character_milo.tres
│       │   ├── character_nova.tres
│       │   ├── character_nyx.tres
│       │   ├── character_orin.tres
│       │   ├── character_rex.tres
│       │   ├── character_siv.tres
│       │   ├── character_vera.tres
│       │   ├── character_vex.tres
│       │   └── character_zara.tres
│       ├── contracts
│       │   ├── delivery_01.tres
│       │   ├── delivery_02.tres
│       │   ├── delivery_03.tres
│       │   ├── delivery_04.tres
│       │   ├── delivery_05.tres
│       │   └── delivery_06.tres
│       ├── factions
│       │   ├── faction_independents.tres
│       │   ├── faction_miners.tres
│       │   └── faction_traders.tres
│       ├── locations
│       │   ├── sector_moon_elace_a1.tres
│       │   ├── sector_moon_elace_a2.tres
│       │   ├── sector_moon_elace_c1.tres
│       │   ├── sector_planet_cob_a.tres
│       │   ├── sector_planet_elace_a.tres
│       │   ├── sector_planet_elace_b.tres
│       │   ├── sector_planet_elace_c.tres
│       │   ├── sector_star_cob.tres
│       │   ├── sector_star_elace.tres
│       │   ├── sector_star_lywin_B.tres
│       │   ├── sector_star_lywin_C.tres
│       │   ├── sector_star_lywin_D.tres
│       │   ├── sector_star_lywin.tres
│       │   └── sector_star_vidr.tres
│       └── tools
│           ├── tool_ablative_laser.tres
│           ├── tool_harpoon.tres
│           └── tool_rotary_drill.tres
├── export_presets.cfg
├── Icon.png
├── log_browser
│   └── log_browser.py
├── project.godot
├── refactor.py
├── scenes
│   ├── levels
│   │   ├── game_world
│   │   │   └── main_game_scene.tscn
│   │   └── sectors
│   │       ├── sector_epsilon
│   │       │   ├── Planet_epsilon.tscn
│   │       │   ├── sector_epsilon.tscn
│   │       │   ├── Star_epsilon.tscn
│   │       │   └── Station_epsilon.tscn
│   │       ├── sector_gamma
│   │       │   ├── Planet_gamma.tscn
│   │       │   ├── sector_gamma.tscn
│   │       │   ├── Star_gamma.tscn
│   │       │   └── Station_gamma.tscn
│   │       ├── sector_star_cob
│   │       │   ├── planet_cob_a
│   │       │   │   └── planet_cob_a.tscn
│   │       │   ├── sector_planet_cob_a.tscn
│   │       │   ├── sector_star_cob.tscn
│   │       │   └── star_cob
│   │       │       ├── star_cob_sprite.tscn
│   │       │       └── star_cob.tscn
│   │       ├── sector_star_elace
│   │       │   ├── moon_elace_a1
│   │       │   │   └── moon_elace_a1.tscn
│   │       │   ├── moon_elace_a2
│   │       │   │   └── moon_elace_a2.tscn
│   │       │   ├── moon_elace_c1
│   │       │   │   └── moon_elace_c1.tscn
│   │       │   ├── planet_elace_a
│   │       │   │   └── planet_elace_a.tscn
│   │       │   ├── planet_elace_b
│   │       │   │   └── planet_elace_b.tscn
│   │       │   ├── planet_elace_c
│   │       │   │   └── planet_elace_c.tscn
│   │       │   ├── sector_moon_elace_a1.tscn
│   │       │   ├── sector_moon_elace_a2.tscn
│   │       │   ├── sector_moon_elace_c1.tscn
│   │       │   ├── sector_planet_elace_a.tscn
│   │       │   ├── sector_planet_elace_b.tscn
│   │       │   ├── sector_planet_elace_c.tscn
│   │       │   ├── sector_star_elace.tscn
│   │       │   └── star_elace
│   │       │       ├── directional_light_elace.tscn
│   │       │       ├── star_elace_sprite.tscn
│   │       │       └── star_elace.tscn
│   │       └── sector_star_lywin
│   │           ├── sector_planet_lywin_a.tscn
│   │           ├── sector_star_lywin_B.tscn
│   │           ├── sector_star_lywin_C.tscn
│   │           ├── sector_star_lywin_D.tscn
│   │           ├── sector_star_lywin.tscn
│   │           ├── star_lywin
│   │           │   ├── star_lywin_sprite.tscn
│   │           │   └── star_lywin.tscn
│   │           ├── star_lywin_B
│   │           │   └── star_lywin_B.tscn
│   │           ├── star_lywin_C
│   │           │   └── star_lywin_C.tscn
│   │           ├── star_lywin_D
│   │           │   └── star_lywin_D.tscn
│   │           └── star_lywin_E
│   │               └── star_lywin_E.tscn
│   ├── prefabs
│   │   ├── agents
│   │   │   ├── agent.tscn
│   │   │   ├── npc_agent.tscn
│   │   │   └── player_agent.tscn
│   │   ├── camera
│   │   │   └── orbit_camera.tscn
│   │   ├── celestial
│   │   │   ├── Planet_default.tscn
│   │   │   └── Star_default.tscn
│   │   ├── navigation
│   │   │   ├── JumpPoint.tscn
│   │   │   └── jump_transition_rig.tscn
│   │   └── station
│   │       └── DockableStation.tscn
│   ├── starspheres
│   │   └── global_nebulas_starsphere
│   │       └── global_nebulas.tscn
│   └── ui
│       ├── hud
│       │   ├── main_hud.tscn
│       │   ├── projected_target_bracket.tscn
│       │   ├── radar_display.tscn
│       │   ├── sector_info_panel.tscn
│       │   └── sim_debug_panel.tscn
│       ├── menus
│       │   ├── contract_board
│       │   │   └── ContractBoard.tscn
│       │   ├── debug_window.tscn
│       │   ├── interaction_window
│       │   │   └── InteractionWindow.tscn
│       │   ├── main_menu.tscn
│       │   ├── npc_trade_panel
│       │   │   └── NpcTradePanel.tscn
│       │   └── station_menu
│       │       └── StationMenu.tscn
│       └── shared
│           └── window_close_button.tscn
├── Splash.png
├── src
│   ├── autoload
│   │   ├── Constants.gd
│   │   ├── CoreMechanicsAPI.gd
│   │   ├── EventBus.gd
│   │   ├── GameState.gd
│   │   ├── GameStateManager.gd
│   │   ├── GlobalRefs.gd
│   │   └── TemplateDatabase.gd
│   ├── core
│   │   ├── agents
│   │   │   ├── agent.gd
│   │   │   └── components
│   │   │       ├── movement_system.gd
│   │   │       ├── navigation_system
│   │   │       │   ├── command_align_to.gd
│   │   │       │   ├── command_approach.gd
│   │   │       │   ├── command_flee.gd
│   │   │       │   ├── command_idle.gd
│   │   │       │   ├── command_move_direction.gd
│   │   │       │   ├── command_move_to.gd
│   │   │       │   ├── command_orbit.gd
│   │   │       │   └── command_stop.gd
│   │   │       ├── navigation_system.gd
│   │   │       └── tool_controller.gd
│   │   ├── simulation
│   │   │   ├── affinity_matrix.gd
│   │   │   ├── agent_layer
│   │   │   │   ├── agent_contract.gd
│   │   │   │   ├── agent_explorer.gd
│   │   │   │   ├── agent_market.gd
│   │   │   │   └── agent_routing.gd
│   │   │   ├── agent_layer.gd
│   │   │   ├── bridge_systems.gd
│   │   │   ├── chronicle_layer.gd
│   │   │   ├── contract_generation_system.gd
│   │   │   ├── grid_layer
│   │   │   │   ├── colony_progression_system.gd
│   │   │   │   ├── economy_progression_system.gd
│   │   │   │   └── security_progression_system.gd
│   │   │   ├── grid_layer.gd
│   │   │   ├── simulation_engine.gd
│   │   │   ├── simulation_raw_logger.gd
│   │   │   ├── simulation_report
│   │   │   │   ├── report_formatter.gd
│   │   │   │   ├── report_sampler.gd
│   │   │   │   └── report_summarizer.gd
│   │   │   ├── simulation_report.gd
│   │   │   └── world_layer.gd
│   │   ├── systems
│   │   │   ├── agent_system.gd
│   │   │   ├── asset_system.gd
│   │   │   ├── character_system.gd
│   │   │   ├── contact_manager.gd
│   │   │   ├── event_system.gd
│   │   │   ├── inventory_system.gd
│   │   │   ├── sector_loader.gd
│   │   │   └── time_system.gd
│   │   ├── targeting
│   │   │   ├── route_target.gd
│   │   │   └── route_target_provider.gd
│   │   ├── ui
│   │   │   ├── contract_board
│   │   │   │   └── contract_board.gd
│   │   │   ├── debug_map_panel
│   │   │   │   ├── debug_map_panel.gd
│   │   │   │   └── debug_map_panel.tscn
│   │   │   ├── debug_window
│   │   │   │   └── debug_window.gd
│   │   │   ├── helpers
│   │   │   │   └── CenteredGrowingLabel.gd
│   │   │   ├── interaction_window
│   │   │   │   └── interaction_window.gd
│   │   │   ├── main_hud
│   │   │   │   ├── hud_drag_controller.gd
│   │   │   │   ├── hud_target_projector.gd
│   │   │   │   ├── main_hud.gd
│   │   │   │   └── projected_target_bracket.gd
│   │   │   ├── main_menu
│   │   │   │   └── main_menu.gd
│   │   │   ├── npc_trade_panel
│   │   │   │   └── npc_trade_panel.gd
│   │   │   ├── radar_display
│   │   │   │   └── radar_display.gd
│   │   │   ├── sector_info_panel
│   │   │   │   └── sector_info_panel.gd
│   │   │   ├── sim_debug_panel
│   │   │   │   └── sim_debug_panel.gd
│   │   │   └── station_menu
│   │   │       └── station_menu.gd
│   │   └── utils
│   │       ├── editor_object.gd
│   │       ├── legacy_system_name_generator.gd
│   │       ├── pid_controller.gd
│   │       └── rotating_object.gd
│   ├── modules
│   │   └── piloting
│   │       ├── player_controller_ship.gd
│   │       ├── player_input_states
│   │       │   ├── state_base.gd
│   │       │   ├── state_default.gd
│   │       │   └── state_free_flight.gd
│   │       └── ship_controller_ai.gd
│   ├── scenes
│   │   ├── camera
│   │   │   ├── components
│   │   │   │   ├── camera_particles_controller.gd
│   │   │   │   ├── camera_position_controller.gd
│   │   │   │   ├── camera_rotation_controller.gd
│   │   │   │   └── camera_zoom_controller.gd
│   │   │   └── orbit_camera.gd
│   │   └── game_world
│   │       ├── jump_point.gd
│   │       ├── jump_transition
│   │       │   └── jump_transition_rig.gd
│   │       ├── starsphere_slot.gd
│   │       ├── station
│   │       │   └── dockable_station.gd
│   │       ├── world_manager
│   │       │   ├── jump_orchestrator.gd
│   │       │   ├── template_indexer.gd
│   │       │   └── world_generator.gd
│   │       ├── world_manager.gd
│   │       └── world_rendering.gd
│   └── tests
│       ├── autoload
│       │   ├── test_constants.gd
│       │   ├── test_core_mechanics_api.gd
│       │   ├── test_event_bus.gd
│       │   ├── test_game_state_manager.gd
│       │   └── test_global_refs.gd
│       ├── core
│       │   ├── agents
│       │   │   └── components
│       │   │       ├── test_movement_system.gd
│       │   │       ├── test_navigation_system.gd
│       │   │       └── test_tool_controller.gd
│       │   ├── simulation
│       │   │   ├── test_affinity_matrix.gd
│       │   │   ├── test_agent_layer.gd
│       │   │   ├── test_chronicle_layer.gd
│       │   │   ├── test_contract_generation_system.gd
│       │   │   ├── test_grid_layer.gd
│       │   │   ├── test_simulation_integration.gd
│       │   │   ├── test_simulation_raw_logger.gd
│       │   │   ├── test_simulation_report.gd
│       │   │   ├── test_simulation_tick.gd
│       │   │   └── test_world_layer.gd
│       │   ├── systems
│       │   │   ├── test_agent_spawner.gd
│       │   │   ├── test_asset_system.gd
│       │   │   ├── test_character_system.gd
│       │   │   ├── test_contact_manager.gd
│       │   │   ├── test_docking_logic.gd
│       │   │   ├── test_event_system.gd
│       │   │   ├── test_inventory_system.gd
│       │   │   ├── test_persistent_agents.gd
│       │   │   ├── test_route_target_provider.gd
│       │   │   ├── test_sector_loader.gd
│       │   │   └── test_time_system.gd
│       │   ├── ui
│       │   │   ├── test_contract_board.gd
│       │   │   ├── test_debug_map_panel_focus.gd
│       │   │   ├── test_debug_map_panel.gd
│       │   │   ├── test_debug_window.gd
│       │   │   ├── test_main_hud_projected_targeting.gd
│       │   │   ├── test_npc_trade_panel.gd
│       │   │   ├── test_sim_debug_panel.gd
│       │   │   └── test_station_menu.gd
│       │   └── utils
│       │       └── test_pid_controller.gd
│       ├── helpers
│       │   ├── mock_agent_body.gd
│       │   ├── mock_agent.tscn
│       │   ├── mock_event_bus.gd
│       │   ├── mock_ship_template.gd
│       │   ├── signal_catcher.gd
│       │   └── test_agent_body.gd
│       ├── modules
│       │   └── piloting
│       │       └── test_player_controller_ship.gd
│       └── scenes
│           ├── camera
│           │   └── test_orbit_camera.gd
│           ├── game_world
│           │   └── world_manager
│           │       ├── test_faction_loading.gd
│           │       ├── test_template_indexer.gd
│           │       ├── test_world_generator.gd
│           │       └── test_world_manager.gd
│           └── jump_transition
│               └── test_jump_transition_regressions.gd
└── tests
    └── data
        └── test_action.tres

147 directories, 487 files

147 directories, 487 files
