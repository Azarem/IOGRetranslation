; =============================================================================
; Walkable World Map — Patch
; =============================================================================
; Replaces WorldMapController and ArrivalAndTravelSetup to implement
; walkable free-roaming on the Mode 7 world map.
;
; Flow:
;   1. WorldMapController spawns ArrivalAndTravelSetup child ($3800 flags)
;   2. Clears $0D58 so the child skips Phase 2 (no HdmaWindowEffect / menu)
;   3. Child runs Phase 1 (zoom out, 44 iter) + Phase 3 (zoom down, 93 iter)
;   4. Child enters idle position-tracking loop (keeps sprite visible)
;   5. Parent waits ~184 frames for zoom to finish, then enters walkable mode
;
; The child actor is display-active ($1000) and inherits spritesetPtr via
; CopyActorState — it IS the visible sprite on the map.

?INCLUDE 'walkable_world_map_core'
?INCLUDE 'WorldMapController'
?INCLUDE 'actor_pool'
?INCLUDE 'flag_helpers'
!joypadMaskStd                  065A
!characterForm                  0AD4
!pendingEntryOffset             0D7E
!prevNearbyIdx                  0D80
!nearbyLocIdx                   0D78
!nearbySceneId                  0D76

---------------------------------------------

WorldMapController! [
  actor-def < #00, #00, #20, {

    ; --- Standard init (same as original) ---
    LDA #$0000
    STA $characterForm
    COP [SpawnThinkerParam] ( #0B, @actor_pool.PaletteResetAndKillThinker )
    JSL $@flag_helpers.ClearAllWramFlags
    COP [SpawnThinkerParam] ( #0B, @actor_pool.PaletteResetAndKillThinker )

    ; Spawn arrival child — display-active sprite with zoom animations
    COP [SpawnAfterFlags] ( @ArrivalAndTravelSetup, #$3800 )

    LDA #$FFF0
    TSB $joypadMaskStd

    ; --- Branch: walkable mode vs idle ---
    LDA $0D58
    BNE +HasTarget
    JMP $&wmcDie
+HasTarget:

    ; Clear $0D58 so the child skips Phase 2 entirely
    ; (no HdmaWindowEffect, no destination menu)
    ; The child checks $0D58 after Phase 1 (~88 frames from now)
    STZ $0D58

    ; Wait for zoom sequences to complete
    ; Phase 1 ≈ 88 frames + Phase 3 ≈ 93 frames = ~181 frames
    ; WaitByte $B8 (184) provides a small margin
    COP [WaitByte] ( #B8 )

    ; Initialize walkable map engine (collision data to WRAM)
    JSL $@WalkableMapInit

    ; Unmask D-pad + B button for player movement and location entry
    LDA #$8F00
    TRB $joypadMaskStd

    ; --- Main loop: run movement engine every frame ---
  wmcLoop:
    COP [SetEntryHere]
    JSL $@WalkableMapUpdate

    ; --- Name display: spawn text actor when nearby location changes ---
    LDA $nearbyLocIdx
    CMP $prevNearbyIdx
    BEQ wmcCheckEntry
    STA $prevNearbyIdx
    CMP #$FFFF
    BEQ wmcLeftZone

    ; New location nearby — display name via the retranslation's rendering pipeline.
    ; Scene ID was pre-computed by WalkableMapUpdate.
    ; Save entry point ($00/$01) — SetEntryHere stored the re-entry address there,
    ; and STA $0000 would corrupt it. The original game never yields after STA $0000
    ; (it runs a one-shot sequence), but we RTL back to the engine's actor loop.
    LDA $00
    PHA
    LDA $nearbySceneId
    STA $0000
    JSR $&LookupMapName
    PLA
    STA $00
?IF 'ichagas'
    ; Stamp rendering: LookupMapName rendered text tiles to $7EA000+.
    ; Upload to VRAM and spawn self-terminating name actor.
    COP [AdhocVramDma] ( $7EA000, #$5000, #$0800 )
    COP [SpawnAfterFlags] ( @WalkableNameActor, #$1001 )
    ; Store location index in spawned actor's $26 field for self-dismissal check
    LDA $nearbyLocIdx
    LDY $06
    STA $0026, Y
?ELSE
    ; Sprite rendering: LookupMapName returned name pointer in Y.
    ; Clear any old OAM text entries before rendering new name
    PHY
    PHX
    LDA #$0000
    LDX #$007E
-ClearOam:
    STA $7F0600, X
    DEX
    DEX
    BPL -ClearOam
    PLX
    COP [SpawnAfterFlags] ( @pr_text_placement_calc, #$2000 )
    PLA
    LDY $06
    STA $0026, Y
?ENDIF
    BRA wmcCheckEntry

  wmcLeftZone:
    ; Player left all zones — clear name display
?IF 'ichagas'
    ; WalkableNameActor self-terminates via nearbyLocIdx mismatch — nothing needed
?ELSE
    ; Clear OAM text buffer entries left by pr_text_placement_calc
    LDA #$0000
    LDX #$007E
-ClearOamLeft:
    STA $7F0600, X
    DEX
    DEX
    BPL -ClearOamLeft
?ENDIF

  wmcCheckEntry:
    ; Check if entry was triggered by the movement engine
    LDA $pendingEntryOffset
    CMP #$FFFF
    BEQ wmcNoEntry

    ; Entry triggered — clear state first, then store index and dispatch.
    ; PHA/PLA keeps the index safe across ClearWorldMapState and minimizes
    ; the window between STA $0000 and COP [SwitchCase].
    PHA
    LDA #$FFFF
    STA $pendingEntryOffset
    JSR $&ClearWorldMapState
    PLA
    STA $0000
    COP [SwitchCase] ( #$0000, &wmcEntryTable )

  wmcNoEntry:
    RTL

  wmcDie:
    COP [Die]
} >
]

---------------------------------------------
; Patched ArrivalAndTravelSetup — zoom sequences only, no menu/route.
;
; Phase 1: Gravity drop (zoom out) — exact copy of original.
;   InitGravity($20, $05, $00), 44-frame loop accumulating into $B8.
;
; Phase 3: Perspective build (zoom down) — exact copy of original.
;   InitGravity($00, $07, $00), 93-frame loop accumulating into $B6,
;   incrementing $B8.
;
; After zoom: idle position-tracking loop. No companion formation,
; no RouteAnimationEngine, no HdmaWindowEffect.

ArrivalAndTravelSetup! {

    ; --- Position sprite at starting coords ---
    LDA $0D54
    STA $14
    SEC
    SBC #$0080
    STA $cameraTargetX
    LDA $0D56
    STA $16
    SEC
    SBC #$0070
    STA $cameraTargetY

    ; === PHASE 1: Zoom out (gravity drop, 44 iterations) ===
    COP [InitGravity] ( #20, #05, #00 )
    COP [LoopStart] ( #2C )
    COP [TickGravity]
    LDA $moveScratch2, X
    CLC
    ADC $00B8
    STA $00B8
    COP [SetEntryHereAndYield]
    COP [LoopEnd]

    ; === PHASE 3: Zoom down (perspective build, 93 iterations) ===
    COP [InitGravity] ( #00, #07, #00 )
    COP [LoopStart] ( #5D )
    COP [TickGravity]
    LDA $00B6
    CLC
    ADC $moveScratch2, X
    STA $00B6
    INC $00B8
    COP [LoopEnd]

    ; Clear gravity state after zoom
    LDA #$0000
    STA $moveScratch2, X
    LDA #$2000
    TRB $10

    ; === IDLE: Track camera position + animate each frame ===
    ; Keeps sprite visible and animated at the player's current location.
    ; AnimOneFrame sets $08 (sleep timer) to the frame's display duration.
    ; We save it to $24 for manual countdown and clear $08 so RunActors
    ; doesn't skip us — position must update every frame to stay in sync
    ; with bg1ScrollH from the parent.
  wmTrackPos:
    COP [AnimOneFrame]
    LDA $08
    STZ $08
    STA $24

  wmTrackTick:
    COP [SetEntryHere]
    LDA $00CA
    STA $14
    LDA $00CC
    STA $16
    DEC $24
    BMI wmTrackPos
    RTL
}
