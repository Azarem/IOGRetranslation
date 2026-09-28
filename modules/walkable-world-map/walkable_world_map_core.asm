; =============================================================================
; Walkable World Map — Core Module
; =============================================================================
; Replaces route-choice menus with free-roaming Mode 7 movement.
; Left/Right rotates camera ($00BC), Up/Down moves forward/backward
; using a 512-entry sin table with sub-pixel accumulation for exact
; alignment with the camera heading. The existing mode7_perspective
; thinker renders the rotated view automatically.
;
; Binary assets auto-discovered by the build system:
;   walkable_map_collision_lut.raw.bin  — 32 bytes (256-bit metatile LUT)
;   walkable_map_metatile_map.raw.bin   — 4096 bytes (64x64 metatile grid)

?BANK 03

?INCLUDE 'WorldMapController'
?INCLUDE 'spriteset_enemies'

; --- Tags (hex values, 4-digit for 16-bit operand contexts) ---------
!joypadCurrent                  0656
!joypadHeld                     0658
!joypadRaw                      0660
!nearbyLocIdx                   0D78
!pendingEntryOffset             0D7E
!prevNearbyIdx                  0D80
!nearbySceneId                  0D76
!scrollOverrideH                06C6
!scrollOverrideV                06CA
!cameraTargetX                  06BE
!cameraTargetY                  06C2
!bg1ScrollH                     068A
!bg2ScrollH                     068E

!LOCATION_COUNT                 0013
!LOCATION_ENTRY_SIZE            000E
!PROXIMITY_RADIUS               0020
!ROTATION_SPEED                 0004
!MAP_PIXEL_MIN                  0020
!MAP_PIXEL_MAX                  03E0
!fracX                          0D7A
!fracY                          0D7C
!METATILE_MAP_SIZE              0FFF
!BUTTON_CONFIRM                 8000

; =============================================================================
; Sin Lookup Table — 512 entries, signed 16-bit (8.8 fixed-point)
; =============================================================================
; SinTable[i] = round(sin(i × 2π/512) × speed × 256), speed = 2.0
; Maximum magnitude = $0200 (2.0 in 8.8).
; Used by CalcForwardVelocity for exact camera-aligned movement:
;   dx = -SinTable[$BC]
;   dy = -SinTable[($BC + 128) AND $01FF]   (cos = sin shifted 90°)

WalkableSinTable [
  #$0000  #$0006  #$000D  #$0013  #$0019  #$001F  #$0026  #$002C  ; i=0 (0°)
  #$0032  #$0038  #$003F  #$0045  #$004B  #$0051  #$0058  #$005E  ; i=8
  #$0064  #$006A  #$0070  #$0076  #$007C  #$0082  #$0089  #$008F  ; i=16
  #$0095  #$009B  #$00A1  #$00A7  #$00AC  #$00B2  #$00B8  #$00BE  ; i=24
  #$00C4  #$00CA  #$00CF  #$00D5  #$00DB  #$00E1  #$00E6  #$00EC  ; i=32 (22.5°)
  #$00F1  #$00F7  #$00FC  #$0102  #$0107  #$010D  #$0112  #$0117  ; i=40
  #$011C  #$0122  #$0127  #$012C  #$0131  #$0136  #$013B  #$0140  ; i=48
  #$0145  #$014A  #$014E  #$0153  #$0158  #$015C  #$0161  #$0166  ; i=56
  #$016A  #$016E  #$0173  #$0177  #$017B  #$0180  #$0184  #$0188  ; i=64 (45°)
  #$018C  #$0190  #$0194  #$0197  #$019B  #$019F  #$01A3  #$01A6  ; i=72
  #$01AA  #$01AD  #$01B1  #$01B4  #$01B7  #$01BA  #$01BD  #$01C1  ; i=80
  #$01C4  #$01C6  #$01C9  #$01CC  #$01CF  #$01D1  #$01D4  #$01D7  ; i=88
  #$01D9  #$01DB  #$01DE  #$01E0  #$01E2  #$01E4  #$01E6  #$01E8  ; i=96 (67.5°)
  #$01EA  #$01EC  #$01ED  #$01EF  #$01F1  #$01F2  #$01F4  #$01F5  ; i=104
  #$01F6  #$01F7  #$01F8  #$01F9  #$01FA  #$01FB  #$01FC  #$01FD  ; i=112
  #$01FE  #$01FE  #$01FF  #$01FF  #$01FF  #$0200  #$0200  #$0200  ; i=120
  #$0200  #$0200  #$0200  #$0200  #$01FF  #$01FF  #$01FF  #$01FE  ; i=128 (90°)
  #$01FE  #$01FD  #$01FC  #$01FB  #$01FA  #$01F9  #$01F8  #$01F7  ; i=136
  #$01F6  #$01F5  #$01F4  #$01F2  #$01F1  #$01EF  #$01ED  #$01EC  ; i=144
  #$01EA  #$01E8  #$01E6  #$01E4  #$01E2  #$01E0  #$01DE  #$01DB  ; i=152
  #$01D9  #$01D7  #$01D4  #$01D1  #$01CF  #$01CC  #$01C9  #$01C6  ; i=160 (112.5°)
  #$01C4  #$01C1  #$01BD  #$01BA  #$01B7  #$01B4  #$01B1  #$01AD  ; i=168
  #$01AA  #$01A6  #$01A3  #$019F  #$019B  #$0197  #$0194  #$0190  ; i=176
  #$018C  #$0188  #$0184  #$0180  #$017B  #$0177  #$0173  #$016E  ; i=184
  #$016A  #$0166  #$0161  #$015C  #$0158  #$0153  #$014E  #$014A  ; i=192 (135°)
  #$0145  #$0140  #$013B  #$0136  #$0131  #$012C  #$0127  #$0122  ; i=200
  #$011C  #$0117  #$0112  #$010D  #$0107  #$0102  #$00FC  #$00F7  ; i=208
  #$00F1  #$00EC  #$00E6  #$00E1  #$00DB  #$00D5  #$00CF  #$00CA  ; i=216
  #$00C4  #$00BE  #$00B8  #$00B2  #$00AC  #$00A7  #$00A1  #$009B  ; i=224 (157.5°)
  #$0095  #$008F  #$0089  #$0082  #$007C  #$0076  #$0070  #$006A  ; i=232
  #$0064  #$005E  #$0058  #$0051  #$004B  #$0045  #$003F  #$0038  ; i=240
  #$0032  #$002C  #$0026  #$001F  #$0019  #$0013  #$000D  #$0006  ; i=248
  #$0000  #$FFFA  #$FFF3  #$FFED  #$FFE7  #$FFE1  #$FFDA  #$FFD4  ; i=256 (180°)
  #$FFCE  #$FFC8  #$FFC1  #$FFBB  #$FFB5  #$FFAF  #$FFA8  #$FFA2  ; i=264
  #$FF9C  #$FF96  #$FF90  #$FF8A  #$FF84  #$FF7E  #$FF77  #$FF71  ; i=272
  #$FF6B  #$FF65  #$FF5F  #$FF59  #$FF54  #$FF4E  #$FF48  #$FF42  ; i=280
  #$FF3C  #$FF36  #$FF31  #$FF2B  #$FF25  #$FF1F  #$FF1A  #$FF14  ; i=288 (202.5°)
  #$FF0F  #$FF09  #$FF04  #$FEFE  #$FEF9  #$FEF3  #$FEEE  #$FEE9  ; i=296
  #$FEE4  #$FEDE  #$FED9  #$FED4  #$FECF  #$FECA  #$FEC5  #$FEC0  ; i=304
  #$FEBB  #$FEB6  #$FEB2  #$FEAD  #$FEA8  #$FEA4  #$FE9F  #$FE9A  ; i=312
  #$FE96  #$FE92  #$FE8D  #$FE89  #$FE85  #$FE80  #$FE7C  #$FE78  ; i=320 (225°)
  #$FE74  #$FE70  #$FE6C  #$FE69  #$FE65  #$FE61  #$FE5D  #$FE5A  ; i=328
  #$FE56  #$FE53  #$FE4F  #$FE4C  #$FE49  #$FE46  #$FE43  #$FE3F  ; i=336
  #$FE3C  #$FE3A  #$FE37  #$FE34  #$FE31  #$FE2F  #$FE2C  #$FE29  ; i=344
  #$FE27  #$FE25  #$FE22  #$FE20  #$FE1E  #$FE1C  #$FE1A  #$FE18  ; i=352 (247.5°)
  #$FE16  #$FE14  #$FE13  #$FE11  #$FE0F  #$FE0E  #$FE0C  #$FE0B  ; i=360
  #$FE0A  #$FE09  #$FE08  #$FE07  #$FE06  #$FE05  #$FE04  #$FE03  ; i=368
  #$FE02  #$FE02  #$FE01  #$FE01  #$FE01  #$FE00  #$FE00  #$FE00  ; i=376
  #$FE00  #$FE00  #$FE00  #$FE00  #$FE01  #$FE01  #$FE01  #$FE02  ; i=384 (270°)
  #$FE02  #$FE03  #$FE04  #$FE05  #$FE06  #$FE07  #$FE08  #$FE09  ; i=392
  #$FE0A  #$FE0B  #$FE0C  #$FE0E  #$FE0F  #$FE11  #$FE13  #$FE14  ; i=400
  #$FE16  #$FE18  #$FE1A  #$FE1C  #$FE1E  #$FE20  #$FE22  #$FE25  ; i=408
  #$FE27  #$FE29  #$FE2C  #$FE2F  #$FE31  #$FE34  #$FE37  #$FE3A  ; i=416 (292.5°)
  #$FE3C  #$FE3F  #$FE43  #$FE46  #$FE49  #$FE4C  #$FE4F  #$FE53  ; i=424
  #$FE56  #$FE5A  #$FE5D  #$FE61  #$FE65  #$FE69  #$FE6C  #$FE70  ; i=432
  #$FE74  #$FE78  #$FE7C  #$FE80  #$FE85  #$FE89  #$FE8D  #$FE92  ; i=440
  #$FE96  #$FE9A  #$FE9F  #$FEA4  #$FEA8  #$FEAD  #$FEB2  #$FEB6  ; i=448 (315°)
  #$FEBB  #$FEC0  #$FEC5  #$FECA  #$FECF  #$FED4  #$FED9  #$FEDE  ; i=456
  #$FEE4  #$FEE9  #$FEEE  #$FEF3  #$FEF9  #$FEFE  #$FF04  #$FF09  ; i=464
  #$FF0F  #$FF14  #$FF1A  #$FF1F  #$FF25  #$FF2B  #$FF31  #$FF36  ; i=472
  #$FF3C  #$FF42  #$FF48  #$FF4E  #$FF54  #$FF59  #$FF5F  #$FF65  ; i=480 (337.5°)
  #$FF6B  #$FF71  #$FF77  #$FF7E  #$FF84  #$FF8A  #$FF90  #$FF96  ; i=488
  #$FF9C  #$FFA2  #$FFA8  #$FFAF  #$FFB5  #$FFBB  #$FFC1  #$FFC8  ; i=496
  #$FFCE  #$FFD4  #$FFDA  #$FFE1  #$FFE7  #$FFED  #$FFF3  #$FFFA  ; i=504
]

; =============================================================================
; Location Entry Table — 15 entries, 14 bytes each (7 words)
; =============================================================================
; Offset  Field        Size   Description
;   +$00  mapX         word   Mode 7 pixel X (proximity detection)
;   +$02  mapY         word   Mode 7 pixel Y (proximity detection)
;   +$04  sceneID      word   Target scene (byte in low; for QueueMapChange/LookupMapName)
;   +$06  spawnX       word   Spawn X in target scene
;   +$08  spawnY       word   Spawn Y in target scene
;   +$0A  camera       word   Camera/scroll mode byte
;   +$0C  flags        word   Scene transition flags
;
; Data from overworld_exit.asm (map coords) + world_map_options.asm (scene params).

WalkableMapLocationTable [
  ; 00 South Cape
  #$00D4  #$03A4  #$0001  #$0178  #$0040  #$0003  #$4300
  ; 01 Edward Castle
  #$0104  #$0334  #$000A  #$01F8  #$02C0  #$0000  #$3420
  ; 02 Itory Village
  #$00C4  #$02B4  #$0015  #$02D8  #$02B0  #$0000  #$3500
  ; 03 Inca Ruins
  #$0134  #$0284  #$001C  #$0068  #$01A0  #$0080  #$2200
  ; 04 Freejia
  #$0254  #$02D4  #$0032  #$0130  #$0350  #$0000  #$4500
  ; 05 Diamond Mine
  #$0334  #$0334  #$003E  #$00A8  #$03D0  #$0080  #$4200
  ; 06 Angel Village
  #$0384  #$0164  #$0069  #$02A0  #$00C0  #$0000  #$1300
  ; 07 Watermia
  #$02D4  #$01A4  #$0078  #$0278  #$0390  #$0000  #$4500
  ; 08 Great Wall
  #$02A4  #$0124  #$0082  #$0020  #$0090  #$0087  #$1800
  ; 09 Euro
  #$01D4  #$0134  #$0091  #$03D0  #$0430  #$0006  #$5400
  ; 10 Mountain Temple
  #$0214  #$00B4  #$00A0  #$02C8  #$01B0  #$0086  #$2300
  ; 11 Native Village
  #$0124  #$01A4  #$00AC  #$01C0  #$01D0  #$0006  #$2200
  ; 12 Angkor Wat
  #$0134  #$0154  #$00B0  #$01F8  #$04C0  #$0080  #$5400
  ; 13 Dao Village
  #$0094  #$0114  #$00C3  #$0010  #$00E0  #$0007  #$2300
  ; 14 Pyramid
  #$0074  #$00B4  #$00CC  #$0010  #$00D0  #$0087  #$4400
  ; 15 Moon Tribe Camp
  #$00E4  #$0294  #$001A  #$0150  #$01A0  #$0000  #$2200
  ; 16 Diamond Coast
  #$0184  #$0304  #$0031  #$00A0  #$0060  #$0003  #$1100
  ; 17 Neil's Cottage
  #$0274  #$0264  #$0049  #$0050  #$00D0  #$0000  #$1100
  ; 18 Nazca Plain
  #$02A4  #$0294  #$004B  #$0120  #$0080  #$0000  #$4400
]

; =============================================================================
; WalkableMapInit — one-shot initialization on walkable mode entry
; =============================================================================
; Copies the metatile map ROM data to WRAM $7F8000 for collision lookups.
; $7F1000 is the actor onHitCallback table — must NOT be overwritten.
; Mode7PerspectiveInit has already loaded $00CA/$00CC from $0D54/$0D56.
; $B8 and $B6 are set by the zoom sequences (Phase 1 + Phase 3) — not here.

WalkableMapInit {
    PHX
    PHY
    PHB
    REP #$30

    LDX #$&walkable_map_metatile_map
    LDY #$8000
    LDA #$METATILE_MAP_SIZE
    MVN #$7F, #$^walkable_map_metatile_map

    PLB

    LDA #$FFFF
    STA $nearbyLocIdx
    STA $pendingEntryOffset
    STA $prevNearbyIdx
    STZ $nearbySceneId
    STZ $fracX
    STZ $fracY

    PLY
    PLX
    RTL
}

; =============================================================================
; WalkableNameActor — self-terminating stamp name display
; =============================================================================
; Spawned when the player enters a location zone. Loops each frame, drawing
; the pre-rendered name tiles as a metasprite. Dies automatically when the
; player's nearbyLocIdx no longer matches the stored index in $26, which
; handles both leaving all zones ($FFFF) and moving to a different zone.

WalkableNameActor {
    LDA #$2000
    TRB $10
    COP [SetMetasprite] ( @spriteset_enemies )

+NameFrame:
    COP [SetEntryHere]
    LDA $nearbyLocIdx
    CMP $26
    BNE +NameDie

    ; Center text: (32 - charCount) * 4 + cameraX
    LDA #$0020
    SEC
    SBC $0D70
    ASL
    ASL
    CLC
    ADC $cameraTargetX
    STA $14
    LDA $cameraTargetY
    CLC
    ADC #$0048
    STA $16
    COP [StageSpriteFrame] ( #34 )
    RTL

+NameDie:
    COP [Die]
}

; =============================================================================
; WalkableMapUpdate — per-frame actor tick
; =============================================================================
; Sets D=0 so DP scratch ($00-$0F) uses safe zero-page RAM instead of
; clobbering actor system fields ($00=entry PC, $02=bank, $06=next link,
; $08=COP timer, $0A/$0C=script pointer). Follows the same pattern as
; Mode7PerspectiveUpdate.

WalkableMapUpdate {
    PHX
    PHD
    LDA #$0000
    TCD
    REP #$30

    ; --- Left: rotate clockwise ---
    LDA $joypadCurrent
    BIT #$0200
    BEQ +SkipLeft
    LDA $00BC
    CLC
    ADC #$ROTATION_SPEED
    AND #$01FF
    STA $00BC
+SkipLeft:

    ; --- Right: rotate counter-clockwise ---
    LDA $joypadCurrent
    BIT #$0100
    BEQ +SkipRight
    LDA $00BC
    SEC
    SBC #$ROTATION_SPEED
    AND #$01FF
    STA $00BC
+SkipRight:

    ; --- Up: move forward ---
    LDA $joypadCurrent
    BIT #$0800
    BEQ +SkipUp
    JSR $&CalcForwardVelocity
    JSR $&AccumulateAndMove
+SkipUp:

    ; --- Down: move backward (negate velocity) ---
    LDA $joypadCurrent
    BIT #$0400
    BEQ +SkipDown
    JSR $&CalcForwardVelocity
    LDA $04
    EOR #$FFFF
    INC
    STA $04
    LDA $06
    EOR #$FFFF
    INC
    STA $06
    JSR $&AccumulateAndMove
+SkipDown:

    ; --- Proximity scan ---
    JSR $&ScanNearby

    ; --- Scene ID lookup for name display ---
    ; Computed here (not in COP script) to use the same execution context
    ; where $@ table reads are proven to work.
    LDA $nearbyLocIdx
    CMP #$FFFF
    BEQ +SkipSceneId
    ; Compute byte offset: index * 14 + 4 (sceneID field offset)
    STA $00
    ASL
    ASL
    ASL
    SEC
    SBC $00
    ASL
    CLC
    ADC #$0004
    TAX
    LDA $@WalkableMapLocationTable, X
    AND #$00FF
    STA $nearbySceneId
+SkipSceneId:

    ; --- Confirm button: signal entry to parent actor ---
    LDA $joypadCurrent
    BIT #$BUTTON_CONFIRM
    BEQ +SkipEnter
    LDA $nearbyLocIdx
    CMP #$FFFF
    BEQ +SkipEnter
    STA $pendingEntryOffset
+SkipEnter:

    ; --- Update all camera systems to follow player ---
    ; Three systems must stay in sync:
    ;   bg1ScrollH ($068A) — OAM builder uses this for sprite screen position
    ;   scrollOverrideH ($06C6) — NMI writes this to BG1HOFS hardware register
    ;   cameraTargetX ($06BE) — smooth-follow target (must match to avoid drift)
    LDA $00CA
    SEC
    SBC #$0080
    STA $bg1ScrollH
    STA $cameraTargetX
    ORA #$8000
    STA $scrollOverrideH

    LDA $00CC
    SEC
    SBC #$0070
    STA $bg2ScrollH
    STA $cameraTargetY
    ORA #$8000
    STA $scrollOverrideV

    PLD
    PLX
    RTL
}

; =============================================================================
; CalcForwardVelocity — compute 8.8 fixed-point velocity from sin table
; =============================================================================
; Uses the 512-entry sin table for exact alignment with camera angle $BC.
; Mode 7 rotates the BACKGROUND clockwise when $BC increases, so forward
; motion in map coordinates uses inverted sin/cos:
;   dx = -sin($BC)      (X component)
;   dy = -cos($BC)      (Y component, cos = sin shifted by 128)
; Output: $04 = dx velocity (signed 8.8), $06 = dy velocity (signed 8.8)

CalcForwardVelocity {
    REP #$30

    ; dx = -sin($BC)
    LDA $00BC
    AND #$01FF
    ASL
    TAX
    SEC
    LDA #$0000
    SBC $@WalkableSinTable, X
    STA $04

    ; dy = -cos($BC) = -sin(($BC + 128) AND $01FF)
    LDA $00BC
    CLC
    ADC #$0080
    AND #$01FF
    ASL
    TAX
    SEC
    LDA #$0000
    SBC $@WalkableSinTable, X
    STA $06

    RTS
}

; =============================================================================
; AccumulateAndMove — sub-pixel fraction accumulation + integer movement
; =============================================================================
; Input: $04 = dx velocity (signed 8.8), $06 = dy velocity (signed 8.8)
; Adds each velocity to its persistent fractional accumulator (fracX/fracY).
; The 16-bit sum of (0:fraction) + velocity has:
;   high byte = signed integer pixel delta (-2..+2 at speed 2.0)
;   low byte  = new fractional remainder
; After extracting integer deltas, calls TryMove for collision.

AccumulateAndMove {
    REP #$30

    ; --- X axis ---
    LDA $&fracX
    AND #$00FF
    CLC
    ADC $04
    PHA
    AND #$00FF
    STA $&fracX
    PLA
    XBA
    AND #$00FF
    CMP #$0080
    BCC +xPos
    ORA #$FF00
+xPos:
    STA $04

    ; --- Y axis ---
    LDA $&fracY
    AND #$00FF
    CLC
    ADC $06
    PHA
    AND #$00FF
    STA $&fracY
    PLA
    XBA
    AND #$00FF
    CMP #$0080
    BCC +yPos
    ORA #$FF00
+yPos:
    STA $06

    JSR $&TryMove
    RTS
}

; =============================================================================
; TryMove — apply delta ($04, $06) to position with collision check
; =============================================================================

TryMove {
    REP #$30

    LDA $00CA
    CLC
    ADC $04
    STA $08

    LDA $00CC
    CLC
    ADC $06
    STA $0A

    JSR $&CheckCollision
    BCS +MoveBlocked

    LDA $08
    STA $00CA
    LDA $0A
    STA $00CC

+MoveBlocked:
    RTS
}

; =============================================================================
; CheckCollision — test passability at pixel position ($08, $0A)
; =============================================================================
; Output: carry set = blocked, carry clear = passable.

CheckCollision {
    REP #$30

    ; Boundary check — relay through +BoundBlock for range
    LDA $08
    CMP #$MAP_PIXEL_MIN
    BCC +BoundBlock
    CMP #$MAP_PIXEL_MAX
    BCS +BoundBlock
    LDA $0A
    CMP #$MAP_PIXEL_MIN
    BCC +BoundBlock
    CMP #$MAP_PIXEL_MAX
    BCS +BoundBlock
    BRA +BoundOk

+BoundBlock:
    SEC
    RTS

+BoundOk:
    ; Metatile row = Y >> 4, col = X >> 4
    ; Map offset = row * 64 + col
    LDA $0A
    LSR
    LSR
    LSR
    LSR
    AND #$003F
    ASL
    ASL
    ASL
    ASL
    ASL
    ASL
    STA $00

    LDA $08
    LSR
    LSR
    LSR
    LSR
    AND #$003F
    CLC
    ADC $00
    TAX

    ; Read metatile index from WRAM copy ($7F8000)
    SEP #$20
    LDA $7F8000, X
    REP #$20
    AND #$00FF
    STA $00

    ; LUT byte = index >> 3, bit = index & 7
    LSR
    LSR
    LSR
    TAX
    SEP #$20
    LDA $@walkable_map_collision_lut, X
    REP #$20
    AND #$00FF
    STA $02

    LDA $00
    AND #$0007
    BEQ +ColTestBit
    TAX
-ColBitLoop:
    LSR $02
    DEX
    BNE -ColBitLoop
+ColTestBit:
    LDA $02
    AND #$0001
    BNE +TileBlock

    CLC
    RTS

+TileBlock:
    SEC
    RTS
}

; =============================================================================
; ScanNearby — find closest location within PROXIMITY_RADIUS
; =============================================================================
; Updates $nearbyLocIdx (or $FFFF if none found).
; If a location is nearby, passes its scene ID to LookupMapName.
; Uses $@WalkableMapLocationTable for long addressing (DBR may not match
; the code bank during actor execution).

ScanNearby {
    REP #$30

    LDA #$FFFF
    STA $nearbyLocIdx
    LDA #$7FFF
    STA $0C

    LDX #$0000
    STX $0E

-ScanLoop:
    LDA $0E
    CMP #$LOCATION_COUNT
    BCS +ScanDone

    ; |locX - playerX|
    LDA $@WalkableMapLocationTable, X
    SEC
    SBC $00CA
    BPL +AbsXOk
    EOR #$FFFF
    INC
+AbsXOk:
    CMP #$PROXIMITY_RADIUS
    BCS +ScanFar
    STA $00

    ; |locY - playerY| — read offset +2
    INX
    INX
    LDA $@WalkableMapLocationTable, X
    DEX
    DEX
    SEC
    SBC $00CC
    BPL +AbsYOk
    EOR #$FFFF
    INC
+AbsYOk:
    CMP #$PROXIMITY_RADIUS
    BCS +ScanFar

    ; Manhattan distance
    CLC
    ADC $00
    CMP $0C
    BCS +ScanFar

    STA $0C
    LDA $0E
    STA $nearbyLocIdx

+ScanFar:
    TXA
    CLC
    ADC #$LOCATION_ENTRY_SIZE
    TAX
    INC $0E
    BRA -ScanLoop

+ScanDone:
    RTS
}

; =============================================================================
; Scene Entry Dispatch Table — indexed by COP [SwitchCase] (location 0-14)
; =============================================================================
; Each handler calls COP [QueueMapChange] with the exact same inline operands
; as the original world_map_options.asm, then COP [Die] to terminate.
; This uses the engine's native COP handler to write all transition registers,
; eliminating any potential mismatch from manual register writes.

wmcEntryTable [
  &wmcEnter_SouthCape
  &wmcEnter_EdwardCastle
  &wmcEnter_Itory
  &wmcEnter_IncaRuins
  &wmcEnter_Freejia
  &wmcEnter_DiamondMine
  &wmcEnter_AngelVillage
  &wmcEnter_Watermia
  &wmcEnter_GreatWall
  &wmcEnter_Euro
  &wmcEnter_MountainTemple
  &wmcEnter_NativeVillage
  &wmcEnter_AngkorWat
  &wmcEnter_DaoVillage
  &wmcEnter_Pyramid
  &wmcEnter_MoonTribeCamp
  &wmcEnter_DiamondCoast
  &wmcEnter_NeilsCottage
  &wmcEnter_NazcaPlain
]

wmcEnter_SouthCape {
    COP [QueueMapChange] ( #01, #$0178, #$0040, #03, #$4300 )
    COP [Die]
}

wmcEnter_EdwardCastle {
    COP [QueueMapChange] ( #0A, #$01F8, #$02C0, #00, #$3420 )
    COP [Die]
}

wmcEnter_Itory {
    COP [QueueMapChange] ( #15, #$02D8, #$02B0, #00, #$3500 )
    COP [Die]
}

wmcEnter_IncaRuins {
    COP [QueueMapChange] ( #1C, #$0068, #$01A0, #80, #$2200 )
    COP [Die]
}

wmcEnter_Freejia {
    COP [QueueMapChange] ( #32, #$0130, #$0350, #00, #$4500 )
    COP [Die]
}

wmcEnter_DiamondMine {
    COP [QueueMapChange] ( #3E, #$00A8, #$03D0, #80, #$4200 )
    COP [Die]
}

wmcEnter_AngelVillage {
    COP [QueueMapChange] ( #69, #$02A0, #$00C0, #00, #$1300 )
    COP [Die]
}

wmcEnter_Watermia {
    COP [QueueMapChange] ( #78, #$0278, #$0390, #00, #$4500 )
    COP [Die]
}

wmcEnter_GreatWall {
    COP [QueueMapChange] ( #82, #$0020, #$0090, #87, #$1800 )
    COP [Die]
}

wmcEnter_Euro {
    COP [QueueMapChange] ( #91, #$03D0, #$0430, #06, #$5400 )
    COP [Die]
}

wmcEnter_MountainTemple {
    COP [QueueMapChange] ( #A0, #$02C8, #$01B0, #86, #$2300 )
    COP [Die]
}

wmcEnter_NativeVillage {
    COP [QueueMapChange] ( #AC, #$01C0, #$01D0, #06, #$2200 )
    COP [Die]
}

wmcEnter_AngkorWat {
    COP [QueueMapChange] ( #B0, #$01F8, #$04C0, #80, #$5400 )
    COP [Die]
}

wmcEnter_DaoVillage {
    COP [QueueMapChange] ( #C3, #$0010, #$00E0, #07, #$2300 )
    COP [Die]
}

wmcEnter_Pyramid {
    COP [QueueMapChange] ( #CC, #$0010, #$00D0, #87, #$4400 )
    COP [Die]
}

wmcEnter_MoonTribeCamp {
    COP [QueueMapChange] ( #1A, #$0150, #$01A0, #00, #$2200 )
    COP [Die]
}

wmcEnter_DiamondCoast {
    COP [QueueMapChange] ( #31, #$00A0, #$0060, #03, #$1100 )
    COP [Die]
}

wmcEnter_NeilsCottage {
    COP [QueueMapChange] ( #49, #$0050, #$00D0, #00, #$1100 )
    COP [Die]
}

wmcEnter_NazcaPlain {
    COP [QueueMapChange] ( #4B, #$0120, #$0080, #00, #$4400 )
    COP [Die]
}
