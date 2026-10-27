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

scene_meta_00EA+ {
  scene_meta_00EB [
    display-mode < #0C >
    music < #01, #00, @music_0B52E8_iog >
    bitmap < #00, #10, #00, @graphics_0609F6, #00 >
    palette < #00, #70, #10, @palette_0F60EB >
    tileset < #00, #20, #00, #01, @tileset_0ED5DB >
    tilemap < #01, @tilemap_0F68AC >
    bitmap < #00, #10, #10, @graphics_0A5987, #00 >
    tileset < #00, #20, #00, #02, @tileset_0EB120 >
    tilemap < #02, @tilemap_0F7891 >
    bitmap < #00, #10, #10, @gfx_apocalypse_sprites, #01 >
    palette < #00, #60, #A0, @pal_apocalypse_sprites+20 >
    spritemap < #$0900, #00, @apocalypse_gaia >
  ]
}

; =============================================
; Thinker spawn list for scene $EB
;
; Mode 7 pattern matching guardian fights (F2-F6).
; The original scene_thinkers table assigned $EB to
; thinker_spawn_0CEAAC (sine_hdma + global_ambient).
; We add ambient_palette_cycler for visual polish.
; =============================================

thinker_spawn_0CEB07+ { 
  thinker_spawn_ag_boss [
    thinker-spawn < #00, @sine_hdma_ending_wave >
    ;thinker-spawn < #71, @ambient_palette_cycler >
    thinker-spawn < #00, @global_ambient_dispatcher >
  ]
}

; =============================================
; OVERRIDES — Scene pointer tables
; =============================================

; --- Override scene-meta_list to add $EB entry ---
scene_meta_list#1D6: &scene_meta_00EB


; --- Override actor spawn list for scene $EB ---
; Boss at tile (8,$17) = pixel (128, 368). Spawns off-screen
; to avoid a 1-frame flash at center. Brain brings boss into
; view via cameraDelta scrolling the M7 BG for zoom effect.
scene_event_0CE3CD! [
  actor-spawn < #07, #0D, #00, @player_character.PlayerCharacterDef >
  actor-spawn < #00, #00, #00, @ag_tile_loader >
  enemy-spawn < #08, #14, #00, @ag_boss_def, #54, #00, #00 >
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
scene_thinkers#1D6: &thinker_spawn_ag_boss

; =============================================
; Debug warp redirect: Space flight → Apocalypse Gaia
; Redirects E7→E8 warp to E7→EB when this patch is active
; =============================================

;loc_0CED99! {
;    CMP #$0030
;    BCC loc_0CED82
;    COP [QueueMapChange] ( #EB, #$0000, #$0000, #80, #$2100 )
;    COP [SetEntryHere]
;    RTL 
;}

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
    ;COP [SpawnAfterFlags] ( @code_09B719, #$2300 )
    ;COP [SpawnAfterFlags] ( @code_09B6FC, #$2300 )
    ;COP [SpawnAfterFlags] ( @code_09B747, #$2300 )
    COP [SpawnBeforeMarked] ( @code_09B5C7, #$2000 )
    COP [SpawnAfterOffsetMarked] ( @code_09B30E, #C8, #7F, #$0111 )
    COP [SpawnAfterOffsetMarked] ( @code_09B36A, #38, #7F, #$0111 )
    COP [SpawnAfterOffsetMarked] ( @code_09B586, #B6, #0B, #$0301 )
    COP [SpawnAfterOffsetMarked] ( @code_09B57F, #3A, #0B, #$0301 )
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
    ;COP [StageSpriteFrame] ( #43 )
    ;COP [AnimOnce]
    ;LDA $16
    ;SEC 
    ;SBC #$0008
    ;STA $16
    ;LDA #$0003
    ;STA $24

  loc_09B861!:
    ;COP [SpawnAfterFlags] ( @code_09B880, #$0202 )
    ;DEC $24
    ;BPL loc_09B861
    ;STZ $24
    ;LDA $16
    ;CLC 
    ;ADC #$0004
    ;STA $16
    COP [PlaySoundCh1] ( #1D )
    COP [StageSpriteFrame] ( #31 )
    COP [AnimOnce]

  loc_09B87E!:
    COP [Die]
}

; Floating bomb death child — #10 instead of #07
code_09B8AF! {
    ;COP [StageSpriteFrame] ( #10 )
    ;COP [AnimOnce]
    ;COP [Die]
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

