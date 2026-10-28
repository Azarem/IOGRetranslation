; Per-scene actor spawn lists indexed by scene ID.
; 
; Each scene entry defines which actors spawn, their initial positions, sprite assignments,
; and behavior flags. Read by SpawnSceneActors during scene transitions.
---------------------------------------------

?INCLUDE 'av69_erik'
?INCLUDE 'av69_kara'
?INCLUDE 'av69_lance'
?INCLUDE 'av69_lily'
?INCLUDE 'av69_neil'
?INCLUDE 'av69_signs'
?INCLUDE 'av6A_erik'
?INCLUDE 'av6A_kara'
?INCLUDE 'av6A_lance'
?INCLUDE 'av6A_lily'
?INCLUDE 'av6A_neil'
?INCLUDE 'av6B_door'
?INCLUDE 'av6B_flame'
?INCLUDE 'av6B_musician'
?INCLUDE 'av6B_ocean_ache'
?INCLUDE 'av6B_villagers1'
?INCLUDE 'av6B_villagers2'
?INCLUDE 'av6B_villagers3'
?INCLUDE 'av6C_harpist'
?INCLUDE 'av6C_only_sleeping'
?INCLUDE 'av6C_portrait'
?INCLUDE 'av6C_villagers4'
?INCLUDE 'av6C_villagers5'
?INCLUDE 'av6D_dive_bat'
?INCLUDE 'av6D_flame_left'
?INCLUDE 'av6D_flame_right'
?INCLUDE 'av6D_steelbones'
?INCLUDE 'av6E_draco'
?INCLUDE 'av70_crawlspace'
?INCLUDE 'av70_flame_center'
?INCLUDE 'av70_hidden_passage'
?INCLUDE 'av70_ramskull'
?INCLUDE 'av71_wind_effect'
?INCLUDE 'av73_waterfall_sound'
?INCLUDE 'av74_ishtar'
?INCLUDE 'av74_kara'
?INCLUDE 'av75_apprentice'
?INCLUDE 'av75_voice_doors'
?INCLUDE 'av75_voice_rooms'
?INCLUDE 'awB0_intro'
?INCLUDE 'awB0_shrubber'
?INCLUDE 'awB0_zip_fly'
?INCLUDE 'awB0_zombie'
?INCLUDE 'awB1_goldcap'
?INCLUDE 'awB1_gorgon'
?INCLUDE 'awB1_wall_walker'
?INCLUDE 'awB2_stair_climb'
?INCLUDE 'awB3_vine_reveal'
?INCLUDE 'awB4_snake_pit_entry'
?INCLUDE 'awB4_snake_pit_fx'
?INCLUDE 'awB6_bones'
?INCLUDE 'awB7_sliding_gate'
?INCLUDE 'awBA_bones'
?INCLUDE 'awBA_glasses'
?INCLUDE 'awBC_blinding_light'
?INCLUDE 'awBC_bouncing_crystal'
?INCLUDE 'awBD_fall_trigger'
?INCLUDE 'awBF_spirit_guide'
?INCLUDE 'boss_clear_reward_handler'
?INCLUDE 'btDC_plane_jumping'
?INCLUDE 'btDE_kara_missing'
?INCLUDE 'btDE_monologue'
?INCLUDE 'btDE_olman'
?INCLUDE 'btDF_crystal_ring'
?INCLUDE 'btDF_kara'
?INCLUDE 'btDF_spirits'
?INCLUDE 'btE0_crystal_gate_a'
?INCLUDE 'btE0_crystal_gate_b'
?INCLUDE 'btE0_crystal_gate_c'
?INCLUDE 'btE0_crystal_gate_d'
?INCLUDE 'btE1_comet_soon'
?INCLUDE 'btE1_light_elevator'
?INCLUDE 'btE2_brought_back'
?INCLUDE 'btE3_crystal_gate'
?INCLUDE 'btE3_dao_travel_spirit'
?INCLUDE 'btE3_kara'
?INCLUDE 'btE4_kara'
?INCLUDE 'btE4_olman'
?INCLUDE 'btEA_conveyor_controller'
?INCLUDE 'camera_scroll'
?INCLUDE 'camera_scroll_controller'
?INCLUDE 'daC3_babel_travel_spirit'
?INCLUDE 'daC3_carpet_man'
?INCLUDE 'daC3_freedom_man'
?INCLUDE 'daC3_jackal_girl'
?INCLUDE 'daC3_kruk1'
?INCLUDE 'daC3_kruk2'
?INCLUDE 'daC3_luggage_man'
?INCLUDE 'daC3_man1'
?INCLUDE 'daC3_merchant'
?INCLUDE 'daC3_moving_kruk'
?INCLUDE 'daC3_prisoner'
?INCLUDE 'daC3_slaver'
?INCLUDE 'daC3_training_man'
?INCLUDE 'daC3_treasure_man'
?INCLUDE 'daC4_erik'
?INCLUDE 'daC4_kara'
?INCLUDE 'daC5_slaver'
?INCLUDE 'daC5_weaver'
?INCLUDE 'daC6_snake_panic'
?INCLUDE 'daC7_explorer1'
?INCLUDE 'daC7_explorer2'
?INCLUDE 'daC7_explorer3'
?INCLUDE 'daC8_neil'
?INCLUDE 'daC9_businessman'
?INCLUDE 'dark_space'
?INCLUDE 'dc2F_adrift'
?INCLUDE 'dc2F_adrift_fx'
?INCLUDE 'dc30_dog'
?INCLUDE 'dc30_kara'
?INCLUDE 'dc31_kara'
?INCLUDE 'dc31_rescuer'
?INCLUDE 'dm3D_breakable_wall'
?INCLUDE 'dm3D_eye_stalker'
?INCLUDE 'dm3D_flayzer'
?INCLUDE 'dm3D_grundit'
?INCLUDE 'dm3E_intro'
?INCLUDE 'dm3F_elevator_door'
?INCLUDE 'dm3F_elevator_sign'
?INCLUDE 'dm3F_laborer'
?INCLUDE 'dm3F_mine_collapse_trigger'
?INCLUDE 'dm3F_switch'
?INCLUDE 'dm40_hidden_dark_space'
?INCLUDE 'dm40_trapped_slave'
?INCLUDE 'dm41_bat_spawner'
?INCLUDE 'dm41_minecart'
?INCLUDE 'dm41_solid_wall_setup'
?INCLUDE 'dm43_elevator'
?INCLUDE 'dm44_cell_door'
?INCLUDE 'dm45_key'
?INCLUDE 'dm47_imas'
?INCLUDE 'dm47_remus'
?INCLUDE 'dm47_sam'
?INCLUDE 'dream_zoom_controller'
?INCLUDE 'ec0A_barrel_roast'
?INCLUDE 'ec0A_bed_maid'
?INCLUDE 'ec0A_caring_maid'
?INCLUDE 'ec0A_door_guard'
?INCLUDE 'ec0A_edward'
?INCLUDE 'ec0A_edwina'
?INCLUDE 'ec0A_kara'
?INCLUDE 'ec0A_kara_guard'
?INCLUDE 'ec0A_left_guard'
?INCLUDE 'ec0A_null_actor'
?INCLUDE 'ec0A_prison_guard'
?INCLUDE 'ec0A_right_guard'
?INCLUDE 'ec0A_shy_guard'
?INCLUDE 'ec0A_stair_guard'
?INCLUDE 'ec0A_stair_maid'
?INCLUDE 'ec0A_throne_guards'
?INCLUDE 'ec0A_torch1'
?INCLUDE 'ec0A_torch2'
?INCLUDE 'ec0B_ball'
?INCLUDE 'ec0B_cell'
?INCLUDE 'ec0B_door'
?INCLUDE 'ec0B_guard'
?INCLUDE 'ec0B_moss'
?INCLUDE 'ec0C_bat'
?INCLUDE 'ec0C_force_hint'
?INCLUDE 'ec0C_ribber'
?INCLUDE 'ec0D_canal_worm'
?INCLUDE 'ec0E_barrier'
?INCLUDE 'ec0E_lily'
?INCLUDE 'ec0E_spiney'
?INCLUDE 'ec0E_statue'
?INCLUDE 'ec0E_switch'
?INCLUDE 'ec0F_king_bat'
?INCLUDE 'ec0F_rusty_switch'
?INCLUDE 'ec0F_spear'
?INCLUDE 'ec10_dp_hint_spirit'
?INCLUDE 'ec11_aqueduct_blocker'
?INCLUDE 'ec11_aqueduct_gate_sprite'
?INCLUDE 'ec11_button_voice'
?INCLUDE 'ec11_countdown'
?INCLUDE 'ec11_flower'
?INCLUDE 'ec12_aqueduct_dark_space'
?INCLUDE 'ec12_aqueduct_enemy'
?INCLUDE 'ec12_skull_chaser'
?INCLUDE 'ec13_lily'
?INCLUDE 'eu91_book'
?INCLUDE 'eu91_crate'
?INCLUDE 'eu91_intro'
?INCLUDE 'eu91_men1'
?INCLUDE 'eu91_men2'
?INCLUDE 'eu91_merchant'
?INCLUDE 'eu91_merchant_counter'
?INCLUDE 'eu91_peeking_man'
?INCLUDE 'eu91_shop_door'
?INCLUDE 'eu91_shop_queue'
?INCLUDE 'eu91_women1'
?INCLUDE 'eu91_women2'
?INCLUDE 'eu92_erasquez'
?INCLUDE 'eu92_rofsky'
?INCLUDE 'eu93_found'
?INCLUDE 'eu94_employee'
?INCLUDE 'eu95_ann'
?INCLUDE 'eu95_neil'
?INCLUDE 'eu95_neils_father'
?INCLUDE 'eu95_neils_mother'
?INCLUDE 'eu96_erik'
?INCLUDE 'eu96_kara'
?INCLUDE 'eu96_neil'
?INCLUDE 'eu97_clerk1'
?INCLUDE 'eu97_clerk2'
?INCLUDE 'eu97_dark_medicine'
?INCLUDE 'eu97_life_medicine'
?INCLUDE 'eu9A_friezer'
?INCLUDE 'eu9A_max'
?INCLUDE 'eu9A_rudy'
?INCLUDE 'eu9D_altar'
?INCLUDE 'eu9D_bones'
?INCLUDE 'eu9D_slaves'
?INCLUDE 'floor_button'
?INCLUDE 'fr32_alley_guard'
?INCLUDE 'fr32_bg_sprite_a'
?INCLUDE 'fr32_bg_sprite_b'
?INCLUDE 'fr32_bg_sprite_c'
?INCLUDE 'fr32_creep'
?INCLUDE 'fr32_doomsday'
?INCLUDE 'fr32_fragrance'
?INCLUDE 'fr32_guide'
?INCLUDE 'fr32_herb'
?INCLUDE 'fr32_honest_life'
?INCLUDE 'fr32_hotel_hint'
?INCLUDE 'fr32_hp_jewel'
?INCLUDE 'fr32_idle_npc_a'
?INCLUDE 'fr32_idle_npc_b'
?INCLUDE 'fr32_kara'
?INCLUDE 'fr32_kidnapper'
?INCLUDE 'fr32_laborer_npc'
?INCLUDE 'fr32_locked_door'
?INCLUDE 'fr32_showman'
?INCLUDE 'fr32_slap'
?INCLUDE 'fr32_slaver1'
?INCLUDE 'fr32_slaver2'
?INCLUDE 'fr32_walking_npc'
?INCLUDE 'fr33_erik'
?INCLUDE 'fr35_slave1'
?INCLUDE 'fr35_slave2'
?INCLUDE 'fr35_slave3'
?INCLUDE 'fr36_mother'
?INCLUDE 'fr37_caution'
?INCLUDE 'fr38_ashamed'
?INCLUDE 'fr38_boyfriend'
?INCLUDE 'fr38_girlfriend'
?INCLUDE 'fr39_erik'
?INCLUDE 'fr39_kara'
?INCLUDE 'fr39_lance'
?INCLUDE 'fr39_lily'
?INCLUDE 'fr3A_harborer'
?INCLUDE 'fr3A_sympathetic'
?INCLUDE 'fr3B_tornado'
?INCLUDE 'fr3C_imas'
?INCLUDE 'fr3C_man1'
?INCLUDE 'fr3C_man2'
?INCLUDE 'fr3C_remus'
?INCLUDE 'fr3C_sam'
?INCLUDE 'fr3C_slaver'
?INCLUDE 'freejia_street_prop'
?INCLUDE 'future_vision_cutscene'
?INCLUDE 'garden_crash_cutscene'
?INCLUDE 'gs2A_shira'
?INCLUDE 'gs2B_bones'
?INCLUDE 'gs2B_erik'
?INCLUDE 'gs2B_seth'
?INCLUDE 'gs2B_wreck_wave_motion'
?INCLUDE 'gs2C_crew1'
?INCLUDE 'gs2C_crew2'
?INCLUDE 'gs2C_crew3'
?INCLUDE 'gs2C_crew4'
?INCLUDE 'gs2C_crew5'
?INCLUDE 'gs2C_crow_crew'
?INCLUDE 'gs2C_descent'
?INCLUDE 'gs2C_rain_particle'
?INCLUDE 'gs2C_rain_spawner'
?INCLUDE 'gs2D_kara'
?INCLUDE 'gs2D_lance'
?INCLUDE 'gs2D_lily'
?INCLUDE 'gs2D_mummy'
?INCLUDE 'gs2E_crew0'
?INCLUDE 'gs2E_crew1'
?INCLUDE 'gs2E_crew2'
?INCLUDE 'gs2E_crew3'
?INCLUDE 'gs2E_queen'
?INCLUDE 'gs2E_sleep'
?INCLUDE 'gw82_archer'
?INCLUDE 'gw82_eyesore'
?INCLUDE 'gw82_fire_bug'
?INCLUDE 'gw82_necklace_stone'
?INCLUDE 'gw82_trail_intro'
?INCLUDE 'gw82_wall_spear'
?INCLUDE 'gw83_asp'
?INCLUDE 'gw83_lily'
?INCLUDE 'gw83_switch'
?INCLUDE 'gw85_long_switch_spear'
?INCLUDE 'gw85_multi_switch_spear'
?INCLUDE 'gw85_retractable_gate'
?INCLUDE 'gw85_short_switch_spear'
?INCLUDE 'gw85_spin_dash_gate'
?INCLUDE 'gw88_short_wall_spear'
?INCLUDE 'gw88_tomb_dark_space'
?INCLUDE 'gw8A_sand_fanger'
?INCLUDE 'gw8B_lance_lily'
?INCLUDE 'hidden_red_jewel'
?INCLUDE 'inventory_menu'
?INCLUDE 'inventory_statue_slot'
?INCLUDE 'ir1B_slugger'
?INCLUDE 'ir1C_kara'
?INCLUDE 'ir1C_lily'
?INCLUDE 'ir1D_bones'
?INCLUDE 'ir1D_four_way'
?INCLUDE 'ir1D_monologue'
?INCLUDE 'ir1D_mudpit'
?INCLUDE 'ir1D_scuttlebug'
?INCLUDE 'ir1D_wind_melody'
?INCLUDE 'ir1E_cliff_mantel_a'
?INCLUDE 'ir1E_cliff_mantel_b'
?INCLUDE 'ir1E_cliff_slide_trigger'
?INCLUDE 'ir1F_gold_tile'
?INCLUDE 'ir1F_plate_gate_opener'
?INCLUDE 'ir1F_stone_guard'
?INCLUDE 'ir1F_stone_lord'
?INCLUDE 'ir20_statue'
?INCLUDE 'ir21_frozen_whirligig'
?INCLUDE 'ir21_splop'
?INCLUDE 'ir21_switch'
?INCLUDE 'ir21_whirligig'
?INCLUDE 'ir24_glowing_tile'
?INCLUDE 'ir25_block_slot'
?INCLUDE 'ir25_ceiling_tile'
?INCLUDE 'ir26_bones'
?INCLUDE 'ir26_journal_bones'
?INCLUDE 'ir26_statue'
?INCLUDE 'ir28_bones'
?INCLUDE 'ir28_ceiling_trap_trigger'
?INCLUDE 'ir29_castoth'
?INCLUDE 'ir29_transform'
?INCLUDE 'it15_bill'
?INCLUDE 'it15_elder'
?INCLUDE 'it15_fable_man'
?INCLUDE 'it15_fable_woman'
?INCLUDE 'it15_friendly_woman'
?INCLUDE 'it15_kara'
?INCLUDE 'it15_lily'
?INCLUDE 'it15_lola'
?INCLUDE 'it15_running_man'
?INCLUDE 'it16_song_woman'
?INCLUDE 'it17_kara'
?INCLUDE 'it17_lily'
?INCLUDE 'it18_warning_man'
?INCLUDE 'it18_warning_woman'
?INCLUDE 'it19_breakable_wall'
?INCLUDE 'it19_inca_statue_a'
?INCLUDE 'it1A_lily'
?INCLUDE 'it1A_moon_tribe'
?INCLUDE 'it1B_inca_statue_b'
?INCLUDE 'it1B_trial'
?INCLUDE 'jeweler_gem'
?INCLUDE 'large_ramps'
?INCLUDE 'movement_speed_zones'
?INCLUDE 'mtA0_acid_spider'
?INCLUDE 'mtA0_intro'
?INCLUDE 'mtA0_skulker'
?INCLUDE 'mtA1_fire_sprite'
?INCLUDE 'mtA1_yorrick_ew'
?INCLUDE 'mtA1_yorrick_ns'
?INCLUDE 'mtA2_mushroom_drop_gate'
?INCLUDE 'mtA5_mushroom_drop_gate_a'
?INCLUDE 'mtA5_mushroom_drop_gate_b'
?INCLUDE 'mu5F_cyclops'
?INCLUDE 'mu5F_flasher'
?INCLUDE 'mu60_floor_spikes'
?INCLUDE 'mu60_force_ball'
?INCLUDE 'mu60_plasma_chain'
?INCLUDE 'mu61_hint'
?INCLUDE 'mu62_hope_statue'
?INCLUDE 'mu63_spirits'
?INCLUDE 'mu64_switch_spikes'
?INCLUDE 'mu66_altar_dialog'
?INCLUDE 'mu66_altar1'
?INCLUDE 'mu66_altar2'
?INCLUDE 'mu66_rama_spirits'
?INCLUDE 'mu67_bomb'
?INCLUDE 'mu67_erik'
?INCLUDE 'mu67_kara'
?INCLUDE 'mu67_lair_curtain'
?INCLUDE 'mu67_neil_lily'
?INCLUDE 'mu67_vampires'
?INCLUDE 'na49_camera'
?INCLUDE 'na49_erik'
?INCLUDE 'na49_kara'
?INCLUDE 'na49_lance'
?INCLUDE 'na49_lily'
?INCLUDE 'na49_neil'
?INCLUDE 'na49_tank'
?INCLUDE 'na49_telescope'
?INCLUDE 'na49_wings'
?INCLUDE 'na4B_buried_tile'
?INCLUDE 'na4B_erik'
?INCLUDE 'na4B_kara'
?INCLUDE 'na4B_lance'
?INCLUDE 'na4B_lily'
?INCLUDE 'na4B_neil'
?INCLUDE 'na4B_spirit'
?INCLUDE 'nvAC_beckon_kid'
?INCLUDE 'nvAC_bones'
?INCLUDE 'nvAC_bonfire'
?INCLUDE 'nvAC_dumpling_man'
?INCLUDE 'nvAC_erik'
?INCLUDE 'nvAC_hamlet'
?INCLUDE 'nvAC_hand_man'
?INCLUDE 'nvAC_kara'
?INCLUDE 'nvAC_map_kid'
?INCLUDE 'nvAC_staring_man'
?INCLUDE 'nvAD_erik'
?INCLUDE 'nvAD_hamlet'
?INCLUDE 'nvAD_kara'
?INCLUDE 'nvAE_erik'
?INCLUDE 'nvAE_kara'
?INCLUDE 'nvAE_stone_girl1'
?INCLUDE 'nvAE_stone_girl2'
?INCLUDE 'nvAE_stone_girl3'
?INCLUDE 'overworld_exit'
?INCLUDE 'player_character'
?INCLUDE 'pr8C_prologue1'
?INCLUDE 'pr8C_prologue5'
?INCLUDE 'pr8D_prologue2'
?INCLUDE 'pr8E_prologue3'
?INCLUDE 'pr8F_prologue4'
?INCLUDE 'pyCC_blaster'
?INCLUDE 'pyCC_dark_space_portal'
?INCLUDE 'pyCC_entrance_portal'
?INCLUDE 'pyCC_mystic_ball'
?INCLUDE 'pyCC_portal'
?INCLUDE 'pyCD_explorer'
?INCLUDE 'pyCD_flame_statue'
?INCLUDE 'pyCD_jackal'
?INCLUDE 'pyCD_kara'
?INCLUDE 'pyCD_puzzle'
?INCLUDE 'pyCE_tuts'
?INCLUDE 'pyD0_breakable_wall'
?INCLUDE 'pyD2_haunt'
?INCLUDE 'pyD4_falling_orb'
?INCLUDE 'pyD6_vader_barrier_lower'
?INCLUDE 'pyD6_vader_barrier_upper'
?INCLUDE 'pyD7_sliding_wall'
?INCLUDE 'pyD9_dangerslide_controller'
?INCLUDE 'pyDA_lithograph1'
?INCLUDE 'pyDA_lithograph2'
?INCLUDE 'pyDA_lithograph3'
?INCLUDE 'pyDA_lithograph4'
?INCLUDE 'pyDA_lithograph5'
?INCLUDE 'pyDA_lithograph6'
?INCLUDE 'pyDD_mummy_queen'
?INCLUDE 'pyDD_mystic_statue'
?INCLUDE 'pyDD_queen_arena_boundary'
?INCLUDE 'pyDD_queen_invincible_orb'
?INCLUDE 'pyDD_teleporter'
?INCLUDE 'ramps'
?INCLUDE 's89_new_babel'
?INCLUDE 's90_changed_world'
?INCLUDE 'sc01_astronomer'
?INCLUDE 'sc01_fisherman'
?INCLUDE 'sc01_girl1'
?INCLUDE 'sc01_girl2'
?INCLUDE 'sc01_girl3'
?INCLUDE 'sc01_guard'
?INCLUDE 'sc01_house_intro'
?INCLUDE 'sc01_jar_door'
?INCLUDE 'sc01_roof_man'
?INCLUDE 'sc01_salesman'
?INCLUDE 'sc01_seagull'
?INCLUDE 'sc01_smoke'
?INCLUDE 'sc01_sprint_man'
?INCLUDE 'sc01_startled_woman'
?INCLUDE 'sc01_sympathetic_woman'
?INCLUDE 'sc01_worried_woman'
?INCLUDE 'sc02_card'
?INCLUDE 'sc02_entry'
?INCLUDE 'sc02_erik'
?INCLUDE 'sc02_lance'
?INCLUDE 'sc02_seth'
?INCLUDE 'sc03_lances_mother'
?INCLUDE 'sc04_eriks_father'
?INCLUDE 'sc04_eriks_mother'
?INCLUDE 'sc04_poverty'
?INCLUDE 'sc05_seths_father'
?INCLUDE 'sc05_seths_mother'
?INCLUDE 'sc06_bill'
?INCLUDE 'sc06_hamlet'
?INCLUDE 'sc06_kara'
?INCLUDE 'sc06_kara_return'
?INCLUDE 'sc06_lily'
?INCLUDE 'sc06_lola'
?INCLUDE 'sc06_main_soldier'
?INCLUDE 'sc06_monologue'
?INCLUDE 'sc06_wills_pet'
?INCLUDE 'sc07_chef'
?INCLUDE 'sc08_erik'
?INCLUDE 'sc08_lance'
?INCLUDE 'sc08_priest'
?INCLUDE 'sc08_seth'
?INCLUDE 'scene_flag_init'
?INCLUDE 'sE5_epilogue'
?INCLUDE 'sE6_gaia'
?INCLUDE 'sE7_space_flight_controller'
?INCLUDE 'sE8_dark_gaia'
?INCLUDE 'sE9_mansion_intro'
?INCLUDE 'sEA_solid_arm'
?INCLUDE 'sF0_class_dismissed'
?INCLUDE 'sF7_credits'
?INCLUDE 'sF7_credits_npc_a'
?INCLUDE 'sF7_credits_npc_b'
?INCLUDE 'sF7_credits_npc_c'
?INCLUDE 'sF7_credits_npc_d'
?INCLUDE 'sF7_credits_npc_e'
?INCLUDE 'sF7_credits_player'
?INCLUDE 'sFA_diary_menu'
?INCLUDE 'sFB_boot_logo'
?INCLUDE 'sFC_title_intro'
?INCLUDE 'sFC_title_start_handler'
?INCLUDE 'sg4C_auto_advance'
?INCLUDE 'sg4C_platforms'
?INCLUDE 'sg4C_spirits'
?INCLUDE 'sg4D_cyber'
?INCLUDE 'sg4D_dynapede'
?INCLUDE 'sg4D_jump_handler'
?INCLUDE 'sg4D_knight_armor'
?INCLUDE 'sg4E_nitropede'
?INCLUDE 'sg4E_plasma_snake'
?INCLUDE 'sg51_statue'
?INCLUDE 'sg52_blocker_enemy_a'
?INCLUDE 'sg52_blocker_enemy_b'
?INCLUDE 'sg52_switch'
?INCLUDE 'sg54_pressure_switch'
?INCLUDE 'sg55_falling_tile'
?INCLUDE 'sg55_mystic_statue'
?INCLUDE 'sg55_viper'
?INCLUDE 'sp58_descent_cutscene'
?INCLUDE 'sp58_missed_flight'
?INCLUDE 'sp58_monologue'
?INCLUDE 'sp58_red_eye'
?INCLUDE 'sp5A_monologue'
?INCLUDE 'sp5A_phantom_ribber'
?INCLUDE 'sp5A_villagers'
?INCLUDE 'sp5A_voice'
?INCLUDE 'sp5B_erik'
?INCLUDE 'sp5B_kara'
?INCLUDE 'sp5B_lance'
?INCLUDE 'sp5B_lily'
?INCLUDE 'sp5B_neil'
?INCLUDE 'sp5C_key_coffin'
?INCLUDE 'sp5C_skuddle'
?INCLUDE 'sp5C_slipper'
?INCLUDE 'sp5C_stone_coffin'
?INCLUDE 'sp5D_fountain'
?INCLUDE 'sp5E_passageway'
?INCLUDE 'st68_ambient_bubbles'
?INCLUDE 'st68_campfire'
?INCLUDE 'st68_erik'
?INCLUDE 'st68_kara'
?INCLUDE 'st68_lance'
?INCLUDE 'st68_lily'
?INCLUDE 'st68_mushrooms'
?INCLUDE 'st68_neil'
?INCLUDE 'slider_glide'
?INCLUDE 'statue_inventory_reward'
?INCLUDE 'town_door'
?INCLUDE 'visual_effect_pipeline'
?INCLUDE 'wa78_centipede_man'
?INCLUDE 'wa78_children'
?INCLUDE 'wa78_crazy_man'
?INCLUDE 'wa78_diary'
?INCLUDE 'wa78_flower'
?INCLUDE 'wa78_full_pad'
?INCLUDE 'wa78_glass_game'
?INCLUDE 'wa78_intro'
?INCLUDE 'wa78_kruk'
?INCLUDE 'wa78_lance_camera_pan'
?INCLUDE 'wa78_lily_pad'
?INCLUDE 'wa78_men'
?INCLUDE 'wa78_moving_pad'
?INCLUDE 'wa78_moving_woman'
?INCLUDE 'wa78_prize_kruk'
?INCLUDE 'wa78_water_kid'
?INCLUDE 'wa78_women'
?INCLUDE 'wa79_erik'
?INCLUDE 'wa79_kara'
?INCLUDE 'wa79_lance'
?INCLUDE 'wa79_lily'
?INCLUDE 'wa79_neil'
?INCLUDE 'wa7A_lance'
?INCLUDE 'wa7A_lances_father'
?INCLUDE 'wa7B_competitor_left'
?INCLUDE 'wa7B_competitor_right'
?INCLUDE 'wa7D_glass_opponent'
?INCLUDE 'wa7F_lance'
?INCLUDE 'wa7F_lily'
?INCLUDE 'WorldMapController'

---------------------------------------------

scene_actors [
  &scene_event_0C821F   ;00
  &scene_event_0C8221   ;01
  &scene_event_0C8325   ;02
  &scene_event_0C835E   ;03
  &scene_event_0C8390   ;04
  &scene_event_0C83C9   ;05
  &scene_event_0C83FB   ;06
  &scene_event_0C845E   ;07
  &scene_event_0C8483   ;08
  &scene_event_0C84BC   ;09
  &scene_event_0C84DA   ;0A
  &scene_event_0C8612   ;0B
  &scene_event_0C867A   ;0C
  &scene_event_0C86AC   ;0D
  &scene_event_0C875C   ;0E
  &scene_event_0C8847   ;0F
  &scene_event_0C8935   ;10
  &scene_event_0C894C   ;11
  &scene_event_0C8986   ;12
  &scene_event_0C8AA9   ;13
  &scene_event_0C8AC7   ;14
  &scene_event_0C8AD7   ;15
  &scene_event_0C8B64   ;16
  &scene_event_0C8B7B   ;17
  &scene_event_0C8BA0   ;18
  &scene_event_0C8BBE   ;19
  &scene_event_0C8BDC   ;1A
  &scene_event_0C8C33   ;1B
  &scene_event_0C8C87   ;1C
  &scene_event_0C8CC4   ;1D
  &scene_event_0C8D85   ;1E
  &scene_event_0C8DBF   ;1F
  &scene_event_0C8E16   ;20
  &scene_event_0C8E75   ;21
  &scene_event_0C8F57   ;22
  &scene_event_0C9029   ;23
  &scene_event_0C90D5   ;24
  &scene_event_0C90F3   ;25
  &scene_event_0C91A0   ;26
  &scene_event_0C9242   ;27
  &scene_event_0C92F2   ;28
  &scene_event_0C935F   ;29
  &scene_event_0C938D   ;2A
  &scene_event_0C93B2   ;2B
  &scene_event_0C9401   ;2C
  &scene_event_0C945E   ;2D
  &scene_event_0C94B4   ;2E
  &scene_event_0C94F5   ;2F
  &scene_event_0C951A   ;30
  &scene_event_0C954D   ;31
  &scene_event_0C9572   ;32
  &scene_event_0C9699   ;33
  &scene_event_0C96B7   ;34
  &scene_event_0C96D5   ;35
  &scene_event_0C970B   ;36
  &scene_event_0C9729   ;37
  &scene_event_0C9747   ;38
  &scene_event_0C9773   ;39
  &scene_event_0C97AD   ;3A
  &scene_event_0C97D2   ;3B
  &scene_event_0C97F0   ;3C
  &scene_event_0C9836   ;3D
  &scene_event_0C98B7   ;3E
  &scene_event_0C991A   ;3F
  &scene_event_0C9A41   ;40
  &scene_event_0C9A95   ;41
  &scene_event_0C9B39   ;42
  &scene_event_0C9B57   ;43
  &scene_event_0C9B8A   ;44
  &scene_event_0C9BA1   ;45
  &scene_event_0C9BF4   ;46
  &scene_event_0C9C5C   ;47
  &scene_event_0C8200   ;48
  &scene_event_0C9C81   ;49
  &scene_event_0C9CE1   ;4A
  &scene_event_0C9CF1   ;4B
  &scene_event_0C9D45   ;4C
  &scene_event_0C9DB3   ;4D
  &scene_event_0C9E92   ;4E
  &scene_event_0C9F53   ;4F
  &scene_event_0CA01A   ;50
  &scene_event_0CA0CB   ;51
  &scene_event_0CA192   ;52
  &scene_event_0CA247   ;53
  &scene_event_0CA335   ;54
  &scene_event_0CA43B   ;55
  &scene_event_0CA4F5   ;56
  &scene_event_0C8200   ;57
  &scene_event_0CA50C   ;58
  &scene_event_0CA554   ;59
  &scene_event_0CA55D   ;5A
  &scene_event_0CA5D6   ;5B
  &scene_event_0CA610   ;5C
  &scene_event_0CA6E6   ;5D
  &scene_event_0CA704   ;5E
  &scene_event_0CA71B   ;5F
  &scene_event_0CA7ED   ;60
  &scene_event_0CA934   ;61
  &scene_event_0CAA7B   ;62
  &scene_event_0CAB28   ;63
  &scene_event_0CAB4B   ;64
  &scene_event_0CABD4   ;65
  &scene_event_0CACC3   ;66
  &scene_event_0CACEF   ;67
  &scene_event_0CAD42   ;68
  &scene_event_0CAD99   ;69
  &scene_event_0CADE1   ;6A
  &scene_event_0CAE1B   ;6B
  &scene_event_0CAEB6   ;6C
  &scene_event_0CAF6E   ;6D
  &scene_event_0CB04B   ;6E
  &scene_event_0CB13E   ;6F
  &scene_event_0CB1AE   ;70
  &scene_event_0CB258   ;71
  &scene_event_0CB29E   ;72
  &scene_event_0CB355   ;73
  &scene_event_0CB388   ;74
  &scene_event_0CB3AD   ;75
  &scene_event_0C8200   ;76
  &scene_event_0C8200   ;77
  &scene_event_0CB41F   ;78
  &scene_event_0CB572   ;79
  &scene_event_0CB5AC   ;7A
  &scene_event_0CB5D1   ;7B
  &scene_event_0CB62D   ;7C
  &scene_event_0CB64B   ;7D
  &scene_event_0CB670   ;7E
  &scene_event_0CB695   ;7F
  &scene_event_0C8200   ;80
  &scene_event_0C8200   ;81
  &scene_event_0CB6C1   ;82
  &scene_event_0CB845   ;83
  &scene_event_0CB966   ;84
  &scene_event_0CB97D   ;85
  &scene_event_0CBB18   ;86
  &scene_event_0CBB87   ;87
  &scene_event_0CBC3B   ;88
  &scene_event_0CBD0A   ;89
  &scene_event_0CBD1A   ;8A
  &scene_event_0CBD41   ;8B
  &scene_event_0CBD5F   ;8C
  &scene_event_0CBD76   ;8D
  &scene_event_0CBD86   ;8E
  &scene_event_0CBDAB   ;8F
  &scene_event_0CBDBB   ;90
  &scene_event_0CBDC4   ;91
  &scene_event_0CBF65   ;92
  &scene_event_0CBF8A   ;93
  &scene_event_0CBFA8   ;94
  &scene_event_0CBFD6   ;95
  &scene_event_0CC012   ;96
  &scene_event_0CC048   ;97
  &scene_event_0CC07B   ;98
  &scene_event_0CC099   ;99
  &scene_event_0CC0BE   ;9A
  &scene_event_0CC0EA   ;9B
  &scene_event_0CC108   ;9C
  &scene_event_0CC12D   ;9D
  &scene_event_0C8200   ;9E
  &scene_event_0CC18A   ;9F
  &scene_event_0CC18C   ;A0
  &scene_event_0CC21C   ;A1
  &scene_event_0CC335   ;A2
  &scene_event_0CC3DF   ;A3
  &scene_event_0CC4F7   ;A4
  &scene_event_0CC5F8   ;A5
  &scene_event_0CC703   ;A6
  &scene_event_0CC7A1   ;A7
  &scene_event_0CC9A3   ;A8
  &scene_event_0CCA02   ;A9
  &scene_event_0C8200   ;AA
  &scene_event_0C8200   ;AB
  &scene_event_0CCA19   ;AC
  &scene_event_0CCAAE   ;AD
  &scene_event_0CCADA   ;AE
  &scene_event_0C8200   ;AF
  &scene_event_0CCB1B   ;B0
  &scene_event_0CCBD8   ;B1
  &scene_event_0CCCA5   ;B2
  &scene_event_0CCD26   ;B3
  &scene_event_0CCD83   ;B4
  &scene_event_0CCDD7   ;B5
  &scene_event_0CCE7B   ;B6
  &scene_event_0CD005   ;B7
  &scene_event_0CD092   ;B8
  &scene_event_0CD0DF   ;B9
  &scene_event_0CD137   ;BA
  &scene_event_0CD197   ;BB
  &scene_event_0CD1F4   ;BC
  &scene_event_0CD29A   ;BD
  &scene_event_0CD339   ;BE
  &scene_event_0CD392   ;BF
  &scene_event_0CD3A9   ;C0
  &scene_event_0C8200   ;C1
  &scene_event_0C8200   ;C2
  &scene_event_0CD3B2   ;C3
  &scene_event_0CD454   ;C4
  &scene_event_0CD479   ;C5
  &scene_event_0CD4B3   ;C6
  &scene_event_0CD4D1   ;C7
  &scene_event_0CD4FD   ;C8
  &scene_event_0CD51B   ;C9
  &scene_event_0C8200   ;CA
  &scene_event_0C8200   ;CB
  &scene_event_0CD539   ;CC
  &scene_event_0CD58C   ;CD
  &scene_event_0CD5C6   ;CE
  &scene_event_0CD650   ;CF
  &scene_event_0CD6F3   ;D0
  &scene_event_0CD752   ;D1
  &scene_event_0CD81B   ;D2
  &scene_event_0CD8F1   ;D3
  &scene_event_0CD9A1   ;D4
  &scene_event_0CDA80   ;D5
  &scene_event_0CDB4B   ;D6
  &scene_event_0CDC1E   ;D7
  &scene_event_0CDCFD   ;D8
  &scene_event_0CDE4F   ;D9
  &scene_event_0CDF3C   ;DA
  &scene_event_0CDF76   ;DB
  &scene_event_0CE010   ;DC
  &scene_event_0CDFBF   ;DD
  &scene_event_0CE027   ;DE
  &scene_event_0CE04C   ;DF
  &scene_event_0CE09B   ;E0
  &scene_event_0CE0EA   ;E1
  &scene_event_0CE116   ;E2
  &scene_event_0CE134   ;E3
  &scene_event_0CE16E   ;E4
  &scene_event_0CE193   ;E5
  &scene_event_0CE1DD   ;E6
  &scene_event_0CE202   ;E7
  &scene_event_0CE212   ;E8
  &scene_event_0CE224   ;E9
  &scene_event_0CE3A6   ;EA
  &scene_event_0CE3CD   ;EB
  &scene_event_0CE3EB   ;EC
  &scene_event_0CE409   ;ED
  &scene_event_0CE427   ;EE
  &scene_event_0CE445   ;EF
  &scene_event_0CE463   ;F0
  &scene_event_0CE538   ;F1
  &scene_event_0CE46C   ;F2
  &scene_event_0CE48C   ;F3
  &scene_event_0CE4AC   ;F4
  &scene_event_0CE4D5   ;F5
  &scene_event_0CE4F5   ;F6
  &scene_event_0CE1AA   ;F7
  &scene_event_0C8200   ;F8
  &scene_event_0C8200   ;F9
  &scene_event_0CE55B   ;FA
  &scene_event_0CE564   ;FB
  &scene_event_0CE56D   ;FC
  &scene_event_0CE57D   ;FD
  &scene_event_0CE5A9   ;FE
  &scene_event_0CE5B2   ;FF
]

scene_event_0C8200 [
  actor-spawn < #02, #09, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
]

scene_event_0C821F [
]

scene_event_0C8221 [
  actor-spawn < #39, #2F, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #30, #0E, #00, @town_door >   ;03
  actor-spawn < #39, #0E, #00, @town_door >   ;04
  actor-spawn < #32, #21, #00, @town_door >   ;05
  actor-spawn < #17, #25, #00, @town_door >   ;06
  actor-spawn < #22, #25, #00, @town_door >   ;07
  actor-spawn < #22, #1A, #30, @sc01_smoke >   ;08
  actor-spawn < #17, #1B, #30, @sc01_smoke >   ;09
  actor-spawn < #29, #1C, #30, @sc01_smoke >   ;0A
  actor-spawn < #35, #13, #30, @sc01_smoke >   ;0B
  actor-spawn < #39, #13, #30, @sc01_smoke >   ;0C
  actor-spawn < #3B, #04, #30, @sc01_smoke >   ;0D
  actor-spawn < #2E, #03, #30, @sc01_smoke >   ;0E
  actor-spawn < #00, #01, #00, @sc01_seagull >   ;0F
  actor-spawn < #00, #01, #00, @sc01_seagull >   ;10
  actor-spawn < #00, #01, #00, @sc01_seagull >   ;11
  actor-spawn < #17, #24, #00, @sc01_jar_door >   ;12
  actor-spawn < #33, #18, #00, @sc01_girl1 >   ;13
  actor-spawn < #39, #18, #00, @sc01_girl2 >   ;14
  actor-spawn < #3B, #17, #00, @sc01_girl3 >   ;15
  actor-spawn < #3D, #0F, #00, @sc01_salesman >   ;16
  actor-spawn < #16, #2F, #00, @sc01_fisherman >   ;17
  actor-spawn < #14, #07, #00, @sc01_roof_man >   ;18
  actor-spawn < #29, #08, #00, @sc01_guard >   ;19
  actor-spawn < #3B, #0F, #00, @sc01_worried_woman >   ;1A
  actor-spawn < #34, #24, #00, @sc01_startled_woman >   ;1B
  actor-spawn < #25, #28, #00, @sc01_astronomer >   ;1C
  actor-spawn < #1A, #26, #00, @sc01_sympathetic_woman >   ;1D
  actor-spawn < #13, #1D, #01, @jeweler_gem >   ;1E
  actor-spawn < #1D, #15, #00, @sc01_sprint_man >   ;1F
  actor-spawn < #00, #01, #00, @sc01_house_intro >   ;20
  actor-spawn < #1E, #06, #01, @dark_space.dark_space2 >   ;21
  actor-spawn < #00, #01, #00, @overworld_exit >   ;22
  actor-spawn < #18, #0C, #03, @hidden_red_jewel >   ;23
]

scene_event_0C8325 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #06, #0A, #00, @sc02_lance >   ;02
  actor-spawn < #09, #0A, #00, @sc02_seth >   ;03
  actor-spawn < #08, #12, #00, @sc02_erik >   ;04
  actor-spawn < #07, #0A, #00, @sc02_card >   ;05
  actor-spawn < #00, #01, #00, @sc02_entry >   ;06
]

scene_event_0C835E [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #06, #09, #00, @sc03_lances_mother >   ;03
  actor-spawn < #07, #18, #01, @hidden_red_jewel >   ;04
]

scene_event_0C8390 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #05, #19, #00, @sc04_poverty >   ;03
  actor-spawn < #19, #18, #00, @sc04_eriks_father >   ;04
  actor-spawn < #18, #09, #00, @sc04_eriks_mother >   ;05
]

scene_event_0C83C9 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #02, #0A, #00, @sc05_seths_mother >   ;03
  actor-spawn < #0D, #0A, #00, @sc05_seths_father >   ;04
]

scene_event_0C83FB [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #08, #0A, #00, @sc06_bill >   ;03
  actor-spawn < #08, #19, #00, @sc06_lola >   ;04
  actor-spawn < #03, #18, #00, @sc06_kara >   ;05
  actor-spawn < #08, #19, #00, @sc06_hamlet >   ;06
  actor-spawn < #05, #21, #00, @sc06_main_soldier >   ;07
  actor-spawn < #06, #21, #00, @sc06_wills_pet >   ;08
  actor-spawn < #00, #01, #00, @sc06_monologue >   ;09
  actor-spawn < #03, #07, #00, @sc06_lily >   ;0A
  actor-spawn < #05, #1D, #00, @sc06_kara_return >   ;0B
]

scene_event_0C845E [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #07, #0A, #00, @sc01_smoke >   ;03
  actor-spawn < #06, #0A, #00, @sc07_chef >   ;04
]

scene_event_0C8483 [
  actor-spawn < #09, #0B, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #0C, #08, #00, @sc08_priest >   ;03
  actor-spawn < #0B, #0B, #00, @sc08_lance >   ;04
  actor-spawn < #0F, #0B, #00, @sc08_seth >   ;05
  actor-spawn < #0D, #0B, #00, @sc08_erik >   ;06
]

scene_event_0C84BC [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #01, #82, #00, @visual_effect_pipeline.effect_position_update >   ;02
  actor-spawn < #00, #01, #00, @sE6_gaia >   ;03
]

scene_event_0C84DA [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #11, #00, @camera_scroll.ScrollCameraVertical >   ;02
  actor-spawn < #18, #2C, #00, @ec0A_left_guard >   ;03
  actor-spawn < #27, #2C, #00, @ec0A_right_guard >   ;04
  actor-spawn < #16, #27, #00, @ec0A_stair_guard >   ;05
  actor-spawn < #1D, #16, #00, @ec0A_edward >   ;06
  actor-spawn < #21, #16, #00, @ec0A_edwina >   ;07
  actor-spawn < #17, #18, #00, @ec0A_door_guard >   ;08
  actor-spawn < #1B, #1B, #00, @ec0A_throne_guards.ec0A_throne_guard1 >   ;09
  actor-spawn < #24, #1B, #00, @ec0A_throne_guards.ec0A_throne_guard2 >   ;0A
  actor-spawn < #09, #19, #00, @ec0A_bed_maid >   ;0B
  actor-spawn < #3A, #1C, #00, @ec0A_stair_maid >   ;0C
  actor-spawn < #35, #09, #00, @ec0A_shy_guard >   ;0D
  actor-spawn < #10, #0C, #00, @ec0A_kara_guard >   ;0E
  actor-spawn < #34, #09, #00, @ec0A_caring_maid >   ;0F
  actor-spawn < #07, #0A, #00, @ec0A_kara >   ;10
  actor-spawn < #30, #3C, #00, @ec0A_prison_guard >   ;11
  actor-spawn < #1C, #16, #00, @ec0A_null_actor >   ;12
  actor-spawn < #28, #3B, #00, @ec0A_barrel_roast >   ;13
  actor-spawn < #00, #01, #00, @overworld_exit >   ;14
  actor-spawn < #32, #35, #00, @ec0A_torch1 >   ;15
  actor-spawn < #33, #24, #00, @ec0A_torch1 >   ;16
  actor-spawn < #32, #25, #00, @ec0A_torch1 >   ;17
  actor-spawn < #12, #25, #00, @ec0A_torch1 >   ;18
  actor-spawn < #13, #24, #00, @ec0A_torch1 >   ;19
  actor-spawn < #02, #25, #00, @ec0A_torch1 >   ;1A
  actor-spawn < #03, #24, #00, @ec0A_torch1 >   ;1B
  actor-spawn < #32, #15, #00, @ec0A_torch1 >   ;1C
  actor-spawn < #33, #14, #00, @ec0A_torch1 >   ;1D
  actor-spawn < #33, #05, #00, @ec0A_torch1 >   ;1E
  actor-spawn < #3D, #35, #00, @ec0A_torch2 >   ;1F
  actor-spawn < #3D, #25, #00, @ec0A_torch2 >   ;20
  actor-spawn < #3C, #24, #00, @ec0A_torch2 >   ;21
  actor-spawn < #2D, #25, #00, @ec0A_torch2 >   ;22
  actor-spawn < #2C, #24, #00, @ec0A_torch2 >   ;23
  actor-spawn < #0D, #25, #00, @ec0A_torch2 >   ;24
  actor-spawn < #0C, #24, #00, @ec0A_torch2 >   ;25
  actor-spawn < #3D, #15, #00, @ec0A_torch2 >   ;26
  actor-spawn < #3C, #14, #00, @ec0A_torch2 >   ;27
  actor-spawn < #3D, #06, #00, @ec0A_torch2 >   ;28
  actor-spawn < #3C, #05, #00, @ec0A_torch2 >   ;29
]

scene_event_0C8612 [
  actor-spawn < #0A, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #0B, #20, #00, @ec0B_cell >   ;03
  actor-spawn < #02, #14, #00, @ec0B_guard >   ;04
  actor-spawn < #1A, #15, #01, @dark_space.dark_space2 >   ;05
  actor-spawn < #0D, #11, #00, @ec0B_door >   ;06
  actor-spawn < #0E, #11, #00, @ec0B_door >   ;07
  actor-spawn < #0F, #11, #00, @ec0B_door >   ;08
  actor-spawn < #10, #11, #00, @ec0B_door >   ;09
  actor-spawn < #12, #07, #00, @ec0B_moss >   ;0A
  actor-spawn < #0B, #0D, #00, @ec0B_moss >   ;0B
  actor-spawn < #0C, #08, #00, @ec0B_ball >   ;0C
]

scene_event_0C867A [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #0B, #09, #00, @ec0C_bat, #05, #01, #00 >   ;02
  enemy-spawn < #11, #0A, #00, @ec0C_bat, #05, #02, #00 >   ;03
  enemy-spawn < #19, #07, #00, @ec0C_bat, #05, #03, #00 >   ;04
  actor-spawn < #00, #01, #00, @ec0C_force_hint >   ;05
]

scene_event_0C86AC [
  actor-spawn < #0A, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #12, #22, #00, @ec0D_canal_worm, #02, #04, #01 >   ;03
  enemy-spawn < #15, #2D, #00, @ec0D_canal_worm, #02, #05, #00 >   ;04
  enemy-spawn < #0C, #3D, #00, @ec0D_canal_worm, #02, #06, #02 >   ;05
  enemy-spawn < #09, #0B, #00, @ec0C_bat, #05, #07, #00 >   ;06
  enemy-spawn < #03, #1B, #00, @ec0C_bat, #05, #08, #00 >   ;07
  enemy-spawn < #01, #22, #00, @ec0C_bat, #05, #09, #00 >   ;08
  enemy-spawn < #0A, #22, #00, @ec0C_bat, #05, #0A, #00 >   ;09
  enemy-spawn < #1B, #18, #00, @ec0C_bat, #05, #0B, #00 >   ;0A
  enemy-spawn < #16, #1C, #00, @ec0C_bat, #05, #0C, #00 >   ;0B
  enemy-spawn < #16, #3B, #00, @ec0C_bat, #05, #0D, #00 >   ;0C
  enemy-spawn < #1C, #38, #00, @ec0C_bat, #05, #0E, #00 >   ;0D
  enemy-spawn < #09, #3A, #00, @ec0C_bat, #05, #0F, #00 >   ;0E
  enemy-spawn < #02, #3B, #00, @ec0C_bat, #05, #10, #00 >   ;0F
  enemy-spawn < #18, #23, #00, @ec0C_ribber, #01, #11, #00 >   ;10
  enemy-spawn < #0D, #32, #00, @ec0C_ribber, #01, #12, #00 >   ;11
]

scene_event_0C875C [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #2B, #10, #00, @ec0D_canal_worm, #02, #13, #00 >   ;03
  enemy-spawn < #1F, #1B, #00, @ec0D_canal_worm, #02, #14, #00 >   ;04
  enemy-spawn < #11, #15, #00, @ec0D_canal_worm, #02, #15, #00 >   ;05
  enemy-spawn < #08, #0B, #00, @ec0D_canal_worm, #02, #16, #03 >   ;06
  enemy-spawn < #37, #04, #00, @ec0C_bat, #05, #17, #00 >   ;07
  enemy-spawn < #3D, #07, #00, @ec0C_bat, #05, #18, #00 >   ;08
  enemy-spawn < #34, #1E, #00, @ec0C_bat, #05, #19, #00 >   ;09
  enemy-spawn < #3B, #17, #00, @ec0C_bat, #05, #1A, #00 >   ;0A
  enemy-spawn < #28, #0F, #00, @ec0C_bat, #05, #1B, #00 >   ;0B
  enemy-spawn < #1F, #09, #00, @ec0C_bat, #05, #1C, #00 >   ;0C
  enemy-spawn < #0C, #10, #00, @ec0C_bat, #05, #1D, #00 >   ;0D
  enemy-spawn < #37, #1A, #00, @ec0C_ribber, #01, #1E, #00 >   ;0E
  enemy-spawn < #10, #04, #00, @ec0C_ribber, #01, #1F, #00 >   ;0F
  enemy-spawn < #19, #1C, #00, @ec0C_ribber, #01, #21, #00 >   ;10
  enemy-spawn < #06, #08, #00, @ec0C_ribber, #01, #22, #00 >   ;11
  actor-spawn < #3D, #11, #00, @ec0E_statue >   ;12
  actor-spawn < #3E, #11, #00, @ec0E_statue >   ;13
  actor-spawn < #17, #18, #00, @ec0E_switch >   ;14
  actor-spawn < #14, #15, #00, @ec0E_barrier >   ;15
  actor-spawn < #15, #15, #00, @ec0E_barrier.ec0E_barrier2 >   ;16
  actor-spawn < #16, #1C, #00, @ec0E_barrier.ec0E_barrier3 >   ;17
  actor-spawn < #16, #1D, #00, @ec0E_barrier.ec0E_barrier4 >   ;18
  actor-spawn < #06, #1B, #00, @ec0E_spiney >   ;19
  actor-spawn < #27, #16, #00, @ec0E_spiney >   ;1A
  actor-spawn < #23, #17, #80, @ec0E_spiney >   ;1B
  actor-spawn < #3D, #0E, #00, @ec0E_lily >   ;1C
]

scene_event_0C8847 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #14, #5B, #00, @ec0D_canal_worm, #02, #23, #00 >   ;03
  enemy-spawn < #0B, #5B, #00, @ec0D_canal_worm, #02, #24, #00 >   ;04
  enemy-spawn < #0A, #23, #00, @ec0C_bat, #05, #25, #00 >   ;05
  enemy-spawn < #0E, #1F, #00, @ec0C_bat, #05, #26, #00 >   ;06
  enemy-spawn < #0B, #1A, #00, @ec0C_bat, #05, #27, #00 >   ;07
  enemy-spawn < #0A, #30, #00, @ec0C_bat, #05, #28, #00 >   ;08
  enemy-spawn < #15, #45, #00, @ec0C_ribber, #01, #29, #00 >   ;09
  enemy-spawn < #15, #22, #00, @ec0C_ribber, #01, #2A, #00 >   ;0A
  enemy-spawn < #0F, #07, #00, @ec0F_king_bat, #03, #2B, #05 >   ;0B
  enemy-spawn < #11, #07, #00, @ec0F_king_bat.ec0F_sub_bat1, #04, #2C, #00 >   ;0C
  enemy-spawn < #0D, #07, #00, @ec0F_king_bat.ec0F_sub_bat2, #04, #2D, #00 >   ;0D
  enemy-spawn < #13, #07, #00, @ec0F_king_bat.ec0F_sub_bat3, #04, #2E, #00 >   ;0E
  enemy-spawn < #0B, #07, #00, @ec0F_king_bat.ec0F_sub_bat4, #04, #2F, #00 >   ;0F
  actor-spawn < #0A, #31, #00, @ec0F_spear >   ;10
  actor-spawn < #15, #31, #00, @ec0F_spear >   ;11
  actor-spawn < #0E, #4C, #00, @ec0F_spear.ec0F_spear2 >   ;12
  actor-spawn < #15, #4A, #00, @ec0F_spear.ec0F_spear2 >   ;13
  actor-spawn < #11, #47, #00, @ec0F_spear.ec0F_spear2 >   ;14
  actor-spawn < #10, #48, #00, @ec0F_spear.ec0F_spear2 >   ;15
  actor-spawn < #0F, #49, #00, @ec0F_spear.ec0F_spear2 >   ;16
  actor-spawn < #09, #46, #00, @ec0F_spear.ec0F_spear2 >   ;17
  actor-spawn < #0A, #46, #00, @ec0F_spear.ec0F_spear2 >   ;18
  actor-spawn < #15, #2B, #00, @ec0F_rusty_switch >   ;19
  actor-spawn < #13, #32, #40, @ec0E_spiney >   ;1A
  actor-spawn < #0D, #32, #40, @ec0E_spiney >   ;1B
  actor-spawn < #09, #39, #00, @ec0E_spiney >   ;1C
  actor-spawn < #16, #2E, #80, @ec0E_spiney >   ;1D
]

scene_event_0C8935 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #02, #06, #00, @ec10_dp_hint_spirit >   ;02
]

scene_event_0C894C [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #04, #05, #00, @ec11_flower >   ;03
  actor-spawn < #03, #07, #00, @ec11_aqueduct_blocker >   ;04
  actor-spawn < #1C, #07, #00, @ec11_button_voice >   ;05
  actor-spawn < #1C, #07, #00, @ec11_countdown >   ;06
  actor-spawn < #0B, #0B, #00, @ec11_aqueduct_gate_sprite >   ;07
]

scene_event_0C8986 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #15, #5A, #00, @ec0D_canal_worm, #02, #30, #00 >   ;03
  enemy-spawn < #21, #5A, #00, @ec0D_canal_worm, #02, #31, #00 >   ;04
  enemy-spawn < #0F, #4D, #00, @ec0D_canal_worm, #02, #32, #00 >   ;05
  enemy-spawn < #0F, #4B, #00, @ec0D_canal_worm, #02, #33, #00 >   ;06
  enemy-spawn < #05, #4D, #00, @ec0D_canal_worm, #02, #34, #00 >   ;07
  enemy-spawn < #05, #4B, #00, @ec0D_canal_worm, #02, #35, #16 >   ;08
  enemy-spawn < #0A, #18, #00, @ec0D_canal_worm, #02, #36, #00 >   ;09
  enemy-spawn < #1B, #56, #00, @ec0C_bat, #05, #37, #00 >   ;0A
  enemy-spawn < #0B, #56, #00, @ec0C_bat, #05, #38, #00 >   ;0B
  enemy-spawn < #28, #4C, #00, @ec0C_bat, #05, #39, #00 >   ;0C
  enemy-spawn < #02, #0C, #00, @ec0C_bat, #05, #3A, #00 >   ;0D
  enemy-spawn < #02, #03, #00, @ec0C_bat, #05, #3B, #00 >   ;0E
  enemy-spawn < #08, #03, #00, @ec0C_bat, #05, #3C, #00 >   ;0F
  enemy-spawn < #0B, #06, #00, @ec0C_bat, #05, #3D, #00 >   ;10
  enemy-spawn < #15, #56, #00, @ec0C_ribber, #01, #3E, #00 >   ;11
  enemy-spawn < #27, #39, #00, @ec0C_ribber, #01, #3F, #00 >   ;12
  enemy-spawn < #06, #23, #00, @ec0C_ribber, #01, #40, #00 >   ;13
  enemy-spawn < #05, #21, #00, @ec0C_ribber, #01, #41, #00 >   ;14
  enemy-spawn < #11, #21, #00, @ec0C_ribber, #01, #42, #00 >   ;15
  enemy-spawn < #12, #15, #00, @ec0C_ribber, #01, #43, #00 >   ;16
  enemy-spawn < #03, #3A, #00, @ec12_skull_chaser, #10, #44, #17 >   ;17
  enemy-spawn < #27, #13, #00, @ec12_skull_chaser, #10, #45, #18 >   ;18
  actor-spawn < #16, #3E, #40, @ec0E_spiney >   ;19
  actor-spawn < #19, #3B, #C0, @ec0E_spiney >   ;1A
  actor-spawn < #11, #38, #80, @ec0E_spiney >   ;1B
  actor-spawn < #1E, #39, #00, @ec0E_spiney >   ;1C
  actor-spawn < #1B, #12, #80, @ec0E_spiney >   ;1D
  actor-spawn < #1E, #15, #40, @ec0E_spiney >   ;1E
  actor-spawn < #20, #12, #00, @ec0E_spiney >   ;1F
  actor-spawn < #1D, #0F, #C0, @ec0E_spiney >   ;20
  actor-spawn < #2B, #56, #00, @ec12_aqueduct_enemy >   ;21
  actor-spawn < #00, #01, #00, @ec12_aqueduct_dark_space >   ;22
]

scene_event_0C8AA9 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #07, #08, #00, @ec13_lily >   ;02
  actor-spawn < #0D, #18, #05, @hidden_red_jewel >   ;03
]

scene_event_0C8AC7 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
]

scene_event_0C8AD7 [
  actor-spawn < #2D, #2B, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #21, #00, #00, @camera_scroll.ScrollCameraVertical >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #4C, #10, #00, @it15_running_man >   ;04
  actor-spawn < #43, #0E, #00, @it15_fable_man >   ;05
  actor-spawn < #44, #0E, #00, @it15_fable_woman >   ;06
  actor-spawn < #3D, #2B, #00, @it15_friendly_woman >   ;07
  actor-spawn < #2E, #36, #00, @it15_lily >   ;08
  actor-spawn < #2D, #36, #00, @it15_kara >   ;09
  actor-spawn < #0A, #18, #00, @it15_elder >   ;0A
  actor-spawn < #46, #27, #00, @it15_lola >   ;0B
  actor-spawn < #47, #27, #00, @it15_bill >   ;0C
  actor-spawn < #43, #08, #05, @dark_space.dark_space2 >   ;0D
  actor-spawn < #00, #01, #00, @overworld_exit >   ;0E
  actor-spawn < #30, #19, #01, @ramps.ramp_east >   ;0F
  actor-spawn < #0F, #25, #01, @ramps.ramp_west >   ;10
  actor-spawn < #25, #28, #07, @hidden_red_jewel >   ;11
]

scene_event_0C8B64 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #04, #09, #00, @it16_song_woman >   ;02
]

scene_event_0C8B7B [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #06, #0D, #00, @it17_kara >   ;02
  actor-spawn < #08, #0B, #00, @it17_lily >   ;03
]

scene_event_0C8BA0 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #09, #0A, #00, @it18_warning_man >   ;02
  actor-spawn < #0B, #0B, #00, @it18_warning_woman >   ;03
]

scene_event_0C8BBE [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #07, #29, #00, @it19_inca_statue_a >   ;02
  actor-spawn < #09, #07, #00, @it19_breakable_wall >   ;03
]

scene_event_0C8BDC [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #21, #00, #00, @camera_scroll.ScrollCameraVertical >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #16, #1B, #00, @it1A_lily >   ;04
  actor-spawn < #0F, #0B, #00, @it1A_moon_tribe >   ;05
  actor-spawn < #0C, #07, #00, @it1A_moon_tribe.it1A_moon_tribe2 >   ;06
  actor-spawn < #11, #09, #00, @it1A_moon_tribe.it1A_moon_tribe3 >   ;07
  actor-spawn < #17, #0D, #00, @it1A_moon_tribe.it1A_moon_tribe4 >   ;08
  actor-spawn < #0B, #12, #00, @it1A_moon_tribe.it1A_moon_tribe5 >   ;09
]

scene_event_0C8C33 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @it1B_trial >   ;02
  actor-spawn < #0F, #10, #00, @it1B_inca_statue_b >   ;03
  enemy-spawn < #09, #0B, #00, @ir1B_slugger, #0B, #00, #00 >   ;04
  enemy-spawn < #0C, #0B, #00, @ir1B_slugger, #0B, #00, #00 >   ;05
  enemy-spawn < #0F, #0B, #00, @ir1B_slugger, #0B, #00, #00 >   ;06
  enemy-spawn < #12, #0B, #00, @ir1B_slugger, #0B, #00, #00 >   ;07
  enemy-spawn < #15, #0B, #00, @ir1B_slugger, #0B, #00, #00 >   ;08
  enemy-spawn < #18, #0B, #00, @ir1B_slugger, #0B, #00, #00 >   ;09
]

scene_event_0C8C87 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #21, #00, #00, @camera_scroll.ScrollCameraVertical >   ;02
  actor-spawn < #06, #17, #00, @ir1C_lily >   ;03
  actor-spawn < #18, #16, #00, @ir1C_kara >   ;04
  actor-spawn < #00, #01, #00, @overworld_exit >   ;05
]

scene_event_0C8CC4 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #11, #00, @camera_scroll.ScrollCameraVertical >   ;02
  actor-spawn < #00, #01, #00, @ir1D_monologue >   ;03
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;04
  actor-spawn < #00, #01, #00, @ir1D_wind_melody >   ;05
  enemy-spawn < #22, #19, #00, @ir1D_mudpit, #0A, #01, #00 >   ;06
  enemy-spawn < #28, #1C, #00, @ir1D_mudpit, #0A, #02, #00 >   ;07
  enemy-spawn < #29, #32, #00, @ir1D_mudpit, #0A, #03, #00 >   ;08
  enemy-spawn < #14, #43, #00, @ir1D_mudpit, #0A, #04, #00 >   ;09
  enemy-spawn < #17, #47, #00, @ir1D_mudpit, #0A, #05, #00 >   ;0A
  enemy-spawn < #12, #18, #00, @ir1D_four_way, #0C, #06, #00 >   ;0B
  enemy-spawn < #10, #2A, #00, @ir1D_four_way, #0C, #07, #0D >   ;0C
  enemy-spawn < #2C, #3F, #00, @ir1D_four_way, #0C, #08, #0E >   ;0D
  enemy-spawn < #0A, #45, #00, @ir1D_four_way, #0C, #09, #00 >   ;0E
  enemy-spawn < #07, #4C, #00, @ir1D_four_way, #0C, #0A, #00 >   ;0F
  enemy-spawn < #2D, #19, #00, @ir1D_four_way, #0C, #0B, #0F >   ;10
  enemy-spawn < #09, #3A, #00, @ir1D_scuttlebug, #0B, #0C, #00 >   ;11
  enemy-spawn < #03, #3D, #00, @ir1D_scuttlebug, #0B, #0D, #00 >   ;12
  enemy-spawn < #17, #41, #00, @ir1D_scuttlebug, #0B, #0E, #00 >   ;13
  enemy-spawn < #14, #48, #00, @ir1D_scuttlebug, #0B, #0F, #00 >   ;14
  actor-spawn < #02, #3E, #00, @ir1D_bones >   ;15
]

scene_event_0C8D85 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @ir1E_cliff_slide_trigger >   ;03
  actor-spawn < #37, #14, #00, @ir1E_cliff_mantel_a >   ;04
  actor-spawn < #26, #17, #00, @ir1E_cliff_mantel_b >   ;05
  actor-spawn < #19, #12, #03, @ramps.ramp_east >   ;06
  actor-spawn < #2C, #05, #03, @dark_space.dark_space2 >   ;07
]

scene_event_0C8DBF [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #05, #0F, #00, @ir1F_stone_lord.ir1F_stone_lord4, #0D, #00, #00 >   ;02
  enemy-spawn < #05, #15, #00, @ir1F_stone_lord.ir1F_stone_lord4, #0D, #00, #00 >   ;03
  enemy-spawn < #1A, #0F, #00, @ir1F_stone_lord.ir1F_stone_lord3, #0D, #00, #00 >   ;04
  enemy-spawn < #1A, #15, #00, @ir1F_stone_lord.ir1F_stone_lord3, #0D, #00, #00 >   ;05
  actor-spawn < #08, #0C, #03, @ir1F_gold_tile >   ;06
  actor-spawn < #0C, #0C, #05, @ir1F_gold_tile >   ;07
  actor-spawn < #12, #0C, #07, @ir1F_gold_tile >   ;08
  actor-spawn < #16, #0C, #09, @ir1F_gold_tile >   ;09
  actor-spawn < #00, #01, #00, @ir1F_plate_gate_opener >   ;0A
]

scene_event_0C8E16 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #1B, #06, #00, @ir1D_mudpit, #0A, #10, #00 >   ;02
  enemy-spawn < #18, #0C, #00, @ir1D_four_way, #0C, #11, #00 >   ;03
  enemy-spawn < #1C, #0C, #00, @ir1D_four_way, #0C, #12, #00 >   ;04
  enemy-spawn < #18, #16, #00, @ir1D_four_way, #0C, #13, #00 >   ;05
  enemy-spawn < #1C, #16, #00, @ir1D_four_way, #0C, #14, #00 >   ;06
  enemy-spawn < #03, #0B, #00, @ir1B_slugger, #0B, #15, #00 >   ;07
  enemy-spawn < #03, #18, #00, @ir1B_slugger, #0B, #16, #00 >   ;08
  enemy-spawn < #05, #11, #00, @ir1B_slugger, #0B, #17, #00 >   ;09
  actor-spawn < #07, #17, #00, @ir20_statue >   ;0A
]

scene_event_0C8E75 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #25, #15, #0B, @ramps.ramp_south >   ;02
  actor-spawn < #25, #1A, #03, @ramps.ramp_north >   ;03
  actor-spawn < #3C, #3C, #00, @ir21_switch >   ;04
  enemy-spawn < #18, #05, #00, @ir1F_stone_guard.ir1F_stone_guard1, #0D, #18, #00 >   ;05
  enemy-spawn < #21, #05, #00, @ir1F_stone_guard.ir1F_stone_guard1, #0D, #19, #00 >   ;06
  enemy-spawn < #2A, #05, #00, @ir1F_stone_guard.ir1F_stone_guard1, #0D, #1A, #00 >   ;07
  enemy-spawn < #05, #19, #00, @ir1F_stone_lord.ir1F_stone_lord4, #0D, #1B, #00 >   ;08
  enemy-spawn < #02, #2C, #00, @ir1F_stone_guard.ir1F_stone_guard4, #0D, #1C, #00 >   ;09
  enemy-spawn < #07, #2C, #00, @ir1F_stone_guard.ir1F_stone_guard3, #0D, #1D, #00 >   ;0A
  enemy-spawn < #1F, #3A, #10, @ir1F_stone_lord, #0D, #1E, #00 >   ;0B
  enemy-spawn < #27, #3A, #10, @ir1F_stone_lord, #0D, #1F, #00 >   ;0C
  enemy-spawn < #2F, #3A, #10, @ir1F_stone_guard.ir1F_stone_guard1, #0D, #20, #00 >   ;0D
  enemy-spawn < #37, #3A, #10, @ir1F_stone_guard.ir1F_stone_guard1, #0D, #21, #00 >   ;0E
  enemy-spawn < #3B, #25, #00, @ir21_splop, #0F, #22, #00 >   ;0F
  enemy-spawn < #3B, #29, #00, @ir21_splop, #0F, #23, #00 >   ;10
  enemy-spawn < #3B, #2E, #00, @ir21_splop, #0F, #24, #00 >   ;11
  enemy-spawn < #1F, #2D, #00, @ir21_splop, #0F, #25, #00 >   ;12
  enemy-spawn < #1F, #32, #00, @ir21_splop, #0F, #26, #00 >   ;13
  enemy-spawn < #03, #36, #00, @ir21_splop, #0F, #27, #00 >   ;14
  enemy-spawn < #05, #3B, #00, @ir21_splop, #0F, #28, #00 >   ;15
  enemy-spawn < #36, #09, #00, @ir21_whirligig, #0E, #29, #00 >   ;16
  enemy-spawn < #05, #22, #00, @ir21_whirligig, #0E, #2A, #00 >   ;17
  enemy-spawn < #23, #2F, #00, @ir21_whirligig, #0E, #2B, #00 >   ;18
  enemy-spawn < #29, #11, #00, @ir21_frozen_whirligig, #0E, #2C, #0C >   ;19
]

scene_event_0C8F57 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #22, #19, #00, @ir1F_stone_guard.ir1F_stone_guard1, #0D, #2D, #00 >   ;02
  enemy-spawn < #1A, #19, #00, @ir1F_stone_guard.ir1F_stone_guard1, #0D, #2E, #00 >   ;03
  actor-spawn < #0A, #1E, #00, @ir21_switch >   ;04
  enemy-spawn < #0A, #1A, #10, @ir1F_stone_lord, #0D, #2F, #00 >   ;05
  enemy-spawn < #0A, #23, #10, @ir1F_stone_lord.ir1F_stone_lord2, #0D, #30, #00 >   ;06
  enemy-spawn < #0E, #1E, #10, @ir1F_stone_lord.ir1F_stone_lord3, #0D, #31, #00 >   ;07
  enemy-spawn < #06, #1E, #10, @ir1F_stone_lord.ir1F_stone_lord4, #0D, #32, #00 >   ;08
  enemy-spawn < #11, #2C, #00, @ir21_splop, #0F, #33, #00 >   ;09
  enemy-spawn < #0E, #2F, #00, @ir21_splop, #0F, #34, #00 >   ;0A
  enemy-spawn < #14, #2F, #00, @ir21_splop, #0F, #35, #00 >   ;0B
  enemy-spawn < #26, #20, #00, @ir21_splop, #0F, #36, #00 >   ;0C
  enemy-spawn < #26, #1D, #00, @ir21_splop, #0F, #37, #00 >   ;0D
  enemy-spawn < #1E, #09, #00, @ir21_splop, #0F, #38, #00 >   ;0E
  enemy-spawn < #1E, #0A, #00, @ir21_splop, #0F, #39, #00 >   ;0F
  enemy-spawn < #1E, #0B, #00, @ir21_splop, #0F, #3A, #00 >   ;10
  enemy-spawn < #1E, #0C, #00, @ir21_splop, #0F, #3B, #00 >   ;11
  enemy-spawn < #33, #1F, #00, @ir21_splop, #0F, #3C, #00 >   ;12
  enemy-spawn < #2F, #1A, #00, @ir21_whirligig, #0E, #3D, #00 >   ;13
  enemy-spawn < #37, #1A, #00, @ir21_whirligig, #0E, #3E, #00 >   ;14
  enemy-spawn < #2F, #20, #00, @ir21_whirligig, #0E, #3F, #00 >   ;15
  enemy-spawn < #37, #20, #00, @ir21_whirligig, #0E, #40, #00 >   ;16
  actor-spawn < #10, #0B, #00, @large_ramps.large_ramp_booster >   ;17
]

scene_event_0C9029 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #21, #21, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #29, #15, #03, @ramps.ramp_east >   ;03
  actor-spawn < #1C, #15, #03, @ramps.ramp_west >   ;04
  enemy-spawn < #35, #07, #00, @ir21_splop, #0F, #41, #00 >   ;05
  enemy-spawn < #39, #0C, #00, @ir21_splop, #0F, #42, #00 >   ;06
  enemy-spawn < #3B, #12, #00, @ir21_splop, #0F, #43, #00 >   ;07
  enemy-spawn < #35, #22, #00, @ir21_splop, #0F, #44, #00 >   ;08
  enemy-spawn < #39, #28, #00, @ir21_splop, #0F, #45, #00 >   ;09
  enemy-spawn < #24, #22, #00, @ir21_splop, #0F, #46, #00 >   ;0A
  enemy-spawn < #1D, #23, #00, @ir21_splop, #0F, #47, #00 >   ;0B
  enemy-spawn < #18, #22, #00, @ir21_splop, #0F, #48, #00 >   ;0C
  enemy-spawn < #0D, #26, #00, @ir21_splop, #0F, #49, #00 >   ;0D
  enemy-spawn < #07, #2B, #00, @ir21_splop, #0F, #4A, #00 >   ;0E
  enemy-spawn < #09, #0A, #00, @ir21_splop, #0F, #4B, #00 >   ;0F
  enemy-spawn < #03, #0B, #00, @ir21_splop, #0F, #4C, #00 >   ;10
  enemy-spawn < #37, #24, #00, @ir21_whirligig, #0E, #4D, #00 >   ;11
  enemy-spawn < #06, #08, #00, @ir21_whirligig, #0E, #4E, #00 >   ;12
  enemy-spawn < #2B, #1C, #00, @ir21_frozen_whirligig, #0E, #4F, #0B >   ;13
]

scene_event_0C90D5 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @ir24_glowing_tile >   ;03
]

scene_event_0C90F3 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #08, #1A, #00, @ir25_ceiling_tile >   ;02
  actor-spawn < #08, #1C, #00, @ir25_ceiling_tile >   ;03
  actor-spawn < #08, #1E, #00, @ir25_ceiling_tile >   ;04
  actor-spawn < #0A, #1A, #00, @ir25_ceiling_tile >   ;05
  actor-spawn < #0A, #1C, #00, @ir25_ceiling_tile >   ;06
  actor-spawn < #0A, #1E, #00, @ir25_ceiling_tile >   ;07
  actor-spawn < #0E, #1C, #00, @ir25_block_slot >   ;08
  enemy-spawn < #03, #1D, #00, @ir1D_mudpit, #0A, #50, #00 >   ;09
  enemy-spawn < #09, #17, #00, @ir1D_mudpit, #0A, #51, #00 >   ;0A
  enemy-spawn < #24, #17, #00, @ir1D_mudpit, #0A, #53, #00 >   ;0B
  enemy-spawn < #26, #1C, #00, @ir1D_mudpit, #0A, #54, #00 >   ;0C
  enemy-spawn < #2B, #14, #00, @ir1D_mudpit, #0A, #55, #00 >   ;0D
  enemy-spawn < #2C, #11, #00, @ir1D_mudpit, #0A, #56, #00 >   ;0E
  enemy-spawn < #24, #06, #00, @ir1D_mudpit, #0A, #57, #00 >   ;0F
  enemy-spawn < #15, #06, #00, @ir1D_mudpit, #0A, #59, #00 >   ;10
  enemy-spawn < #26, #09, #00, @ir1D_four_way, #0C, #5A, #00 >   ;11
  enemy-spawn < #0B, #13, #00, @ir1D_four_way, #0C, #5B, #00 >   ;12
  enemy-spawn < #07, #13, #00, @ir1D_four_way, #0C, #5C, #00 >   ;13
  enemy-spawn < #0E, #1C, #00, @ir1D_four_way, #0C, #5D, #00 >   ;14
]

scene_event_0C91A0 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #0E, #05, #00, @ir1D_mudpit, #0A, #5E, #00 >   ;02
  enemy-spawn < #0D, #07, #00, @ir1D_mudpit, #0A, #5F, #00 >   ;03
  enemy-spawn < #1A, #2C, #00, @ir1D_mudpit, #0A, #61, #00 >   ;04
  enemy-spawn < #15, #2A, #00, @ir1D_mudpit, #0A, #62, #00 >   ;05
  enemy-spawn < #02, #12, #00, @ir1B_slugger, #0B, #63, #00 >   ;06
  enemy-spawn < #03, #12, #00, @ir1B_slugger, #0B, #64, #00 >   ;07
  enemy-spawn < #0A, #1C, #00, @ir1D_scuttlebug, #0B, #65, #00 >   ;08
  enemy-spawn < #0B, #1C, #00, @ir1D_scuttlebug, #0B, #66, #00 >   ;09
  enemy-spawn < #0C, #1C, #00, @ir1D_scuttlebug, #0B, #67, #00 >   ;0A
  enemy-spawn < #0D, #1C, #00, @ir1D_scuttlebug, #0B, #68, #00 >   ;0B
  actor-spawn < #13, #1D, #00, @ir26_statue >   ;0C
  actor-spawn < #18, #1E, #00, @ir26_statue >   ;0D
  actor-spawn < #1D, #20, #00, @ir26_statue >   ;0E
  actor-spawn < #19, #21, #00, @ir26_statue >   ;0F
  actor-spawn < #1A, #21, #00, @ir26_statue >   ;10
  actor-spawn < #11, #28, #00, @ir26_bones >   ;11
  actor-spawn < #11, #16, #00, @ir26_journal_bones >   ;12
  actor-spawn < #1C, #14, #03, @dark_space.dark_space2 >   ;13
]

scene_event_0C9242 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #21, #21, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #38, #09, #00, @ir1D_mudpit, #0A, #6C, #00 >   ;03
  enemy-spawn < #27, #07, #00, @ir1D_mudpit, #0A, #6D, #00 >   ;04
  enemy-spawn < #02, #10, #00, @ir1D_mudpit, #0A, #6E, #00 >   ;05
  enemy-spawn < #02, #16, #00, @ir1D_mudpit, #0A, #70, #00 >   ;06
  enemy-spawn < #2A, #08, #00, @ir1D_four_way, #0C, #71, #00 >   ;07
  enemy-spawn < #24, #06, #00, @ir1D_four_way, #0C, #72, #00 >   ;08
  enemy-spawn < #12, #08, #00, @ir1D_four_way, #0C, #73, #00 >   ;09
  enemy-spawn < #0C, #06, #00, @ir1D_four_way, #0C, #74, #00 >   ;0A
  enemy-spawn < #06, #08, #00, @ir1D_four_way, #0C, #75, #00 >   ;0B
  enemy-spawn < #06, #1C, #00, @ir1D_four_way, #0C, #76, #00 >   ;0C
  enemy-spawn < #0C, #1D, #00, @ir1D_four_way, #0C, #77, #00 >   ;0D
  enemy-spawn < #19, #1C, #00, @ir1D_four_way, #0C, #78, #0A >   ;0E
  enemy-spawn < #23, #1B, #00, @ir1B_slugger, #0B, #79, #00 >   ;0F
  enemy-spawn < #26, #13, #00, @ir1B_slugger, #0B, #7A, #00 >   ;10
  enemy-spawn < #2C, #10, #00, @ir1B_slugger, #0B, #7B, #00 >   ;11
  enemy-spawn < #2D, #18, #00, @ir1B_slugger, #0B, #7D, #00 >   ;12
  enemy-spawn < #33, #1C, #00, @ir1B_slugger, #0B, #7E, #00 >   ;13
]

scene_event_0C92F2 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #08, #03, @dark_space.dark_space2 >   ;02
  enemy-spawn < #13, #17, #00, @ir1D_scuttlebug, #0B, #7F, #00 >   ;03
  enemy-spawn < #0C, #24, #00, @ir1D_scuttlebug, #0B, #80, #00 >   ;04
  enemy-spawn < #11, #27, #00, @ir1D_scuttlebug, #0B, #81, #00 >   ;05
  enemy-spawn < #04, #10, #00, @ir1D_four_way, #0C, #82, #00 >   ;06
  enemy-spawn < #02, #1A, #00, @ir1D_four_way, #0C, #83, #00 >   ;07
  enemy-spawn < #04, #24, #00, @ir1D_four_way, #0C, #84, #10 >   ;08
  enemy-spawn < #12, #12, #00, @ir1D_four_way, #0C, #85, #00 >   ;09
  enemy-spawn < #0E, #18, #00, @ir1D_four_way, #0C, #86, #00 >   ;0A
  actor-spawn < #00, #01, #00, @ir28_ceiling_trap_trigger >   ;0B
  actor-spawn < #1B, #13, #00, @ir28_bones >   ;0C
]

scene_event_0C935F [
  actor-spawn < #0D, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #0F, #11, #00, @ir29_castoth.ir29_castoth, #14, #88, #00 >   ;03
  actor-spawn < #00, #01, #00, @ir29_transform >   ;04
  actor-spawn < #00, #01, #01, @boss_clear_reward_handler >   ;05
]

scene_event_0C938D [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #08, #19, #00, @gs2A_shira >   ;03
  actor-spawn < #00, #01, #01, @dream_zoom_controller >   ;04
]

scene_event_0C93B2 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @gs2B_wreck_wave_motion >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #20, #20, #00, @gs2B_bones >   ;04
  actor-spawn < #25, #22, #00, @gs2B_bones >   ;05
  actor-spawn < #22, #22, #00, @gs2B_bones >   ;06
  actor-spawn < #16, #25, #00, @gs2B_bones >   ;07
  actor-spawn < #14, #0B, #00, @gs2B_bones >   ;08
  actor-spawn < #18, #20, #00, @gs2B_erik >   ;09
  actor-spawn < #0B, #24, #00, @gs2B_seth >   ;0A
]

scene_event_0C9401 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @gs2B_wreck_wave_motion >   ;02
  actor-spawn < #00, #01, #00, @gs2C_rain_spawner >   ;03
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;04
  actor-spawn < #00, #01, #00, @gs2C_descent >   ;05
  actor-spawn < #20, #20, #00, @gs2C_crew1 >   ;06
  actor-spawn < #25, #22, #00, @gs2C_crew2 >   ;07
  actor-spawn < #22, #22, #00, @gs2C_crew3 >   ;08
  actor-spawn < #1B, #26, #00, @gs2C_crew4 >   ;09
  actor-spawn < #15, #25, #00, @gs2C_crew5 >   ;0A
  actor-spawn < #14, #0B, #00, @gs2C_crow_crew >   ;0B
  actor-spawn < #11, #27, #00, @gs2C_rain_particle >   ;0C
]

scene_event_0C945E [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @gs2B_wreck_wave_motion >   ;02
  actor-spawn < #08, #0B, #00, @gs2B_bones >   ;03
  actor-spawn < #18, #09, #00, @gs2B_bones >   ;04
  actor-spawn < #2D, #0C, #00, @gs2B_bones >   ;05
  actor-spawn < #24, #1D, #00, @gs2B_bones >   ;06
  actor-spawn < #19, #1B, #00, @gs2B_bones >   ;07
  actor-spawn < #09, #0C, #00, @gs2D_lily >   ;08
  actor-spawn < #0A, #0C, #00, @gs2D_lance >   ;09
  actor-spawn < #2C, #0D, #00, @gs2D_kara >   ;0A
  actor-spawn < #2B, #0B, #00, @gs2D_mummy >   ;0B
]

scene_event_0C94B4 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @gs2B_wreck_wave_motion >   ;02
  actor-spawn < #08, #0B, #00, @gs2E_sleep >   ;03
  actor-spawn < #18, #09, #00, @gs2E_crew0 >   ;04
  actor-spawn < #2D, #0C, #00, @gs2E_crew1 >   ;05
  actor-spawn < #24, #1D, #00, @gs2E_crew2 >   ;06
  actor-spawn < #19, #1B, #00, @gs2E_crew3 >   ;07
  actor-spawn < #2B, #0B, #00, @gs2E_queen >   ;08
]

scene_event_0C94F5 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #01, #00, @gs2B_wreck_wave_motion >   ;01
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;02
  actor-spawn < #0B, #0B, #30, @dc2F_adrift >   ;03
  actor-spawn < #00, #01, #00, @dc2F_adrift_fx >   ;04
]

scene_event_0C951A [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #07, #06, #00, @dc30_dog >   ;04
  actor-spawn < #06, #06, #00, @dc30_kara >   ;05
  actor-spawn < #0F, #0A, #09, @hidden_red_jewel >   ;06
]

scene_event_0C954D [
  actor-spawn < #0A, #07, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #09, #0A, #00, @dc31_rescuer >   ;03
  actor-spawn < #05, #0A, #00, @dc31_kara >   ;04
]

scene_event_0C9572 [
  actor-spawn < #13, #36, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #01, #82, #00, @visual_effect_pipeline.effect_position_update >   ;02
  actor-spawn < #00, #01, #00, @overworld_exit >   ;03
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;04
  actor-spawn < #00, #01, #00, @fr32_laborer_npc >   ;05
  actor-spawn < #07, #2B, #00, @town_door >   ;06
  actor-spawn < #16, #2D, #00, @town_door >   ;07
  actor-spawn < #21, #2B, #00, @town_door >   ;08
  actor-spawn < #41, #2C, #00, @town_door >   ;09
  actor-spawn < #2F, #2B, #00, @fr32_locked_door >   ;0A
  actor-spawn < #19, #0E, #00, @freejia_street_prop >   ;0B
  actor-spawn < #2F, #0F, #00, @freejia_street_prop >   ;0C
  actor-spawn < #0D, #16, #00, @fr32_bg_sprite_b >   ;0D
  actor-spawn < #0D, #19, #00, @fr32_bg_sprite_a >   ;0E
  actor-spawn < #3C, #16, #00, @fr32_bg_sprite_c >   ;0F
  actor-spawn < #22, #17, #00, @fr32_bg_sprite_c >   ;10
  actor-spawn < #14, #0E, #00, @fr32_herb >   ;11
  actor-spawn < #24, #0E, #00, @fr32_herb >   ;12
  actor-spawn < #34, #10, #00, @fr32_herb >   ;13
  actor-spawn < #0F, #0F, #00, @fr32_hp_jewel >   ;14
  actor-spawn < #1D, #0F, #00, @fr32_hp_jewel >   ;15
  actor-spawn < #36, #10, #00, @fr32_hp_jewel >   ;16
  actor-spawn < #14, #36, #00, @fr32_kara >   ;17
  actor-spawn < #22, #26, #00, @fr32_idle_npc_a >   ;18
  actor-spawn < #03, #26, #00, @fr32_walking_npc >   ;19
  actor-spawn < #21, #26, #00, @fr32_idle_npc_b >   ;1A
  actor-spawn < #07, #0D, #00, @fr32_kidnapper >   ;1B
  actor-spawn < #1D, #2A, #00, @fr32_slap >   ;1C
  actor-spawn < #36, #1E, #00, @fr32_hotel_hint >   ;1D
  actor-spawn < #4D, #34, #00, @fr32_creep >   ;1E
  actor-spawn < #1C, #31, #00, @fr32_guide >   ;1F
  actor-spawn < #12, #2F, #00, @fr32_fragrance >   ;20
  actor-spawn < #35, #11, #00, @fr32_alley_guard >   ;21
  actor-spawn < #15, #0F, #00, @fr32_slaver1 >   ;22
  actor-spawn < #17, #0F, #00, @fr32_slaver2 >   ;23
  actor-spawn < #23, #07, #00, @fr32_showman >   ;24
  actor-spawn < #0C, #0F, #00, @fr32_honest_life >   ;25
  actor-spawn < #3D, #09, #00, @fr32_doomsday >   ;26
  actor-spawn < #1C, #1C, #01, @jeweler_gem >   ;27
]

scene_event_0C9699 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #06, #08, #00, @fr33_erik >   ;03
]

scene_event_0C96B7 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #04, #09, #01, @dark_space.dark_space2 >   ;03
]

scene_event_0C96D5 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #06, #09, #00, @fr35_slave1 >   ;03
  actor-spawn < #08, #09, #00, @fr35_slave2 >   ;04
  actor-spawn < #09, #09, #00, @fr35_slave3 >   ;05
]

scene_event_0C970B [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #0C, #0C, #00, @fr36_mother >   ;03
]

scene_event_0C9729 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #03, #1B, #00, @fr37_caution >   ;03
]

scene_event_0C9747 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #04, #1D, #00, @fr38_ashamed >   ;03
  actor-spawn < #0A, #0D, #00, @fr38_girlfriend >   ;04
  actor-spawn < #0B, #0D, #00, @fr38_boyfriend >   ;05
]

scene_event_0C9773 [
  actor-spawn < #04, #1D, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #05, #1D, #00, @fr39_kara >   ;03
  actor-spawn < #07, #16, #00, @fr39_lily >   ;04
  actor-spawn < #16, #19, #00, @fr39_lance >   ;05
  actor-spawn < #18, #1A, #00, @fr39_erik >   ;06
  actor-spawn < #27, #08, #0B, @hidden_red_jewel >   ;07
]

scene_event_0C97AD [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #0E, #0C, #00, @fr3A_sympathetic >   ;03
  actor-spawn < #08, #0A, #00, @fr3A_harborer >   ;04
]

scene_event_0C97D2 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #05, #0A, #00, @fr3B_tornado >   ;03
]

scene_event_0C97F0 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #05, #07, #00, @fr3C_imas >   ;02
  actor-spawn < #07, #07, #00, @fr3C_remus >   ;03
  actor-spawn < #09, #07, #00, @fr3C_sam >   ;04
  actor-spawn < #03, #0A, #00, @fr3C_slaver >   ;05
  actor-spawn < #08, #0B, #00, @fr3C_man1 >   ;06
  actor-spawn < #0B, #08, #00, @fr3C_man2 >   ;07
]

scene_event_0C9836 [
  actor-spawn < #05, #08, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #03, #3A, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #01, #00 >   ;02
  enemy-spawn < #0C, #3A, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #02, #34 >   ;03
  enemy-spawn < #04, #42, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #03, #00 >   ;04
  enemy-spawn < #0C, #42, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #04, #00 >   ;05
  enemy-spawn < #08, #2C, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #05, #36 >   ;06
  enemy-spawn < #04, #4C, #00, @dm3D_eye_stalker.dm3D_eye_stalker1, #19, #06, #35 >   ;07
  enemy-spawn < #04, #51, #00, @dm3D_eye_stalker.dm3D_eye_stalker1, #19, #07, #00 >   ;08
  enemy-spawn < #0B, #4C, #00, @dm3D_eye_stalker.dm3D_eye_stalker1, #19, #08, #00 >   ;09
  enemy-spawn < #0B, #51, #00, @dm3D_eye_stalker.dm3D_eye_stalker1, #19, #09, #00 >   ;0A
  enemy-spawn < #02, #29, #00, @dm3D_grundit, #1A, #0A, #00 >   ;0B
  enemy-spawn < #0D, #29, #00, @dm3D_grundit, #1A, #0B, #00 >   ;0C
  actor-spawn < #05, #03, #00, @dm3D_breakable_wall >   ;0D
  actor-spawn < #0D, #0B, #03, @dark_space.dark_space2 >   ;0E
]

scene_event_0C98B7 [
  actor-spawn < #0A, #3E, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #07, #24, #00, @dm3D_grundit, #1A, #10, #00 >   ;02
  enemy-spawn < #1A, #18, #00, @dm3D_grundit, #1A, #11, #00 >   ;03
  enemy-spawn < #13, #07, #00, @dm3D_grundit, #1A, #12, #00 >   ;04
  enemy-spawn < #0A, #34, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #13, #00 >   ;05
  enemy-spawn < #11, #22, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #14, #00 >   ;06
  enemy-spawn < #17, #21, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #15, #00 >   ;07
  enemy-spawn < #0B, #0D, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #16, #00 >   ;08
  actor-spawn < #00, #01, #00, @dm3E_intro >   ;09
  actor-spawn < #00, #01, #00, @overworld_exit >   ;0A
]

scene_event_0C991A [
  actor-spawn < #0B, #3C, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #19, #0C, #20, @dm3D_grundit, #1A, #21, #22 >   ;02
  enemy-spawn < #36, #0B, #20, @dm3D_grundit, #1A, #22, #00 >   ;03
  enemy-spawn < #3A, #0A, #20, @dm3D_grundit, #1A, #23, #00 >   ;04
  enemy-spawn < #37, #12, #20, @dm3D_grundit, #1A, #24, #00 >   ;05
  enemy-spawn < #29, #2C, #20, @dm3D_grundit, #1A, #25, #00 >   ;06
  enemy-spawn < #37, #34, #20, @dm3D_grundit, #1A, #26, #00 >   ;07
  enemy-spawn < #2D, #3B, #20, @dm3D_grundit, #1A, #27, #00 >   ;08
  enemy-spawn < #2C, #1D, #30, @dm3D_grundit, #1A, #28, #00 >   ;09
  enemy-spawn < #20, #2E, #30, @dm3D_grundit, #1A, #29, #00 >   ;0A
  enemy-spawn < #10, #19, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #2A, #00 >   ;0B
  enemy-spawn < #0F, #0C, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #2B, #00 >   ;0C
  enemy-spawn < #13, #0D, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #2C, #00 >   ;0D
  enemy-spawn < #27, #10, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #2D, #00 >   ;0E
  enemy-spawn < #2D, #14, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #2E, #00 >   ;0F
  enemy-spawn < #31, #21, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #2F, #00 >   ;10
  enemy-spawn < #30, #30, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #30, #00 >   ;11
  enemy-spawn < #15, #39, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #31, #00 >   ;12
  enemy-spawn < #10, #2D, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #32, #00 >   ;13
  enemy-spawn < #12, #12, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #33, #00 >   ;14
  enemy-spawn < #04, #10, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #34, #00 >   ;15
  enemy-spawn < #27, #37, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #35, #00 >   ;16
  enemy-spawn < #14, #20, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #36, #00 >   ;17
  enemy-spawn < #09, #28, #00, @dm3D_flayzer.dm3D_flayzer2, #18, #37, #00 >   ;18
  enemy-spawn < #37, #09, #00, @dm3D_flayzer.dm3D_flayzer2, #18, #38, #00 >   ;19
  actor-spawn < #07, #27, #01, @dm3F_laborer >   ;1A
  actor-spawn < #35, #08, #03, @dm3F_laborer >   ;1B
  actor-spawn < #00, #01, #00, @dm3F_mine_collapse_trigger >   ;1C
  actor-spawn < #20, #10, #00, @dm3F_switch >   ;1D
  actor-spawn < #14, #1F, #00, @dm3F_switch >   ;1E
  actor-spawn < #2D, #1C, #00, @dm3F_switch >   ;1F
  actor-spawn < #20, #30, #00, @dm3F_switch >   ;20
  actor-spawn < #1A, #33, #00, @dm3F_elevator_sign >   ;21
  actor-spawn < #18, #36, #00, @dm3F_elevator_door >   ;22
]

scene_event_0C9A41 [
  actor-spawn < #0B, #1C, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #1B, #06, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #40, #00 >   ;02
  enemy-spawn < #0A, #0D, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #41, #00 >   ;03
  enemy-spawn < #0B, #18, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #42, #00 >   ;04
  enemy-spawn < #1B, #2D, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #43, #00 >   ;05
  enemy-spawn < #08, #28, #00, @dm3D_grundit, #1A, #44, #00 >   ;06
  enemy-spawn < #16, #18, #00, @dm3D_grundit, #1A, #45, #32 >   ;07
  actor-spawn < #1C, #16, #03, @dm40_hidden_dark_space >   ;08
  actor-spawn < #08, #14, #00, @dm40_trapped_slave >   ;09
]

scene_event_0C9A95 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #23, #23, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #0F, #23, #00, @dm3D_grundit, #1A, #50, #00 >   ;03
  enemy-spawn < #12, #0E, #00, @dm3D_grundit, #1A, #51, #00 >   ;04
  enemy-spawn < #22, #11, #00, @dm3D_grundit, #1A, #52, #00 >   ;05
  enemy-spawn < #25, #0D, #00, @dm3D_grundit, #1A, #53, #00 >   ;06
  enemy-spawn < #29, #04, #30, @dm41_bat_spawner, #1A, #55, #23 >   ;07
  actor-spawn < #00, #01, #00, @dm41_solid_wall_setup >   ;08
  enemy-spawn < #1E, #29, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #56, #00 >   ;09
  enemy-spawn < #12, #24, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #58, #00 >   ;0A
  enemy-spawn < #08, #24, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #59, #00 >   ;0B
  enemy-spawn < #16, #2E, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #5A, #00 >   ;0C
  enemy-spawn < #0C, #29, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #5B, #00 >   ;0D
  enemy-spawn < #26, #10, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #5C, #00 >   ;0E
  actor-spawn < #02, #07, #00, @dm41_minecart >   ;0F
  actor-spawn < #28, #03, #00, @dm41_minecart.dm41_actor_0AA4F5 >   ;10
  actor-spawn < #15, #3D, #00, @dm41_minecart.dm41_actor_0AA50C >   ;11
  actor-spawn < #16, #1C, #00, @large_ramps.large_ramp_booster >   ;12
  actor-spawn < #1B, #0B, #00, @large_ramps.large_ramp_booster >   ;13
]

scene_event_0C9B39 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #27, #06, #05, @dark_space.dark_space2 >   ;02
  actor-spawn < #28, #17, #07, @dm3F_laborer >   ;03
]

scene_event_0C9B57 [
  actor-spawn < #05, #0A, #32, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #21, #21, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #00, #01, #30, @dm43_elevator >   ;04
  actor-spawn < #28, #03, #00, @dm43_elevator.dm43_elevator_stop_y >   ;05
  actor-spawn < #15, #3D, #00, @dm43_elevator.dm43_elevator_stop_x >   ;06
]

scene_event_0C9B8A [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #0F, #18, #00, @dm44_cell_door >   ;02
]

scene_event_0C9BA1 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #07, #0B, #00, @dm3D_grundit, #1A, #60, #00 >   ;02
  enemy-spawn < #0B, #12, #00, @dm3D_grundit, #1A, #61, #00 >   ;03
  enemy-spawn < #08, #1A, #00, @dm3D_grundit, #1A, #62, #00 >   ;04
  enemy-spawn < #12, #14, #00, @dm3D_grundit, #1A, #63, #00 >   ;05
  enemy-spawn < #19, #0F, #00, @dm3D_grundit, #1A, #64, #00 >   ;06
  enemy-spawn < #19, #1D, #00, @dm3D_grundit, #1A, #65, #00 >   ;07
  actor-spawn < #1B, #1C, #00, @dm45_key >   ;08
]

scene_event_0C9BF4 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #18, #0F, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #70, #00 >   ;02
  enemy-spawn < #17, #18, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #71, #00 >   ;03
  enemy-spawn < #0F, #0B, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #73, #00 >   ;04
  enemy-spawn < #07, #12, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #19, #74, #00 >   ;05
  enemy-spawn < #1C, #18, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #75, #00 >   ;06
  enemy-spawn < #13, #12, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #76, #00 >   ;07
  enemy-spawn < #11, #1C, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #77, #00 >   ;08
  enemy-spawn < #09, #0F, #00, @dm3D_flayzer.dm3D_flayzer3, #18, #78, #00 >   ;09
  enemy-spawn < #02, #0C, #00, @dm3D_flayzer, #18, #7A, #00 >   ;0A
  actor-spawn < #04, #0B, #05, @dm3F_laborer >   ;0B
]

scene_event_0C9C5C [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #0B, #25, #00, @dm47_imas >   ;02
  actor-spawn < #03, #23, #00, @dm47_remus >   ;03
  actor-spawn < #02, #2A, #00, @dm47_sam >   ;04
]

scene_event_0C9C81 [
  actor-spawn < #09, #0C, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #08, #09, #00, @na49_neil >   ;03
  actor-spawn < #08, #11, #00, @na49_lance >   ;04
  actor-spawn < #08, #12, #00, @na49_lily >   ;05
  actor-spawn < #08, #12, #00, @na49_kara >   ;06
  actor-spawn < #09, #12, #00, @na49_erik >   ;07
  actor-spawn < #04, #08, #00, @na49_tank >   ;08
  actor-spawn < #05, #08, #00, @na49_wings >   ;09
  actor-spawn < #09, #08, #00, @na49_telescope >   ;0A
  actor-spawn < #0C, #0B, #00, @na49_camera >   ;0B
]

scene_event_0C9CE1 [
  actor-spawn < #05, #0E, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
]

scene_event_0C9CF1 [
  actor-spawn < #12, #09, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #12, #06, #00, @na4B_neil >   ;03
  actor-spawn < #10, #09, #00, @na4B_lily >   ;04
  actor-spawn < #11, #09, #00, @na4B_lance >   ;05
  actor-spawn < #13, #09, #00, @na4B_kara >   ;06
  actor-spawn < #14, #09, #00, @na4B_erik >   ;07
  actor-spawn < #04, #3C, #00, @na4B_spirit >   ;08
  actor-spawn < #1D, #2C, #00, @na4B_buried_tile >   ;09
]

scene_event_0C9D45 [
  actor-spawn < #0F, #14, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #41, #41, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #09, #06, #01, @dark_space.dark_space2 >   ;04
  actor-spawn < #13, #0E, #00, @sg4C_platforms.sg4C_platform1 >   ;05
  actor-spawn < #13, #12, #00, @sg4C_platforms.sg4C_platform2 >   ;06
  actor-spawn < #0B, #0C, #00, @sg4C_platforms.sg4C_platform3 >   ;07
  actor-spawn < #0B, #10, #00, @sg4C_platforms.sg4C_platform4 >   ;08
  actor-spawn < #1A, #0A, #00, @sg4C_spirits.sg4C_spirit1 >   ;09
  actor-spawn < #18, #17, #00, @sg4C_spirits.sg4C_spirit2 >   ;0A
  actor-spawn < #0E, #14, #00, @sg4C_spirits.sg4C_spirit3 >   ;0B
  actor-spawn < #00, #01, #00, @dm3E_intro >   ;0C
  actor-spawn < #00, #01, #00, @sg4C_auto_advance >   ;0D
]

scene_event_0C9DB3 [
  actor-spawn < #07, #08, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #41, #41, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @sg4D_jump_handler >   ;03
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;04
  enemy-spawn < #0A, #31, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #01, #00 >   ;05
  enemy-spawn < #18, #22, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #02, #00 >   ;06
  enemy-spawn < #1E, #22, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #03, #00 >   ;07
  enemy-spawn < #14, #12, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #04, #00 >   ;08
  enemy-spawn < #1B, #12, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #05, #00 >   ;09
  enemy-spawn < #2B, #1B, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #06, #00 >   ;0A
  enemy-spawn < #36, #1B, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #07, #00 >   ;0B
  enemy-spawn < #06, #26, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #08, #00 >   ;0C
  enemy-spawn < #0E, #23, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #09, #00 >   ;0D
  enemy-spawn < #14, #38, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #0A, #00 >   ;0E
  enemy-spawn < #1B, #30, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #0B, #00 >   ;0F
  enemy-spawn < #20, #08, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #0D, #00 >   ;10
  enemy-spawn < #27, #06, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #0E, #00 >   ;11
  enemy-spawn < #2D, #11, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #0F, #00 >   ;12
  enemy-spawn < #34, #16, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #10, #00 >   ;13
  enemy-spawn < #28, #20, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #11, #00 >   ;14
  enemy-spawn < #37, #1E, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #12, #00 >   ;15
  enemy-spawn < #31, #38, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #13, #00 >   ;16
  actor-spawn < #3A, #33, #00, @sg4D_knight_armor.sg4D_knight_armor1 >   ;17
  actor-spawn < #00, #01, #00, @sg4C_auto_advance >   ;18
]

scene_event_0C9E92 [
  actor-spawn < #3C, #14, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #02, #02, #00, @visual_effect_pipeline.effect_velocity_init >   ;02
  actor-spawn < #00, #01, #00, @sg4D_jump_handler >   ;03
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;04
  enemy-spawn < #09, #1A, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #20, #00 >   ;05
  enemy-spawn < #14, #1A, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #21, #00 >   ;06
  enemy-spawn < #1E, #0B, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #22, #00 >   ;07
  enemy-spawn < #23, #0B, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #23, #00 >   ;08
  enemy-spawn < #24, #32, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #24, #00 >   ;09
  enemy-spawn < #38, #25, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #25, #00 >   ;0A
  enemy-spawn < #09, #14, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #26, #00 >   ;0B
  enemy-spawn < #1E, #0E, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #27, #00 >   ;0C
  enemy-spawn < #24, #09, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #28, #00 >   ;0D
  enemy-spawn < #20, #21, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #2B, #00 >   ;0E
  enemy-spawn < #2C, #38, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #2C, #00 >   ;0F
  enemy-spawn < #0D, #31, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #2D, #00 >   ;10
  enemy-spawn < #11, #38, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #2E, #00 >   ;11
  actor-spawn < #39, #14, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;12
  actor-spawn < #3B, #24, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;13
  actor-spawn < #33, #27, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;14
  actor-spawn < #00, #01, #00, @sg4C_auto_advance >   ;15
]

scene_event_0C9F53 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #41, #41, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #18, #35, #03, @ramps.ramp_west >   ;04
  actor-spawn < #27, #35, #03, @ramps.ramp_east >   ;05
  actor-spawn < #00, #01, #00, @sg4D_jump_handler >   ;06
  enemy-spawn < #0D, #1B, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #40, #00 >   ;07
  enemy-spawn < #11, #1B, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #41, #00 >   ;08
  enemy-spawn < #15, #1B, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #42, #00 >   ;09
  enemy-spawn < #36, #09, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #44, #00 >   ;0A
  enemy-spawn < #20, #0B, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #45, #37 >   ;0B
  enemy-spawn < #09, #0E, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #46, #00 >   ;0C
  enemy-spawn < #2F, #19, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #4A, #00 >   ;0D
  enemy-spawn < #38, #0D, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #4B, #00 >   ;0E
  enemy-spawn < #33, #05, #00, @sg4D_dynapede, #1B, #4C, #00 >   ;0F
  enemy-spawn < #20, #05, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #4D, #00 >   ;10
  enemy-spawn < #1F, #11, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #4E, #00 >   ;11
  enemy-spawn < #1A, #0B, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #4F, #00 >   ;12
  enemy-spawn < #25, #0B, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #50, #00 >   ;13
  actor-spawn < #17, #36, #00, @sg4D_knight_armor.sg4F_knight_armor2 >   ;14
  actor-spawn < #2E, #20, #00, @sg4D_knight_armor.sg4F_knight_armor2 >   ;15
  actor-spawn < #00, #01, #00, @sg4C_auto_advance >   ;16
]

scene_event_0CA01A [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #02, #02, #00, @visual_effect_pipeline.effect_velocity_init >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #00, #01, #00, @sg4D_jump_handler >   ;04
  enemy-spawn < #1F, #0B, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #60, #00 >   ;05
  enemy-spawn < #2A, #1B, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #61, #00 >   ;06
  enemy-spawn < #2E, #1B, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #62, #00 >   ;07
  enemy-spawn < #32, #1B, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #63, #00 >   ;08
  enemy-spawn < #3A, #09, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #64, #30 >   ;09
  enemy-spawn < #15, #0B, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #65, #00 >   ;0A
  enemy-spawn < #1F, #05, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #66, #00 >   ;0B
  enemy-spawn < #1F, #12, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #67, #00 >   ;0C
  enemy-spawn < #0B, #1C, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #68, #00 >   ;0D
  enemy-spawn < #0B, #1E, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #69, #00 >   ;0E
  enemy-spawn < #0B, #20, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #6A, #00 >   ;0F
  enemy-spawn < #37, #1C, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #6B, #00 >   ;10
  actor-spawn < #34, #06, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;11
  actor-spawn < #3B, #06, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;12
  actor-spawn < #00, #01, #00, @sg4C_auto_advance >   ;13
]

scene_event_0CA0CB [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #41, #41, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  enemy-spawn < #27, #1F, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #80, #24 >   ;04
  enemy-spawn < #16, #07, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #81, #00 >   ;05
  enemy-spawn < #19, #07, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #82, #00 >   ;06
  enemy-spawn < #16, #0C, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #83, #2B >   ;07
  enemy-spawn < #07, #1C, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #84, #00 >   ;08
  enemy-spawn < #04, #20, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #85, #00 >   ;09
  enemy-spawn < #07, #24, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #86, #00 >   ;0A
  enemy-spawn < #37, #23, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #87, #00 >   ;0B
  enemy-spawn < #29, #22, #00, @sg4D_dynapede, #1B, #88, #00 >   ;0C
  enemy-spawn < #25, #1D, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #89, #00 >   ;0D
  enemy-spawn < #28, #08, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #8A, #00 >   ;0E
  enemy-spawn < #23, #0C, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #8B, #00 >   ;0F
  enemy-spawn < #1A, #23, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #8C, #2C >   ;10
  actor-spawn < #18, #22, #00, @sg4E_plasma_snake.sg51_plasma_snake1 >   ;11
  actor-spawn < #30, #33, #00, @sg51_statue >   ;12
  actor-spawn < #30, #34, #00, @sg51_statue >   ;13
  actor-spawn < #03, #0B, #03, @dark_space.dark_space2 >   ;14
  actor-spawn < #00, #01, #00, @sg4D_jump_handler >   ;15
  actor-spawn < #00, #01, #00, @sg4C_auto_advance >   ;16
]

scene_event_0CA192 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #02, #02, #00, @visual_effect_pipeline.effect_velocity_init >   ;02
  actor-spawn < #38, #33, #00, @sg4D_knight_armor.sg4F_knight_armor2 >   ;03
  enemy-spawn < #25, #33, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #A0, #00 >   ;04
  enemy-spawn < #38, #1C, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #A1, #00 >   ;05
  enemy-spawn < #3C, #1F, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #A2, #00 >   ;06
  enemy-spawn < #38, #23, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #A3, #00 >   ;07
  enemy-spawn < #18, #1F, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #A5, #31 >   ;08
  enemy-spawn < #25, #23, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #A6, #00 >   ;09
  enemy-spawn < #29, #1D, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #A7, #00 >   ;0A
  actor-spawn < #19, #34, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;0B
  actor-spawn < #1C, #23, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;0C
  actor-spawn < #15, #1C, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;0D
  actor-spawn < #0C, #09, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;0E
  actor-spawn < #19, #0B, #00, @sg52_blocker_enemy_a >   ;0F
  actor-spawn < #23, #0A, #00, @sg52_blocker_enemy_a >   ;10
  actor-spawn < #3D, #0C, #00, @sg52_blocker_enemy_b >   ;11
  actor-spawn < #25, #33, #00, @sg52_switch >   ;12
  actor-spawn < #00, #01, #00, @sg4D_jump_handler >   ;13
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;14
  actor-spawn < #00, #01, #00, @sg4C_auto_advance >   ;15
]

scene_event_0CA247 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #41, #41, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #32, #18, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #C0, #00 >   ;03
  enemy-spawn < #0C, #19, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #C1, #00 >   ;04
  enemy-spawn < #08, #18, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #C2, #00 >   ;05
  enemy-spawn < #04, #1E, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #C3, #00 >   ;06
  enemy-spawn < #0A, #26, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #C4, #00 >   ;07
  enemy-spawn < #38, #3A, #00, @sg4D_cyber.sg4D_blue_cyber, #1D, #C5, #00 >   ;08
  enemy-spawn < #04, #14, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #C6, #00 >   ;09
  enemy-spawn < #04, #04, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #C7, #00 >   ;0A
  enemy-spawn < #20, #14, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #C8, #00 >   ;0B
  enemy-spawn < #20, #1D, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #C9, #00 >   ;0C
  enemy-spawn < #16, #24, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #CA, #00 >   ;0D
  enemy-spawn < #03, #2D, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #CB, #00 >   ;0E
  enemy-spawn < #33, #28, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #CC, #00 >   ;0F
  enemy-spawn < #36, #2A, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #CD, #00 >   ;10
  enemy-spawn < #39, #29, #00, @sg4D_dynapede.sg4D_dynapede2, #1B, #CE, #00 >   ;11
  actor-spawn < #31, #38, #00, @sg4D_knight_armor.sg4F_knight_armor4 >   ;12
  actor-spawn < #08, #26, #00, @sg4D_knight_armor.sg4F_knight_armor3 >   ;13
  actor-spawn < #26, #08, #03, @ramps.ramp_west >   ;14
  actor-spawn < #10, #08, #03, @ramps.ramp_west >   ;15
  actor-spawn < #1A, #33, #03, @ramps.ramp_west >   ;16
  actor-spawn < #1A, #39, #03, @ramps.ramp_west >   ;17
  actor-spawn < #26, #18, #03, @ramps.ramp_east >   ;18
  actor-spawn < #00, #01, #00, @sg4D_jump_handler >   ;19
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;1A
  actor-spawn < #00, #01, #00, @sg4C_auto_advance >   ;1B
]

scene_event_0CA335 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #02, #02, #00, @visual_effect_pipeline.effect_velocity_init >   ;02
  actor-spawn < #3A, #2F, #00, @sg4D_knight_armor.sg4F_knight_armor4 >   ;03
  actor-spawn < #34, #2E, #00, @sg54_pressure_switch >   ;04
  enemy-spawn < #1C, #2C, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #E0, #00 >   ;05
  enemy-spawn < #08, #38, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #E1, #00 >   ;06
  enemy-spawn < #2A, #33, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #E2, #00 >   ;07
  enemy-spawn < #2A, #3A, #00, @sg4D_cyber.sg4D_red_cyber, #1E, #E3, #00 >   ;08
  enemy-spawn < #09, #06, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #E5, #00 >   ;09
  enemy-spawn < #08, #1A, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #E6, #00 >   ;0A
  enemy-spawn < #11, #1A, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #E7, #00 >   ;0B
  enemy-spawn < #2E, #19, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #E8, #00 >   ;0C
  enemy-spawn < #33, #26, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #E9, #00 >   ;0D
  enemy-spawn < #39, #28, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #EA, #00 >   ;0E
  enemy-spawn < #28, #2C, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #EB, #00 >   ;0F
  enemy-spawn < #21, #2C, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #EC, #00 >   ;10
  enemy-spawn < #16, #35, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #ED, #00 >   ;11
  enemy-spawn < #16, #38, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #EE, #00 >   ;12
  enemy-spawn < #31, #04, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #EF, #00 >   ;13
  enemy-spawn < #36, #05, #00, @sg4E_nitropede.sg4E_nitropede1, #1C, #F0, #00 >   ;14
  actor-spawn < #0F, #06, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;15
  actor-spawn < #18, #19, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;16
  actor-spawn < #37, #18, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;17
  actor-spawn < #32, #33, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;18
  actor-spawn < #29, #34, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;19
  actor-spawn < #3B, #0C, #00, @sg4E_plasma_snake.sg4E_plasma_snake2 >   ;1A
  actor-spawn < #00, #01, #00, @sg4D_jump_handler >   ;1B
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;1C
  actor-spawn < #02, #06, #03, @dark_space.dark_space2 >   ;1D
  actor-spawn < #00, #01, #00, @sg4C_auto_advance >   ;1E
]

scene_event_0CA43B [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;02
  actor-spawn < #07, #0D, #30, @sg55_falling_tile >   ;03
  actor-spawn < #07, #0E, #30, @sg55_falling_tile >   ;04
  actor-spawn < #07, #0F, #30, @sg55_falling_tile >   ;05
  actor-spawn < #07, #10, #30, @sg55_falling_tile >   ;06
  actor-spawn < #07, #11, #30, @sg55_falling_tile >   ;07
  actor-spawn < #07, #12, #30, @sg55_falling_tile >   ;08
  actor-spawn < #07, #13, #30, @sg55_falling_tile >   ;09
  actor-spawn < #07, #14, #30, @sg55_falling_tile >   ;0A
  actor-spawn < #07, #15, #30, @sg55_falling_tile >   ;0B
  actor-spawn < #07, #16, #30, @sg55_falling_tile >   ;0C
  actor-spawn < #07, #17, #30, @sg55_falling_tile >   ;0D
  actor-spawn < #07, #18, #30, @sg55_falling_tile >   ;0E
  actor-spawn < #07, #19, #30, @sg55_falling_tile >   ;0F
  actor-spawn < #07, #1A, #30, @sg55_falling_tile >   ;10
  actor-spawn < #07, #1B, #30, @sg55_falling_tile >   ;11
  actor-spawn < #07, #1C, #30, @sg55_falling_tile >   ;12
  actor-spawn < #07, #1D, #30, @sg55_falling_tile >   ;13
  actor-spawn < #07, #1E, #30, @sg55_falling_tile >   ;14
  actor-spawn < #07, #1F, #30, @sg55_falling_tile >   ;15
  actor-spawn < #07, #20, #30, @sg55_falling_tile >   ;16
  enemy-spawn < #10, #05, #30, @sg55_viper.sg55_viper, #27, #00, #00 >   ;17
  actor-spawn < #00, #01, #00, @sg55_mystic_statue >   ;18
  actor-spawn < #00, #01, #01, @boss_clear_reward_handler >   ;19
]

scene_event_0CA4F5 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #07, #09, #03, @dark_space.dark_space2 >   ;02
]

scene_event_0CA50C [
  actor-spawn < #00, #01, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #0C, #00, @visual_effect_pipeline.effect_velocity_init >   ;01
  actor-spawn < #08, #01, #00, @sp58_descent_cutscene >   ;02
  actor-spawn < #00, #0B, #00, @sp58_missed_flight >   ;03
  actor-spawn < #08, #0B, #00, @sp58_red_eye >   ;04
  actor-spawn < #05, #03, #00, @sp58_monologue.sp58_actor_068380 >   ;05
  actor-spawn < #07, #04, #00, @sp58_monologue.sp58_actor_068380 >   ;06
  actor-spawn < #08, #01, #00, @sp58_monologue.sp58_actor_068380 >   ;07
  actor-spawn < #0A, #02, #00, @sp58_monologue.sp58_actor_068380 >   ;08
  actor-spawn < #0C, #05, #00, @sp58_monologue.sp58_monologue >   ;09
]

scene_event_0CA554 [
  actor-spawn < #05, #03, #00, @garden_crash_cutscene.GardenCrashCutscene >
]

scene_event_0CA55D [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #21, #51, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #2F, #08, #01, @dark_space.dark_space2 >   ;03
  actor-spawn < #21, #0A, #00, @sp5A_phantom_ribber >   ;04
  actor-spawn < #2D, #2B, #00, @sp5A_phantom_ribber >   ;05
  actor-spawn < #13, #27, #00, @sp5A_phantom_ribber >   ;06
  actor-spawn < #16, #5B, #0D, @sp5A_villagers >   ;07
  actor-spawn < #2F, #5B, #2F, @sp5A_villagers >   ;08
  actor-spawn < #31, #4B, #71, @sp5A_villagers >   ;09
  actor-spawn < #04, #49, #15, @sp5A_villagers >   ;0A
  actor-spawn < #1F, #3A, #33, @sp5A_villagers >   ;0B
  actor-spawn < #2E, #2A, #77, @sp5A_villagers >   ;0C
  actor-spawn < #2E, #1A, #19, @sp5A_villagers >   ;0D
  actor-spawn < #2F, #19, #3B, @sp5A_villagers >   ;0E
  actor-spawn < #00, #01, #00, @sp5A_voice >   ;0F
  actor-spawn < #00, #01, #00, @sp5A_monologue >   ;10
]

scene_event_0CA5D6 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #21, #51, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #09, #0A, #00, @sp5B_kara >   ;03
  actor-spawn < #06, #19, #00, @sp5B_erik >   ;04
  actor-spawn < #04, #3A, #00, @sp5B_lily >   ;05
  actor-spawn < #06, #2B, #00, @sp5B_lance >   ;06
  actor-spawn < #0A, #28, #00, @sp5B_neil >   ;07
]

scene_event_0CA610 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #21, #41, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #2F, #0A, #00, @sp5C_key_coffin >   ;03
  actor-spawn < #2B, #0A, #00, @sp5C_stone_coffin >   ;04
  actor-spawn < #2A, #39, #01, @sp5A_villagers >   ;05
  actor-spawn < #1B, #3B, #23, @sp5A_villagers >   ;06
  actor-spawn < #1C, #2B, #65, @sp5A_villagers >   ;07
  actor-spawn < #30, #29, #07, @sp5A_villagers >   ;08
  actor-spawn < #31, #29, #29, @sp5A_villagers >   ;09
  actor-spawn < #36, #0B, #6B, @sp5A_villagers >   ;0A
  enemy-spawn < #2A, #19, #00, @sp5C_slipper, #2A, #00, #00 >   ;0B
  enemy-spawn < #37, #19, #00, @sp5C_slipper, #2A, #00, #00 >   ;0C
  enemy-spawn < #26, #2A, #00, @sp5C_slipper, #2A, #00, #00 >   ;0D
  enemy-spawn < #1A, #2B, #00, @sp5C_slipper, #2A, #00, #00 >   ;0E
  enemy-spawn < #0D, #3B, #00, @sp5C_slipper, #2A, #00, #00 >   ;0F
  enemy-spawn < #1E, #3B, #00, @sp5C_slipper, #2A, #00, #00 >   ;10
  enemy-spawn < #30, #2B, #00, @sp5C_skuddle.sp5C_ceiling_skuddle, #2B, #00, #00 >   ;11
  enemy-spawn < #0A, #2A, #00, @sp5C_skuddle.sp5C_ceiling_skuddle, #2B, #00, #00 >   ;12
  enemy-spawn < #08, #2C, #00, @sp5C_skuddle.sp5C_ceiling_skuddle, #2B, #00, #00 >   ;13
  enemy-spawn < #25, #3B, #00, @sp5C_skuddle.sp5C_ceiling_skuddle, #2B, #00, #00 >   ;14
  enemy-spawn < #27, #3A, #00, @sp5C_skuddle.sp5C_ceiling_skuddle, #2B, #00, #00 >   ;15
  enemy-spawn < #2A, #3C, #00, @sp5C_skuddle.sp5C_ceiling_skuddle, #2B, #00, #00 >   ;16
  enemy-spawn < #2B, #3A, #00, @sp5C_skuddle.sp5C_ceiling_skuddle, #2B, #00, #00 >   ;17
  enemy-spawn < #30, #3A, #00, @sp5C_skuddle.sp5C_ceiling_skuddle, #2B, #00, #00 >   ;18
  enemy-spawn < #32, #3C, #00, @sp5C_skuddle.sp5C_ceiling_skuddle, #2B, #00, #00 >   ;19
]

scene_event_0CA6E6 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @sp5D_fountain >   ;03
]

scene_event_0CA704 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @sp5E_passageway >   ;02
]

scene_event_0CA71B [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @sp5A_monologue >   ;03
  enemy-spawn < #26, #13, #30, @mu5F_cyclops, #28, #13, #00 >   ;04
  enemy-spawn < #23, #3B, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #01, #3D >   ;05
  enemy-spawn < #3D, #24, #30, @mu5F_cyclops, #28, #02, #00 >   ;06
  enemy-spawn < #3A, #1F, #30, @mu5F_cyclops, #28, #03, #00 >   ;07
  enemy-spawn < #16, #16, #30, @mu5F_cyclops, #28, #04, #00 >   ;08
  enemy-spawn < #1E, #20, #30, @mu5F_cyclops, #28, #05, #00 >   ;09
  enemy-spawn < #10, #0C, #30, @sp5C_slipper, #2A, #06, #00 >   ;0A
  enemy-spawn < #1A, #07, #30, @sp5C_slipper, #2A, #07, #00 >   ;0B
  enemy-spawn < #1E, #0B, #30, @sp5C_slipper, #2A, #08, #00 >   ;0C
  enemy-spawn < #26, #1F, #30, @sp5C_slipper, #2A, #09, #00 >   ;0D
  enemy-spawn < #26, #31, #30, @sp5C_slipper, #2A, #0A, #00 >   ;0E
  enemy-spawn < #23, #3E, #30, @sp5C_slipper, #2A, #0B, #00 >   ;0F
  enemy-spawn < #33, #31, #30, @sp5C_slipper, #2A, #0C, #00 >   ;10
  enemy-spawn < #3B, #31, #30, @sp5C_slipper, #2A, #0D, #00 >   ;11
  enemy-spawn < #3D, #37, #30, @sp5C_slipper, #2A, #0E, #00 >   ;12
  enemy-spawn < #14, #32, #30, @sp5C_slipper, #2A, #0F, #00 >   ;13
  enemy-spawn < #1A, #2D, #30, @sp5C_slipper, #2A, #10, #00 >   ;14
  enemy-spawn < #21, #1B, #30, @sp5C_slipper, #2A, #11, #00 >   ;15
  enemy-spawn < #14, #2E, #30, @mu5F_flasher, #29, #12, #00 >   ;16
  actor-spawn < #33, #3E, #09, @slider_glide.SliderGlideTriggerSouth >   ;17
]

scene_event_0CA7ED [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #3A, #21, #30, @mu60_force_ball >   ;03
  actor-spawn < #2F, #08, #30, @mu60_force_ball >   ;04
  enemy-spawn < #36, #2E, #30, @sp5C_skuddle, #2B, #20, #00 >   ;05
  enemy-spawn < #3C, #2F, #30, @sp5C_skuddle, #2B, #21, #3E >   ;06
  enemy-spawn < #38, #31, #30, @sp5C_skuddle, #2B, #22, #00 >   ;07
  enemy-spawn < #3C, #32, #30, @sp5C_skuddle, #2B, #23, #3F >   ;08
  enemy-spawn < #37, #35, #30, @sp5C_skuddle, #2B, #24, #00 >   ;09
  enemy-spawn < #1F, #1A, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #25, #00 >   ;0A
  enemy-spawn < #3B, #1A, #30, @mu5F_cyclops, #28, #26, #00 >   ;0B
  enemy-spawn < #3E, #1A, #30, @mu5F_cyclops, #28, #27, #00 >   ;0C
  enemy-spawn < #2C, #3B, #30, @mu5F_cyclops, #28, #28, #00 >   ;0D
  enemy-spawn < #2C, #3E, #30, @mu5F_cyclops, #28, #29, #00 >   ;0E
  enemy-spawn < #28, #1E, #30, @mu5F_cyclops, #28, #2A, #00 >   ;0F
  enemy-spawn < #2D, #1E, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #2B, #00 >   ;10
  enemy-spawn < #2F, #1E, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #2C, #00 >   ;11
  enemy-spawn < #11, #08, #30, @mu5F_flasher, #29, #2D, #00 >   ;12
  enemy-spawn < #3C, #0B, #30, @mu5F_flasher, #29, #2E, #00 >   ;13
  enemy-spawn < #34, #1F, #30, @mu5F_flasher, #29, #2F, #00 >   ;14
  enemy-spawn < #0D, #2E, #30, @mu5F_flasher, #29, #39, #00 >   ;15
  enemy-spawn < #27, #0A, #30, @sp5C_slipper, #2A, #30, #00 >   ;16
  enemy-spawn < #32, #05, #30, @sp5C_slipper, #2A, #31, #00 >   ;17
  enemy-spawn < #31, #0A, #30, @sp5C_slipper, #2A, #32, #00 >   ;18
  enemy-spawn < #3A, #28, #30, @sp5C_slipper, #2A, #33, #00 >   ;19
  enemy-spawn < #1B, #37, #30, @sp5C_slipper, #2A, #34, #00 >   ;1A
  enemy-spawn < #0A, #1A, #30, @sp5C_slipper, #2A, #35, #00 >   ;1B
  enemy-spawn < #11, #1A, #30, @sp5C_slipper, #2A, #36, #00 >   ;1C
  enemy-spawn < #0D, #16, #30, @sp5C_slipper, #2A, #37, #00 >   ;1D
  enemy-spawn < #2C, #28, #30, @sp5C_slipper, #2A, #38, #00 >   ;1E
  actor-spawn < #19, #26, #30, @mu60_floor_spikes >   ;1F
  actor-spawn < #1A, #26, #30, @mu60_floor_spikes >   ;20
  actor-spawn < #1B, #26, #30, @mu60_floor_spikes >   ;21
  actor-spawn < #1C, #26, #30, @mu60_floor_spikes >   ;22
  actor-spawn < #1D, #26, #30, @mu60_floor_spikes >   ;23
  actor-spawn < #1E, #26, #30, @mu60_floor_spikes >   ;24
  actor-spawn < #2B, #34, #30, @mu60_plasma_chain >   ;25
  actor-spawn < #07, #23, #03, @dark_space.dark_space2 >   ;26
]

scene_event_0CA934 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #3B, #12, #30, @mu60_force_ball >   ;03
  actor-spawn < #21, #25, #30, @mu60_force_ball >   ;04
  enemy-spawn < #2B, #18, #30, @sp5C_skuddle, #2B, #40, #00 >   ;05
  enemy-spawn < #2E, #1C, #30, @sp5C_skuddle, #2B, #41, #00 >   ;06
  enemy-spawn < #2B, #20, #30, @sp5C_skuddle, #2B, #42, #00 >   ;07
  enemy-spawn < #2E, #24, #30, @sp5C_skuddle, #2B, #43, #00 >   ;08
  enemy-spawn < #3C, #27, #30, @mu5F_cyclops, #28, #44, #00 >   ;09
  enemy-spawn < #3C, #31, #30, @mu5F_cyclops, #28, #45, #00 >   ;0A
  enemy-spawn < #18, #31, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #46, #00 >   ;0B
  enemy-spawn < #21, #13, #30, @mu5F_cyclops, #28, #47, #00 >   ;0C
  enemy-spawn < #22, #18, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #48, #00 >   ;0D
  enemy-spawn < #3B, #08, #30, @mu5F_flasher, #29, #49, #00 >   ;0E
  enemy-spawn < #20, #2A, #30, @mu5F_flasher, #29, #4A, #00 >   ;0F
  enemy-spawn < #0F, #2A, #30, @mu5F_flasher, #29, #4B, #00 >   ;10
  enemy-spawn < #09, #24, #30, @mu5F_flasher, #29, #4C, #00 >   ;11
  enemy-spawn < #0C, #1F, #30, @mu5F_flasher, #29, #4D, #00 >   ;12
  enemy-spawn < #20, #0B, #30, @sp5C_slipper, #2A, #4E, #00 >   ;13
  enemy-spawn < #36, #3A, #30, @sp5C_slipper, #2A, #4F, #00 >   ;14
  enemy-spawn < #36, #3E, #30, @sp5C_slipper, #2A, #50, #00 >   ;15
  enemy-spawn < #30, #3A, #30, @sp5C_slipper, #2A, #51, #00 >   ;16
  enemy-spawn < #29, #3A, #30, @sp5C_slipper, #2A, #52, #00 >   ;17
  enemy-spawn < #22, #3B, #30, @sp5C_slipper, #2A, #53, #00 >   ;18
  enemy-spawn < #22, #20, #30, @sp5C_slipper, #2A, #54, #00 >   ;19
  enemy-spawn < #2E, #14, #30, @sp5C_slipper, #2A, #55, #00 >   ;1A
  enemy-spawn < #22, #31, #30, @sp5C_slipper, #2A, #56, #00 >   ;1B
  enemy-spawn < #22, #33, #30, @sp5C_slipper, #2A, #57, #00 >   ;1C
  enemy-spawn < #22, #35, #30, @sp5C_slipper, #2A, #58, #00 >   ;1D
  enemy-spawn < #22, #37, #30, @sp5C_slipper, #2A, #59, #00 >   ;1E
  actor-spawn < #1A, #0A, #30, @mu60_floor_spikes >   ;1F
  actor-spawn < #1A, #0B, #30, @mu60_floor_spikes >   ;20
  actor-spawn < #1A, #0C, #30, @mu60_floor_spikes >   ;21
  actor-spawn < #1D, #0A, #30, @mu60_floor_spikes >   ;22
  actor-spawn < #1D, #0B, #30, @mu60_floor_spikes >   ;23
  actor-spawn < #1D, #0C, #30, @mu60_floor_spikes >   ;24
  actor-spawn < #00, #01, #00, @mu61_hint >   ;25
  actor-spawn < #00, #01, #00, @sp5A_monologue >   ;26
]

scene_event_0CAA7B [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #2F, #3A, #00, @mu62_hope_statue >   ;03
  actor-spawn < #10, #1A, #05, @dark_space.dark_space2 >   ;04
  enemy-spawn < #2A, #24, #30, @sp5C_slipper, #2A, #60, #00 >   ;05
  enemy-spawn < #30, #24, #30, @sp5C_slipper, #2A, #61, #00 >   ;06
  enemy-spawn < #2A, #28, #30, @sp5C_slipper, #2A, #62, #00 >   ;07
  enemy-spawn < #30, #28, #30, @sp5C_slipper, #2A, #63, #00 >   ;08
  enemy-spawn < #2D, #26, #30, @sp5C_slipper, #2A, #64, #42 >   ;09
  enemy-spawn < #26, #09, #30, @sp5C_slipper, #2A, #65, #00 >   ;0A
  enemy-spawn < #18, #2A, #30, @sp5C_slipper, #2A, #66, #00 >   ;0B
  enemy-spawn < #11, #28, #30, @sp5C_slipper, #2A, #67, #00 >   ;0C
  enemy-spawn < #1A, #31, #30, @sp5C_slipper, #2A, #68, #00 >   ;0D
  enemy-spawn < #07, #2D, #30, @sp5C_slipper, #2A, #69, #00 >   ;0E
  enemy-spawn < #1B, #26, #30, @mu5F_flasher, #29, #6A, #00 >   ;0F
  enemy-spawn < #11, #30, #30, @mu5F_flasher, #29, #6B, #00 >   ;10
  actor-spawn < #38, #11, #30, @mu60_plasma_chain >   ;11
  actor-spawn < #20, #1C, #11, @slider_glide.SliderGlideTriggerEast >   ;12
  actor-spawn < #28, #1C, #11, @slider_glide.SliderGlideTriggerWest >   ;13
  actor-spawn < #33, #05, #0B, @slider_glide.SliderGlideTriggerNorth >   ;14
]

scene_event_0CAB28 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @mu63_spirits >   ;02
]

scene_event_0CAB4B [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #13, #20, #30, @mu5F_cyclops, #28, #45, #00 >   ;03
  enemy-spawn < #04, #31, #30, @sp5C_slipper, #2A, #70, #00 >   ;04
  enemy-spawn < #07, #27, #30, @sp5C_slipper, #2A, #71, #00 >   ;05
  enemy-spawn < #0E, #3D, #30, @sp5C_slipper, #2A, #72, #00 >   ;06
  enemy-spawn < #16, #3B, #30, @sp5C_slipper, #2A, #73, #00 >   ;07
  enemy-spawn < #1B, #1B, #30, @sp5C_slipper, #2A, #74, #00 >   ;08
  enemy-spawn < #0E, #13, #30, @mu5F_flasher, #29, #75, #00 >   ;09
  enemy-spawn < #0E, #31, #30, @mu5F_flasher, #29, #76, #00 >   ;0A
  actor-spawn < #03, #2E, #30, @mu60_plasma_chain >   ;0B
  actor-spawn < #09, #2E, #30, @mu60_plasma_chain >   ;0C
  actor-spawn < #15, #26, #00, @ir21_switch >   ;0D
  actor-spawn < #1B, #2D, #00, @ir21_switch >   ;0E
  actor-spawn < #1A, #27, #00, @mu64_switch_spikes >   ;0F
  actor-spawn < #1B, #27, #00, @mu64_switch_spikes >   ;10
]

scene_event_0CABD4 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #14, #1F, #1B, @slider_glide.SliderGlideTriggerNorth >   ;03
  actor-spawn < #14, #13, #19, @slider_glide.SliderGlideTriggerSouth >   ;04
  enemy-spawn < #1D, #39, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #90, #41 >   ;05
  enemy-spawn < #36, #19, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #91, #00 >   ;06
  enemy-spawn < #3D, #19, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #92, #00 >   ;07
  enemy-spawn < #36, #20, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #93, #00 >   ;08
  enemy-spawn < #3D, #20, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #94, #00 >   ;09
  enemy-spawn < #08, #08, #30, @mu5F_cyclops.mu5F_cyclops2, #28, #95, #00 >   ;0A
  enemy-spawn < #15, #2F, #30, @mu5F_flasher, #29, #96, #00 >   ;0B
  enemy-spawn < #31, #3E, #30, @sp5C_slipper, #2A, #97, #00 >   ;0C
  enemy-spawn < #2F, #07, #30, @sp5C_slipper, #2A, #98, #00 >   ;0D
  enemy-spawn < #22, #08, #30, @sp5C_slipper, #2A, #99, #00 >   ;0E
  enemy-spawn < #10, #18, #30, @sp5C_slipper, #2A, #9A, #00 >   ;0F
  enemy-spawn < #1E, #27, #30, @sp5C_slipper, #2A, #9B, #00 >   ;10
  enemy-spawn < #31, #29, #30, @sp5C_skuddle, #2B, #9C, #00 >   ;11
  enemy-spawn < #31, #2F, #30, @sp5C_skuddle, #2B, #9D, #00 >   ;12
  enemy-spawn < #2E, #2C, #30, @sp5C_skuddle, #2B, #9E, #40 >   ;13
  enemy-spawn < #06, #05, #30, @sp5C_skuddle, #2B, #9F, #00 >   ;14
  enemy-spawn < #06, #0A, #30, @sp5C_skuddle, #2B, #A0, #00 >   ;15
  actor-spawn < #2A, #3E, #30, @mu62_hope_statue.mu62_hope_statue2 >   ;16
  actor-spawn < #39, #1C, #30, @mu60_plasma_chain >   ;17
  actor-spawn < #37, #38, #30, @mu60_force_ball >   ;18
  actor-spawn < #35, #3D, #30, @mu60_floor_spikes >   ;19
  actor-spawn < #34, #3D, #30, @mu60_floor_spikes >   ;1A
  actor-spawn < #2D, #3D, #30, @mu60_floor_spikes >   ;1B
  actor-spawn < #2C, #3D, #30, @mu60_floor_spikes >   ;1C
]

scene_event_0CACC3 [
  actor-spawn < #05, #0A, #32, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #24, #08, #00, @mu66_altar1 >   ;02
  actor-spawn < #2B, #08, #00, @mu66_altar2 >   ;03
  actor-spawn < #00, #01, #00, @mu66_altar_dialog >   ;04
  actor-spawn < #0F, #07, #00, @mu66_rama_spirits >   ;05
]

scene_event_0CACEF [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #12, #09, #30, @mu67_vampires.mu67_male_vampire, #2F, #00, #00 >   ;03
  enemy-spawn < #0D, #09, #30, @mu67_vampires.mu67_female_vampire, #30, #00, #00 >   ;04
  actor-spawn < #0F, #09, #30, @mu67_bomb >   ;05
  actor-spawn < #0F, #0A, #30, @mu67_erik >   ;06
  actor-spawn < #0F, #22, #30, @mu67_neil_lily.mu67_neil >   ;07
  actor-spawn < #10, #22, #30, @mu67_lair_curtain >   ;08
  actor-spawn < #0F, #23, #30, @mu67_kara >   ;09
  actor-spawn < #00, #01, #01, @boss_clear_reward_handler >   ;0A
]

scene_event_0CAD42 [
  actor-spawn < #07, #0D, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #08, #0B, #00, @st68_campfire >   ;03
  actor-spawn < #07, #09, #00, @st68_neil >   ;04
  actor-spawn < #09, #09, #00, @st68_erik >   ;05
  actor-spawn < #06, #0B, #00, @st68_lance >   ;06
  actor-spawn < #0A, #0B, #00, @st68_kara >   ;07
  actor-spawn < #09, #0D, #00, @st68_lily >   ;08
  actor-spawn < #16, #0A, #00, @st68_mushrooms >   ;09
  actor-spawn < #00, #01, #00, @st68_ambient_bubbles >   ;0A
]

scene_event_0CAD99 [
  actor-spawn < #2A, #0D, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #29, #0C, #00, @av69_lance >   ;02
  actor-spawn < #2A, #0C, #00, @av69_neil >   ;03
  actor-spawn < #2B, #0C, #00, @av69_lily >   ;04
  actor-spawn < #29, #0D, #00, @av69_kara >   ;05
  actor-spawn < #2B, #0D, #00, @av69_erik >   ;06
  actor-spawn < #28, #07, #01, @av69_signs >   ;07
  actor-spawn < #06, #08, #03, @av69_signs >   ;08
  actor-spawn < #00, #01, #00, @overworld_exit >   ;09
]

scene_event_0CADE1 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #1D, #0C, #00, @av6A_lance >   ;03
  actor-spawn < #03, #0D, #00, @av6A_neil >   ;04
  actor-spawn < #0F, #0B, #00, @av6A_lily >   ;05
  actor-spawn < #06, #0D, #00, @av6A_erik >   ;06
  actor-spawn < #1A, #0B, #00, @av6A_kara >   ;07
]

scene_event_0CAE1B [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #1B, #08, #01, @av6B_ocean_ache >   ;03
  actor-spawn < #0D, #0C, #01, @av6B_villagers1 >   ;04
  actor-spawn < #33, #17, #43, @av6B_villagers1 >   ;05
  actor-spawn < #09, #1B, #01, @jeweler_gem >   ;06
  actor-spawn < #39, #28, #07, @av6B_villagers1 >   ;07
  actor-spawn < #12, #26, #A9, @av6B_villagers1 >   ;08
  actor-spawn < #25, #0D, #01, @av6B_villagers2 >   ;09
  actor-spawn < #32, #17, #61, @av6B_villagers3 >   ;0A
  actor-spawn < #38, #0D, #03, @av6B_villagers2 >   ;0B
  actor-spawn < #33, #0D, #63, @av6B_villagers3 >   ;0C
  actor-spawn < #03, #1D, #00, @av6B_musician >   ;0D
  actor-spawn < #03, #08, #00, @av6B_flame >   ;0E
  actor-spawn < #06, #08, #00, @av6B_flame >   ;0F
  actor-spawn < #1A, #05, #00, @av6B_flame >   ;10
  actor-spawn < #2E, #14, #00, @av6B_flame >   ;11
  actor-spawn < #0A, #15, #00, @av6B_flame >   ;12
  actor-spawn < #3A, #28, #00, @av6B_door >   ;13
]

scene_event_0CAEB6 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #27, #0A, #01, @av6C_villagers4 >   ;03
  actor-spawn < #2C, #07, #03, @av6C_villagers4 >   ;04
  actor-spawn < #21, #0C, #6B, @av6B_villagers1 >   ;05
  actor-spawn < #28, #0A, #01, @av6C_villagers5 >   ;06
  actor-spawn < #2D, #07, #03, @av6C_villagers5 >   ;07
  actor-spawn < #32, #0A, #05, @av6C_villagers5 >   ;08
  actor-spawn < #06, #09, #21, @av6B_villagers3 >   ;09
  actor-spawn < #17, #19, #00, @av6C_only_sleeping >   ;0A
  actor-spawn < #37, #08, #00, @av6C_harpist >   ;0B
  actor-spawn < #3A, #09, #00, @av6C_harpist >   ;0C
  actor-spawn < #3D, #0A, #00, @av6C_harpist >   ;0D
  actor-spawn < #1A, #06, #00, @av6B_flame >   ;0E
  actor-spawn < #14, #16, #00, @av6B_flame >   ;0F
  actor-spawn < #1A, #16, #00, @av6B_flame >   ;10
  actor-spawn < #04, #16, #00, @av6B_flame >   ;11
  actor-spawn < #07, #16, #00, @av6B_flame >   ;12
  actor-spawn < #0A, #16, #00, @av6B_flame >   ;13
  actor-spawn < #26, #06, #40, @av6C_portrait >   ;14
  actor-spawn < #2B, #05, #00, @av6C_portrait.av6C_portrait2 >   ;15
  actor-spawn < #2E, #05, #00, @av6C_portrait >   ;16
  actor-spawn < #35, #06, #00, @av6C_portrait.av6C_portrait3 >   ;17
  actor-spawn < #23, #09, #0D, @hidden_red_jewel >   ;18
  actor-spawn < #19, #0A, #01, @dark_space.dark_space2 >   ;19
]

scene_event_0CAF6E [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #12, #07, #00, @av6D_flame_left >   ;04
  actor-spawn < #1E, #05, #00, @av6D_flame_left >   ;05
  actor-spawn < #29, #05, #00, @av6D_flame_left >   ;06
  actor-spawn < #2E, #05, #00, @av6D_flame_right >   ;07
  actor-spawn < #10, #15, #00, @av6D_flame_right >   ;08
  actor-spawn < #25, #15, #00, @av6D_flame_right >   ;09
  actor-spawn < #14, #28, #00, @av6D_flame_left >   ;0A
  actor-spawn < #2C, #25, #00, @av6D_flame_left >   ;0B
  enemy-spawn < #1F, #0C, #00, @av6D_steelbones, #2C, #01, #00 >   ;0C
  enemy-spawn < #24, #19, #00, @av6D_steelbones, #2C, #02, #00 >   ;0D
  enemy-spawn < #10, #19, #00, @av6D_steelbones, #2C, #03, #00 >   ;0E
  enemy-spawn < #10, #2C, #00, @av6D_steelbones, #2C, #04, #00 >   ;0F
  enemy-spawn < #1C, #2C, #00, @av6D_steelbones, #2C, #05, #00 >   ;10
  enemy-spawn < #2D, #29, #00, @av6D_steelbones, #2C, #06, #00 >   ;11
  enemy-spawn < #10, #03, #00, @av6D_dive_bat, #2D, #07, #00 >   ;12
  enemy-spawn < #14, #04, #00, @av6D_dive_bat, #2D, #08, #00 >   ;13
  enemy-spawn < #24, #04, #00, @av6D_dive_bat, #2D, #09, #00 >   ;14
  enemy-spawn < #22, #13, #00, @av6D_dive_bat, #2D, #0A, #00 >   ;15
  enemy-spawn < #18, #12, #00, @av6D_dive_bat, #2D, #0B, #00 >   ;16
  enemy-spawn < #1B, #12, #00, @av6D_dive_bat, #2D, #0C, #00 >   ;17
  enemy-spawn < #07, #13, #00, @av6D_dive_bat, #2D, #0D, #00 >   ;18
  enemy-spawn < #16, #25, #00, @av6D_dive_bat, #2D, #0E, #00 >   ;19
  enemy-spawn < #20, #25, #00, @av6D_dive_bat, #2D, #0F, #00 >   ;1A
]

scene_event_0CB04B [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #09, #05, #00, @av6D_flame_left >   ;04
  actor-spawn < #10, #05, #00, @av6D_flame_left >   ;05
  actor-spawn < #25, #06, #00, @av6D_flame_left >   ;06
  actor-spawn < #2A, #06, #00, @av6D_flame_right >   ;07
  actor-spawn < #33, #05, #00, @av6D_flame_right >   ;08
  actor-spawn < #31, #27, #00, @av6D_flame_left >   ;09
  enemy-spawn < #11, #0C, #00, @av6D_steelbones, #2C, #10, #00 >   ;0A
  enemy-spawn < #33, #0C, #00, @av6D_steelbones, #2C, #11, #00 >   ;0B
  enemy-spawn < #3D, #1C, #00, @av6D_steelbones, #2C, #12, #00 >   ;0C
  enemy-spawn < #28, #1C, #00, @av6D_steelbones, #2C, #13, #00 >   ;0D
  enemy-spawn < #05, #1C, #00, @av6D_steelbones, #2C, #14, #00 >   ;0E
  enemy-spawn < #03, #2C, #00, @av6D_steelbones, #2C, #15, #00 >   ;0F
  enemy-spawn < #08, #2A, #00, @av6D_steelbones, #2C, #16, #00 >   ;10
  enemy-spawn < #3B, #2C, #00, @av6D_steelbones, #2C, #17, #00 >   ;11
  enemy-spawn < #1B, #05, #00, @av6D_dive_bat, #2D, #18, #00 >   ;12
  enemy-spawn < #21, #04, #00, @av6D_dive_bat, #2D, #19, #00 >   ;13
  enemy-spawn < #2A, #03, #00, @av6D_dive_bat, #2D, #1A, #00 >   ;14
  enemy-spawn < #2F, #15, #00, @av6D_dive_bat, #2D, #1B, #00 >   ;15
  enemy-spawn < #0E, #25, #00, @av6D_dive_bat, #2D, #1C, #00 >   ;16
  enemy-spawn < #16, #25, #00, @av6D_dive_bat, #2D, #1D, #00 >   ;17
  enemy-spawn < #30, #24, #00, @av6D_dive_bat, #2D, #1E, #00 >   ;18
  enemy-spawn < #35, #23, #00, @av6D_dive_bat, #2D, #1F, #00 >   ;19
  enemy-spawn < #28, #09, #00, @av6E_draco, #2E, #20, #00 >   ;1A
  enemy-spawn < #37, #08, #00, @av6E_draco, #2E, #21, #00 >   ;1B
  enemy-spawn < #39, #29, #00, @av6E_draco, #2E, #22, #00 >   ;1C
]

scene_event_0CB13E [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #0D, #06, #00, @av6D_flame_left >   ;04
  actor-spawn < #14, #07, #00, @av6D_flame_left >   ;05
  actor-spawn < #1A, #06, #00, @av6D_flame_left >   ;06
  actor-spawn < #22, #09, #00, @av6D_flame_left >   ;07
  enemy-spawn < #0F, #02, #00, @av6D_dive_bat, #2D, #23, #00 >   ;08
  enemy-spawn < #16, #02, #00, @av6D_dive_bat, #2D, #24, #00 >   ;09
  enemy-spawn < #18, #02, #00, @av6D_dive_bat, #2D, #25, #00 >   ;0A
  enemy-spawn < #1C, #02, #00, @av6D_dive_bat, #2D, #26, #00 >   ;0B
  enemy-spawn < #22, #05, #00, @av6D_dive_bat, #2D, #27, #00 >   ;0C
  enemy-spawn < #24, #05, #00, @av6D_dive_bat, #2D, #28, #00 >   ;0D
]

scene_event_0CB1AE [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;03
  actor-spawn < #12, #07, #00, @av6D_flame_left >   ;04
  actor-spawn < #1D, #04, #00, @av6D_flame_right >   ;05
  actor-spawn < #2A, #05, #00, @av6D_flame_right >   ;06
  actor-spawn < #05, #16, #00, @av6D_flame_left >   ;07
  actor-spawn < #02, #27, #00, @av70_flame_center >   ;08
  actor-spawn < #07, #26, #00, @av70_flame_center >   ;09
  actor-spawn < #0C, #27, #00, @av70_flame_center >   ;0A
  actor-spawn < #17, #08, #00, @av70_hidden_passage >   ;0B
  actor-spawn < #00, #01, #00, @av70_crawlspace >   ;0C
  enemy-spawn < #1B, #19, #00, @av6D_steelbones, #2C, #30, #00 >   ;0D
  enemy-spawn < #1F, #12, #00, @av6D_dive_bat, #2D, #31, #00 >   ;0E
  enemy-spawn < #17, #13, #00, @av6D_dive_bat, #2D, #32, #00 >   ;0F
  enemy-spawn < #12, #14, #00, @av6D_dive_bat, #2D, #33, #00 >   ;10
  enemy-spawn < #27, #18, #00, @av6E_draco, #2E, #34, #00 >   ;11
  enemy-spawn < #2A, #18, #00, @av6E_draco, #2E, #35, #00 >   ;12
  enemy-spawn < #12, #1C, #00, @av70_ramskull, #2E, #36, #00 >   ;13
  actor-spawn < #26, #18, #09, @slider_glide.SliderGlideTriggerNorth >   ;14
  actor-spawn < #0A, #2E, #09, @slider_glide.SliderGlideTriggerSouth >   ;15
]

scene_event_0CB258 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;02
  actor-spawn < #00, #01, #00, @av71_wind_effect >   ;03
  actor-spawn < #1C, #09, #00, @av6D_flame_left >   ;04
  actor-spawn < #14, #07, #00, @av6D_flame_left >   ;05
  enemy-spawn < #1B, #0C, #00, @av70_ramskull, #2E, #37, #00 >   ;06
  enemy-spawn < #1E, #0E, #00, @av70_ramskull, #2E, #38, #00 >   ;07
]

scene_event_0CB29E [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;02
  enemy-spawn < #19, #0C, #00, @av6D_steelbones, #2C, #43, #00 >   ;03
  enemy-spawn < #49, #0C, #00, @av6D_steelbones, #2C, #44, #00 >   ;04
  enemy-spawn < #13, #05, #00, @av6D_dive_bat, #2D, #45, #00 >   ;05
  enemy-spawn < #15, #05, #00, @av6D_dive_bat, #2D, #46, #00 >   ;06
  enemy-spawn < #19, #05, #00, @av6D_dive_bat, #2D, #47, #00 >   ;07
  enemy-spawn < #1B, #05, #00, @av6D_dive_bat, #2D, #48, #00 >   ;08
  enemy-spawn < #1F, #05, #00, @av6D_dive_bat, #2D, #49, #00 >   ;09
  enemy-spawn < #21, #05, #00, @av6D_dive_bat, #2D, #50, #00 >   ;0A
  enemy-spawn < #32, #05, #00, @av6D_dive_bat, #2D, #51, #00 >   ;0B
  enemy-spawn < #39, #05, #00, @av6D_dive_bat, #2D, #52, #00 >   ;0C
  enemy-spawn < #47, #05, #00, @av6D_dive_bat, #2D, #53, #00 >   ;0D
  enemy-spawn < #29, #0B, #00, @av70_ramskull, #2E, #54, #00 >   ;0E
  enemy-spawn < #2A, #0C, #00, @av70_ramskull, #2E, #55, #00 >   ;0F
  enemy-spawn < #2B, #0D, #00, @av70_ramskull, #2E, #56, #00 >   ;10
  enemy-spawn < #45, #0B, #00, @av70_ramskull, #2E, #57, #00 >   ;11
  enemy-spawn < #46, #0C, #00, @av70_ramskull, #2E, #58, #00 >   ;12
  enemy-spawn < #47, #0D, #00, @av70_ramskull, #2E, #59, #00 >   ;13
  actor-spawn < #57, #08, #09, @slider_glide.SliderGlideTriggerNorthEntry >   ;14
]

scene_event_0CB355 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #08, #1E, #09, @slider_glide.SliderGlideTriggerSouth >   ;03
  actor-spawn < #00, #01, #00, @av70_crawlspace >   ;04
  actor-spawn < #2C, #17, #00, @av70_hidden_passage >   ;05
  actor-spawn < #00, #01, #00, @av73_waterfall_sound >   ;06
]

scene_event_0CB388 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #07, #08, #00, @av74_kara >   ;02
  actor-spawn < #25, #0B, #00, @av74_ishtar >   ;03
  actor-spawn < #15, #09, #0F, @hidden_red_jewel >   ;04
]

scene_event_0CB3AD [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #08, #1A, #01, @av75_voice_doors >   ;02
  actor-spawn < #12, #1A, #03, @av75_voice_doors >   ;03
  actor-spawn < #25, #1A, #05, @av75_voice_doors >   ;04
  actor-spawn < #2F, #1A, #07, @av75_voice_doors >   ;05
  actor-spawn < #42, #1A, #09, @av75_voice_doors >   ;06
  actor-spawn < #4C, #1A, #0B, @av75_voice_doors >   ;07
  actor-spawn < #5F, #1A, #0D, @av75_voice_doors >   ;08
  actor-spawn < #69, #1A, #0F, @av75_voice_doors >   ;09
  actor-spawn < #00, #01, #00, @av75_voice_rooms >   ;0A
  actor-spawn < #1D, #1D, #00, @av75_apprentice >   ;0B
  actor-spawn < #25, #08, #00, @av6C_portrait.av6C_portrait2 >   ;0C
  actor-spawn < #29, #08, #00, @av6C_portrait.av6C_portrait3 >   ;0D
  actor-spawn < #35, #08, #00, @av6C_portrait.av6C_portrait2 >   ;0E
  actor-spawn < #39, #08, #00, @av6C_portrait.av6C_portrait3 >   ;0F
]

scene_event_0CB41F [
  actor-spawn < #25, #38, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @overworld_exit >   ;03
  actor-spawn < #00, #01, #00, @scene_flag_init >   ;04
  actor-spawn < #00, #01, #00, @wa78_intro >   ;05
  actor-spawn < #00, #01, #00, @wa78_lance_camera_pan >   ;06
  actor-spawn < #4C, #2E, #00, @wa78_moving_pad >   ;07
  actor-spawn < #2D, #2C, #00, @wa78_lily_pad >   ;08
  actor-spawn < #1B, #1D, #00, @wa78_lily_pad >   ;09
  actor-spawn < #3E, #0E, #00, @wa78_lily_pad >   ;0A
  actor-spawn < #0D, #11, #00, @wa78_lily_pad >   ;0B
  actor-spawn < #0B, #12, #00, @wa78_lily_pad >   ;0C
  actor-spawn < #0B, #14, #00, @wa78_lily_pad >   ;0D
  actor-spawn < #09, #15, #00, @wa78_lily_pad >   ;0E
  actor-spawn < #09, #17, #00, @wa78_lily_pad >   ;0F
  actor-spawn < #09, #19, #00, @wa78_lily_pad >   ;10
  actor-spawn < #03, #3B, #00, @wa78_full_pad >   ;11
  actor-spawn < #29, #38, #41, @wa78_men >   ;12
  actor-spawn < #31, #34, #23, @wa78_men >   ;13
  actor-spawn < #3F, #34, #45, @wa78_men >   ;14
  actor-spawn < #33, #21, #01, @wa78_centipede_man >   ;15
  actor-spawn < #39, #11, #0B, @wa78_men >   ;16
  actor-spawn < #15, #3A, #01, @wa78_women >   ;17
  actor-spawn < #24, #2C, #01, @wa78_moving_woman >   ;18
  actor-spawn < #1D, #18, #03, @wa78_women >   ;19
  actor-spawn < #1D, #3B, #01, @wa78_water_kid >   ;1A
  actor-spawn < #05, #1D, #01, @wa78_children >   ;1B
  actor-spawn < #06, #1D, #03, @wa78_children >   ;1C
  actor-spawn < #1E, #18, #05, @wa78_children >   ;1D
  actor-spawn < #42, #1B, #07, @wa78_children >   ;1E
  actor-spawn < #11, #1D, #00, @wa78_crazy_man >   ;1F
  actor-spawn < #4A, #0A, #00, @wa78_glass_game >   ;20
  actor-spawn < #30, #33, #00, @wa78_kruk >   ;21
  actor-spawn < #30, #31, #00, @wa78_kruk >   ;22
  actor-spawn < #26, #08, #00, @wa78_kruk >   ;23
  actor-spawn < #1E, #22, #00, @wa78_prize_kruk >   ;24
  actor-spawn < #1E, #24, #00, @wa78_prize_kruk >   ;25
  actor-spawn < #1E, #26, #00, @wa78_prize_kruk >   ;26
  actor-spawn < #1E, #28, #00, @wa78_prize_kruk >   ;27
  actor-spawn < #25, #3A, #00, @wa78_flower >   ;28
  actor-spawn < #25, #3C, #00, @wa78_flower >   ;29
  actor-spawn < #2A, #3B, #00, @wa78_flower >   ;2A
  actor-spawn < #30, #28, #00, @wa78_flower >   ;2B
  actor-spawn < #0F, #16, #00, @wa78_flower >   ;2C
  actor-spawn < #35, #0B, #00, @wa78_diary >   ;2D
  actor-spawn < #12, #38, #11, @hidden_red_jewel >   ;2E
]

scene_event_0CB572 [
  actor-spawn < #05, #09, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #09, #0A, #00, @wa79_neil >   ;03
  actor-spawn < #07, #09, #00, @wa79_lily >   ;04
  actor-spawn < #08, #09, #00, @wa79_erik >   ;05
  actor-spawn < #05, #0A, #00, @wa79_kara >   ;06
  actor-spawn < #07, #0C, #00, @wa79_lance >   ;07
]

scene_event_0CB5AC [
  actor-spawn < #05, #09, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #0D, #0B, #00, @wa7A_lances_father >   ;03
  actor-spawn < #0B, #0B, #00, @wa7A_lance >   ;04
]

scene_event_0CB5D1 [
  actor-spawn < #05, #09, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #12, #08, #0D, @wa78_men >   ;03
  actor-spawn < #0E, #08, #01, @jeweler_gem >   ;04
  actor-spawn < #15, #0B, #4F, @wa78_men >   ;05
  actor-spawn < #0A, #0C, #71, @wa78_men >   ;06
  actor-spawn < #11, #08, #05, @wa78_women >   ;07
  actor-spawn < #0A, #0A, #67, @wa78_women >   ;08
  actor-spawn < #0D, #0A, #00, @wa7B_competitor_left >   ;09
  actor-spawn < #12, #0A, #00, @wa7B_competitor_right >   ;0A
  actor-spawn < #1A, #07, #13, @hidden_red_jewel >   ;0B
]

scene_event_0CB62D [
  actor-spawn < #05, #09, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #04, #09, #01, @dark_space.dark_space2 >   ;03
]

scene_event_0CB64B [
  actor-spawn < #05, #09, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #0B, #0A, #00, @wa7D_glass_opponent >   ;03
  actor-spawn < #07, #08, #09, @wa78_women >   ;04
]

scene_event_0CB670 [
  actor-spawn < #05, #09, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #09, #08, #17, @wa78_men >   ;03
  actor-spawn < #03, #0A, #6B, @wa78_women >   ;04
]

scene_event_0CB695 [
  actor-spawn < #2E, #0C, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @wa78_lance_camera_pan >   ;03
  actor-spawn < #2D, #0B, #00, @wa7F_lily >   ;04
  actor-spawn < #2B, #0B, #00, @wa7F_lance >   ;05
]

scene_event_0CB6C1 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraVertical >   ;02
  actor-spawn < #00, #01, #00, @gw82_trail_intro >   ;03
  actor-spawn < #00, #01, #00, @overworld_exit >   ;04
  enemy-spawn < #20, #18, #00, @gw82_archer.gw82_archer3, #33, #01, #00 >   ;05
  enemy-spawn < #20, #1B, #00, @gw82_archer.gw82_archer3, #33, #02, #00 >   ;06
  enemy-spawn < #21, #38, #00, @gw82_archer.gw82_archer3, #33, #03, #00 >   ;07
  enemy-spawn < #33, #38, #00, @gw82_archer.gw82_archer3, #33, #04, #00 >   ;08
  enemy-spawn < #47, #38, #00, @gw82_archer.gw82_archer3, #33, #05, #00 >   ;09
  enemy-spawn < #60, #28, #00, @gw82_archer.gw82_archer1, #33, #06, #00 >   ;0A
  enemy-spawn < #60, #2B, #00, @gw82_archer.gw82_archer1, #33, #07, #00 >   ;0B
  enemy-spawn < #6F, #28, #00, @gw82_archer.gw82_archer1, #33, #08, #00 >   ;0C
  enemy-spawn < #6F, #2B, #00, @gw82_archer.gw82_archer1, #33, #09, #00 >   ;0D
  enemy-spawn < #15, #0A, #00, @gw82_archer.gw82_archer1, #33, #10, #00 >   ;0E
  enemy-spawn < #13, #1A, #00, @gw82_archer.gw82_archer2, #33, #11, #00 >   ;0F
  enemy-spawn < #0E, #1A, #00, @gw82_archer.gw82_archer2, #33, #12, #00 >   ;10
  enemy-spawn < #14, #29, #00, @gw82_archer.gw82_archer2, #33, #13, #00 >   ;11
  enemy-spawn < #13, #2B, #00, @gw82_archer.gw82_archer2, #33, #14, #00 >   ;12
  enemy-spawn < #64, #1B, #00, @gw82_archer.gw82_archer2, #33, #15, #00 >   ;13
  enemy-spawn < #62, #18, #00, @gw82_archer.gw82_archer2, #33, #16, #00 >   ;14
  enemy-spawn < #5D, #1B, #00, @gw82_archer.gw82_archer2, #33, #17, #00 >   ;15
  enemy-spawn < #1F, #04, #00, @gw82_fire_bug, #35, #18, #00 >   ;16
  enemy-spawn < #2C, #04, #00, @gw82_fire_bug, #35, #19, #00 >   ;17
  enemy-spawn < #30, #14, #00, @gw82_fire_bug, #35, #1A, #00 >   ;18
  enemy-spawn < #30, #34, #00, @gw82_fire_bug, #35, #1B, #00 >   ;19
  enemy-spawn < #5F, #13, #00, @gw82_fire_bug, #35, #1C, #00 >   ;1A
  enemy-spawn < #57, #03, #00, @gw82_fire_bug, #35, #1D, #00 >   ;1B
  enemy-spawn < #0E, #38, #00, @gw82_eyesore, #34, #1E, #00 >   ;1C
  enemy-spawn < #17, #37, #00, @gw82_eyesore, #34, #1F, #00 >   ;1D
  enemy-spawn < #40, #39, #00, @gw82_eyesore, #34, #20, #00 >   ;1E
  enemy-spawn < #43, #37, #00, @gw82_eyesore, #34, #21, #00 >   ;1F
  enemy-spawn < #5C, #38, #00, @gw82_eyesore, #34, #22, #00 >   ;20
  enemy-spawn < #76, #38, #00, @gw82_eyesore, #34, #23, #00 >   ;21
  enemy-spawn < #70, #1A, #00, @gw82_eyesore, #34, #24, #00 >   ;22
  enemy-spawn < #51, #19, #00, @gw82_eyesore, #34, #25, #00 >   ;23
  enemy-spawn < #4C, #1A, #00, @gw82_eyesore, #34, #26, #00 >   ;24
  actor-spawn < #5A, #08, #01, @gw82_wall_spear >   ;25
  actor-spawn < #5D, #08, #01, @gw82_wall_spear >   ;26
  actor-spawn < #60, #08, #01, @gw82_wall_spear >   ;27
  actor-spawn < #63, #08, #01, @gw82_wall_spear >   ;28
  actor-spawn < #54, #28, #01, @gw82_necklace_stone >   ;29
  actor-spawn < #3E, #09, #03, @ramps.ramp_west >   ;2A
  actor-spawn < #40, #09, #03, @ramps.ramp_east >   ;2B
]

scene_event_0CB845 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraVertical >   ;02
  enemy-spawn < #14, #0A, #00, @gw82_archer.gw82_archer3, #33, #30, #00 >   ;03
  enemy-spawn < #24, #49, #00, @gw82_archer.gw82_archer3, #33, #31, #00 >   ;04
  enemy-spawn < #1A, #0A, #00, @gw82_archer.gw82_archer1, #33, #32, #00 >   ;05
  enemy-spawn < #3B, #2B, #00, @gw82_archer.gw82_archer1, #33, #33, #00 >   ;06
  enemy-spawn < #2F, #2B, #00, @gw82_archer.gw82_archer1, #33, #34, #00 >   ;07
  enemy-spawn < #24, #69, #00, @gw82_archer.gw82_archer2, #33, #35, #00 >   ;08
  enemy-spawn < #24, #6B, #00, @gw82_archer.gw82_archer2, #33, #36, #00 >   ;09
  enemy-spawn < #30, #49, #00, @gw82_archer.gw82_archer2, #33, #37, #00 >   ;0A
  enemy-spawn < #25, #19, #00, @gw82_archer.gw82_archer2, #33, #38, #00 >   ;0B
  enemy-spawn < #24, #1A, #00, @gw82_archer.gw82_archer2, #33, #39, #00 >   ;0C
  enemy-spawn < #31, #78, #00, @gw82_archer.gw83_stone_archer3, #33, #40, #00 >   ;0D
  enemy-spawn < #30, #04, #00, @gw82_fire_bug, #35, #41, #00 >   ;0E
  enemy-spawn < #37, #33, #00, @gw82_fire_bug, #35, #42, #00 >   ;0F
  enemy-spawn < #30, #6B, #00, @gw82_eyesore, #34, #43, #00 >   ;10
  enemy-spawn < #30, #58, #00, @gw82_eyesore, #34, #44, #00 >   ;11
  enemy-spawn < #34, #58, #00, @gw82_eyesore, #34, #45, #00 >   ;12
  enemy-spawn < #27, #4B, #00, @gw83_asp, #32, #46, #00 >   ;13
  enemy-spawn < #37, #3A, #00, @gw83_asp, #32, #47, #00 >   ;14
  enemy-spawn < #34, #39, #00, @gw83_asp, #32, #48, #00 >   ;15
  enemy-spawn < #37, #2B, #00, @gw83_asp, #32, #49, #00 >   ;16
  enemy-spawn < #2B, #2B, #00, @gw83_asp, #32, #4A, #00 >   ;17
  actor-spawn < #29, #47, #01, @gw82_wall_spear >   ;18
  actor-spawn < #30, #08, #01, @gw82_wall_spear >   ;19
  actor-spawn < #31, #08, #11, @gw82_wall_spear >   ;1A
  actor-spawn < #32, #08, #21, @gw82_wall_spear >   ;1B
  actor-spawn < #33, #08, #31, @gw82_wall_spear >   ;1C
  actor-spawn < #35, #1B, #03, @floor_button >   ;1D
  actor-spawn < #35, #1B, #00, @gw83_switch >   ;1E
  actor-spawn < #35, #29, #03, @gw82_necklace_stone >   ;1F
  actor-spawn < #2E, #05, #00, @gw83_lily >   ;20
  actor-spawn < #16, #09, #03, @ramps.ramp_west >   ;21
  actor-spawn < #18, #09, #03, @ramps.ramp_east >   ;22
]

scene_event_0CB966 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraVertical >   ;02
]

scene_event_0CB97D [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraVertical >   ;02
  actor-spawn < #3E, #0B, #03, @ramps.ramp_west >   ;03
  actor-spawn < #50, #0B, #03, @ramps.ramp_west >   ;04
  actor-spawn < #62, #0B, #03, @ramps.ramp_west >   ;05
  actor-spawn < #68, #0B, #03, @ramps.ramp_west >   ;06
  actor-spawn < #40, #0B, #03, @ramps.ramp_east >   ;07
  actor-spawn < #52, #0B, #03, @ramps.ramp_east >   ;08
  actor-spawn < #64, #0B, #03, @ramps.ramp_east >   ;09
  actor-spawn < #6A, #0B, #03, @ramps.ramp_east >   ;0A
  enemy-spawn < #15, #1D, #00, @gw83_asp, #32, #50, #00 >   ;0B
  enemy-spawn < #1C, #1A, #00, @gw83_asp, #32, #51, #00 >   ;0C
  enemy-spawn < #47, #1B, #00, @gw83_asp, #32, #52, #00 >   ;0D
  enemy-spawn < #4C, #1A, #00, @gw83_asp, #32, #53, #00 >   ;0E
  enemy-spawn < #4E, #1D, #00, @gw83_asp, #32, #54, #00 >   ;0F
  enemy-spawn < #53, #1B, #00, @gw83_asp, #32, #55, #00 >   ;10
  enemy-spawn < #26, #2A, #00, @gw83_asp, #32, #56, #00 >   ;11
  enemy-spawn < #6A, #2A, #00, @gw83_asp, #32, #57, #00 >   ;12
  enemy-spawn < #6E, #2B, #00, @gw83_asp, #32, #58, #00 >   ;13
  enemy-spawn < #75, #2A, #00, @gw83_asp, #32, #59, #00 >   ;14
  enemy-spawn < #27, #1D, #00, @gw82_eyesore, #34, #60, #00 >   ;15
  enemy-spawn < #4C, #1C, #00, @gw82_eyesore, #34, #61, #00 >   ;16
  enemy-spawn < #28, #2D, #00, @gw82_eyesore, #34, #64, #00 >   ;17
  enemy-spawn < #4E, #2D, #00, @gw82_eyesore, #34, #66, #00 >   ;18
  enemy-spawn < #55, #2D, #00, @gw82_eyesore, #34, #67, #00 >   ;19
  enemy-spawn < #5C, #2D, #00, @gw82_eyesore, #34, #68, #00 >   ;1A
  enemy-spawn < #6D, #2D, #00, @gw82_eyesore, #34, #69, #00 >   ;1B
  enemy-spawn < #74, #2D, #00, @gw82_eyesore, #34, #6A, #00 >   ;1C
  enemy-spawn < #4B, #25, #00, @gw82_fire_bug, #35, #6B, #00 >   ;1D
  enemy-spawn < #5A, #25, #00, @gw82_fire_bug, #35, #6C, #00 >   ;1E
  enemy-spawn < #11, #1D, #00, @gw82_archer.gw82_archer2, #33, #6D, #00 >   ;1F
  enemy-spawn < #1D, #1C, #00, @gw82_archer.gw82_archer2, #33, #6E, #00 >   ;20
  enemy-spawn < #20, #1B, #00, @gw82_archer.gw82_archer2, #33, #6F, #00 >   ;21
  enemy-spawn < #23, #1C, #00, @gw82_archer.gw82_archer2, #33, #70, #00 >   ;22
  enemy-spawn < #10, #2B, #00, @gw82_archer.gw82_archer2, #33, #71, #00 >   ;23
  enemy-spawn < #17, #2B, #00, @gw82_archer.gw82_archer2, #33, #72, #00 >   ;24
  actor-spawn < #13, #29, #01, @gw82_wall_spear >   ;25
  actor-spawn < #1A, #29, #01, @gw82_wall_spear >   ;26
  actor-spawn < #12, #19, #00, @gw85_retractable_gate >   ;27
  actor-spawn < #2C, #29, #00, @gw85_short_switch_spear >   ;28
  actor-spawn < #34, #29, #00, @gw85_long_switch_spear >   ;29
  actor-spawn < #64, #19, #00, @gw85_multi_switch_spear >   ;2A
  actor-spawn < #65, #19, #00, @gw85_multi_switch_spear >   ;2B
  actor-spawn < #18, #1A, #03, @floor_button >   ;2C
  actor-spawn < #3B, #29, #05, @floor_button >   ;2D
  actor-spawn < #29, #2B, #05, @floor_button >   ;2E
  actor-spawn < #37, #2C, #07, @floor_button >   ;2F
  actor-spawn < #64, #1D, #09, @floor_button >   ;30
  actor-spawn < #00, #01, #00, @gw85_spin_dash_gate >   ;31
  actor-spawn < #06, #2B, #03, @dark_space.dark_space2 >   ;32
]

scene_event_0CBB18 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraVertical >   ;02
  enemy-spawn < #17, #28, #00, @gw82_archer.gw83_stone_archer3, #33, #80, #00 >   ;03
  enemy-spawn < #1B, #28, #00, @gw82_archer.gw83_stone_archer3, #33, #81, #00 >   ;04
  enemy-spawn < #14, #1B, #00, @gw83_asp, #32, #82, #00 >   ;05
  enemy-spawn < #0F, #1B, #00, @gw83_asp, #32, #83, #00 >   ;06
  enemy-spawn < #1E, #1B, #00, @gw83_asp, #32, #84, #00 >   ;07
  enemy-spawn < #26, #1B, #00, @gw83_asp, #32, #85, #00 >   ;08
  enemy-spawn < #08, #5B, #00, @gw83_asp, #32, #86, #00 >   ;09
  enemy-spawn < #1F, #5B, #00, @gw83_asp, #32, #87, #00 >   ;0A
  enemy-spawn < #24, #5B, #00, @gw83_asp, #32, #88, #00 >   ;0B
  actor-spawn < #15, #47, #05, @dark_space.dark_space2 >   ;0C
]

scene_event_0CBB87 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraVertical >   ;02
  enemy-spawn < #21, #0A, #00, @gw82_archer.gw82_archer1, #33, #9B, #53 >   ;03
  enemy-spawn < #0D, #18, #00, @gw82_archer.gw82_archer2, #33, #90, #00 >   ;04
  enemy-spawn < #0C, #19, #00, @gw82_archer.gw82_archer2, #33, #91, #00 >   ;05
  enemy-spawn < #0B, #1A, #00, @gw82_archer.gw82_archer2, #33, #92, #00 >   ;06
  enemy-spawn < #0A, #1B, #00, @gw82_archer.gw82_archer2, #33, #93, #00 >   ;07
  enemy-spawn < #08, #2A, #00, @gw82_archer.gw87_statue_archer, #46, #94, #00 >   ;08
  enemy-spawn < #14, #2A, #00, @gw82_archer.gw87_statue_archer, #46, #95, #00 >   ;09
  enemy-spawn < #1B, #2B, #00, @gw82_archer.gw87_statue_archer, #46, #96, #00 >   ;0A
  enemy-spawn < #25, #2A, #00, @gw82_archer.gw87_statue_archer, #46, #97, #00 >   ;0B
  enemy-spawn < #26, #2B, #00, @gw82_archer.gw87_statue_archer, #46, #98, #00 >   ;0C
  enemy-spawn < #2F, #2B, #00, @gw82_archer.gw87_statue_archer, #46, #99, #00 >   ;0D
  enemy-spawn < #28, #14, #00, @gw82_fire_bug, #33, #9A, #00 >   ;0E
  actor-spawn < #2F, #28, #1F, @floor_button >   ;0F
  actor-spawn < #27, #17, #01, @gw82_wall_spear >   ;10
  actor-spawn < #28, #17, #21, @gw82_wall_spear >   ;11
  actor-spawn < #29, #17, #41, @gw82_wall_spear >   ;12
  actor-spawn < #2D, #17, #41, @gw82_wall_spear >   ;13
  actor-spawn < #2E, #17, #21, @gw82_wall_spear >   ;14
  actor-spawn < #2F, #17, #01, @gw82_wall_spear >   ;15
]

scene_event_0CBC3B [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraVertical >   ;02
  actor-spawn < #16, #09, #03, @ramps.ramp_west >   ;03
  actor-spawn < #18, #09, #03, @ramps.ramp_east >   ;04
  actor-spawn < #00, #01, #00, @gw88_tomb_dark_space >   ;05
  enemy-spawn < #14, #1B, #00, @gw82_archer.gw82_archer3, #33, #A0, #00 >   ;06
  enemy-spawn < #2F, #1A, #00, @gw82_archer.gw82_archer3, #33, #A1, #00 >   ;07
  enemy-spawn < #1E, #18, #00, @gw82_archer.gw82_archer1, #33, #A2, #00 >   ;08
  enemy-spawn < #3A, #1A, #00, @gw82_archer.gw82_archer1, #33, #A3, #00 >   ;09
  enemy-spawn < #05, #18, #00, @gw82_archer.gw82_archer2, #33, #A4, #00 >   ;0A
  enemy-spawn < #0A, #1B, #00, @gw82_archer.gw82_archer2, #33, #A5, #00 >   ;0B
  enemy-spawn < #2F, #2B, #00, @gw82_archer.gw83_stone_archer4, #33, #F8, #00 >   ;0C
  enemy-spawn < #06, #2B, #00, @gw82_archer.gw83_stone_archer4, #33, #F9, #00 >   ;0D
  enemy-spawn < #11, #28, #00, @gw82_archer.gw83_stone_archer4, #33, #FA, #00 >   ;0E
  enemy-spawn < #15, #28, #00, @gw82_archer.gw83_stone_archer4, #33, #FB, #00 >   ;0F
  enemy-spawn < #27, #28, #00, @gw82_archer.gw83_stone_archer4, #33, #FC, #00 >   ;10
  enemy-spawn < #36, #28, #00, @gw82_archer.gw83_stone_archer4, #33, #FD, #00 >   ;11
  enemy-spawn < #19, #18, #00, @gw83_asp, #32, #A8, #00 >   ;12
  enemy-spawn < #28, #1B, #00, @gw82_eyesore, #34, #A6, #00 >   ;13
  enemy-spawn < #35, #1B, #00, @gw82_eyesore, #34, #A7, #00 >   ;14
  actor-spawn < #2B, #17, #01, @gw82_wall_spear >   ;15
  actor-spawn < #32, #17, #01, @gw82_wall_spear >   ;16
  actor-spawn < #07, #17, #01, @gw88_short_wall_spear >   ;17
  actor-spawn < #17, #17, #01, @gw88_short_wall_spear >   ;18
]

scene_event_0CBD0A [
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;00
  actor-spawn < #00, #01, #00, @s89_new_babel >   ;01
]

scene_event_0CBD1A [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraVertical >   ;02
  enemy-spawn < #27, #30, #00, @gw8A_sand_fanger.gw8A_sand_fanger, #36, #00, #6A >   ;03
  actor-spawn < #00, #01, #01, @boss_clear_reward_handler >   ;04
]

scene_event_0CBD41 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraVertical >   ;02
  actor-spawn < #04, #1A, #00, @gw8B_lance_lily.gw8B_lance >   ;03
]

scene_event_0CBD5F [
  actor-spawn < #00, #01, #00, @pr8C_prologue1 >   ;00
  actor-spawn < #00, #01, #00, @pr8C_prologue5 >   ;01
  actor-spawn < #00, #01, #00, @sFC_title_start_handler.sFC_actor_0BC9BD >   ;02
]

scene_event_0CBD76 [
  actor-spawn < #00, #01, #00, @pr8D_prologue2 >   ;00
  actor-spawn < #00, #01, #00, @sFC_title_start_handler.sFC_actor_0BC9BD >   ;01
]

scene_event_0CBD86 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #12, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @pr8E_prologue3 >   ;03
  actor-spawn < #00, #01, #00, @sFC_title_start_handler.sFC_actor_0BC9BD >   ;04
]

scene_event_0CBDAB [
  actor-spawn < #00, #01, #00, @pr8F_prologue4 >   ;00
  actor-spawn < #00, #01, #00, @sFC_title_start_handler.sFC_actor_0BC9BD >   ;01
]

scene_event_0CBDBB [
  actor-spawn < #00, #01, #00, @s90_changed_world >
]

scene_event_0CBDC4 [
  actor-spawn < #37, #44, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @eu91_intro >   ;03
  actor-spawn < #00, #01, #00, @overworld_exit >   ;04
  actor-spawn < #14, #3B, #21, @eu91_merchant_counter >   ;05
  actor-spawn < #14, #39, #43, @eu91_merchant_counter >   ;06
  actor-spawn < #1B, #39, #61, @eu91_merchant_counter >   ;07
  actor-spawn < #1B, #35, #07, @eu91_merchant_counter >   ;08
  actor-spawn < #1B, #2C, #8F, @eu91_merchant_counter >   ;09
  actor-spawn < #1B, #2E, #0F, @eu91_merchant_counter >   ;0A
  actor-spawn < #1B, #2F, #0F, @eu91_merchant_counter >   ;0B
  actor-spawn < #14, #28, #A9, @eu91_merchant_counter >   ;0C
  actor-spawn < #14, #29, #AB, @eu91_merchant_counter >   ;0D
  actor-spawn < #14, #2C, #D1, @eu91_merchant_counter >   ;0E
  actor-spawn < #1B, #20, #ED, @eu91_merchant_counter >   ;0F
  actor-spawn < #14, #20, #00, @eu91_book >   ;10
  actor-spawn < #03, #41, #00, @eu91_crate >   ;11
  actor-spawn < #01, #3F, #00, @eu91_crate >   ;12
  actor-spawn < #03, #41, #00, @eu91_crate.eu91_crate2 >   ;13
  actor-spawn < #13, #3B, #81, @eu91_merchant >   ;14
  actor-spawn < #13, #2D, #C1, @eu91_merchant >   ;15
  actor-spawn < #1C, #21, #61, @eu91_merchant.eu91_merchant2 >   ;16
  actor-spawn < #13, #39, #21, @eu91_merchant >   ;17
  actor-spawn < #1C, #2D, #41, @eu91_merchant.eu91_merchant2 >   ;18
  actor-spawn < #13, #21, #61, @eu91_merchant >   ;19
  actor-spawn < #1C, #39, #00, @eu91_merchant.eu91_merchant3 >   ;1A
  actor-spawn < #13, #29, #00, @eu91_merchant.eu91_merchant4 >   ;1B
  actor-spawn < #34, #43, #01, @eu91_men1 >   ;1C
  actor-spawn < #39, #0C, #03, @eu91_men1 >   ;1D
  actor-spawn < #1A, #40, #05, @eu91_men1 >   ;1E
  actor-spawn < #15, #39, #47, @eu91_men1 >   ;1F
  actor-spawn < #27, #0A, #69, @eu91_men1 >   ;20
  actor-spawn < #02, #40, #0B, @eu91_men1 >   ;21
  actor-spawn < #27, #21, #00, @eu91_peeking_man >   ;22
  actor-spawn < #37, #31, #61, @eu91_women1 >   ;23
  actor-spawn < #15, #29, #43, @eu91_women1 >   ;24
  actor-spawn < #01, #2E, #65, @eu91_women1 >   ;25
  actor-spawn < #17, #1E, #01, @eu91_men2 >   ;26
  actor-spawn < #18, #0A, #03, @eu91_men2 >   ;27
  actor-spawn < #39, #39, #01, @eu91_women2 >   ;28
  actor-spawn < #19, #31, #03, @eu91_women2 >   ;29
  actor-spawn < #16, #1B, #05, @eu91_women2 >   ;2A
  actor-spawn < #22, #41, #01, @eu91_shop_queue >   ;2B
  actor-spawn < #22, #42, #A3, @eu91_shop_queue >   ;2C
  actor-spawn < #23, #42, #05, @eu91_shop_queue >   ;2D
  actor-spawn < #24, #42, #A7, @eu91_shop_queue >   ;2E
  actor-spawn < #25, #42, #A9, @eu91_shop_queue >   ;2F
  actor-spawn < #2C, #42, #0B, @eu91_shop_queue >   ;30
  actor-spawn < #22, #40, #01, @eu91_shop_door >   ;31
  actor-spawn < #06, #40, #00, @town_door >   ;32
  actor-spawn < #0D, #40, #00, @town_door >   ;33
  actor-spawn < #33, #40, #00, @town_door >   ;34
  actor-spawn < #34, #31, #00, @town_door >   ;35
  actor-spawn < #31, #23, #00, @town_door >   ;36
  actor-spawn < #29, #23, #00, @town_door >   ;37
  actor-spawn < #23, #23, #00, @town_door >   ;38
  actor-spawn < #27, #32, #15, @hidden_red_jewel >   ;39
]

scene_event_0CBF65 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #06, #09, #00, @eu92_erasquez >   ;03
  actor-spawn < #08, #09, #00, @eu92_rofsky >   ;04
]

scene_event_0CBF8A [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #07, #09, #00, @eu93_found >   ;03
]

scene_event_0CBFA8 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #0C, #0C, #00, @eu94_employee >   ;03
  actor-spawn < #0B, #0C, #6D, @eu91_men1 >   ;04
]

scene_event_0CBFD6 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #0B, #0A, #00, @eu95_ann >   ;03
  actor-spawn < #2B, #0B, #00, @eu95_neils_father >   ;04
  actor-spawn < #29, #0C, #00, @eu95_neils_mother >   ;05
  actor-spawn < #2A, #0B, #00, @eu95_neil >   ;06
]

scene_event_0CC012 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #05, #0B, #00, @eu96_kara >   ;03
  actor-spawn < #08, #09, #00, @eu96_erik >   ;04
  actor-spawn < #0A, #0D, #00, @eu96_neil >   ;05
]

scene_event_0CC048 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #19, #0C, #00, @eu97_clerk1 >   ;03
  actor-spawn < #08, #0D, #00, @eu97_clerk2 >   ;04
  actor-spawn < #0D, #08, #00, @eu97_life_medicine >   ;05
  actor-spawn < #10, #08, #00, @eu97_dark_medicine >   ;06
]

scene_event_0CC07B [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #07, #0A, #07, @eu91_women2 >   ;03
]

scene_event_0CC099 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #0B, #0A, #01, @dark_space.dark_space2 >   ;03
  actor-spawn < #04, #1A, #05, @eu91_men2 >   ;04
]

scene_event_0CC0BE [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #07, #09, #00, @eu9A_friezer >   ;03
  actor-spawn < #05, #0A, #00, @eu9A_max >   ;04
  actor-spawn < #0A, #0A, #00, @eu9A_rudy >   ;05
]

scene_event_0CC0EA [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #03, #0C, #01, @jeweler_gem >   ;03
]

scene_event_0CC108 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #04, #0B, #0F, @eu91_men1 >   ;03
  actor-spawn < #03, #0B, #11, @eu91_men1 >   ;04
]

scene_event_0CC12D [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #06, #18, #01, @eu9D_slaves >   ;03
  actor-spawn < #08, #18, #03, @eu9D_slaves >   ;04
  actor-spawn < #0B, #18, #05, @eu9D_slaves >   ;05
  actor-spawn < #12, #19, #07, @eu9D_slaves >   ;06
  actor-spawn < #14, #19, #09, @eu9D_slaves >   ;07
  actor-spawn < #03, #1A, #00, @eu9D_bones >   ;08
  actor-spawn < #05, #19, #00, @eu9D_bones >   ;09
  actor-spawn < #0F, #08, #00, @eu9D_altar >   ;0A
  actor-spawn < #1E, #1C, #17, @hidden_red_jewel >   ;0B
]

scene_event_0CC18A [
]

scene_event_0CC18C [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #DF, #DF, #00, @camera_scroll.ScrollCameraInit >   ;02
  actor-spawn < #00, #01, #00, @overworld_exit >   ;03
  actor-spawn < #00, #01, #00, @mtA0_intro >   ;04
  enemy-spawn < #1E, #1C, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #01, #00 >   ;05
  enemy-spawn < #15, #1C, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #02, #00 >   ;06
  enemy-spawn < #08, #15, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #03, #00 >   ;07
  enemy-spawn < #10, #09, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #04, #00 >   ;08
  enemy-spawn < #20, #09, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #05, #00 >   ;09
  enemy-spawn < #25, #15, #30, @mtA0_skulker.mtA0_skulker_ns, #3E, #06, #00 >   ;0A
  enemy-spawn < #17, #11, #30, @mtA0_skulker.mtA0_skulker_ns, #3E, #07, #00 >   ;0B
  enemy-spawn < #07, #19, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #08, #00 >   ;0C
  enemy-spawn < #0E, #05, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #09, #00 >   ;0D
  enemy-spawn < #13, #0F, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #0A, #00 >   ;0E
  enemy-spawn < #18, #04, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #0B, #00 >   ;0F
]

scene_event_0CC21C [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #DF, #DF, #00, @camera_scroll.ScrollCameraInit >   ;02
  actor-spawn < #36, #27, #09, @ramps.ramp_north >   ;03
  actor-spawn < #16, #1E, #09, @ramps.ramp_north >   ;04
  actor-spawn < #1A, #23, #11, @ramps.ramp_south >   ;05
  actor-spawn < #10, #0C, #03, @ramps.ramp_west >   ;06
  actor-spawn < #1F, #30, #03, @dark_space.dark_space2 >   ;07
  enemy-spawn < #0B, #33, #30, @mtA1_fire_sprite, #3F, #10, #00 >   ;08
  enemy-spawn < #28, #0C, #30, @mtA1_fire_sprite, #3F, #11, #00 >   ;09
  enemy-spawn < #1B, #0B, #30, @mtA1_fire_sprite, #3F, #12, #00 >   ;0A
  enemy-spawn < #31, #25, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #13, #00 >   ;0B
  enemy-spawn < #09, #21, #30, @mtA0_acid_spider.mtA0_acid_spider2, #3C, #14, #00 >   ;0C
  enemy-spawn < #0B, #21, #30, @mtA0_acid_spider.mtA0_acid_spider2, #3C, #15, #00 >   ;0D
  enemy-spawn < #1A, #22, #30, @mtA0_acid_spider.mtA0_acid_spider3, #3C, #16, #00 >   ;0E
  enemy-spawn < #17, #1F, #30, @mtA0_acid_spider.mtA0_acid_spider4, #3C, #17, #00 >   ;0F
  enemy-spawn < #2E, #34, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #18, #00 >   ;10
  enemy-spawn < #30, #3C, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #19, #00 >   ;11
  enemy-spawn < #1E, #2A, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #1A, #00 >   ;12
  enemy-spawn < #1C, #1A, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #1B, #00 >   ;13
  enemy-spawn < #07, #11, #30, @mtA0_skulker.mtA0_skulker_ns, #3E, #1C, #00 >   ;14
  enemy-spawn < #0C, #11, #30, @mtA0_skulker.mtA0_skulker_ns, #3E, #1D, #00 >   ;15
  enemy-spawn < #26, #38, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #1E, #00 >   ;16
  enemy-spawn < #17, #27, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #1F, #00 >   ;17
  enemy-spawn < #21, #17, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #20, #00 >   ;18
  enemy-spawn < #24, #17, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #21, #00 >   ;19
  enemy-spawn < #2A, #2A, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #22, #00 >   ;1A
  enemy-spawn < #09, #1B, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #23, #00 >   ;1B
  enemy-spawn < #0A, #16, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #24, #00 >   ;1C
  enemy-spawn < #09, #11, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #25, #00 >   ;1D
  enemy-spawn < #0A, #0C, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #26, #00 >   ;1E
  enemy-spawn < #2D, #1A, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #27, #00 >   ;1F
  actor-spawn < #36, #28, #01, @movement_speed_zones.speed_zone_ns_slow >   ;20
]

scene_event_0CC335 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #DF, #DF, #00, @camera_scroll.ScrollCameraInit >   ;02
  actor-spawn < #0C, #2D, #09, @ramps.ramp_north >   ;03
  actor-spawn < #00, #01, #00, @mtA2_mushroom_drop_gate >   ;04
  enemy-spawn < #0D, #1C, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #30, #00 >   ;05
  enemy-spawn < #0D, #18, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #31, #00 >   ;06
  enemy-spawn < #07, #09, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #32, #00 >   ;07
  enemy-spawn < #04, #30, #30, @mtA0_acid_spider.mtA0_acid_spider4, #3C, #33, #00 >   ;08
  enemy-spawn < #15, #09, #30, @mtA0_acid_spider.mtA0_acid_spider4, #3C, #34, #00 >   ;09
  enemy-spawn < #11, #2C, #30, @mtA0_acid_spider.mtA0_acid_spider1, #3C, #35, #00 >   ;0A
  enemy-spawn < #07, #2B, #30, @mtA0_skulker.mtA0_skulker_ns, #3E, #36, #00 >   ;0B
  enemy-spawn < #18, #24, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #37, #00 >   ;0C
  enemy-spawn < #18, #1A, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #38, #00 >   ;0D
  enemy-spawn < #11, #1F, #30, @mtA0_skulker.mtA0_skulker2, #3E, #39, #00 >   ;0E
  enemy-spawn < #11, #15, #30, @mtA0_skulker.mtA0_skulker2, #3E, #3A, #00 >   ;0F
  enemy-spawn < #0C, #0F, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #3B, #00 >   ;10
  enemy-spawn < #13, #29, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #3C, #00 >   ;11
  enemy-spawn < #1B, #09, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #3D, #00 >   ;12
  actor-spawn < #0C, #2E, #01, @movement_speed_zones.speed_zone_ns_slow >   ;13
]

scene_event_0CC3DF [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #DF, #DF, #00, @camera_scroll.ScrollCameraInit >   ;02
  actor-spawn < #69, #11, #03, @ramps.ramp_east >   ;03
  actor-spawn < #58, #11, #03, @ramps.ramp_east >   ;04
  actor-spawn < #47, #11, #03, @ramps.ramp_east >   ;05
  actor-spawn < #36, #11, #03, @ramps.ramp_east >   ;06
  actor-spawn < #25, #11, #03, @ramps.ramp_east >   ;07
  actor-spawn < #7C, #0B, #03, @dark_space.dark_space2 >   ;08
  enemy-spawn < #12, #09, #30, @mtA0_skulker.mtA0_skulker2, #3E, #40, #00 >   ;09
  enemy-spawn < #21, #09, #30, @mtA0_skulker.mtA0_skulker2, #3E, #41, #00 >   ;0A
  enemy-spawn < #3D, #09, #30, @mtA0_skulker.mtA0_skulker2, #3E, #42, #00 >   ;0B
  enemy-spawn < #54, #0E, #30, @mtA0_skulker.mtA0_skulker2, #3E, #43, #00 >   ;0C
  enemy-spawn < #74, #09, #30, @mtA0_skulker.mtA0_skulker2, #3E, #44, #00 >   ;0D
  enemy-spawn < #1B, #09, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #45, #00 >   ;0E
  enemy-spawn < #23, #07, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #46, #00 >   ;0F
  enemy-spawn < #7A, #0B, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #47, #00 >   ;10
  enemy-spawn < #76, #0E, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #48, #00 >   ;11
  enemy-spawn < #7B, #10, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #49, #00 >   ;12
  enemy-spawn < #28, #14, #30, @mtA0_acid_spider.mtA0_acid_spider4, #3C, #4A, #00 >   ;13
  enemy-spawn < #3E, #0E, #30, @mtA0_acid_spider.mtA0_acid_spider4, #3C, #4B, #00 >   ;14
  enemy-spawn < #51, #09, #30, @mtA0_acid_spider.mtA0_acid_spider4, #3C, #4C, #00 >   ;15
  enemy-spawn < #35, #14, #30, @mtA0_acid_spider.mtA0_acid_spider3, #3C, #4D, #00 >   ;16
  enemy-spawn < #58, #09, #30, @mtA0_acid_spider.mtA0_acid_spider3, #3C, #4E, #00 >   ;17
  enemy-spawn < #2D, #0F, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #50, #00 >   ;18
  enemy-spawn < #30, #0F, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #51, #00 >   ;19
  enemy-spawn < #2E, #12, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #52, #00 >   ;1A
  enemy-spawn < #3F, #0C, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #53, #00 >   ;1B
  enemy-spawn < #6B, #07, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #55, #00 >   ;1C
  actor-spawn < #6A, #11, #01, @movement_speed_zones.speed_zone_ew_slow >   ;1D
  actor-spawn < #4F, #11, #01, @movement_speed_zones.speed_zone_ew_slow >   ;1E
  actor-spawn < #40, #11, #01, @movement_speed_zones.speed_zone_ew_slow >   ;1F
  actor-spawn < #36, #11, #01, @movement_speed_zones.speed_zone_ew_slow >   ;20
  actor-spawn < #25, #11, #01, @movement_speed_zones.speed_zone_ew_slow >   ;21
]

scene_event_0CC4F7 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #DF, #DF, #00, @camera_scroll.ScrollCameraInit >   ;02
  enemy-spawn < #19, #16, #30, @mtA0_skulker.mtA0_skulker2, #3E, #60, #00 >   ;03
  enemy-spawn < #26, #16, #30, @mtA0_skulker.mtA0_skulker2, #3E, #61, #00 >   ;04
  enemy-spawn < #21, #3E, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #62, #00 >   ;05
  enemy-spawn < #09, #38, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #63, #00 >   ;06
  enemy-spawn < #2E, #06, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #64, #00 >   ;07
  enemy-spawn < #29, #06, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #65, #00 >   ;08
  enemy-spawn < #24, #06, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #66, #00 >   ;09
  enemy-spawn < #1F, #06, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #67, #00 >   ;0A
  enemy-spawn < #32, #25, #30, @mtA0_skulker.mtA0_skulker_ns, #3E, #68, #00 >   ;0B
  enemy-spawn < #0F, #1F, #30, @mtA0_skulker.mtA0_skulker_ns, #3E, #69, #00 >   ;0C
  enemy-spawn < #26, #38, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #6A, #00 >   ;0D
  enemy-spawn < #11, #28, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #6B, #00 >   ;0E
  enemy-spawn < #13, #1C, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #6C, #00 >   ;0F
  enemy-spawn < #32, #0F, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #6D, #00 >   ;10
  enemy-spawn < #34, #10, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #6E, #68 >   ;11
  enemy-spawn < #1C, #2F, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #6F, #00 >   ;12
  enemy-spawn < #0C, #28, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #70, #00 >   ;13
  enemy-spawn < #0A, #1C, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #71, #00 >   ;14
  enemy-spawn < #1E, #2E, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #72, #00 >   ;15
  enemy-spawn < #28, #38, #30, @mtA0_acid_spider.mtA0_acid_spider3, #3C, #73, #00 >   ;16
  enemy-spawn < #31, #38, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #74, #00 >   ;17
  enemy-spawn < #35, #38, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #75, #00 >   ;18
  enemy-spawn < #0D, #32, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #76, #00 >   ;19
  enemy-spawn < #10, #12, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #77, #00 >   ;1A
  enemy-spawn < #13, #12, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #78, #00 >   ;1B
  enemy-spawn < #16, #12, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #79, #00 >   ;1C
]

scene_event_0CC5F8 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #DF, #DF, #00, @camera_scroll.ScrollCameraInit >   ;02
  actor-spawn < #14, #0F, #11, @ramps.ramp_south >   ;03
  actor-spawn < #00, #01, #00, @mtA5_mushroom_drop_gate_a >   ;04
  actor-spawn < #00, #01, #00, @mtA5_mushroom_drop_gate_b >   ;05
  enemy-spawn < #23, #3D, #30, @mtA1_fire_sprite, #3F, #80, #00 >   ;06
  enemy-spawn < #15, #23, #30, @mtA1_fire_sprite, #3F, #81, #00 >   ;07
  enemy-spawn < #0A, #19, #30, @mtA1_fire_sprite, #3F, #82, #00 >   ;08
  enemy-spawn < #08, #33, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #83, #00 >   ;09
  enemy-spawn < #26, #23, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #84, #00 >   ;0A
  enemy-spawn < #08, #3A, #30, @mtA1_yorrick_ns.mtA1_yorrick_2, #3D, #85, #00 >   ;0B
  enemy-spawn < #29, #13, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #86, #00 >   ;0C
  enemy-spawn < #0E, #07, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #87, #00 >   ;0D
  enemy-spawn < #11, #07, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #88, #00 >   ;0E
  enemy-spawn < #38, #13, #30, @mtA0_skulker.mtA0_skulker_ns, #3E, #89, #00 >   ;0F
  enemy-spawn < #37, #2B, #30, @mtA0_skulker.mtA0_skulker2, #3E, #8A, #00 >   ;10
  enemy-spawn < #1C, #2B, #30, @mtA0_skulker.mtA0_skulker2, #3E, #8B, #00 >   ;11
  enemy-spawn < #19, #3A, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #8C, #00 >   ;12
  enemy-spawn < #05, #13, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #8D, #00 >   ;13
  enemy-spawn < #0C, #13, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #8E, #00 >   ;14
  enemy-spawn < #12, #13, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #8F, #00 >   ;15
  enemy-spawn < #0E, #37, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #90, #00 >   ;16
  enemy-spawn < #12, #27, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #91, #00 >   ;17
  enemy-spawn < #0F, #03, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #92, #00 >   ;18
  enemy-spawn < #2B, #09, #30, @mtA0_acid_spider.mtA0_acid_spider2, #3C, #93, #00 >   ;19
  enemy-spawn < #1A, #31, #30, @mtA0_acid_spider.mtA0_acid_spider3, #3C, #94, #00 >   ;1A
  enemy-spawn < #29, #25, #30, @mtA0_acid_spider.mtA0_acid_spider3, #3C, #95, #00 >   ;1B
  enemy-spawn < #14, #37, #30, @mtA0_acid_spider.mtA0_acid_spider4, #3C, #96, #00 >   ;1C
  enemy-spawn < #24, #25, #30, @mtA0_acid_spider.mtA0_acid_spider4, #3C, #97, #00 >   ;1D
  actor-spawn < #14, #0E, #01, @movement_speed_zones.speed_zone_ew_slow >   ;1E
]

scene_event_0CC703 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #DF, #DF, #00, @camera_scroll.ScrollCameraInit >   ;02
  enemy-spawn < #17, #2E, #30, @mtA1_fire_sprite, #3F, #A0, #00 >   ;03
  enemy-spawn < #2B, #33, #30, @mtA1_fire_sprite, #3F, #A1, #00 >   ;04
  enemy-spawn < #0D, #21, #30, @mtA1_fire_sprite, #3F, #A2, #00 >   ;05
  enemy-spawn < #2E, #1C, #30, @mtA1_fire_sprite, #3F, #A3, #00 >   ;06
  enemy-spawn < #35, #16, #30, @mtA1_fire_sprite, #3F, #A4, #00 >   ;07
  enemy-spawn < #26, #0C, #30, @mtA1_fire_sprite, #3F, #A5, #00 >   ;08
  enemy-spawn < #14, #1C, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #A6, #00 >   ;09
  enemy-spawn < #17, #1D, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #A7, #00 >   ;0A
  enemy-spawn < #1A, #1C, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #A8, #00 >   ;0B
  enemy-spawn < #1D, #1D, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #A9, #00 >   ;0C
  enemy-spawn < #05, #07, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #AA, #00 >   ;0D
  enemy-spawn < #22, #0B, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #AB, #00 >   ;0E
  enemy-spawn < #38, #29, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #AC, #00 >   ;0F
  enemy-spawn < #39, #2D, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #AD, #00 >   ;10
  enemy-spawn < #3C, #2B, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #AE, #00 >   ;11
]

scene_event_0CC7A1 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #DF, #DF, #00, @camera_scroll.ScrollCameraInit >   ;02
  actor-spawn < #79, #31, #05, @dark_space.dark_space2 >   ;03
  actor-spawn < #25, #09, #03, @ramps.ramp_west >   ;04
  actor-spawn < #27, #0F, #03, @ramps.ramp_east >   ;05
  actor-spawn < #15, #1F, #03, @ramps.ramp_east >   ;06
  actor-spawn < #0F, #22, #09, @ramps.ramp_north >   ;07
  actor-spawn < #22, #28, #09, @ramps.ramp_north >   ;08
  actor-spawn < #4A, #1F, #03, @ramps.ramp_west >   ;09
  actor-spawn < #66, #35, #03, @ramps.ramp_west >   ;0A
  actor-spawn < #65, #2E, #03, @ramps.ramp_east >   ;0B
  actor-spawn < #54, #2E, #03, @ramps.ramp_east >   ;0C
  actor-spawn < #43, #2E, #03, @ramps.ramp_east >   ;0D
  actor-spawn < #32, #2E, #03, @ramps.ramp_east >   ;0E
  enemy-spawn < #06, #17, #30, @mtA1_fire_sprite, #3F, #B3, #00 >   ;0F
  enemy-spawn < #73, #14, #30, @mtA1_fire_sprite, #3F, #B5, #00 >   ;10
  enemy-spawn < #59, #0F, #30, @mtA1_fire_sprite, #3F, #B6, #00 >   ;11
  enemy-spawn < #38, #33, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #B7, #00 >   ;12
  enemy-spawn < #3B, #31, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #B8, #00 >   ;13
  enemy-spawn < #40, #31, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #B9, #00 >   ;14
  enemy-spawn < #41, #38, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #BA, #00 >   ;15
  enemy-spawn < #51, #28, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #BB, #00 >   ;16
  enemy-spawn < #3D, #28, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #BC, #00 >   ;17
  enemy-spawn < #37, #22, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #BD, #00 >   ;18
  enemy-spawn < #62, #19, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #BE, #00 >   ;19
  enemy-spawn < #7A, #14, #30, @mtA0_acid_spider.mtA0_acid_spider5, #3C, #BF, #00 >   ;1A
  enemy-spawn < #5B, #3A, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #C0, #00 >   ;1B
  enemy-spawn < #5C, #3A, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #C1, #00 >   ;1C
  enemy-spawn < #40, #0F, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #C2, #00 >   ;1D
  enemy-spawn < #14, #03, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #C3, #00 >   ;1E
  enemy-spawn < #18, #03, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #C4, #00 >   ;1F
  enemy-spawn < #7B, #23, #30, @mtA1_yorrick_ns.mtA1_yorrick_2, #3D, #C5, #00 >   ;20
  enemy-spawn < #79, #24, #30, @mtA1_yorrick_ns.mtA1_yorrick_2, #3D, #C6, #00 >   ;21
  enemy-spawn < #77, #25, #30, @mtA1_yorrick_ns.mtA1_yorrick_2, #3D, #C7, #00 >   ;22
  enemy-spawn < #48, #14, #30, @mtA1_yorrick_ns.mtA1_yorrick_2, #3D, #C8, #00 >   ;23
  enemy-spawn < #12, #08, #30, @mtA1_yorrick_ns.mtA1_yorrick_2, #3D, #C9, #00 >   ;24
  enemy-spawn < #16, #08, #30, @mtA1_yorrick_ns.mtA1_yorrick_2, #3D, #CA, #00 >   ;25
  enemy-spawn < #5F, #31, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #CB, #00 >   ;26
  enemy-spawn < #44, #10, #30, @mtA1_yorrick_ew.mtA1_yorrick_3, #3D, #CC, #00 >   ;27
  enemy-spawn < #5B, #31, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #CD, #00 >   ;28
  enemy-spawn < #57, #31, #30, @mtA1_yorrick_ew.mtA1_yorrick_4, #3D, #CE, #00 >   ;29
  enemy-spawn < #33, #1B, #30, @mtA0_skulker.mtA0_skulker1, #3E, #CF, #00 >   ;2A
  enemy-spawn < #7A, #1B, #30, @mtA0_skulker.mtA0_skulker1, #3E, #D0, #00 >   ;2B
  enemy-spawn < #5D, #25, #30, @mtA0_skulker.mtA0_skulker2, #3E, #D1, #00 >   ;2C
  enemy-spawn < #56, #25, #30, @mtA0_skulker.mtA0_skulker2, #3E, #D2, #00 >   ;2D
  enemy-spawn < #4F, #25, #30, @mtA0_skulker.mtA0_skulker2, #3E, #D3, #00 >   ;2E
  enemy-spawn < #48, #25, #30, @mtA0_skulker.mtA0_skulker2, #3E, #D4, #00 >   ;2F
  enemy-spawn < #1C, #05, #30, @mtA0_skulker.mtA0_skulker2, #3E, #D5, #00 >   ;30
  enemy-spawn < #46, #3D, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #D6, #00 >   ;31
  enemy-spawn < #4E, #3D, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #D7, #00 >   ;32
  enemy-spawn < #56, #3D, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #D8, #00 >   ;33
  enemy-spawn < #52, #07, #30, @mtA0_skulker.mtA0_skulker_ew, #3E, #D9, #00 >   ;34
  enemy-spawn < #3B, #0B, #30, @mtA0_acid_spider.mtA0_acid_spider3, #3C, #DA, #00 >   ;35
  actor-spawn < #23, #09, #01, @movement_speed_zones.speed_zone_ew_fast >   ;36
  actor-spawn < #28, #0F, #01, @movement_speed_zones.speed_zone_ew_slow >   ;37
  actor-spawn < #48, #1F, #01, @movement_speed_zones.speed_zone_ew_fast >   ;38
  actor-spawn < #16, #1F, #01, @movement_speed_zones.speed_zone_ew_slow >   ;39
  actor-spawn < #0F, #23, #01, @movement_speed_zones.speed_zone_ns_slow >   ;3A
  actor-spawn < #66, #2E, #01, @movement_speed_zones.speed_zone_ew_slow >   ;3B
  actor-spawn < #64, #35, #01, @movement_speed_zones.speed_zone_ew_fast >   ;3C
  actor-spawn < #22, #29, #01, @movement_speed_zones.speed_zone_ns_slow >   ;3D
]

scene_event_0CC9A3 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #DF, #DF, #00, @camera_scroll.ScrollCameraInit >   ;02
  enemy-spawn < #31, #18, #30, @mtA1_fire_sprite, #3F, #E0, #00 >   ;03
  enemy-spawn < #1E, #0E, #30, @mtA1_fire_sprite, #3F, #E1, #00 >   ;04
  enemy-spawn < #16, #0E, #30, @mtA1_fire_sprite, #3F, #E2, #00 >   ;05
  enemy-spawn < #0A, #1D, #30, @mtA1_fire_sprite, #3F, #E3, #00 >   ;06
  enemy-spawn < #21, #0F, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #E4, #00 >   ;07
  enemy-spawn < #1F, #0B, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #E5, #00 >   ;08
  enemy-spawn < #15, #0B, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #E6, #00 >   ;09
  enemy-spawn < #14, #0F, #30, @mtA1_yorrick_ns.mtA1_yorrick_1, #3D, #E7, #00 >   ;0A
]

scene_event_0CCA02 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #DF, #DF, #00, @camera_scroll.ScrollCameraInit >   ;02
]

scene_event_0CCA19 [
  actor-spawn < #1C, #1E, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @overworld_exit >   ;03
  actor-spawn < #1C, #04, #01, @dark_space.dark_space2 >   ;04
  actor-spawn < #1D, #1D, #00, @nvAC_erik >   ;05
  actor-spawn < #1D, #1E, #00, @nvAC_kara >   ;06
  actor-spawn < #1D, #1F, #00, @nvAC_hamlet >   ;07
  actor-spawn < #05, #08, #00, @nvAC_bones >   ;08
  actor-spawn < #19, #14, #00, @nvAC_bones >   ;09
  actor-spawn < #11, #07, #00, @nvAC_bones >   ;0A
  actor-spawn < #04, #11, #00, @nvAC_bones >   ;0B
  actor-spawn < #08, #13, #00, @nvAC_bonfire >   ;0C
  actor-spawn < #07, #12, #00, @nvAC_hand_man.nvAC_hand_man1 >   ;0D
  actor-spawn < #09, #14, #00, @nvAC_dumpling_man.nvAC_dumpling_man1 >   ;0E
  actor-spawn < #04, #13, #00, @nvAC_staring_man.nvAC_staring_man1 >   ;0F
  actor-spawn < #0C, #12, #00, @nvAC_map_kid >   ;10
  actor-spawn < #0C, #14, #00, @nvAC_beckon_kid >   ;11
  actor-spawn < #06, #0F, #00, @nvAC_dumpling_man.nvAC_dumpling_man2 >   ;12
  actor-spawn < #08, #0F, #00, @nvAC_hand_man.nvAC_hand_man2 >   ;13
  actor-spawn < #0A, #0F, #00, @nvAC_staring_man.nvAC_staring_man2 >   ;14
]

scene_event_0CCAAE [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #07, #0D, #00, @nvAD_kara >   ;03
  actor-spawn < #07, #0E, #00, @nvAD_erik >   ;04
  actor-spawn < #08, #0E, #00, @nvAD_hamlet >   ;05
]

scene_event_0CCADA [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #06, #07, #00, @nvAE_stone_girl1 >   ;03
  actor-spawn < #08, #07, #00, @nvAE_stone_girl2 >   ;04
  actor-spawn < #0A, #07, #00, @nvAE_stone_girl3 >   ;05
  actor-spawn < #07, #10, #00, @nvAE_kara >   ;06
  actor-spawn < #08, #10, #00, @nvAE_erik >   ;07
  actor-spawn < #03, #0D, #19, @hidden_red_jewel >   ;08
]

scene_event_0CCB1B [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @overworld_exit >   ;03
  actor-spawn < #00, #01, #00, @awB0_intro >   ;04
  enemy-spawn < #0E, #1F, #00, @awB0_zip_fly, #4A, #01, #00 >   ;05
  enemy-spawn < #13, #1B, #00, @awB0_zip_fly, #4A, #02, #00 >   ;06
  enemy-spawn < #15, #22, #00, @awB0_zip_fly, #4A, #03, #00 >   ;07
  enemy-spawn < #2D, #1D, #00, @awB0_zip_fly, #4A, #04, #00 >   ;08
  enemy-spawn < #30, #21, #00, @awB0_zip_fly, #4A, #05, #00 >   ;09
  enemy-spawn < #30, #3D, #00, @awB0_shrubber.awB0_shrubber2, #49, #06, #00 >   ;0A
  enemy-spawn < #3A, #34, #00, @awB0_shrubber.awB0_shrubber2, #49, #07, #00 >   ;0B
  enemy-spawn < #08, #38, #00, @awB0_shrubber.awB0_shrubber2, #49, #08, #00 >   ;0C
  enemy-spawn < #21, #3B, #00, @awB0_zombie, #46, #09, #00 >   ;0D
  enemy-spawn < #22, #31, #00, @awB0_zombie, #46, #0A, #00 >   ;0E
  enemy-spawn < #08, #24, #00, @awB0_zombie, #46, #0B, #00 >   ;0F
  enemy-spawn < #1E, #2C, #00, @awB0_zombie, #46, #0C, #00 >   ;10
  enemy-spawn < #38, #24, #00, @awB0_zombie, #46, #0D, #00 >   ;11
  enemy-spawn < #1E, #1C, #00, @awB0_zombie, #46, #0E, #00 >   ;12
  enemy-spawn < #21, #1C, #00, @awB0_zombie, #46, #0F, #00 >   ;13
]

scene_event_0CCBD8 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #0B, #15, #00, @awB1_goldcap, #42, #10, #00 >   ;02
  enemy-spawn < #4A, #16, #00, @awB1_goldcap, #42, #11, #00 >   ;03
  enemy-spawn < #6D, #10, #00, @awB1_goldcap, #42, #12, #00 >   ;04
  enemy-spawn < #1A, #0B, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #13, #00 >   ;05
  enemy-spawn < #1A, #11, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #14, #00 >   ;06
  enemy-spawn < #1A, #17, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #15, #00 >   ;07
  enemy-spawn < #1D, #11, #06, @awB1_wall_walker.awB1_wall_walker3, #43, #16, #00 >   ;08
  enemy-spawn < #1D, #18, #06, @awB1_wall_walker.awB1_wall_walker3, #43, #17, #00 >   ;09
  enemy-spawn < #22, #0E, #06, @awB1_wall_walker.awB1_wall_walker3, #43, #18, #00 >   ;0A
  enemy-spawn < #22, #14, #06, @awB1_wall_walker.awB1_wall_walker3, #43, #19, #00 >   ;0B
  enemy-spawn < #22, #1A, #06, @awB1_wall_walker.awB1_wall_walker3, #43, #1A, #00 >   ;0C
  enemy-spawn < #27, #11, #06, @awB1_wall_walker.awB1_wall_walker3, #43, #1B, #00 >   ;0D
  enemy-spawn < #27, #18, #06, @awB1_wall_walker.awB1_wall_walker3, #43, #1C, #00 >   ;0E
  enemy-spawn < #47, #04, #00, @awB1_wall_walker.awB1_wall_walker1, #44, #1D, #6C >   ;0F
  enemy-spawn < #10, #0E, #00, @awB1_wall_walker.awB1_wall_walker2, #44, #1E, #00 >   ;10
  enemy-spawn < #58, #10, #00, @awB1_gorgon.awB1_gorgon2, #45, #1F, #00 >   ;11
  enemy-spawn < #62, #12, #00, @awB1_gorgon.awB1_gorgon2, #45, #20, #00 >   ;12
  enemy-spawn < #75, #08, #00, @awB1_gorgon.awB1_gorgon2, #45, #21, #00 >   ;13
  enemy-spawn < #7A, #08, #00, @awB1_gorgon.awB1_gorgon2, #45, #22, #00 >   ;14
]

scene_event_0CCCA5 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #07, #27, #00, @awB2_stair_climb >   ;02
  actor-spawn < #07, #1E, #13, @slider_glide.SliderGlideTriggerSouth >   ;03
  enemy-spawn < #0B, #6D, #00, @awB1_goldcap, #42, #30, #00 >   ;04
  enemy-spawn < #08, #0C, #00, @awB1_goldcap, #42, #31, #00 >   ;05
  enemy-spawn < #06, #57, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #32, #00 >   ;06
  enemy-spawn < #03, #33, #00, @awB1_wall_walker.awB1_wall_walker3, #43, #33, #00 >   ;07
  enemy-spawn < #0C, #33, #00, @awB1_wall_walker.awB1_wall_walker3, #43, #34, #00 >   ;08
  enemy-spawn < #0B, #45, #00, @awB1_wall_walker.awB1_wall_walker2, #44, #35, #00 >   ;09
  enemy-spawn < #06, #25, #00, @awB1_wall_walker.awB1_wall_walker2, #44, #36, #00 >   ;0A
  enemy-spawn < #09, #25, #00, @awB1_wall_walker.awB1_wall_walker2, #44, #37, #6B >   ;0B
  enemy-spawn < #07, #47, #00, @awB1_gorgon.awB1_gorgon2, #45, #38, #00 >   ;0C
  enemy-spawn < #04, #09, #00, @awB1_gorgon.awB1_gorgon2, #45, #39, #00 >   ;0D
  enemy-spawn < #0B, #09, #00, @awB1_gorgon.awB1_gorgon2, #45, #3A, #00 >   ;0E
]

scene_event_0CCD26 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #66, #07, #03, @ramps.ramp_west >   ;02
  actor-spawn < #00, #01, #00, @awB3_vine_reveal >   ;03
  enemy-spawn < #18, #13, #00, @awB1_goldcap, #42, #40, #00 >   ;04
  enemy-spawn < #71, #05, #06, @awB1_wall_walker.awB1_wall_walker4, #43, #41, #00 >   ;05
  enemy-spawn < #71, #10, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #42, #00 >   ;06
  enemy-spawn < #35, #05, #00, @awB1_wall_walker.awB1_wall_walker2, #44, #43, #00 >   ;07
  enemy-spawn < #3B, #05, #00, @awB1_wall_walker.awB1_wall_walker2, #44, #44, #00 >   ;08
  enemy-spawn < #41, #05, #00, @awB1_wall_walker.awB1_wall_walker2, #44, #45, #00 >   ;09
  enemy-spawn < #47, #05, #00, @awB1_wall_walker.awB1_wall_walker2, #44, #46, #00 >   ;0A
]

scene_event_0CCD83 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @awB4_snake_pit_entry >   ;02
  actor-spawn < #00, #01, #00, @awB4_snake_pit_fx >   ;03
  enemy-spawn < #04, #05, #00, @awB1_wall_walker.awB1_wall_walker1, #3A, #50, #6D >   ;04
  enemy-spawn < #24, #0D, #00, @awB1_goldcap, #42, #51, #00 >   ;05
  enemy-spawn < #24, #15, #00, @awB1_goldcap, #42, #52, #00 >   ;06
  enemy-spawn < #14, #11, #00, @awB1_goldcap, #42, #53, #00 >   ;07
  enemy-spawn < #18, #0D, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #54, #00 >   ;08
  enemy-spawn < #13, #15, #00, @awB1_wall_walker.awB1_wall_walker4, #43, #55, #00 >   ;09
]

scene_event_0CCDD7 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #06, #0E, #0F, @slider_glide.SliderGlideTriggerSouth >   ;02
  actor-spawn < #08, #0E, #0F, @slider_glide.SliderGlideTriggerSouth >   ;03
  actor-spawn < #06, #15, #11, @slider_glide.SliderGlideTriggerNorth >   ;04
  actor-spawn < #08, #15, #11, @slider_glide.SliderGlideTriggerNorth >   ;05
  actor-spawn < #07, #1E, #13, @slider_glide.SliderGlideTriggerSouth >   ;06
  actor-spawn < #07, #27, #15, @slider_glide.SliderGlideTriggerNorth >   ;07
  actor-spawn < #07, #4B, #11, @ramps.ramp_south >   ;08
  enemy-spawn < #04, #45, #00, @awB1_wall_walker.awB1_wall_walker2, #3A, #60, #00 >   ;09
  enemy-spawn < #0B, #45, #00, @awB1_wall_walker.awB1_wall_walker2, #3A, #61, #00 >   ;0A
  enemy-spawn < #03, #19, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #62, #00 >   ;0B
  enemy-spawn < #0C, #19, #00, @awB1_wall_walker.awB1_wall_walker4, #43, #63, #00 >   ;0C
  enemy-spawn < #06, #34, #04, @awB1_wall_walker.awB1_wall_walker3, #43, #64, #00 >   ;0D
  enemy-spawn < #04, #12, #00, @awB1_gorgon, #45, #65, #00 >   ;0E
  enemy-spawn < #0B, #12, #00, @awB1_gorgon, #45, #66, #00 >   ;0F
  enemy-spawn < #04, #2F, #00, @awB1_gorgon.awB1_gorgon2, #45, #67, #00 >   ;10
  enemy-spawn < #0B, #2F, #00, @awB1_gorgon.awB1_gorgon2, #45, #68, #00 >   ;11
  enemy-spawn < #03, #74, #00, @awB1_gorgon, #45, #69, #00 >   ;12
  enemy-spawn < #0C, #74, #00, @awB1_gorgon, #45, #6A, #00 >   ;13
]

scene_event_0CCE7B [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #42, #32, #03, @dark_space.dark_space2 >   ;03
  enemy-spawn < #3A, #31, #00, @awB0_zip_fly, #4A, #70, #00 >   ;04
  enemy-spawn < #4F, #34, #00, @awB0_zip_fly, #4A, #71, #00 >   ;05
  enemy-spawn < #4C, #28, #00, @awB0_zip_fly, #4A, #72, #00 >   ;06
  enemy-spawn < #38, #22, #00, @awB0_zip_fly, #4A, #73, #00 >   ;07
  enemy-spawn < #34, #25, #00, @awB0_zip_fly, #4A, #74, #00 >   ;08
  enemy-spawn < #1F, #26, #00, @awB0_zip_fly, #4A, #75, #00 >   ;09
  enemy-spawn < #1F, #14, #00, @awB0_zip_fly, #4A, #76, #00 >   ;0A
  enemy-spawn < #41, #11, #00, @awB0_zip_fly, #4A, #77, #00 >   ;0B
  enemy-spawn < #22, #31, #00, @awB0_shrubber.awB0_shrubber2, #49, #78, #00 >   ;0C
  enemy-spawn < #15, #2C, #00, @awB0_shrubber.awB0_shrubber2, #49, #79, #00 >   ;0D
  enemy-spawn < #02, #1D, #00, @awB0_shrubber.awB0_shrubber2, #49, #7A, #00 >   ;0E
  enemy-spawn < #02, #1A, #00, @awB0_shrubber.awB0_shrubber2, #49, #7B, #00 >   ;0F
  enemy-spawn < #02, #17, #00, @awB0_shrubber.awB0_shrubber2, #49, #7C, #00 >   ;10
  enemy-spawn < #13, #16, #00, @awB0_shrubber.awB0_shrubber2, #49, #7D, #00 >   ;11
  enemy-spawn < #1E, #11, #00, @awB0_shrubber.awB0_shrubber2, #49, #7E, #00 >   ;12
  enemy-spawn < #14, #33, #00, @awB0_shrubber, #49, #7F, #00 >   ;13
  enemy-spawn < #18, #23, #00, @awB0_shrubber, #49, #80, #00 >   ;14
  enemy-spawn < #19, #19, #00, @awB0_shrubber, #49, #81, #00 >   ;15
  enemy-spawn < #28, #1C, #00, @awB0_shrubber, #49, #82, #00 >   ;16
  enemy-spawn < #27, #1B, #00, @awB0_shrubber, #49, #83, #00 >   ;17
  enemy-spawn < #28, #1A, #00, @awB0_shrubber, #49, #84, #00 >   ;18
  enemy-spawn < #29, #19, #00, @awB0_shrubber, #49, #85, #00 >   ;19
  enemy-spawn < #3F, #1C, #00, @awB0_shrubber, #49, #86, #00 >   ;1A
  enemy-spawn < #3E, #1D, #00, @awB0_shrubber, #49, #87, #00 >   ;1B
  enemy-spawn < #41, #20, #00, @awB0_shrubber, #49, #88, #00 >   ;1C
  enemy-spawn < #5B, #1B, #00, @awB0_shrubber, #49, #89, #00 >   ;1D
  enemy-spawn < #5B, #1C, #00, @awB0_shrubber, #49, #8A, #00 >   ;1E
  enemy-spawn < #5B, #1D, #00, @awB0_shrubber, #49, #8B, #00 >   ;1F
  enemy-spawn < #5B, #1E, #00, @awB0_shrubber, #49, #8C, #00 >   ;20
  enemy-spawn < #19, #0A, #00, @awB0_shrubber, #49, #8D, #00 >   ;21
  enemy-spawn < #12, #03, #00, @awB0_shrubber, #49, #8E, #00 >   ;22
  enemy-spawn < #5B, #26, #00, @awB0_zombie, #46, #8F, #00 >   ;23
  enemy-spawn < #48, #2E, #00, @awB0_zombie, #46, #90, #00 >   ;24
  enemy-spawn < #29, #2F, #00, @awB0_zombie, #46, #91, #00 >   ;25
  enemy-spawn < #1E, #2E, #00, @awB0_zombie, #46, #92, #00 >   ;26
  enemy-spawn < #05, #29, #00, @awB0_zombie, #46, #93, #00 >   ;27
  enemy-spawn < #29, #1B, #00, @awB0_zombie, #46, #94, #00 >   ;28
  enemy-spawn < #2F, #15, #00, @awB0_zombie, #46, #95, #00 >   ;29
  enemy-spawn < #4E, #12, #00, @awB0_zombie, #46, #96, #00 >   ;2A
  actor-spawn < #53, #28, #00, @awB6_bones >   ;2B
]

scene_event_0CD005 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #03, #10, #00, @awB7_sliding_gate, #45, #A0, #00 >   ;02
  enemy-spawn < #29, #15, #00, @awB1_gorgon, #45, #A1, #00 >   ;03
  enemy-spawn < #0B, #14, #00, @awB1_gorgon.awB1_gorgon2, #45, #A2, #00 >   ;04
  enemy-spawn < #14, #05, #00, @awB1_wall_walker.awB1_wall_walker1, #3A, #A3, #00 >   ;05
  enemy-spawn < #1A, #05, #00, @awB1_wall_walker.awB1_wall_walker2, #3A, #A4, #00 >   ;06
  enemy-spawn < #54, #09, #04, @awB1_wall_walker.awB1_wall_walker4, #43, #A5, #00 >   ;07
  enemy-spawn < #54, #15, #04, @awB1_wall_walker.awB1_wall_walker4, #43, #A6, #00 >   ;08
  enemy-spawn < #49, #1B, #06, @awB1_wall_walker.awB1_wall_walker4, #43, #A7, #00 >   ;09
  enemy-spawn < #51, #15, #06, @awB1_wall_walker.awB1_wall_walker4, #43, #A8, #00 >   ;0A
  enemy-spawn < #58, #15, #06, @awB1_wall_walker.awB1_wall_walker4, #43, #A9, #00 >   ;0B
  enemy-spawn < #4E, #0F, #06, @awB1_wall_walker.awB1_wall_walker3, #43, #AA, #00 >   ;0C
  enemy-spawn < #4A, #15, #06, @awB1_wall_walker.awB1_wall_walker3, #43, #AB, #00 >   ;0D
]

scene_event_0CD092 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #08, #06, #05, @dark_space.dark_space2 >   ;02
  enemy-spawn < #05, #56, #00, @awB1_gorgon, #45, #B0, #00 >   ;03
  enemy-spawn < #0A, #4D, #00, @awB1_gorgon, #45, #B1, #00 >   ;04
  enemy-spawn < #05, #25, #00, @awB1_wall_walker.awB1_wall_walker1, #3A, #B2, #00 >   ;05
  enemy-spawn < #0A, #25, #00, @awB1_wall_walker.awB1_wall_walker1, #3A, #B3, #00 >   ;06
  enemy-spawn < #03, #3D, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #B4, #00 >   ;07
  enemy-spawn < #0C, #3D, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #B5, #6F >   ;08
]

scene_event_0CD0DF [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #07, #16, #00, @awB1_goldcap, #42, #B8, #00 >   ;02
  enemy-spawn < #08, #4F, #00, @awB1_goldcap, #42, #B9, #00 >   ;03
  enemy-spawn < #05, #17, #00, @awB1_wall_walker.awB1_wall_walker4, #43, #BA, #00 >   ;04
  enemy-spawn < #0A, #17, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #BB, #00 >   ;05
  enemy-spawn < #04, #32, #00, @awB1_gorgon.awB1_gorgon2, #45, #BC, #00 >   ;06
  enemy-spawn < #0B, #32, #00, @awB1_gorgon.awB1_gorgon2, #45, #BD, #00 >   ;07
  enemy-spawn < #04, #45, #00, @awB1_wall_walker.awB1_wall_walker2, #3A, #BE, #00 >   ;08
  enemy-spawn < #0B, #45, #00, @awB1_wall_walker.awB1_wall_walker2, #3A, #BF, #00 >   ;09
]

scene_event_0CD137 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #3D, #0E, #00, @awB0_shrubber, #49, #C0, #00 >   ;03
  actor-spawn < #3D, #0E, #00, @awBA_glasses >   ;04
  enemy-spawn < #15, #3C, #00, @awB0_zombie, #46, #C1, #00 >   ;05
  enemy-spawn < #0F, #43, #00, @awB0_zombie, #46, #C2, #00 >   ;06
  enemy-spawn < #29, #3D, #00, @awB0_zombie, #46, #C3, #00 >   ;07
  enemy-spawn < #2F, #43, #00, @awB0_zombie, #46, #C4, #00 >   ;08
  actor-spawn < #03, #42, #00, @awBA_bones >   ;09
]

scene_event_0CD197 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #2B, #1B, #03, @dark_space.dark_space2 >   ;02
  actor-spawn < #00, #01, #00, @awBD_fall_trigger >   ;03
  enemy-spawn < #07, #11, #00, @awB1_goldcap, #42, #C8, #00 >   ;04
  enemy-spawn < #0B, #11, #00, @awB1_goldcap, #42, #C9, #00 >   ;05
  enemy-spawn < #08, #0D, #00, @awB1_goldcap, #42, #CA, #00 >   ;06
  enemy-spawn < #27, #24, #00, @awB1_goldcap, #42, #CB, #00 >   ;07
  enemy-spawn < #07, #07, #06, @awB1_wall_walker.awB1_wall_walker4, #43, #CC, #00 >   ;08
  enemy-spawn < #21, #07, #06, @awB1_wall_walker.awB1_wall_walker4, #43, #CD, #00 >   ;09
]

scene_event_0CD1F4 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @awBC_blinding_light >   ;02
  actor-spawn < #1D, #0B, #00, @awBC_bouncing_crystal >   ;03
  actor-spawn < #0F, #1D, #00, @awBC_bouncing_crystal >   ;04
  actor-spawn < #06, #24, #00, @awBC_bouncing_crystal >   ;05
  actor-spawn < #27, #15, #00, @awBC_bouncing_crystal >   ;06
  actor-spawn < #05, #14, #0F, @slider_glide.SliderGlideTriggerSouth >   ;07
  actor-spawn < #05, #1B, #0F, @slider_glide.SliderGlideTriggerNorth >   ;08
  actor-spawn < #20, #1C, #0F, @slider_glide.SliderGlideTriggerSouth >   ;09
  actor-spawn < #22, #1C, #0F, @slider_glide.SliderGlideTriggerSouth >   ;0A
  actor-spawn < #20, #23, #0F, @slider_glide.SliderGlideTriggerNorth >   ;0B
  actor-spawn < #21, #23, #0F, @slider_glide.SliderGlideTriggerNorth >   ;0C
  enemy-spawn < #09, #1F, #00, @awB1_goldcap, #42, #D0, #00 >   ;0D
  enemy-spawn < #27, #23, #00, @awB1_goldcap, #42, #D1, #00 >   ;0E
  enemy-spawn < #23, #07, #06, @awB1_wall_walker.awB1_wall_walker4, #43, #D2, #00 >   ;0F
  enemy-spawn < #29, #0C, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #D3, #00 >   ;10
  enemy-spawn < #24, #17, #00, @awB1_wall_walker.awB1_wall_walker4, #43, #D4, #00 >   ;11
  enemy-spawn < #0C, #09, #00, @awB1_wall_walker.awB1_wall_walker4, #43, #D5, #00 >   ;12
  enemy-spawn < #03, #10, #02, @awB1_wall_walker.awB1_wall_walker4, #43, #D6, #00 >   ;13
]

scene_event_0CD29A [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @awBD_fall_trigger >   ;02
  actor-spawn < #08, #1A, #0D, @slider_glide.SliderGlideTriggerSouth >   ;03
  actor-spawn < #0A, #1A, #0D, @slider_glide.SliderGlideTriggerSouth >   ;04
  actor-spawn < #08, #20, #0D, @slider_glide.SliderGlideTriggerNorth >   ;05
  actor-spawn < #09, #20, #0D, @slider_glide.SliderGlideTriggerNorth >   ;06
  enemy-spawn < #05, #22, #00, @awB1_goldcap, #42, #E0, #00 >   ;07
  enemy-spawn < #10, #10, #00, @awB1_goldcap, #42, #E1, #00 >   ;08
  enemy-spawn < #19, #0F, #00, @awB1_goldcap, #42, #E2, #00 >   ;09
  enemy-spawn < #24, #1D, #06, @awB1_wall_walker.awB1_wall_walker3, #43, #E3, #00 >   ;0A
  enemy-spawn < #26, #27, #04, @awB1_wall_walker.awB1_wall_walker3, #43, #E4, #00 >   ;0B
  enemy-spawn < #21, #23, #04, @awB1_wall_walker.awB1_wall_walker3, #43, #E5, #00 >   ;0C
  enemy-spawn < #12, #1A, #04, @awB1_wall_walker.awB1_wall_walker3, #43, #E6, #00 >   ;0D
  enemy-spawn < #06, #1C, #04, @awB1_wall_walker.awB1_wall_walker3, #43, #E7, #00 >   ;0E
  enemy-spawn < #06, #26, #00, @awB1_gorgon, #45, #E8, #00 >   ;0F
  enemy-spawn < #2B, #19, #00, @awB1_gorgon.awB1_gorgon2, #45, #E9, #00 >   ;10
  enemy-spawn < #0E, #1C, #00, @awB1_gorgon.awB1_gorgon2, #45, #EA, #00 >   ;11
]

scene_event_0CD339 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #20, #2B, #04, @awB1_wall_walker.awB1_wall_walker3, #43, #F0, #00 >   ;02
  enemy-spawn < #17, #2B, #04, @awB1_wall_walker.awB1_wall_walker3, #43, #F1, #00 >   ;03
  enemy-spawn < #0E, #2B, #04, @awB1_wall_walker.awB1_wall_walker3, #43, #F2, #00 >   ;04
  enemy-spawn < #25, #07, #04, @awB1_wall_walker.awB1_wall_walker3, #43, #F3, #00 >   ;05
  enemy-spawn < #2A, #07, #06, @awB1_wall_walker.awB1_wall_walker3, #43, #F4, #00 >   ;06
  enemy-spawn < #1E, #13, #00, @awB1_goldcap, #42, #F5, #00 >   ;07
  enemy-spawn < #25, #2B, #00, @awB1_gorgon.awB1_gorgon2, #45, #F6, #00 >   ;08
]

scene_event_0CD392 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #0F, #0B, #00, @awBF_spirit_guide >   ;02
]

scene_event_0CD3A9 [
  actor-spawn < #00, #01, #00, @future_vision_cutscene.FutureVisionCutscene >
]

scene_event_0CD3B2 [
  actor-spawn < #05, #0A, #32, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #03, #02, #00, @visual_effect_pipeline.effect_position_update >   ;02
  actor-spawn < #00, #01, #00, @overworld_exit >   ;03
  actor-spawn < #02, #07, #01, @dark_space >   ;04
  actor-spawn < #0E, #10, #30, @daC3_man1 >   ;05
  actor-spawn < #14, #07, #01, @jeweler_gem >   ;06
  actor-spawn < #27, #0F, #30, @daC3_merchant >   ;07
  actor-spawn < #29, #0A, #30, @daC3_freedom_man >   ;08
  actor-spawn < #2A, #0A, #30, @daC3_carpet_man >   ;09
  actor-spawn < #29, #0F, #30, @daC3_moving_kruk >   ;0A
  actor-spawn < #29, #07, #70, @daC3_kruk1 >   ;0B
  actor-spawn < #2C, #09, #30, @daC3_kruk2 >   ;0C
  actor-spawn < #15, #1A, #00, @daC3_prisoner >   ;0D
  actor-spawn < #1E, #06, #30, @daC3_jackal_girl >   ;0E
  actor-spawn < #29, #17, #30, @daC3_training_man >   ;0F
  actor-spawn < #05, #0C, #30, @daC3_luggage_man >   ;10
  actor-spawn < #18, #1B, #30, @daC3_slaver >   ;11
  actor-spawn < #07, #1B, #30, @daC3_treasure_man >   ;12
  actor-spawn < #21, #08, #00, @daC3_babel_travel_spirit >   ;13
  actor-spawn < #28, #05, #1B, @hidden_red_jewel >   ;14
]

scene_event_0CD454 [
  actor-spawn < #07, #0B, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #07, #09, #00, @daC4_kara >   ;03
  actor-spawn < #08, #09, #00, @daC4_erik >   ;04
]

scene_event_0CD479 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #08, #08, #00, @daC5_slaver >   ;03
  actor-spawn < #06, #09, #21, @daC5_weaver >   ;04
  actor-spawn < #06, #0B, #23, @daC5_weaver >   ;05
  actor-spawn < #09, #09, #05, @daC5_weaver >   ;06
  actor-spawn < #09, #0B, #07, @daC5_weaver >   ;07
]

scene_event_0CD4B3 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #07, #09, #00, @daC6_snake_panic >   ;03
]

scene_event_0CD4D1 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #06, #0A, #00, @daC7_explorer1 >   ;03
  actor-spawn < #07, #09, #00, @daC7_explorer2 >   ;04
  actor-spawn < #08, #0A, #00, @daC7_explorer3 >   ;05
]

scene_event_0CD4FD [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #07, #09, #00, @daC8_neil >   ;03
]

scene_event_0CD51B [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #07, #0A, #00, @daC9_businessman >   ;03
]

scene_event_0CD539 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #00, #01, #00, @overworld_exit >   ;02
  actor-spawn < #3B, #3C, #00, @pyCC_entrance_portal >   ;03
  enemy-spawn < #1C, #1E, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #01, #00 >   ;04
  enemy-spawn < #23, #1E, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #02, #73 >   ;05
  actor-spawn < #27, #1B, #E7, @pyCC_dark_space_portal >   ;06
  actor-spawn < #1C, #38, #03, @dark_space.dark_space2 >   ;07
  actor-spawn < #1F, #13, #00, @pyCC_portal >   ;08
  actor-spawn < #36, #2A, #1D, @hidden_red_jewel >   ;09
]

scene_event_0CD58C [
  actor-spawn < #05, #0A, #32, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #02, #0B, #00, @pyCD_flame_statue >   ;02
  actor-spawn < #0D, #0B, #00, @pyCD_flame_statue.pyCD_flame_statue2 >   ;03
  actor-spawn < #07, #0E, #00, @pyCD_jackal >   ;04
  actor-spawn < #07, #0E, #00, @pyCD_kara >   ;05
  actor-spawn < #04, #0A, #00, @pyCD_explorer >   ;06
  actor-spawn < #00, #01, #00, @pyCD_puzzle >   ;07
]

scene_event_0CD5C6 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #31, #0E, #03, @ramps.ramp_east >   ;02
  actor-spawn < #24, #0E, #03, @ramps.ramp_west >   ;03
  enemy-spawn < #29, #3C, #00, @pyCE_tuts, #4E, #03, #00 >   ;04
  enemy-spawn < #04, #14, #00, @pyCC_mystic_ball, #4F, #04, #00 >   ;05
  enemy-spawn < #0B, #14, #00, @pyCC_mystic_ball, #4F, #05, #00 >   ;06
  enemy-spawn < #1D, #2E, #00, @pyCC_mystic_ball, #4F, #06, #00 >   ;07
  enemy-spawn < #49, #2C, #00, @pyCC_mystic_ball, #4F, #07, #00 >   ;08
  enemy-spawn < #48, #2D, #00, @pyCC_mystic_ball, #4F, #08, #00 >   ;09
  enemy-spawn < #43, #11, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #09, #00 >   ;0A
  enemy-spawn < #1A, #3C, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #0A, #00 >   ;0B
  enemy-spawn < #22, #2F, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #0B, #00 >   ;0C
  enemy-spawn < #0C, #29, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #0C, #00 >   ;0D
  enemy-spawn < #03, #3D, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #0D, #00 >   ;0E
  enemy-spawn < #10, #3D, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #0E, #00 >   ;0F
]

scene_event_0CD650 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #31, #3C, #03, @ramps.ramp_east >   ;02
  actor-spawn < #24, #3C, #03, @ramps.ramp_west >   ;03
  actor-spawn < #04, #3C, #00, @pyCC_entrance_portal >   ;04
  enemy-spawn < #42, #13, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #10, #00 >   ;05
  enemy-spawn < #07, #15, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #11, #00 >   ;06
  enemy-spawn < #55, #25, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #12, #00 >   ;07
  enemy-spawn < #5C, #24, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #13, #00 >   ;08
  enemy-spawn < #0D, #15, #00, @pyCC_mystic_ball, #4F, #14, #00 >   ;09
  enemy-spawn < #58, #24, #00, @pyCC_mystic_ball, #4F, #15, #00 >   ;0A
  enemy-spawn < #2F, #14, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #16, #00 >   ;0B
  enemy-spawn < #30, #14, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #17, #00 >   ;0C
  enemy-spawn < #31, #14, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #18, #00 >   ;0D
  enemy-spawn < #2F, #15, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #19, #00 >   ;0E
  enemy-spawn < #30, #15, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #1A, #00 >   ;0F
  enemy-spawn < #31, #15, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #1B, #00 >   ;10
  enemy-spawn < #33, #27, #00, @pyCE_tuts, #4E, #1C, #00 >   ;11
  enemy-spawn < #48, #2F, #00, @pyCE_tuts, #4E, #1D, #00 >   ;12
]

scene_event_0CD6F3 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #26, #15, #01, @pyD0_breakable_wall >   ;02
  enemy-spawn < #2B, #15, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #20, #00 >   ;03
  enemy-spawn < #1E, #15, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #21, #00 >   ;04
  enemy-spawn < #27, #12, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #22, #00 >   ;05
  enemy-spawn < #26, #10, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #23, #00 >   ;06
  enemy-spawn < #4B, #4D, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #24, #00 >   ;07
  enemy-spawn < #45, #4D, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #25, #00 >   ;08
  enemy-spawn < #38, #4C, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #26, #00 >   ;09
  enemy-spawn < #33, #4D, #00, @pyCE_tuts, #4E, #27, #00 >   ;0A
]

scene_event_0CD752 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #36, #19, #03, @pyD0_breakable_wall >   ;02
  actor-spawn < #32, #49, #00, @pyCC_entrance_portal >   ;03
  enemy-spawn < #35, #19, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #30, #00 >   ;04
  enemy-spawn < #36, #19, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #31, #00 >   ;05
  enemy-spawn < #37, #19, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #32, #00 >   ;06
  enemy-spawn < #38, #19, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #33, #00 >   ;07
  enemy-spawn < #1E, #3A, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #34, #00 >   ;08
  enemy-spawn < #1F, #3A, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #35, #00 >   ;09
  enemy-spawn < #20, #3A, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #36, #00 >   ;0A
  enemy-spawn < #21, #3A, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #37, #00 >   ;0B
  enemy-spawn < #22, #3A, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #38, #00 >   ;0C
  enemy-spawn < #23, #3A, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #39, #00 >   ;0D
  enemy-spawn < #28, #16, #00, @pyCC_mystic_ball, #4F, #3A, #00 >   ;0E
  enemy-spawn < #07, #2A, #00, @pyCC_mystic_ball, #4F, #3B, #00 >   ;0F
  enemy-spawn < #05, #4A, #00, @pyCC_mystic_ball, #4F, #3C, #00 >   ;10
  enemy-spawn < #25, #17, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #3D, #00 >   ;11
  enemy-spawn < #0C, #2B, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #3E, #00 >   ;12
  enemy-spawn < #03, #4C, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #3F, #00 >   ;13
  enemy-spawn < #06, #2A, #00, @pyCE_tuts, #4E, #40, #00 >   ;14
  enemy-spawn < #20, #5B, #00, @pyCE_tuts, #4E, #41, #00 >   ;15
  enemy-spawn < #27, #5C, #00, @pyCE_tuts, #4E, #42, #00 >   ;16
]

scene_event_0CD81B [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  enemy-spawn < #26, #15, #00, @pyD2_haunt, #4C, #48, #00 >   ;02
  enemy-spawn < #2A, #15, #00, @pyD2_haunt, #4C, #49, #00 >   ;03
  enemy-spawn < #2E, #15, #00, @pyD2_haunt, #4C, #4A, #00 >   ;04
  enemy-spawn < #4E, #0F, #00, @pyD2_haunt, #4C, #4B, #00 >   ;05
  enemy-spawn < #52, #0F, #00, @pyD2_haunt, #4C, #4C, #00 >   ;06
  enemy-spawn < #56, #0F, #00, @pyD2_haunt, #4C, #4D, #00 >   ;07
  enemy-spawn < #35, #26, #00, @pyD2_haunt, #4C, #4E, #00 >   ;08
  enemy-spawn < #39, #26, #00, @pyD2_haunt, #4C, #4F, #00 >   ;09
  enemy-spawn < #11, #28, #00, @pyD2_haunt, #4C, #50, #00 >   ;0A
  enemy-spawn < #15, #28, #00, @pyD2_haunt, #4C, #51, #00 >   ;0B
  enemy-spawn < #19, #28, #00, @pyD2_haunt, #4C, #52, #00 >   ;0C
  enemy-spawn < #30, #17, #00, @pyCC_mystic_ball, #4F, #53, #00 >   ;0D
  enemy-spawn < #58, #11, #00, @pyCC_mystic_ball, #4F, #54, #00 >   ;0E
  enemy-spawn < #50, #10, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #55, #00 >   ;0F
  enemy-spawn < #54, #10, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #56, #00 >   ;10
  enemy-spawn < #3B, #27, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #57, #00 >   ;11
  enemy-spawn < #37, #27, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #58, #00 >   ;12
  enemy-spawn < #33, #27, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #59, #00 >   ;13
  enemy-spawn < #5D, #39, #00, @pyCC_blaster, #51, #5A, #00 >   ;14
  enemy-spawn < #1B, #3B, #00, @pyCC_blaster, #51, #5B, #00 >   ;15
  enemy-spawn < #07, #3B, #00, @pyCC_blaster, #51, #5C, #00 >   ;16
  enemy-spawn < #10, #3B, #00, @pyCE_tuts, #4E, #5D, #00 >   ;17
]

scene_event_0CD8F1 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #79, #25, #00, @pyCC_entrance_portal >   ;02
  enemy-spawn < #24, #13, #00, @pyD2_haunt, #4C, #60, #00 >   ;03
  enemy-spawn < #28, #13, #00, @pyD2_haunt, #4C, #61, #00 >   ;04
  enemy-spawn < #2C, #13, #00, @pyD2_haunt, #4C, #62, #00 >   ;05
  enemy-spawn < #4E, #0F, #00, @pyD2_haunt, #4C, #63, #00 >   ;06
  enemy-spawn < #52, #0F, #00, @pyD2_haunt, #4C, #64, #00 >   ;07
  enemy-spawn < #66, #0D, #00, @pyD2_haunt, #4C, #65, #00 >   ;08
  enemy-spawn < #6A, #0D, #00, @pyD2_haunt, #4C, #66, #00 >   ;09
  enemy-spawn < #72, #0D, #00, @pyD2_haunt, #4C, #67, #00 >   ;0A
  enemy-spawn < #76, #0D, #00, @pyD2_haunt, #4C, #68, #00 >   ;0B
  enemy-spawn < #2A, #14, #00, @pyCC_mystic_ball, #4F, #69, #00 >   ;0C
  enemy-spawn < #2F, #14, #00, @pyCC_mystic_ball, #4F, #6A, #00 >   ;0D
  enemy-spawn < #6D, #0E, #00, @pyCC_mystic_ball, #4F, #6B, #00 >   ;0E
  enemy-spawn < #76, #0F, #00, @pyCC_mystic_ball, #4F, #6C, #00 >   ;0F
  enemy-spawn < #6D, #0E, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #6D, #00 >   ;10
  enemy-spawn < #44, #27, #00, @pyCC_blaster, #51, #6E, #00 >   ;11
  enemy-spawn < #53, #12, #00, @pyCE_tuts, #4E, #6F, #00 >   ;12
  enemy-spawn < #44, #28, #00, @pyCE_tuts, #4E, #70, #00 >   ;13
]

scene_event_0CD9A1 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #22, #1B, #E5, @pyD4_falling_orb >   ;02
  actor-spawn < #24, #1B, #E5, @pyD4_falling_orb >   ;03
  actor-spawn < #22, #1D, #E5, @pyD4_falling_orb >   ;04
  actor-spawn < #24, #1D, #E5, @pyD4_falling_orb >   ;05
  actor-spawn < #0C, #4B, #E7, @pyD4_falling_orb >   ;06
  actor-spawn < #0E, #4B, #E7, @pyD4_falling_orb >   ;07
  actor-spawn < #0C, #4D, #E7, @pyD4_falling_orb >   ;08
  actor-spawn < #0E, #4D, #E7, @pyD4_falling_orb >   ;09
  enemy-spawn < #21, #1B, #00, @pyCC_mystic_ball, #4F, #78, #00 >   ;0A
  enemy-spawn < #21, #1D, #00, @pyCC_mystic_ball, #4F, #79, #00 >   ;0B
  enemy-spawn < #4B, #0A, #00, @pyCC_mystic_ball, #4F, #7A, #00 >   ;0C
  enemy-spawn < #1B, #2C, #00, @pyCC_mystic_ball, #4F, #7B, #00 >   ;0D
  enemy-spawn < #0F, #1A, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #7C, #00 >   ;0E
  enemy-spawn < #11, #1D, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #7D, #00 >   ;0F
  enemy-spawn < #13, #1A, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #7E, #00 >   ;10
  enemy-spawn < #15, #1D, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #7F, #00 >   ;11
  enemy-spawn < #18, #2C, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #80, #00 >   ;12
  enemy-spawn < #31, #34, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #81, #00 >   ;13
  enemy-spawn < #1B, #0C, #00, @pyCE_tuts, #4E, #82, #00 >   ;14
  enemy-spawn < #32, #0C, #00, @pyCE_tuts, #4E, #83, #00 >   ;15
  enemy-spawn < #2C, #34, #00, @pyCE_tuts, #4E, #84, #00 >   ;16
  enemy-spawn < #4D, #2C, #00, @pyCC_blaster, #51, #85, #00 >   ;17
  enemy-spawn < #0B, #4B, #00, @pyCC_blaster, #51, #86, #00 >   ;18
  enemy-spawn < #0B, #4D, #00, @pyCC_blaster, #51, #87, #00 >   ;19
  actor-spawn < #42, #4C, #00, @pyCC_entrance_portal >   ;1A
]

scene_event_0CDA80 [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #04, #4C, #00, @pyCC_entrance_portal >   ;02
  enemy-spawn < #33, #0B, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #90, #00 >   ;03
  enemy-spawn < #42, #0B, #00, @pyCC_mystic_ball, #4F, #91, #00 >   ;04
  enemy-spawn < #1B, #10, #00, @pyD2_haunt.pyD5_haunt2, #4C, #92, #00 >   ;05
  enemy-spawn < #1D, #10, #00, @pyD2_haunt.pyD5_haunt2, #4C, #93, #00 >   ;06
  enemy-spawn < #32, #0A, #00, @pyD2_haunt, #4C, #94, #00 >   ;07
  enemy-spawn < #45, #0A, #00, @pyD2_haunt, #4C, #95, #00 >   ;08
  enemy-spawn < #47, #0A, #00, @pyD2_haunt, #4C, #96, #00 >   ;09
  enemy-spawn < #0A, #1A, #00, @pyD2_haunt, #4C, #97, #00 >   ;0A
  enemy-spawn < #08, #1A, #00, @pyD2_haunt, #4C, #98, #00 >   ;0B
  enemy-spawn < #06, #1A, #00, @pyD2_haunt, #4C, #99, #00 >   ;0C
  enemy-spawn < #23, #26, #00, @pyD2_haunt, #4C, #9A, #00 >   ;0D
  enemy-spawn < #21, #26, #00, @pyD2_haunt, #4C, #9B, #00 >   ;0E
  enemy-spawn < #1F, #26, #00, @pyD2_haunt, #4C, #9C, #00 >   ;0F
  enemy-spawn < #1D, #26, #00, @pyD2_haunt, #4C, #9D, #00 >   ;10
  enemy-spawn < #14, #1D, #00, @pyCE_tuts, #4E, #9E, #00 >   ;11
  enemy-spawn < #30, #34, #00, @pyCE_tuts, #4E, #9F, #00 >   ;12
  enemy-spawn < #0C, #4C, #00, @pyCE_tuts, #4E, #A0, #00 >   ;13
  enemy-spawn < #0C, #4D, #00, @pyCE_tuts, #4E, #A1, #00 >   ;14
  enemy-spawn < #3D, #45, #00, @pyCC_blaster, #51, #A2, #00 >   ;15
  enemy-spawn < #4D, #4B, #00, @pyCC_blaster, #51, #A3, #00 >   ;16
]

scene_event_0CDB4B [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraAccumulate >   ;02
  actor-spawn < #3B, #0C, #03, @ramps.ramp_east >   ;03
  actor-spawn < #32, #0C, #03, @ramps.ramp_west >   ;04
  actor-spawn < #3A, #2C, #00, @pyD6_vader_barrier_upper >   ;05
  actor-spawn < #3A, #4C, #00, @pyD6_vader_barrier_lower >   ;06
  actor-spawn < #33, #4D, #00, @pyD6_vader_barrier_lower >   ;07
  enemy-spawn < #11, #0C, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #A8, #00 >   ;08
  enemy-spawn < #15, #0D, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #A9, #00 >   ;09
  enemy-spawn < #19, #0C, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #AA, #00 >   ;0A
  enemy-spawn < #1D, #0D, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #AB, #00 >   ;0B
  enemy-spawn < #03, #2B, #00, @pyCC_mystic_ball, #4F, #AC, #00 >   ;0C
  enemy-spawn < #29, #0A, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #AD, #00 >   ;0D
  enemy-spawn < #3B, #2C, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #AE, #00 >   ;0E
  enemy-spawn < #3E, #4C, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #AF, #00 >   ;0F
  enemy-spawn < #1C, #45, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #B0, #00 >   ;10
  enemy-spawn < #28, #0A, #00, @pyCE_tuts, #4E, #B1, #00 >   ;11
  enemy-spawn < #0D, #2A, #00, @pyCE_tuts, #4E, #B2, #00 >   ;12
  enemy-spawn < #1E, #46, #00, @pyCE_tuts, #4E, #B3, #00 >   ;13
  enemy-spawn < #4C, #0B, #00, @pyCC_blaster, #51, #B4, #00 >   ;14
  enemy-spawn < #29, #3A, #00, @pyCC_blaster, #51, #B5, #00 >   ;15
  enemy-spawn < #29, #3B, #00, @pyCC_blaster, #51, #B6, #00 >   ;16
  enemy-spawn < #29, #3C, #00, @pyCC_blaster, #51, #B7, #00 >   ;17
  enemy-spawn < #29, #3D, #00, @pyCC_blaster, #51, #B8, #00 >   ;18
]

scene_event_0CDC1E [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraAccumulate >   ;02
  actor-spawn < #3B, #4C, #00, @pyCC_entrance_portal >   ;03
  actor-spawn < #11, #1C, #03, @pyD7_sliding_wall >   ;04
  actor-spawn < #37, #1C, #05, @pyD7_sliding_wall >   ;05
  actor-spawn < #08, #2C, #03, @pyD7_sliding_wall >   ;06
  actor-spawn < #37, #3C, #07, @pyD7_sliding_wall.pyD7_actor_08C57F >   ;07
  actor-spawn < #08, #4C, #0B, @pyD7_sliding_wall.pyD7_actor_08C57F >   ;08
  actor-spawn < #34, #5D, #03, @pyD7_sliding_wall >   ;09
  actor-spawn < #0B, #5D, #07, @pyD7_sliding_wall >   ;0A
  enemy-spawn < #36, #1A, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #C0, #00 >   ;0B
  enemy-spawn < #38, #1D, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #C1, #00 >   ;0C
  enemy-spawn < #07, #2C, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #C2, #00 >   ;0D
  enemy-spawn < #09, #2C, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #C3, #00 >   ;0E
  enemy-spawn < #08, #2B, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #C4, #00 >   ;0F
  enemy-spawn < #08, #2D, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #C5, #00 >   ;10
  enemy-spawn < #0C, #5C, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #C6, #00 >   ;11
  enemy-spawn < #0D, #5D, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #C7, #00 >   ;12
  enemy-spawn < #0E, #5C, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #C8, #00 >   ;13
  enemy-spawn < #0F, #5D, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #C9, #00 >   ;14
  enemy-spawn < #10, #5C, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #CA, #00 >   ;15
  enemy-spawn < #11, #5D, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #CB, #00 >   ;16
  enemy-spawn < #08, #4C, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #CC, #00 >   ;17
  enemy-spawn < #33, #3A, #00, @pyCC_blaster, #51, #CD, #00 >   ;18
  enemy-spawn < #3B, #3A, #00, @pyCC_blaster, #51, #CE, #00 >   ;19
  enemy-spawn < #34, #5D, #00, @pyCC_blaster, #51, #CF, #00 >   ;1A
]

scene_event_0CDCFD [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #44, #1C, #00, @pyCC_entrance_portal >   ;02
  enemy-spawn < #40, #29, #00, @pyD2_haunt, #4C, #D0, #00 >   ;03
  enemy-spawn < #3C, #29, #00, @pyD2_haunt, #4C, #D1, #00 >   ;04
  enemy-spawn < #34, #19, #00, @pyD2_haunt, #4C, #D2, #00 >   ;05
  enemy-spawn < #30, #19, #00, @pyD2_haunt, #4C, #D3, #00 >   ;06
  enemy-spawn < #2C, #19, #00, @pyD2_haunt, #4C, #D4, #00 >   ;07
  enemy-spawn < #25, #49, #00, @pyD2_haunt, #4C, #D5, #00 >   ;08
  enemy-spawn < #21, #49, #00, @pyD2_haunt, #4C, #D6, #00 >   ;09
  enemy-spawn < #1D, #49, #00, @pyD2_haunt, #4C, #D7, #00 >   ;0A
  enemy-spawn < #16, #39, #00, @pyD2_haunt, #4C, #D8, #00 >   ;0B
  enemy-spawn < #11, #39, #00, @pyD2_haunt, #4C, #D9, #00 >   ;0C
  enemy-spawn < #0C, #39, #00, @pyD2_haunt, #4C, #DA, #00 >   ;0D
  enemy-spawn < #46, #19, #00, @pyD2_haunt, #4C, #DB, #00 >   ;0E
  enemy-spawn < #37, #0C, #00, @pyCC_mystic_ball, #4F, #DC, #00 >   ;0F
  enemy-spawn < #37, #0D, #00, @pyCC_mystic_ball, #4F, #DD, #00 >   ;10
  enemy-spawn < #30, #1D, #00, @pyCC_mystic_ball, #4F, #DE, #00 >   ;11
  enemy-spawn < #2C, #1B, #00, @pyCC_mystic_ball, #4F, #DF, #00 >   ;12
  enemy-spawn < #0F, #25, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #E0, #00 >   ;13
  enemy-spawn < #10, #26, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #E1, #00 >   ;14
  enemy-spawn < #11, #25, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #E2, #00 >   ;15
  enemy-spawn < #12, #26, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #E3, #00 >   ;16
  enemy-spawn < #13, #25, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #E4, #00 >   ;17
  enemy-spawn < #14, #26, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #E5, #00 >   ;18
  enemy-spawn < #15, #25, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #E6, #00 >   ;19
  enemy-spawn < #3E, #2A, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #E7, #00 >   ;1A
  enemy-spawn < #41, #3A, #00, @pyD2_haunt.pyD5_haunt2, #4C, #E8, #00 >   ;1B
  enemy-spawn < #40, #3D, #00, @pyD2_haunt.pyD5_haunt2, #4C, #E9, #00 >   ;1C
  enemy-spawn < #4C, #3A, #00, @pyD2_haunt.pyD5_haunt2, #4C, #EA, #00 >   ;1D
  enemy-spawn < #4D, #3D, #00, @pyD2_haunt.pyD5_haunt2, #4C, #EB, #00 >   ;1E
  enemy-spawn < #22, #0D, #00, @pyCE_tuts, #4E, #EC, #00 >   ;1F
  enemy-spawn < #0E, #3B, #00, @pyCE_tuts, #4E, #ED, #00 >   ;20
  enemy-spawn < #06, #3B, #00, @pyCE_tuts, #4E, #EE, #00 >   ;21
  enemy-spawn < #0C, #4A, #00, @pyCC_blaster, #51, #EF, #00 >   ;22
  enemy-spawn < #0D, #4D, #00, @pyCC_blaster, #51, #F0, #00 >   ;23
  enemy-spawn < #03, #4A, #00, @pyCC_blaster, #51, #F1, #00 >   ;24
  enemy-spawn < #02, #4D, #00, @pyCC_blaster, #51, #F2, #00 >   ;25
]

scene_event_0CDE4F [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraAccumulate >   ;02
  actor-spawn < #00, #01, #00, @pyD9_dangerslide_controller >   ;03
  enemy-spawn < #33, #1A, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #F3, #00 >   ;04
  enemy-spawn < #4A, #0B, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #F4, #00 >   ;05
  enemy-spawn < #4B, #0B, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #F4, #00 >   ;06
  enemy-spawn < #4A, #0C, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #F4, #00 >   ;07
  enemy-spawn < #4B, #0C, #00, @pyCC_mystic_ball.pyCC_mystic_ball3, #4F, #F4, #00 >   ;08
  enemy-spawn < #2B, #1A, #00, @pyCC_mystic_ball, #4F, #F8, #00 >   ;09
  enemy-spawn < #39, #1A, #00, @pyCC_mystic_ball, #4F, #F8, #00 >   ;0A
  enemy-spawn < #4C, #2A, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #FA, #00 >   ;0B
  enemy-spawn < #49, #2B, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #FA, #00 >   ;0C
  enemy-spawn < #50, #2A, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #FA, #00 >   ;0D
  enemy-spawn < #52, #2B, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #FA, #00 >   ;0E
  enemy-spawn < #45, #0C, #00, @pyCC_mystic_ball.pyCC_mystic_ball2, #4F, #FA, #00 >   ;0F
  enemy-spawn < #4E, #2A, #00, @pyCC_blaster, #51, #FB, #00 >   ;10
  enemy-spawn < #4E, #2B, #00, @pyCC_blaster, #51, #FB, #00 >   ;11
  enemy-spawn < #4E, #2C, #00, @pyCC_blaster, #51, #FB, #00 >   ;12
  enemy-spawn < #4E, #2D, #00, @pyCC_blaster, #51, #FB, #00 >   ;13
  enemy-spawn < #66, #1A, #00, @pyCE_tuts, #4E, #FC, #00 >   ;14
  enemy-spawn < #73, #2A, #00, @pyD2_haunt.pyD5_haunt2, #4C, #FD, #00 >   ;15
  enemy-spawn < #72, #2B, #00, @pyD2_haunt.pyD5_haunt2, #4C, #FD, #00 >   ;16
  enemy-spawn < #72, #2D, #00, @pyD2_haunt.pyD5_haunt2, #4C, #FD, #00 >   ;17
  enemy-spawn < #7C, #2A, #00, @pyD2_haunt.pyD5_haunt2, #4C, #FD, #00 >   ;18
  enemy-spawn < #7D, #2B, #00, @pyD2_haunt.pyD5_haunt2, #4C, #FD, #00 >   ;19
  enemy-spawn < #7D, #2D, #00, @pyD2_haunt.pyD5_haunt2, #4C, #FD, #00 >   ;1A
]

scene_event_0CDF3C [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #07, #07, #00, @pyDA_lithograph1 >   ;02
  actor-spawn < #17, #07, #00, @pyDA_lithograph2 >   ;03
  actor-spawn < #27, #07, #00, @pyDA_lithograph3 >   ;04
  actor-spawn < #37, #07, #00, @pyDA_lithograph4 >   ;05
  actor-spawn < #47, #07, #00, @pyDA_lithograph5 >   ;06
  actor-spawn < #57, #07, #00, @pyDA_lithograph6 >   ;07
]

scene_event_0CDF76 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraAccumulate >   ;02
  actor-spawn < #00, #01, #00, @pyD9_dangerslide_controller >   ;03
  actor-spawn < #7C, #0C, #00, @pyCC_entrance_portal >   ;04
  enemy-spawn < #4E, #0D, #00, @pyCC_blaster, #51, #FE, #00 >   ;05
  enemy-spawn < #4E, #0E, #00, @pyCC_blaster, #51, #FE, #00 >   ;06
  enemy-spawn < #68, #0E, #00, @pyCC_mystic_ball, #4F, #BE, #00 >   ;07
  enemy-spawn < #6C, #0F, #00, @pyCC_mystic_ball, #4F, #BF, #00 >   ;08
]

scene_event_0CDFBF [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #04, #0C, #30, @pyDD_queen_invincible_orb >   ;03
  actor-spawn < #04, #1B, #30, @pyDD_teleporter >   ;04
  actor-spawn < #1B, #0C, #30, @pyDD_queen_invincible_orb >   ;05
  actor-spawn < #1B, #1B, #30, @pyDD_teleporter.pyDD_teleporter_right >   ;06
  enemy-spawn < #0F, #0C, #30, @pyDD_mummy_queen.pyDD_mummy_queen, #50, #00, #00 >   ;07
  actor-spawn < #00, #01, #01, @pyDD_queen_arena_boundary >   ;08
  actor-spawn < #00, #01, #00, @pyDD_mystic_statue >   ;09
  actor-spawn < #00, #01, #01, @boss_clear_reward_handler >   ;0A
]

scene_event_0CE010 [
  actor-spawn < #00, #01, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @visual_effect_pipeline.effect_velocity_init >   ;01
  actor-spawn < #08, #0B, #00, @btDC_plane_jumping >   ;02
]

scene_event_0CE027 [
  actor-spawn < #05, #0A, #32, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #17, #0B, #00, @btDE_olman >   ;02
  actor-spawn < #00, #01, #00, @btDE_kara_missing >   ;03
  actor-spawn < #00, #01, #00, @btDE_monologue >   ;04
]

scene_event_0CE04C [
  actor-spawn < #07, #0E, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @btDE_kara_missing >   ;03
  actor-spawn < #00, #01, #00, @btDF_kara >   ;04
  actor-spawn < #00, #01, #00, @btDF_crystal_ring >   ;05
  actor-spawn < #00, #01, #00, @btDE_monologue >   ;06
  actor-spawn < #4B, #0A, #01, @btDF_spirits >   ;07
  actor-spawn < #2B, #0A, #05, @btDF_spirits >   ;08
  actor-spawn < #28, #0A, #07, @btDF_spirits >   ;09
  actor-spawn < #3F, #1A, #1F, @hidden_red_jewel >   ;0A
]

scene_event_0CE09B [
  actor-spawn < #07, #0E, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #46, #3A, #01, @dark_space.dark_space2 >   ;03
  actor-spawn < #00, #01, #00, @btE0_crystal_gate_a >   ;04
  actor-spawn < #00, #01, #00, @btE0_crystal_gate_b >   ;05
  actor-spawn < #00, #01, #00, @btE0_crystal_gate_c >   ;06
  actor-spawn < #00, #01, #00, @btE0_crystal_gate_d >   ;07
  actor-spawn < #00, #01, #00, @btDE_kara_missing >   ;08
  actor-spawn < #27, #3A, #03, @btDF_spirits >   ;09
  actor-spawn < #3A, #3A, #09, @btDF_spirits >   ;0A
]

scene_event_0CE0EA [
  actor-spawn < #07, #0E, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @btDE_kara_missing >   ;03
  actor-spawn < #00, #01, #00, @btE1_light_elevator >   ;04
  actor-spawn < #15, #6E, #00, @btE1_comet_soon >   ;05
]

scene_event_0CE116 [
  actor-spawn < #07, #0E, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #18, #70, #00, @btE2_brought_back >   ;03
]

scene_event_0CE134 [
  actor-spawn < #07, #0E, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #11, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #00, #01, #00, @btE3_crystal_gate >   ;03
  actor-spawn < #00, #01, #00, @btDE_kara_missing >   ;04
  actor-spawn < #09, #1A, #00, @btE3_kara >   ;05
  actor-spawn < #2B, #1A, #01, @dark_space.dark_space2 >   ;06
  actor-spawn < #28, #1A, #00, @btE3_dao_travel_spirit >   ;07
]

scene_event_0CE16E [
  actor-spawn < #07, #0E, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #41, #00, @camera_scroll.ScrollCameraTrack >   ;02
  actor-spawn < #10, #12, #00, @btE4_olman >   ;03
  actor-spawn < #11, #15, #00, @btE4_kara >   ;04
]

scene_event_0CE193 [
  actor-spawn < #09, #0B, #32, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #07, #0B, #30, @sE5_epilogue >   ;02
]

scene_event_0CE1AA [
  actor-spawn < #12, #01, #00, @sF7_credits_player.sF7_actor_09DFF8 >   ;00
  actor-spawn < #12, #01, #00, @sF7_credits_npc_a.sF7_actor_09E26C >   ;01
  actor-spawn < #12, #01, #00, @sF7_credits_npc_b.sF7_actor_09E3EB >   ;02
  actor-spawn < #12, #01, #00, @sF7_credits_npc_c.sF7_actor_09E4DD >   ;03
  actor-spawn < #12, #01, #00, @sF7_credits_npc_d.sF7_actor_09E591 >   ;04
  actor-spawn < #12, #01, #00, @sF7_credits_npc_e.sF7_actor_09E607 >   ;05
  actor-spawn < #00, #01, #00, @sF7_credits >   ;06
]

scene_event_0CE1DD [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #01, #82, #00, @visual_effect_pipeline.effect_position_update >   ;02
  actor-spawn < #00, #01, #00, @sE6_gaia >   ;03
]

scene_event_0CE202 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #01, #00, @sE7_space_flight_controller >   ;01
]

scene_event_0CE212 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  enemy-spawn < #00, #01, #00, @sE8_dark_gaia, #54, #00, #00 >   ;01
]

scene_event_0CE224 [
  actor-spawn < #33, #3E, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #81, #02, #00, @visual_effect_pipeline.effect_position_update >   ;02
  actor-spawn < #28, #2E, #17, @slider_glide.SliderGlideTriggerNorth >   ;03
  actor-spawn < #28, #23, #17, @slider_glide.SliderGlideTriggerSouth >   ;04
  actor-spawn < #00, #01, #00, @sE9_mansion_intro >   ;05
  enemy-spawn < #25, #3A, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #00 >   ;06
  enemy-spawn < #1D, #3A, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #9A >   ;07
  enemy-spawn < #18, #3A, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #00 >   ;08
  enemy-spawn < #10, #3A, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #00 >   ;09
  enemy-spawn < #02, #32, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #00 >   ;0A
  enemy-spawn < #0B, #11, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #00 >   ;0B
  enemy-spawn < #03, #0E, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #00 >   ;0C
  enemy-spawn < #16, #10, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #00 >   ;0D
  enemy-spawn < #2F, #27, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #00 >   ;0E
  enemy-spawn < #2A, #30, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #00 >   ;0F
  enemy-spawn < #26, #0F, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #00 >   ;10
  enemy-spawn < #2A, #06, #00, @dm3D_flayzer.dm3D_flayzer3, #61, #00, #00 >   ;11
  enemy-spawn < #14, #3A, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #9B >   ;12
  enemy-spawn < #0B, #25, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;13
  enemy-spawn < #03, #21, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;14
  enemy-spawn < #08, #1F, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;15
  enemy-spawn < #0C, #1A, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;16
  enemy-spawn < #09, #0D, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;17
  enemy-spawn < #0C, #0D, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;18
  enemy-spawn < #16, #13, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;19
  enemy-spawn < #14, #19, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;1A
  enemy-spawn < #17, #19, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;1B
  enemy-spawn < #13, #2F, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;1C
  enemy-spawn < #32, #2F, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;1D
  enemy-spawn < #2D, #16, #00, @dm3D_eye_stalker.dm3D_eye_stalker3, #62, #00, #00 >   ;1E
  enemy-spawn < #04, #32, #00, @dm3D_eye_stalker.sE9_eye_stalker2, #62, #00, #00 >   ;1F
  enemy-spawn < #04, #31, #00, @dm3D_eye_stalker.sE9_eye_stalker2, #62, #00, #00 >   ;20
  enemy-spawn < #37, #18, #00, @dm3D_eye_stalker.sE9_eye_stalker2, #62, #00, #00 >   ;21
  enemy-spawn < #38, #18, #00, @dm3D_eye_stalker.sE9_eye_stalker2, #62, #00, #00 >   ;22
  enemy-spawn < #1B, #0D, #00, @dm3D_grundit, #63, #00, #00 >   ;23
  enemy-spawn < #1B, #12, #00, @dm3D_grundit, #63, #00, #00 >   ;24
  enemy-spawn < #17, #23, #00, @dm3D_grundit, #63, #00, #00 >   ;25
  enemy-spawn < #21, #23, #00, @dm3D_grundit, #63, #00, #00 >   ;26
  enemy-spawn < #17, #2C, #00, @dm3D_grundit, #63, #00, #00 >   ;27
  enemy-spawn < #21, #2C, #00, @dm3D_grundit, #63, #00, #00 >   ;28
  enemy-spawn < #25, #1D, #00, @dm3D_grundit, #63, #00, #00 >   ;29
  enemy-spawn < #24, #13, #00, @dm3D_grundit, #63, #00, #00 >   ;2A
  enemy-spawn < #29, #13, #00, @dm3D_grundit, #63, #00, #00 >   ;2B
]

scene_event_0CE3A6 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #83, #04, #00, @visual_effect_pipeline.effect_position_update >   ;02
  actor-spawn < #00, #01, #00, @btEA_conveyor_controller >   ;03
  enemy-spawn < #08, #07, #00, @sEA_solid_arm, #5F, #00, #00 >   ;04
]

scene_event_0CE3CD [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #03, #86, #00, @visual_effect_pipeline.effect_position_update >   ;02
]

scene_event_0CE3EB [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #01, #82, #00, @visual_effect_pipeline.effect_position_update >   ;02
]

scene_event_0CE409 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #01, #82, #00, @visual_effect_pipeline.effect_position_update >   ;02
]

scene_event_0CE427 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #01, #82, #00, @visual_effect_pipeline.effect_position_update >   ;02
]

scene_event_0CE445 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #01, #82, #00, @visual_effect_pipeline.effect_position_update >   ;02
]

scene_event_0CE463 [
  actor-spawn < #00, #01, #00, @sF0_class_dismissed >
]

scene_event_0CE46C [
  actor-spawn < #05, #0A, #30, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #11, #82, #00, @visual_effect_pipeline.effect_position_update >   ;02
  enemy-spawn < #07, #09, #00, @ir29_castoth.btF2_neo_castoth, #5A, #01, #00 >   ;03
]

scene_event_0CE48C [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #06, #86, #00, @visual_effect_pipeline.effect_position_update >   ;02
  enemy-spawn < #10, #05, #30, @sg55_viper.btF3_neo_viper, #5B, #02, #00 >   ;03
]

scene_event_0CE4AC [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #21, #21, #00, @camera_scroll.ScrollCameraTrack >   ;02
  enemy-spawn < #0A, #09, #30, @mu67_vampires.btF4_neo_male_vampire, #5C, #03, #00 >   ;03
  enemy-spawn < #05, #09, #30, @mu67_vampires.btF4_neo_female_vampire, #5C, #03, #00 >   ;04
]

scene_event_0CE4D5 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #06, #81, #00, @visual_effect_pipeline.effect_position_update >   ;02
  enemy-spawn < #27, #30, #00, @gw8A_sand_fanger.btF5_neo_fanger, #5D, #04, #00 >   ;03
]

scene_event_0CE4F5 [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #81, #02, #00, @visual_effect_pipeline.effect_position_update >   ;02
  actor-spawn < #04, #0C, #30, @pyDD_queen_invincible_orb >   ;03
  actor-spawn < #04, #1B, #30, @pyDD_teleporter >   ;04
  actor-spawn < #1B, #0C, #30, @pyDD_queen_invincible_orb >   ;05
  actor-spawn < #1B, #1B, #30, @pyDD_teleporter.pyDD_teleporter_right >   ;06
  enemy-spawn < #0F, #0C, #30, @pyDD_mummy_queen.btF6_neo_queen, #5E, #05, #00 >   ;07
  actor-spawn < #00, #01, #01, @pyDD_queen_arena_boundary >   ;08
]

scene_event_0CE538 [
  actor-spawn < #05, #0A, #02, @player_character.PlayerCharacterDef >   ;00
  actor-spawn < #00, #00, #00, @camera_scroll_controller >   ;01
  actor-spawn < #81, #02, #00, @visual_effect_pipeline.effect_position_update >   ;02
]

scene_event_0CE55B [
  actor-spawn < #00, #01, #00, @sFA_diary_menu >
]

scene_event_0CE564 [
  actor-spawn < #07, #08, #01, @sFB_boot_logo >
]

scene_event_0CE56D [
  actor-spawn < #00, #01, #00, @sFC_title_intro >   ;00
  actor-spawn < #00, #01, #00, @sFC_title_start_handler >   ;01
]

scene_event_0CE57D [
  actor-spawn < #02, #03, #21, @statue_inventory_reward >   ;00
  actor-spawn < #01, #05, #03, @statue_inventory_reward >   ;01
  actor-spawn < #02, #08, #05, @statue_inventory_reward >   ;02
  actor-spawn < #0C, #03, #27, @statue_inventory_reward >   ;03
  actor-spawn < #0D, #05, #09, @statue_inventory_reward >   ;04
  actor-spawn < #0C, #08, #0B, @statue_inventory_reward >   ;05
]

scene_event_0CE5A9 [
  actor-spawn < #00, #01, #00, @WorldMapController >
]

scene_event_0CE5B2 [
  actor-spawn < #00, #01, #00, @inventory_menu.InventoryMenuDef >   ;00
  actor-spawn < #02, #03, #21, @inventory_statue_slot >   ;01
  actor-spawn < #01, #05, #03, @inventory_statue_slot >   ;02
  actor-spawn < #02, #08, #05, @inventory_statue_slot >   ;03
  actor-spawn < #0C, #03, #27, @inventory_statue_slot >   ;04
  actor-spawn < #0D, #05, #09, @inventory_statue_slot >   ;05
  actor-spawn < #0C, #08, #0B, @inventory_statue_slot >   ;06
]

scene_actors_extract_table [
  &scene_event_0C821F_value   ;00
  &scene_event_0C8221_value   ;01
  &scene_event_0C8325_value   ;02
  &scene_event_0C835E_value   ;03
  &scene_event_0C8390_value   ;04
  &scene_event_0C83C9_value   ;05
  &scene_event_0C83FB_value   ;06
  &scene_event_0C845E_value   ;07
  &scene_event_0C8483_value   ;08
  &scene_event_0C84BC_value   ;09
  &scene_event_0C84DA_value   ;0A
  &scene_event_0C8612_value   ;0B
  &scene_event_0C867A_value   ;0C
  &scene_event_0C86AC_value   ;0D
  &scene_event_0C875C_value   ;0E
  &scene_event_0C8847_value   ;0F
  &scene_event_0C8935_value   ;10
  &scene_event_0C894C_value   ;11
  &scene_event_0C8986_value   ;12
  &scene_event_0C8AA9_value   ;13
  &scene_event_0C8AC7_value   ;14
  &scene_event_0C8AD7_value   ;15
  &scene_event_0C8B64_value   ;16
  &scene_event_0C8B7B_value   ;17
  &scene_event_0C8BA0_value   ;18
  &scene_event_0C8BBE_value   ;19
  &scene_event_0C8BDC_value   ;1A
  &scene_event_0C8C33_value   ;1B
  &scene_event_0C8C87_value   ;1C
  &scene_event_0C8CC4_value   ;1D
  &scene_event_0C8D85_value   ;1E
  &scene_event_0C8DBF_value   ;1F
  &scene_event_0C8E16_value   ;20
  &scene_event_0C8E75_value   ;21
  &scene_event_0C8F57_value   ;22
  &scene_event_0C9029_value   ;23
  &scene_event_0C90D5_value   ;24
  &scene_event_0C90F3_value   ;25
  &scene_event_0C91A0_value   ;26
  &scene_event_0C9242_value   ;27
  &scene_event_0C92F2_value   ;28
  &scene_event_0C935F_value   ;29
  &scene_event_0C938D_value   ;2A
  &scene_event_0C93B2_value   ;2B
  &scene_event_0C9401_value   ;2C
  &scene_event_0C945E_value   ;2D
  &scene_event_0C94B4_value   ;2E
  &scene_event_0C94F5_value   ;2F
  &scene_event_0C951A_value   ;30
  &scene_event_0C954D_value   ;31
  &scene_event_0C9572_value   ;32
  &scene_event_0C9699_value   ;33
  &scene_event_0C96B7_value   ;34
  &scene_event_0C96D5_value   ;35
  &scene_event_0C970B_value   ;36
  &scene_event_0C9729_value   ;37
  &scene_event_0C9747_value   ;38
  &scene_event_0C9773_value   ;39
  &scene_event_0C97AD_value   ;3A
  &scene_event_0C97D2_value   ;3B
  &scene_event_0C97F0_value   ;3C
  &scene_event_0C9836_value   ;3D
  &scene_event_0C98B7_value   ;3E
  &scene_event_0C991A_value   ;3F
  &scene_event_0C9A41_value   ;40
  &scene_event_0C9A95_value   ;41
  &scene_event_0C9B39_value   ;42
  &scene_event_0C9B57_value   ;43
  &scene_event_0C9B8A_value   ;44
  &scene_event_0C9BA1_value   ;45
  &scene_event_0C9BF4_value   ;46
  &scene_event_0C9C5C_value   ;47
  &scene_event_0C8200_value   ;48
  &scene_event_0C9C81_value   ;49
  &scene_event_0C9CE1_value   ;4A
  &scene_event_0C9CF1_value   ;4B
  &scene_event_0C9D45_value   ;4C
  &scene_event_0C9DB3_value   ;4D
  &scene_event_0C9E92_value   ;4E
  &scene_event_0C9F53_value   ;4F
  &scene_event_0CA01A_value   ;50
  &scene_event_0CA0CB_value   ;51
  &scene_event_0CA192_value   ;52
  &scene_event_0CA247_value   ;53
  &scene_event_0CA335_value   ;54
  &scene_event_0CA43B_value   ;55
  &scene_event_0CA4F5_value   ;56
  &scene_event_0C8200_value   ;57
  &scene_event_0CA50C_value   ;58
  &scene_event_0CA554_value   ;59
  &scene_event_0CA55D_value   ;5A
  &scene_event_0CA5D6_value   ;5B
  &scene_event_0CA610_value   ;5C
  &scene_event_0CA6E6_value   ;5D
  &scene_event_0CA704_value   ;5E
  &scene_event_0CA71B_value   ;5F
  &scene_event_0CA7ED_value   ;60
  &scene_event_0CA934_value   ;61
  &scene_event_0CAA7B_value   ;62
  &scene_event_0CAB28_value   ;63
  &scene_event_0CAB4B_value   ;64
  &scene_event_0CABD4_value   ;65
  &scene_event_0CACC3_value   ;66
  &scene_event_0CACEF_value   ;67
  &scene_event_0CAD42_value   ;68
  &scene_event_0CAD99_value   ;69
  &scene_event_0CADE1_value   ;6A
  &scene_event_0CAE1B_value   ;6B
  &scene_event_0CAEB6_value   ;6C
  &scene_event_0CAF6E_value   ;6D
  &scene_event_0CB04B_value   ;6E
  &scene_event_0CB13E_value   ;6F
  &scene_event_0CB1AE_value   ;70
  &scene_event_0CB258_value   ;71
  &scene_event_0CB29E_value   ;72
  &scene_event_0CB355_value   ;73
  &scene_event_0CB388_value   ;74
  &scene_event_0CB3AD_value   ;75
  &scene_event_0C8200_value   ;76
  &scene_event_0C8200_value   ;77
  &scene_event_0CB41F_value   ;78
  &scene_event_0CB572_value   ;79
  &scene_event_0CB5AC_value   ;7A
  &scene_event_0CB5D1_value   ;7B
  &scene_event_0CB62D_value   ;7C
  &scene_event_0CB64B_value   ;7D
  &scene_event_0CB670_value   ;7E
  &scene_event_0CB695_value   ;7F
  &scene_event_0C8200_value   ;80
  &scene_event_0C8200_value   ;81
  &scene_event_0CB6C1_value   ;82
  &scene_event_0CB845_value   ;83
  &scene_event_0CB966_value   ;84
  &scene_event_0CB97D_value   ;85
  &scene_event_0CBB18_value   ;86
  &scene_event_0CBB87_value   ;87
  &scene_event_0CBC3B_value   ;88
  &scene_event_0CBD0A_value   ;89
  &scene_event_0CBD1A_value   ;8A
  &scene_event_0CBD41_value   ;8B
  &scene_event_0CBD5F_value   ;8C
  &scene_event_0CBD76_value   ;8D
  &scene_event_0CBD86_value   ;8E
  &scene_event_0CBDAB_value   ;8F
  &scene_event_0CBDBB_value   ;90
  &scene_event_0CBDC4_value   ;91
  &scene_event_0CBF65_value   ;92
  &scene_event_0CBF8A_value   ;93
  &scene_event_0CBFA8_value   ;94
  &scene_event_0CBFD6_value   ;95
  &scene_event_0CC012_value   ;96
  &scene_event_0CC048_value   ;97
  &scene_event_0CC07B_value   ;98
  &scene_event_0CC099_value   ;99
  &scene_event_0CC0BE_value   ;9A
  &scene_event_0CC0EA_value   ;9B
  &scene_event_0CC108_value   ;9C
  &scene_event_0CC12D_value   ;9D
  &scene_event_0C8200_value   ;9E
  &scene_event_0CC18A_value   ;9F
  &scene_event_0CC18C_value   ;A0
  &scene_event_0CC21C_value   ;A1
  &scene_event_0CC335_value   ;A2
  &scene_event_0CC3DF_value   ;A3
  &scene_event_0CC4F7_value   ;A4
  &scene_event_0CC5F8_value   ;A5
  &scene_event_0CC703_value   ;A6
  &scene_event_0CC7A1_value   ;A7
  &scene_event_0CC9A3_value   ;A8
  &scene_event_0CCA02_value   ;A9
  &scene_event_0C8200_value   ;AA
  &scene_event_0C8200_value   ;AB
  &scene_event_0CCA19_value   ;AC
  &scene_event_0CCAAE_value   ;AD
  &scene_event_0CCADA_value   ;AE
  &scene_event_0C8200_value   ;AF
  &scene_event_0CCB1B_value   ;B0
  &scene_event_0CCBD8_value   ;B1
  &scene_event_0CCCA5_value   ;B2
  &scene_event_0CCD26_value   ;B3
  &scene_event_0CCD83_value   ;B4
  &scene_event_0CCDD7_value   ;B5
  &scene_event_0CCE7B_value   ;B6
  &scene_event_0CD005_value   ;B7
  &scene_event_0CD092_value   ;B8
  &scene_event_0CD0DF_value   ;B9
  &scene_event_0CD137_value   ;BA
  &scene_event_0CD197_value   ;BB
  &scene_event_0CD1F4_value   ;BC
  &scene_event_0CD29A_value   ;BD
  &scene_event_0CD339_value   ;BE
  &scene_event_0CD392_value   ;BF
  &scene_event_0CD3A9_value   ;C0
  &scene_event_0C8200_value   ;C1
  &scene_event_0C8200_value   ;C2
  &scene_event_0CD3B2_value   ;C3
  &scene_event_0CD454_value   ;C4
  &scene_event_0CD479_value   ;C5
  &scene_event_0CD4B3_value   ;C6
  &scene_event_0CD4D1_value   ;C7
  &scene_event_0CD4FD_value   ;C8
  &scene_event_0CD51B_value   ;C9
  &scene_event_0C8200_value   ;CA
  &scene_event_0C8200_value   ;CB
  &scene_event_0CD539_value   ;CC
  &scene_event_0CD58C_value   ;CD
  &scene_event_0CD5C6_value   ;CE
  &scene_event_0CD650_value   ;CF
  &scene_event_0CD6F3_value   ;D0
  &scene_event_0CD752_value   ;D1
  &scene_event_0CD81B_value   ;D2
  &scene_event_0CD8F1_value   ;D3
  &scene_event_0CD9A1_value   ;D4
  &scene_event_0CDA80_value   ;D5
  &scene_event_0CDB4B_value   ;D6
  &scene_event_0CDC1E_value   ;D7
  &scene_event_0CDCFD_value   ;D8
  &scene_event_0CDE4F_value   ;D9
  &scene_event_0CDF3C_value   ;DA
  &scene_event_0CDF76_value   ;DB
  &scene_event_0CE010_value   ;DC
  &scene_event_0CDFBF_value   ;DD
  &scene_event_0CE027_value   ;DE
  &scene_event_0CE04C_value   ;DF
  &scene_event_0CE09B_value   ;E0
  &scene_event_0CE0EA_value   ;E1
  &scene_event_0CE116_value   ;E2
  &scene_event_0CE134_value   ;E3
  &scene_event_0CE16E_value   ;E4
  &scene_event_0CE193_value   ;E5
  &scene_event_0CE1DD_value   ;E6
  &scene_event_0CE202_value   ;E7
  &scene_event_0CE212_value   ;E8
  &scene_event_0CE224_value   ;E9
  &scene_event_0CE3A6_value   ;EA
  &scene_event_0CE3CD_value   ;EB
  &scene_event_0CE3EB_value   ;EC
  &scene_event_0CE409_value   ;ED
  &scene_event_0CE427_value   ;EE
  &scene_event_0CE445_value   ;EF
  &scene_event_0CE463_value   ;F0
  &scene_event_0CE538_value   ;F1
  &scene_event_0CE46C_value   ;F2
  &scene_event_0CE48C_value   ;F3
  &scene_event_0CE4AC_value   ;F4
  &scene_event_0CE4D5_value   ;F5
  &scene_event_0CE4F5_value   ;F6
  &scene_event_0CE1AA_value   ;F7
  &scene_event_0C8200_value   ;F8
  &scene_event_0C8200_value   ;F9
  &scene_event_0CE55B_value   ;FA
  &scene_event_0CE564_value   ;FB
  &scene_event_0CE56D_value   ;FC
  &scene_event_0CE57D_value   ;FD
  &scene_event_0CE5A9_value   ;FE
  &scene_event_0CE5B2_value   ;FF
]

scene_event_0C8200_value `TEST MAP`

scene_event_0C821F_value ``

scene_event_0C8221_value `South Cape`

scene_event_0C8325_value `Seaside Cave`

scene_event_0C835E_value `Lance's House`

scene_event_0C8390_value `Erik's House`

scene_event_0C83C9_value `Seth's House`

scene_event_0C83FB_value `Will's House`

scene_event_0C845E_value ``

scene_event_0C8483_value `School`

scene_event_0C84BC_value ``

scene_event_0C84DA_value `Edward's Castle`

scene_event_0C8612_value `Edward's Prison`

scene_event_0C867A_value ``

scene_event_0C86AC_value `Underground Tunnel`

scene_event_0C875C_value ``

scene_event_0C8847_value ``

scene_event_0C8935_value ``

scene_event_0C894C_value ``

scene_event_0C8986_value ``

scene_event_0C8AA9_value ``

scene_event_0C8AC7_value ``

scene_event_0C8AD7_value `Itory Village`

scene_event_0C8B64_value ``

scene_event_0C8B7B_value `Lilly's House`

scene_event_0C8BA0_value ``

scene_event_0C8BBE_value ``

scene_event_0C8BDC_value `Home of Moon Tribe`

scene_event_0C8C33_value ``

scene_event_0C8C87_value `Entrance to Ruins`

scene_event_0C8CC4_value `Larai Cliff`

scene_event_0C8D85_value ``

scene_event_0C8DBF_value ``

scene_event_0C8E16_value ``

scene_event_0C8E75_value ``

scene_event_0C8F57_value ``

scene_event_0C9029_value ``

scene_event_0C90D5_value ``

scene_event_0C90F3_value ``

scene_event_0C91A0_value ``

scene_event_0C9242_value ``

scene_event_0C92F2_value ``

scene_event_0C935F_value ``

scene_event_0C938D_value ``

scene_event_0C93B2_value ``

scene_event_0C9401_value ``

scene_event_0C945E_value ``

scene_event_0C94B4_value ``

scene_event_0C94F5_value ``

scene_event_0C951A_value ``

scene_event_0C954D_value ``

scene_event_0C9572_value `City of Freejia`

scene_event_0C9699_value ``

scene_event_0C96B7_value ``

scene_event_0C96D5_value `Labor Camp`

scene_event_0C970B_value ``

scene_event_0C9729_value ``

scene_event_0C9747_value ``

scene_event_0C9773_value ``

scene_event_0C97AD_value ``

scene_event_0C97D2_value ``

scene_event_0C97F0_value `Labor Market`

scene_event_0C9836_value ``

scene_event_0C98B7_value `Diamond Mine`

scene_event_0C991A_value ``

scene_event_0C9A41_value ``

scene_event_0C9A95_value ``

scene_event_0C9B39_value ``

scene_event_0C9B57_value ``

scene_event_0C9B8A_value ``

scene_event_0C9BA1_value `Morgue`

scene_event_0C9BF4_value ``

scene_event_0C9C5C_value ``

scene_event_0C9C81_value `Neil's Cottage`

scene_event_0C9CE1_value ``

scene_event_0C9CF1_value `Nazca Plain`

scene_event_0C9D45_value `Sky Garden`

scene_event_0C9DB3_value `Sky Garden`

scene_event_0C9E92_value `Back of Garden`

scene_event_0C9F53_value `Sky Garden`

scene_event_0CA01A_value `Back of Garden`

scene_event_0CA0CB_value `Sky Garden`

scene_event_0CA192_value `Back of Garden`

scene_event_0CA247_value `Sky Garden`

scene_event_0CA335_value `Back of Garden`

scene_event_0CA43B_value ``

scene_event_0CA4F5_value ``

scene_event_0CA50C_value ``

scene_event_0CA554_value ``

scene_event_0CA55D_value ``

scene_event_0CA5D6_value ``

scene_event_0CA610_value ``

scene_event_0CA6E6_value ``

scene_event_0CA704_value ``

scene_event_0CA71B_value `Mu`

scene_event_0CA7ED_value ``

scene_event_0CA934_value ``

scene_event_0CAA7B_value ``

scene_event_0CAB28_value `Room of hope`

scene_event_0CAB4B_value ``

scene_event_0CABD4_value ``

scene_event_0CACC3_value ``

scene_event_0CACEF_value ``

scene_event_0CAD42_value `Seaside Tunnel`

scene_event_0CAD99_value ``

scene_event_0CADE1_value ``

scene_event_0CAE1B_value `Angel Village`

scene_event_0CAEB6_value ``

scene_event_0CAF6E_value ``

scene_event_0CB04B_value ``

scene_event_0CB13E_value ``

scene_event_0CB1AE_value ``

scene_event_0CB258_value `Wind Tunnel`

scene_event_0CB29E_value ``

scene_event_0CB355_value ``

scene_event_0CB388_value ``

scene_event_0CB3AD_value ``

scene_event_0CB41F_value `Watermia`

scene_event_0CB572_value ``

scene_event_0CB5AC_value ``

scene_event_0CB5D1_value `Desert`

scene_event_0CB62D_value ``

scene_event_0CB64B_value ``

scene_event_0CB670_value ``

scene_event_0CB695_value ``

scene_event_0CB6C1_value `China's Great Wall`

scene_event_0CB845_value ``

scene_event_0CB966_value ``

scene_event_0CB97D_value ``

scene_event_0CBB18_value ``

scene_event_0CBB87_value ``

scene_event_0CBC3B_value ``

scene_event_0CBD0A_value ``

scene_event_0CBD1A_value ``

scene_event_0CBD41_value ``

scene_event_0CBD5F_value ``

scene_event_0CBD76_value ``

scene_event_0CBD86_value ``

scene_event_0CBDAB_value ``

scene_event_0CBDBB_value ``

scene_event_0CBDC4_value `City of Euro`

scene_event_0CBF65_value ``

scene_event_0CBF8A_value ``

scene_event_0CBFA8_value `Rolek Company`

scene_event_0CBFD6_value `Rolek Mansion`

scene_event_0CC012_value `Guest Room`

scene_event_0CC048_value ``

scene_event_0CC07B_value ``

scene_event_0CC099_value ``

scene_event_0CC0BE_value ``

scene_event_0CC0EA_value ``

scene_event_0CC108_value ``

scene_event_0CC12D_value `Shrine`

scene_event_0CC18A_value ``

scene_event_0CC18C_value `Mountain Temple`

scene_event_0CC21C_value ``

scene_event_0CC335_value ``

scene_event_0CC3DF_value ``

scene_event_0CC4F7_value ``

scene_event_0CC5F8_value ``

scene_event_0CC703_value ``

scene_event_0CC7A1_value ``

scene_event_0CC9A3_value ``

scene_event_0CCA02_value ``

scene_event_0CCA19_value ``

scene_event_0CCAAE_value ``

scene_event_0CCADA_value ``

scene_event_0CCB1B_value `Door to Ankor Wat`

scene_event_0CCBD8_value `Passage - Outside`

scene_event_0CCCA5_value ``

scene_event_0CCD26_value ``

scene_event_0CCD83_value ``

scene_event_0CCDD7_value ``

scene_event_0CCE7B_value `Garden`

scene_event_0CD005_value `Passage - Inside`

scene_event_0CD092_value ``

scene_event_0CD0DF_value ``

scene_event_0CD137_value `Road to Main Hall`

scene_event_0CD197_value `Main Hall 1F`

scene_event_0CD1F4_value `Main Hall 2F`

scene_event_0CD29A_value `Main Hall 3F`

scene_event_0CD339_value `Main Hall 4F`

scene_event_0CD392_value ``

scene_event_0CD3A9_value ``

scene_event_0CD3B2_value `Desert Village Dao`

scene_event_0CD454_value ``

scene_event_0CD479_value ``

scene_event_0CD4B3_value ``

scene_event_0CD4D1_value ``

scene_event_0CD4FD_value ``

scene_event_0CD51B_value ``

scene_event_0CD539_value `Pyramid`

scene_event_0CD58C_value ``

scene_event_0CD5C6_value ``

scene_event_0CD650_value ``

scene_event_0CD6F3_value ``

scene_event_0CD752_value ``

scene_event_0CD81B_value ``

scene_event_0CD8F1_value ``

scene_event_0CD9A1_value ``

scene_event_0CDA80_value ``

scene_event_0CDB4B_value ``

scene_event_0CDC1E_value ``

scene_event_0CDCFD_value ``

scene_event_0CDE4F_value ``

scene_event_0CDF3C_value ``

scene_event_0CDF76_value ``

scene_event_0CDFBF_value ``

scene_event_0CE010_value ``

scene_event_0CE027_value ``

scene_event_0CE04C_value ``

scene_event_0CE09B_value ``

scene_event_0CE0EA_value ``

scene_event_0CE116_value ``

scene_event_0CE134_value ``

scene_event_0CE16E_value ``

scene_event_0CE193_value ``

scene_event_0CE1AA_value ``

scene_event_0CE1DD_value `Dark Space`

scene_event_0CE202_value ``

scene_event_0CE212_value ``

scene_event_0CE224_value ``

scene_event_0CE3A6_value ``

scene_event_0CE3CD_value `Dark Space`

scene_event_0CE3EB_value `Dark Space`

scene_event_0CE409_value `Dark Space`

scene_event_0CE427_value `Dark Space`

scene_event_0CE445_value `Dark Space`

scene_event_0CE463_value ``

scene_event_0CE46C_value ``

scene_event_0CE48C_value ``

scene_event_0CE4AC_value ``

scene_event_0CE4D5_value ``

scene_event_0CE4F5_value ``

scene_event_0CE538_value `Demon Palace`

scene_event_0CE55B_value ``

scene_event_0CE564_value ``

scene_event_0CE56D_value ``

scene_event_0CE57D_value ``

scene_event_0CE5A9_value ``

scene_event_0CE5B2_value ``