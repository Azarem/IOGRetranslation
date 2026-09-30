; =============================================
; Apocalypse Gaia — Unused Mode 7 Boss Restoration
; 
; Wires the unused Mode 7 boss ($09AA6E) into scene $EB
; with proper Mode 7 rendering as originally designed.
; Reuses E7's space backdrop for the Mode 7 arena,
; overlaid with custom sprite assets for all 3 boss phases.
;
; The boss code's camera system (brain actor + code_09B9CC)
; writes cameraDeltaX/Y each frame. In Mode 7, this scrolls
; the M7 BG creating a zoom/approach effect while OBJ sprites
; remain in actor-coordinate screen space — exactly as the
; original designers intended.
; =============================================

?INCLUDE 'scene_meta'
?INCLUDE 'scene_actors'
?INCLUDE 'scene_thinkers'
?INCLUDE 'unused_mode7_boss'
?INCLUDE 'enemy_stats_table'
?INCLUDE 'apocalypse_gaia'
?INCLUDE 'gfx_ag_sprites'
?INCLUDE 'gfx_ag_phase3'
?INCLUDE 'sine_hdma_ending_wave'
?INCLUDE 'ambient_palette_cycler'
?INCLUDE 'global_ambient_dispatcher'
?INCLUDE 'player_character'
?INCLUDE 'sE7_space_flight_controller'
?INCLUDE 'scene_script'

; =============================================
; Scene meta for $EB — Mode 7 Apocalypse Gaia arena
;
; display-mode #0C sets BGMODE=$07 and $06EF bit $08
; (Mode 7 flag). E7's space backdrop provides the M7 BG.
; BG3 layer from guardian fights prevents tilemap corruption.
;
; Boss sprite tiles are NOT loaded via bitmap — the bitmap
; struct compiles to SceneCmd_LoadBgTiles ($03) which writes
; to BG VRAM, not OBJ VRAM. Instead, a helper actor DMAs
; raw tiles directly to OBJ VRAM via AdhocVramDma.
; =============================================

scene_meta_00EA+ [
]

scene_meta_00EB [
  display-mode < #0C >
  bitmap < #00, #10, #00, @gfx_ending_combined, #00 >
  palette < #00, #70, #10, @pal_babel_spaceflight >
  tileset < #00, #20, #00, #01, @set_babel_darklair_effect >
  tilemap < #01, @map_babel_spaceflight >
  bitmap < #00, #10, #10, @gfx_ending_combined, #00 >
  tileset < #00, #20, #00, #02, @set_babel_darklair_effect >
  tilemap < #02, @map_babel_darklair_effect >
  palette < #00, #70, #90, @palette_1E6273 >
  spritemap < #$0900, #00, @apocalypse_gaia >
]

; =============================================
; Thinker spawn list for scene $EB
;
; Mode 7 pattern matching guardian fights (F2-F6).
; The original scene_thinkers table assigned $EB to
; thinker_spawn_0CEAAC (sine_hdma + global_ambient).
; We add ambient_palette_cycler for visual polish.
; =============================================

thinker_spawn_0CEB07+ [
]

thinker_spawn_ag_boss [
  thinker-spawn < #00, @sine_hdma_ending_wave >
  thinker-spawn < #71, @ambient_palette_cycler >
  thinker-spawn < #00, @global_ambient_dispatcher >
]

; =============================================
; OVERRIDES — Scene pointer tables
; =============================================

; --- Override scene-meta_list to add $EB entry ---
scene_meta_list! [
  &scene_meta_0000   ;00
  &scene_meta_0001   ;01
  &scene_meta_0002   ;02
  &scene_meta_0003   ;03
  &scene_meta_0004   ;04
  &scene_meta_0005   ;05
  &scene_meta_0006   ;06
  &scene_meta_0007   ;07
  &scene_meta_0008   ;08
  #$0000   ;09
  &scene_meta_000A   ;0A
  &scene_meta_000B   ;0B
  &scene_meta_000C   ;0C
  &scene_meta_000D   ;0D
  &scene_meta_000E   ;0E
  &scene_meta_000F   ;0F
  &scene_meta_0010   ;10
  &scene_meta_0011   ;11
  &scene_meta_0012   ;12
  &scene_meta_0013   ;13
  &scene_meta_0014   ;14
  &scene_meta_0015   ;15
  &scene_meta_0016   ;16
  &scene_meta_0017   ;17
  &scene_meta_0018   ;18
  &scene_meta_0019   ;19
  &scene_meta_001A   ;1A
  &scene_meta_001B   ;1B
  &scene_meta_001C   ;1C
  &scene_meta_001D   ;1D
  &scene_meta_001E   ;1E
  &scene_meta_001F   ;1F
  &scene_meta_0020   ;20
  &scene_meta_0021   ;21
  &scene_meta_0022   ;22
  &scene_meta_0023   ;23
  &scene_meta_0024   ;24
  &scene_meta_0025   ;25
  &scene_meta_0026   ;26
  &scene_meta_0027   ;27
  &scene_meta_0028   ;28
  &scene_meta_0029   ;29
  &scene_meta_002A   ;2A
  &scene_meta_002B   ;2B
  &scene_meta_002C   ;2C
  &scene_meta_002D   ;2D
  &scene_meta_002E   ;2E
  &scene_meta_002F   ;2F
  &scene_meta_0030   ;30
  &scene_meta_0031   ;31
  &scene_meta_0032   ;32
  &scene_meta_0033   ;33
  &scene_meta_0034   ;34
  &scene_meta_0035   ;35
  &scene_meta_0036   ;36
  &scene_meta_0037   ;37
  &scene_meta_0038   ;38
  &scene_meta_0039   ;39
  &scene_meta_003A   ;3A
  &scene_meta_003B   ;3B
  &scene_meta_003C   ;3C
  &scene_meta_003D   ;3D
  &scene_meta_003E   ;3E
  &scene_meta_003F   ;3F
  &scene_meta_0040   ;40
  &scene_meta_0041   ;41
  &scene_meta_0042   ;42
  &scene_meta_0043   ;43
  &scene_meta_0044   ;44
  &scene_meta_0045   ;45
  &scene_meta_0046   ;46
  &scene_meta_0047   ;47
  #$0000   ;48
  &scene_meta_0049   ;49
  #$0000   ;4A
  &scene_meta_004B   ;4B
  &scene_meta_004C   ;4C
  &scene_meta_004D   ;4D
  &scene_meta_004E   ;4E
  &scene_meta_004F   ;4F
  &scene_meta_0050   ;50
  &scene_meta_0051   ;51
  &scene_meta_0052   ;52
  &scene_meta_0053   ;53
  &scene_meta_0054   ;54
  &scene_meta_0055   ;55
  &scene_meta_0056   ;56
  #$0000   ;57
  &scene_meta_0058   ;58
  &scene_meta_0059   ;59
  &scene_meta_005A   ;5A
  &scene_meta_005B   ;5B
  &scene_meta_005C   ;5C
  &scene_meta_005D   ;5D
  &scene_meta_005E   ;5E
  &scene_meta_005F   ;5F
  &scene_meta_0060   ;60
  &scene_meta_0061   ;61
  &scene_meta_0062   ;62
  &scene_meta_0063   ;63
  &scene_meta_0064   ;64
  &scene_meta_0065   ;65
  &scene_meta_0066   ;66
  &scene_meta_0067   ;67
  &scene_meta_0068   ;68
  &scene_meta_0069   ;69
  &scene_meta_006A   ;6A
  &scene_meta_006B   ;6B
  &scene_meta_006C   ;6C
  &scene_meta_006D   ;6D
  &scene_meta_006E   ;6E
  &scene_meta_006F   ;6F
  &scene_meta_0070   ;70
  &scene_meta_0071   ;71
  &scene_meta_0072   ;72
  &scene_meta_0073   ;73
  &scene_meta_0074   ;74
  &scene_meta_0075   ;75
  #$0000   ;76
  #$0000   ;77
  &scene_meta_0078   ;78
  &scene_meta_0079   ;79
  &scene_meta_007A   ;7A
  &scene_meta_007B   ;7B
  &scene_meta_007C   ;7C
  &scene_meta_007D   ;7D
  &scene_meta_007E   ;7E
  &scene_meta_007F   ;7F
  #$0000   ;80
  #$0000   ;81
  &scene_meta_0082   ;82
  &scene_meta_0083   ;83
  #$0000   ;84
  &scene_meta_0085   ;85
  &scene_meta_0086   ;86
  &scene_meta_0087   ;87
  &scene_meta_0088   ;88
  &scene_meta_0089   ;89
  &scene_meta_008A   ;8A
  &scene_meta_008B   ;8B
  &scene_meta_008C   ;8C
  &scene_meta_008D   ;8D
  &scene_meta_008E   ;8E
  &scene_meta_008F   ;8F
  &scene_meta_0090   ;90
  &scene_meta_0091   ;91
  &scene_meta_0092   ;92
  &scene_meta_0093   ;93
  &scene_meta_0094   ;94
  &scene_meta_0095   ;95
  &scene_meta_0096   ;96
  &scene_meta_0097   ;97
  &scene_meta_0098   ;98
  &scene_meta_0099   ;99
  &scene_meta_009A   ;9A
  &scene_meta_009B   ;9B
  &scene_meta_009C   ;9C
  &scene_meta_009D   ;9D
  #$0000   ;9E
  #$0000   ;9F
  &scene_meta_00A0   ;A0
  &scene_meta_00A1   ;A1
  &scene_meta_00A2   ;A2
  &scene_meta_00A3   ;A3
  &scene_meta_00A4   ;A4
  &scene_meta_00A5   ;A5
  &scene_meta_00A6   ;A6
  &scene_meta_00A7   ;A7
  &scene_meta_00A8   ;A8
  &scene_meta_00A9   ;A9
  #$0000   ;AA
  #$0000   ;AB
  &scene_meta_00AC   ;AC
  &scene_meta_00AD   ;AD
  &scene_meta_00AE   ;AE
  #$0000   ;AF
  &scene_meta_00B0   ;B0
  &scene_meta_00B1   ;B1
  &scene_meta_00B2   ;B2
  &scene_meta_00B3   ;B3
  &scene_meta_00B4   ;B4
  &scene_meta_00B5   ;B5
  &scene_meta_00B6   ;B6
  &scene_meta_00B7   ;B7
  &scene_meta_00B8   ;B8
  &scene_meta_00B9   ;B9
  &scene_meta_00BA   ;BA
  &scene_meta_00BB   ;BB
  &scene_meta_00BC   ;BC
  &scene_meta_00BD   ;BD
  &scene_meta_00BE   ;BE
  &scene_meta_00BF   ;BF
  &scene_meta_00C0   ;C0
  #$0000   ;C1
  #$0000   ;C2
  &scene_meta_00C3   ;C3
  &scene_meta_00C4   ;C4
  &scene_meta_00C5   ;C5
  &scene_meta_00C6   ;C6
  &scene_meta_00C7   ;C7
  &scene_meta_00C8   ;C8
  &scene_meta_00C9   ;C9
  #$0000   ;CA
  #$0000   ;CB
  &scene_meta_00CC   ;CC
  &scene_meta_00CD   ;CD
  &scene_meta_00CE   ;CE
  &scene_meta_00CF   ;CF
  &scene_meta_00D0   ;D0
  &scene_meta_00D1   ;D1
  &scene_meta_00D2   ;D2
  &scene_meta_00D3   ;D3
  &scene_meta_00D4   ;D4
  &scene_meta_00D5   ;D5
  &scene_meta_00D6   ;D6
  &scene_meta_00D7   ;D7
  &scene_meta_00D8   ;D8
  &scene_meta_00D9   ;D9
  &scene_meta_00DA   ;DA
  &scene_meta_00DB   ;DB
  &scene_meta_00DC   ;DC
  &scene_meta_00DD   ;DD
  &scene_meta_00DE   ;DE
  &scene_meta_00DF   ;DF
  &scene_meta_00E0   ;E0
  &scene_meta_00E1   ;E1
  &scene_meta_00E2   ;E2
  &scene_meta_00E3   ;E3
  &scene_meta_00E4   ;E4
  &scene_meta_00E5   ;E5
  &scene_meta_00E6   ;E6
  &scene_meta_00E7   ;E7
  &scene_meta_00E8   ;E8
  &scene_meta_00E9   ;E9
  &scene_meta_00EA   ;EA
  &scene_meta_00EB   ;EB
  #$0000   ;EC
  #$0000   ;ED
  #$0000   ;EE
  #$0000   ;EF
  &scene_meta_00F0   ;F0
  #$0000   ;F1
  &scene_meta_00F2   ;F2
  &scene_meta_00F3   ;F3
  &scene_meta_00F4   ;F4
  &scene_meta_00F5   ;F5
  &scene_meta_00F6   ;F6
  &scene_meta_00F7   ;F7
  #$0000   ;F8
  &scene_meta_00F9   ;F9
  &scene_meta_00FA   ;FA
  &scene_meta_00FB   ;FB
  &scene_meta_00FC   ;FC
  &scene_meta_00FD   ;FD
  &scene_meta_00FE   ;FE
  &scene_meta_00FF   ;FF
]

; --- Override actor spawn list for scene $EB ---
; Boss at tile (8,$17) = pixel (128, 368). Spawns off-screen
; to avoid a 1-frame flash at center. Brain brings boss into
; view via cameraDelta scrolling the M7 BG for zoom effect.
scene_event_0CE3CD! [
  actor-spawn < #05, #0A, #00, @player_character.PlayerCharacterDef >
  actor-spawn < #00, #00, #00, @ag_tile_loader >
  enemy-spawn < #08, #17, #00, @ag_boss_def, #54, #00, #00 >
]

scene_event_0CE3CD_value! ``

; =============================================
; Boss uses original actor_09AA6E directly — no wrapper needed.
;
; InitActorFromSceneData sets spritesetPtr=$4000/bank=$7E for
; ALL scene-spawned actors. SpritemapPatch copies the packed
; apocalypse_gaia spritemap to $7E:$4000 with & pointers rebased
; to $4000. All children inherit $4000/$7E via CopyActorState.
; =============================================

; --- Override scene_thinkers pointer table to point $EB to our thinker list ---
scene_thinkers! [
  &thinker_spawn_0CE7E5   ;00
  &thinker_spawn_0CE80C+4   ;01
  &thinker_spawn_0CE7EA+8   ;02
  &thinker_spawn_0CE7EA+4   ;03
  &thinker_spawn_0CE7EA   ;04
  &thinker_spawn_0CE7EA+4   ;05
  &thinker_spawn_0CE7EA+4   ;06
  &thinker_spawn_0CE7EA   ;07
  &thinker_spawn_0CE7EA+4   ;08
  &thinker_spawn_0CE7E5   ;09
  &thinker_spawn_0CE821   ;0A
  &thinker_spawn_0CE7E5   ;0B
  &thinker_spawn_0CE7E5   ;0C
  &thinker_spawn_0CE82E   ;0D
  &thinker_spawn_0CE82E   ;0E
  &thinker_spawn_0CE82E   ;0F
  &thinker_spawn_0CE7E5   ;10
  &thinker_spawn_0CE7E5   ;11
  &thinker_spawn_0CE82E   ;12
  &thinker_spawn_0CE7E5   ;13
  &thinker_spawn_0CE7E5   ;14
  &thinker_spawn_0CE843   ;15
  &thinker_spawn_0CE7EA+8   ;16
  &thinker_spawn_0CE7EA+8   ;17
  &thinker_spawn_0CE7EA+8   ;18
  &thinker_spawn_0CE7E5   ;19
  &thinker_spawn_0CE843+4   ;1A
  &thinker_spawn_0CE7E5   ;1B
  &thinker_spawn_0CE843+4   ;1C
  &thinker_spawn_0CE861   ;1D
  &thinker_spawn_0CE7E5   ;1E
  &thinker_spawn_0CE7E5   ;1F
  &thinker_spawn_0CE861+8   ;20
  &thinker_spawn_0CE8D4   ;21
  &thinker_spawn_0CE8D4   ;22
  &thinker_spawn_0CE850   ;23
  &thinker_spawn_0CE7E5   ;24
  &thinker_spawn_0CE861+8   ;25
  &thinker_spawn_0CE861+8   ;26
  &thinker_spawn_0CE872   ;27
  &thinker_spawn_0CE861+8   ;28
  &thinker_spawn_0CE8C7   ;29
  &thinker_spawn_0CE7FB   ;2A
  &thinker_spawn_0CE87F   ;2B
  &thinker_spawn_0CE87F+4   ;2C
  &thinker_spawn_0CE8A1   ;2D
  &thinker_spawn_0CE8A1+8   ;2E
  &thinker_spawn_0CE890   ;2F
  &thinker_spawn_0CE80C   ;30
  &thinker_spawn_0CE7EA+8   ;31
  &thinker_spawn_0CE8BA   ;32
  &thinker_spawn_0CE7EA+8   ;33
  &thinker_spawn_0CE7EA+8   ;34
  &thinker_spawn_0CE7EA+8   ;35
  &thinker_spawn_0CE7EA+8   ;36
  &thinker_spawn_0CE7EA+8   ;37
  &thinker_spawn_0CE7EA+8   ;38
  &thinker_spawn_0CE7E5   ;39
  &thinker_spawn_0CE7EA+8   ;3A
  &thinker_spawn_0CE7EA+8   ;3B
  &thinker_spawn_0CE7EA+8   ;3C
  &thinker_spawn_0CE7E5   ;3D
  &thinker_spawn_0CE9E1+4   ;3E
  &thinker_spawn_0CE9E1+4   ;3F
  &thinker_spawn_0CE8E1   ;40
  &thinker_spawn_0CE9E1+4   ;41
  &thinker_spawn_0CE9E1   ;42
  &thinker_spawn_0CE9E1+4   ;43
  &thinker_spawn_0CE9E1+4   ;44
  &thinker_spawn_0CE9E1+4   ;45
  &thinker_spawn_0CE9E1+4   ;46
  &thinker_spawn_0CE9E1+4   ;47
  &thinker_spawn_0CE7E5   ;48
  &thinker_spawn_0CE7EA+8   ;49
  &thinker_spawn_0CE7E5   ;4A
  &thinker_spawn_0CE8EF   ;4B
  &thinker_spawn_0CE8F4   ;4C
  &thinker_spawn_0CE8F9   ;4D
  &thinker_spawn_0CE906   ;4E
  &thinker_spawn_0CE913   ;4F
  &thinker_spawn_0CE920   ;50
  &thinker_spawn_0CE92D   ;51
  &thinker_spawn_0CE93A   ;52
  &thinker_spawn_0CE947   ;53
  &thinker_spawn_0CE950   ;54
  &thinker_spawn_0CE959   ;55
  &thinker_spawn_0CE7EA+8   ;56
  &thinker_spawn_0CE7E5   ;57
  &thinker_spawn_0CE7E5   ;58
  &thinker_spawn_0CE962   ;59
  &thinker_spawn_0CE96F+8   ;5A
  &thinker_spawn_0CE96F+8   ;5B
  &thinker_spawn_0CE96F   ;5C
  &thinker_spawn_0CE984   ;5D
  &thinker_spawn_0CE7EA+8   ;5E
  &thinker_spawn_0CE98D   ;5F
  &thinker_spawn_0CE98D   ;60
  &thinker_spawn_0CE98D   ;61
  &thinker_spawn_0CE98D   ;62
  &thinker_spawn_0CE7E5   ;63
  &thinker_spawn_0CE98D   ;64
  &thinker_spawn_0CE98D   ;65
  &thinker_spawn_0CE7E5   ;66
  &thinker_spawn_0CE99A   ;67
  &thinker_spawn_0CEA11+4   ;68
  &thinker_spawn_0CE7E5   ;69
  &thinker_spawn_0CEA11+4   ;6A
  &thinker_spawn_0CEA11   ;6B
  &thinker_spawn_0CEA11+4   ;6C
  &thinker_spawn_0CEA11+4   ;6D
  &thinker_spawn_0CE7E5   ;6E
  &thinker_spawn_0CEA26   ;6F
  &thinker_spawn_0CEA11+4   ;70
  &thinker_spawn_0CE7E5   ;71
  &thinker_spawn_0CE7E5   ;72
  &thinker_spawn_0CEA11+4   ;73
  &thinker_spawn_0CE9A3   ;74
  &thinker_spawn_0CE7E5   ;75
  &thinker_spawn_0CE7E5   ;76
  &thinker_spawn_0CE7E5   ;77
  &thinker_spawn_0CE9AC   ;78
  &thinker_spawn_0CE7EA+8   ;79
  &thinker_spawn_0CE7EA+8   ;7A
  &thinker_spawn_0CE7EA+8   ;7B
  &thinker_spawn_0CE7EA+8   ;7C
  &thinker_spawn_0CE7EA+8   ;7D
  &thinker_spawn_0CE7EA+8   ;7E
  &thinker_spawn_0CE9AC   ;7F
  &thinker_spawn_0CE7E5   ;80
  &thinker_spawn_0CE7E5   ;81
  &thinker_spawn_0CE9B5   ;82
  &thinker_spawn_0CE9B5   ;83
  &thinker_spawn_0CE9BE   ;84
  &thinker_spawn_0CE9CB   ;85
  &thinker_spawn_0CE9B5   ;86
  &thinker_spawn_0CE9B5   ;87
  &thinker_spawn_0CE9B5   ;88
  &thinker_spawn_0CE7E5   ;89
  &thinker_spawn_0CE9D4   ;8A
  &thinker_spawn_0CE9B5   ;8B
  &thinker_spawn_0CEB2A   ;8C
  &thinker_spawn_0CE7E5   ;8D
  &thinker_spawn_0CE7E5   ;8E
  &thinker_spawn_0CE7E5   ;8F
  &thinker_spawn_0CE7E5   ;90
  &thinker_spawn_0CE7E5   ;91
  &thinker_spawn_0CE7EA+8   ;92
  &thinker_spawn_0CE7EA+8   ;93
  &thinker_spawn_0CE7EA+8   ;94
  &thinker_spawn_0CE7EA+8   ;95
  &thinker_spawn_0CE7EA+8   ;96
  &thinker_spawn_0CE7EA+8   ;97
  &thinker_spawn_0CE7EA+8   ;98
  &thinker_spawn_0CE7EA+8   ;99
  &thinker_spawn_0CE7EA+8   ;9A
  &thinker_spawn_0CE7EA+8   ;9B
  &thinker_spawn_0CE7EA+8   ;9C
  &thinker_spawn_0CE7EA+8   ;9D
  &thinker_spawn_0CE7E5   ;9E
  &thinker_spawn_0CE9FB   ;9F
  &thinker_spawn_0CE9FB   ;A0
  &thinker_spawn_0CE9FB   ;A1
  &thinker_spawn_0CE9FB   ;A2
  &thinker_spawn_0CE9FB   ;A3
  &thinker_spawn_0CE9FB   ;A4
  &thinker_spawn_0CE9FB   ;A5
  &thinker_spawn_0CE9FB   ;A6
  &thinker_spawn_0CE9FB   ;A7
  &thinker_spawn_0CE9FB   ;A8
  &thinker_spawn_0CE9FB   ;A9
  &thinker_spawn_0CE7E5   ;AA
  &thinker_spawn_0CE7E5   ;AB
  &thinker_spawn_0CEA08   ;AC
  &thinker_spawn_0CE7EA+8   ;AD
  &thinker_spawn_0CE7EA+8   ;AE
  &thinker_spawn_0CE7E5   ;AF
  &thinker_spawn_0CE7E5   ;B0
  &thinker_spawn_0CE7E5   ;B1
  &thinker_spawn_0CE7E5   ;B2
  &thinker_spawn_0CE7E5   ;B3
  &thinker_spawn_0CE7E5   ;B4
  &thinker_spawn_0CE7E5   ;B5
  &thinker_spawn_0CE7E5   ;B6
  &thinker_spawn_0CE7E5   ;B7
  &thinker_spawn_0CE7E5   ;B8
  &thinker_spawn_0CE7E5   ;B9
  &thinker_spawn_0CE7E5   ;BA
  &thinker_spawn_0CE7E5   ;BB
  &thinker_spawn_0CE7E5   ;BC
  &thinker_spawn_0CE7E5   ;BD
  &thinker_spawn_0CE7E5   ;BE
  &thinker_spawn_0CE7E5   ;BF
  &thinker_spawn_0CE7E5   ;C0
  &thinker_spawn_0CE7E5   ;C1
  &thinker_spawn_0CE7E5   ;C2
  &thinker_spawn_0CEA6C   ;C3
  &thinker_spawn_0CE7EA+8   ;C4
  &thinker_spawn_0CE7EA+8   ;C5
  &thinker_spawn_0CE7EA+8   ;C6
  &thinker_spawn_0CE7EA+8   ;C7
  &thinker_spawn_0CE7EA+8   ;C8
  &thinker_spawn_0CE7EA+8   ;C9
  &thinker_spawn_0CE7E5   ;CA
  &thinker_spawn_0CE7E5   ;CB
  &thinker_spawn_0CEA2F   ;CC
  &thinker_spawn_0CEA3C   ;CD
  &thinker_spawn_0CEA2F   ;CE
  &thinker_spawn_0CEA2F   ;CF
  &thinker_spawn_0CEA2F   ;D0
  &thinker_spawn_0CEA2F   ;D1
  &thinker_spawn_0CEA2F   ;D2
  &thinker_spawn_0CEA2F   ;D3
  &thinker_spawn_0CEA2F   ;D4
  &thinker_spawn_0CEA2F   ;D5
  &thinker_spawn_0CEA2F   ;D6
  &thinker_spawn_0CEA2F   ;D7
  &thinker_spawn_0CEA2F   ;D8
  &thinker_spawn_0CEA2F   ;D9
  &thinker_spawn_0CEA2F   ;DA
  &thinker_spawn_0CEA2F   ;DB
  &thinker_spawn_0CE7E5   ;DC
  &thinker_spawn_0CEA52   ;DD
  &thinker_spawn_0CE7E5   ;DE
  &thinker_spawn_0CEA81   ;DF
  &thinker_spawn_0CEA81   ;E0
  &thinker_spawn_0CEA8E   ;E1
  &thinker_spawn_0CE7E5   ;E2
  &thinker_spawn_0CEA81   ;E3
  &thinker_spawn_0CE7E5   ;E4
  &thinker_spawn_0CEA9B   ;E5
  &thinker_spawn_0CEAAC   ;E6
  &thinker_spawn_0CEAB5   ;E7
  &thinker_spawn_0CEABA   ;E8
  &thinker_spawn_0CEB07   ;E9
  &thinker_spawn_0CEB07   ;EA
  &thinker_spawn_ag_boss   ;EB
  &thinker_spawn_0CEAAC   ;EC
  &thinker_spawn_0CEAAC   ;ED
  &thinker_spawn_0CEAAC   ;EE
  &thinker_spawn_0CE7E5   ;EF
  &thinker_spawn_0CE7E5   ;F0
  &thinker_spawn_0CE7E5   ;F1
  &thinker_spawn_0CEAFA   ;F2
  &thinker_spawn_0CEAD3   ;F3
  &thinker_spawn_0CEAAC   ;F4
  &thinker_spawn_0CEAE0   ;F5
  &thinker_spawn_0CEAED   ;F6
  &thinker_spawn_0CEA5B   ;F7
  &thinker_spawn_0CE7E5   ;F8
  &thinker_spawn_0CE7E5   ;F9
  &thinker_spawn_0CEB18   ;FA
  &thinker_spawn_0CEB1D   ;FB
  &thinker_spawn_0CEB2F   ;FC
  &thinker_spawn_0CEB30   ;FD
  &thinker_spawn_0CEB3D   ;FE
  &thinker_spawn_0CEB46   ;FF
]

; =============================================
; Debug warp redirect: Space flight → Apocalypse Gaia
; Redirects E7→E8 warp to E7→EB when this patch is active
; =============================================

loc_0CED99! {
    CMP #$0030
    BCC loc_0CED82
    COP [QueueMapChange] ( #EB, #$0000, #$0000, #80, #$2100 )
    COP [SetEntryHere]
    RTL 
}

; =============================================
; Boss actor wrapper — hidden on spawn
;
; InitActorFromSceneData sets $10 from the actor-def header
; bytes 1-2 ORed with $4000, and calls UpdateActorAnimation,
; BEFORE any actor code runs. The original actor_09AA6E has
; header bytes $10,$01 → $10 = $4110 (no $2000 = visible).
;
; This wrapper sets header bytes $10,$21 → $10 = $6110,
; which includes $2000 (hidden from SortActorsByDepth).
; The code block JMLs to our patched code_09AA71 which
; clears $2000 after the brain has set up the camera.
; =============================================

ag_boss_def [
  actor-def < #00, #10, #21, {
    JML $@code_09AA71
  } >
]

; =============================================
; Boss controller override
;
; InitActorFromSceneData sets spritesetPtr=$4000/bank=$7E for
; all scene-spawned actors. The spritemap scene command copies
; @apocalypse_gaia to $7E:$4000 with & pointers rebased to $4000.
; All children inherit $4000/$7E via CopyActorState — no
; SetMetasprite needed.
; =============================================

code_09AA71! {
    LDA #$8011
    TSB $12
    LDA #$2000
    TSB $10
    LDA #$0028
    STA $currentHp, X
    LDA $14
    SEC 
    SBC #$0008
    STA $14
    LDA #$0000
    STA $cameraTargetX
    STA $cameraTargetY
    STA $cameraDeltaX
    STA $cameraDeltaY
    COP [SpawnAfterFlags] ( @code_09B719, #$2300 )
    COP [SpawnAfterFlags] ( @code_09B6FC, #$2300 )
    COP [SpawnAfterFlags] ( @code_09B747, #$2300 )
    COP [SpawnBeforeMarked] ( @code_09B5C7, #$2000 )
    COP [SpawnAfterOffsetMarked] ( @code_09B30E, #C8, #33, #$0111 )
    COP [SpawnAfterOffsetMarked] ( @code_09B36A, #38, #33, #$0111 )
    COP [SpawnAfterOffsetMarked] ( @code_09B586, #BF, #0B, #$0301 )
    COP [SpawnAfterOffsetMarked] ( @code_09B57F, #41, #0B, #$0301 )
    STZ $24
    COP [WaitByte] ( #04 )
    LDA #$2000
    TRB $10
    COP [StageSpriteFrame] ( #00 )
    COP [AnimOnce]
    COP [SetEntryHere]
    LDA $24
    BNE loc_09AAE3
    RTL 
}

; =============================================
; Phase 3 core HP fix
;
; enemy_stats_table entry #$57 has HP=1, DEF=$7F. While $7F
; defense means immune to normal damage, HP=1 is fragile if
; any attack bypasses defense. Override to HP=60 ($3C),
; matching standard boss-tier HP for $7F-defense enemies.
; =============================================

code_09AC55! {
    COP [SetDeathCallback] ( @code_09B1D5 )
    LDA #$&enemy_stats_table+15C
    STA $statsPtr, X
    LDA #$003C
    STA $currentHp, X
    COP [SetSpritePriority] ( #30 )
    COP [SpawnAfterOffsetMarked] ( @code_09ADB3, #EA, #E0, #$2200 )
    COP [SpawnAfterOffsetMarked] ( @code_09ADEB, #16, #E0, #$2200 )
    COP [StageSpriteFrame] ( #1E )
    COP [AnimOnce]
    LDA #$0080
    STA $moveXAlt, X
    STA $moveYAlt, X
    COP [StageMove] ( #1E, #FF, #FF )
    COP [TickMove]
    COP [StageSpriteLoop] ( #1E, #04 )
    COP [AnimLoop]
    LDA #$0010
    TRB $10
    JMP $&code_09ACA2
}

; =============================================
; Explosion sprite overrides
;
; The original boss code calls SetMetasprite(@spriteset_enemies)
; for death/explosion effects, switching to the ROM enemies
; spriteset. In our scene, actors inherit $7E:$4000 (the packed
; apocalypse_gaia spritemap) via CopyActorState — so we remove
; the SetMetasprite calls and remap animation indices to boss
; explosion frames (#10 = sparkle A, #1D = sparkle B, #31 = death).
; =============================================

; Phase 2 death explosion spawner — removed SetMetasprite
code_09B1FA! {
    COP [LoopStart] ( #0A )
    COP [SpawnListAppend] ( @code_09B21E, #00, #C8, #$0302 )
    COP [WaitByte] ( #01 )
    COP [SpawnListAppend] ( @code_09B22B, #00, #C8, #$0302 )
    COP [WaitByte] ( #02 )
    COP [LoopEnd]
    COP [Die]
}

; Explosion sparkle A — #10 instead of spriteset_enemies #07
code_09B21E! {
    JSR $&code_09B238
    COP [PlaySoundCh1] ( #06 )
    COP [StageSpriteFrame] ( #10 )
    COP [AnimOnce]
    COP [Die]
}

; Explosion sparkle B — #1D instead of spriteset_enemies #01
code_09B22B! {
    JSR $&code_09B238
    COP [PlaySoundCh1] ( #06 )
    COP [StageSpriteFrame] ( #1D )
    COP [AnimOnce]
    COP [Die]
}

; Random explosion variant A — removed SetMetasprite
code_09B4C9! {
    COP [PlaySoundCh1] ( #06 )
    COP [StageSpriteFrame] ( #10 )
    COP [AnimOnce]
    COP [Die]
}

; Random explosion variant B — removed SetMetasprite
code_09B4D8! {
    COP [PlaySoundCh1] ( #06 )
    COP [StageSpriteFrame] ( #1D )
    COP [AnimOnce]
    COP [Die]
}

; Floating bomb death — bubble pop (#43) → death explosion (#31)
; Original used spriteset_enemies #02; now uses boss explosion sprites.
code_09B84F! {
    COP [StageSpriteFrame] ( #43 )
    COP [AnimOnce]
    LDA $16
    SEC 
    SBC #$0008
    STA $16
    LDA #$0003
    STA $24

  loc_09B861!:
    COP [SpawnAfterFlags] ( @code_09B880, #$0202 )
    DEC $24
    BPL loc_09B861
    STZ $24
    LDA $16
    CLC 
    ADC #$0004
    STA $16
    COP [PlaySoundCh1] ( #1D )
    COP [StageSpriteFrame] ( #31 )
    COP [AnimOnce]

  loc_09B87E!:
    COP [Die]
}

; Floating bomb death child — #10 instead of #07
code_09B8AF! {
    COP [StageSpriteFrame] ( #10 )
    COP [AnimOnce]
    COP [Die]
}

; =============================================
; Random explosion generator — finite loop fix
;
; Original code_09B479 loops until $10 bit $4000 is set, but
; nothing ever sets that bit (actor has no collision, no parent
; death propagation). Each arm bit death spawns a perpetual
; instance → actors accumulate → lag.
;
; Fix: Replace infinite $4000 check with LoopStart/LoopEnd
; for 8 iterations (~3 seconds of explosions), then Die.
; =============================================

code_09B479! {
    COP [SetSpritePriority] ( #30 )
    LDA #$0002
    TSB $12
    COP [LoopStart] ( #08 )
    COP [RngByte]
    LDA $0036
    LSR 
    BCS ag_rand_explode_b
    COP [SpawnAfterFlags] ( @code_09B4C9, #$0302 )
    BRA ag_rand_explode_pos

  ag_rand_explode_b:
    COP [SpawnAfterFlags] ( @code_09B4D8, #$0302 )

  ag_rand_explode_pos:
    LDA $0410
    AND #$001F
    SEC 
    SBC #$000F
    CLC 
    ADC $14
    STA $0014, Y
    LDA $0411
    AND #$001F
    SEC 
    SBC #$000F
    CLC 
    ADC $16
    STA $0016, Y
    COP [StageSpriteLoopMoveY] ( #05, #07, #01 )
    COP [AnimLoop]
    COP [LoopEnd]
    COP [Die]
}

; =============================================
; Tile loader actor — DMAs Phase 1 sprite tiles to OBJ VRAM
;
; Spawns during scene init, before the boss. DMAs $1800 bytes
; of raw tile data to VRAM word $4400 (tile $40+), which is
; where the spritemap expects Phase 1/2 tiles.
; Runs AFTER LoadPlayerGraphics overwrites $4200+, so our
; tiles take priority over the player character's sprites.
; =============================================

ag_tile_loader [
  actor-def < #00, #00, #20, {
    COP [AdhocVramDma] ( @gfx_ag_sprites, #$4400, #$0800 )
    COP [AdhocVramDma] ( @gfx_ag_sprites+800, #$4800, #$0800 )
    COP [AdhocVramDma] ( @gfx_ag_sprites+1000, #$4C00, #$0800 )
    COP [Die]
  } >
]

; =============================================
; P2→P3 transition override
;
; Restores original COP [SetFlagByte] (#F5) from unused code.
; DMAs Phase 3 tiles to OBJ VRAM $4400-$4BFF (tiles $40-$BF),
; same range as Phase 1. Avoids corrupting player tiles at $20-$3F.
; =============================================

code_09ABF5! {
    COP [SpawnListAppend] ( @code_09B9C5, #00, #00, #$2000 )
    COP [StageSpriteFrame] ( #04 )
    COP [AnimOnce]
    LDY $04
    LDA #$&code_09B6A6
    STA $0000, Y
    LDA #$0001
    STA $26
    COP [SetEntryHere]
    LDA $26
    BEQ ag_p3_dma
    RTL 

  ag_p3_dma:
    LDA #$FFF0
    TSB $joypadMaskStd
    COP [SetFlagByte] ( #F5 )
    COP [AdhocVramDma] ( @gfx_ag_phase3, #$4400, #$0800 )
    COP [AdhocVramDma] ( @gfx_ag_phase3+800, #$4800, #$0800 )
    COP [AdhocVramDma] ( @gfx_ag_phase3+1000, #$4C00, #$0800 )
    LDA #$FFF0
    TRB $joypadMaskStd
    COP [SpawnListAppend] ( @code_09AC55, #00, #00, #$0012 )
    COP [Die]
}

