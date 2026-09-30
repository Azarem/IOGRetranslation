; Apocalypse Gaia boss spritemap
; 
; Defines 69 sprite animation sets ($00-$44) for the unused Mode 7 boss.
; Phase 1/2 tiles occupy lower OBJ page (tiles $40-$FF, VRAM $4400-$4FFF).
; Phase 3 tiles occupy upper OBJ page (tiles $100-$1FF, VRAM $6000-$6FFF).
; Shared/persistent tiles split across both pages.
;
; Tile index reference — grid-aware row-pair allocation:
;   16×16 OAM sprites use tiles at base, base+1, base+16, base+17.
;   Each row pair (32 tiles) holds up to 8 non-overlapping 16×16 slots.
;
;   Phase 1/2 (gfx_ag_sprites.raw.bin → VRAM $4400, tile $40+):
;     Pair A ($40-$5F): Core idle frames
;       $40: ci0 TL  $42: ci0 TR  $44: ci0 BL  $46: ci0 BR
;       $48: ci1 TL  $4A: ci1 TR  $4C: ci1 BL  $4E: ci1 BR
;     Pair B ($60-$7F): Core action variants
;       $60: atk A   $62: atk B   $64: dmg A   $66: dmg B
;       $68: death A $6A: death B $6C: extra A $6E: extra B
;     Pair C ($80-$9F): Sub-actor sprites
;       $80: bit idle  $82: bit atk  $84: bit vuln  $86: bit dead
;       $88: lnch idle $8A: lnch fire $8C: nuke     $8E: deadbit
;     Pair D ($A0-$BF): Floor beam + 8×8 sprites
;       $A0: floor beam (16×16)
;       $A2: bubble  $A3: beam  $A4: nuke piece  $A5: fire obj
;       $A6: bubble death  $A7: bubble pop/debris A  $A8: debris B
;
;   Phase 3 (gfx_ag_phase3.raw.bin → VRAM $4400, tile $40+):
;     Pair A ($40-$5F): Final Core body (replaces P1 Core idle)
;       $40: fm0 TL  $42: fm0 TR  $44: fm0 BL  $46: fm0 BR
;       $48: fm1 TL  $4A: fm1 TR  $4C: fm1 BL  $4E: fm1 BR
;     Pair B ($60-$7F): Final Core variants + Minis (replaces P1 Core action)
;       $60: fdmg A  $62: fdmg B  $64: falt A  $66: falt B
;       $68: mini fall  $6A: mini idle  $6C: mini move  $6E: mini dmg
;     Pair C ($80-$9F): Mini death + 5 Cannons + Shared FX
;       $80: mini death  $82: can N  $84: can NE  $86: can E
;       $88: can SE  $8A: can S  $8C: NUKE(shared)  $8E: DEADBIT(shared)
;     Pair D ($A0-$BF): 3 Cannons + Shared FX 8×8 + Bullets
;       $A0: can SW  $A2: can W  $A4: nuke_piece(sh)  $A5: fire_obj(sh)
;       $A6: can NW  $A8: body seg
;       $A9-$AF,$B4: bullet starts (N,NE,E,SE,S,SW,W,NW)
;       $B5,$B8-$BE: bullet hitboxes (N,NE,E,SE,S,SW,W,NW)
;
; sprite-part format:
;   < size, x_norm, x_mirr, y_norm, y_vflip, tileattr >
;   size: 0=8x8, 1=16x16
;   x_norm/x_mirr: X offset (normal view / H-mirrored view)
;   y_norm/y_vflip: Y offset (normal view / V-flipped view)
;   tileattr: VHOOPPPn nnnnnnnn
;     V=vflip, H=hflip, OO=priority, PPP=palette, n=9-bit tile#
;
; For single centered sprites, all offsets = 0.
; For multi-part sprites (e.g. 32x32 = 4×16x16):
;   TL: x=0,x_m=$10, y=0,y_v=$10
;   TR: x=$10,x_m=0, y=0,y_v=$10
;   BL: x=0,x_m=$10, y=$10,y_v=0
;   BR: x=$10,x_m=0, y=$10,y_v=0
;
; Palette 3 (PPP=011), name table 0 (N=0) = $16xx
; The engine EORs tile attrs with actor field $0E (base priority $2000
; from display preset $0C). $16 XOR $20 = $36 → OAM priority 3 (OO=11).
; Phase 1/2 tiles: $16xx where xx = tile index ($40-$A8 range)
; Phase 3 tiles: $16xx where xx = tile index ($40-$BE range)

---------------------------------------------

apocalypse_gaia [
  ; Sprite set pointer table: indices $00-$42
  &ag_set_00   ;00 - Core idle
  &ag_set_01   ;01 - Core attack 1
  &ag_set_02   ;02 - Core attack 2
  &ag_set_03   ;03 - Core damage
  &ag_set_04   ;04 - Core death
  &ag_set_05   ;05 - Bit idle (left)
  &ag_set_06   ;06 - Bit attack frame 1
  &ag_set_07   ;07 - Bit attack frame 2
  &ag_set_08   ;08 - Launcher idle
  &ag_set_09   ;09 - Launcher fire frame 1
  &ag_set_0A   ;0A - Launcher fire frame 2
  &ag_set_0B   ;0B - Bit dead idle
  &ag_set_0C   ;0C - Nuke descent (MoveToward)
  &ag_set_0D   ;0D - Nuke impact explosion
  &ag_set_0E   ;0E - Nuke debris falling (loop)
  &ag_set_0F   ;0F - Shrapnel rain (loop)
  &ag_set_10   ;10 - Explosion sparkle A
  &ag_set_11   ;11 - Arm fire projectile (loop)
  &ag_set_12   ;12 - Nuke fall
  &ag_set_13   ;13 - Nuke explosion
  &ag_set_14   ;14 - Floating bomb spawn
  &ag_set_15   ;15 - Star/beam particle
  &ag_set_16   ;16 - Bit attack return
  &ag_set_17   ;17 - Floating bomb expanded
  &ag_set_18   ;18 - Floating bomb chase (loop)
  &ag_set_19   ;19 - Core P2 anim
  &ag_set_1A   ;1A - Launcher fire return
  &ag_set_1B   ;1B - Bit recovery transition
  &ag_set_1C   ;1C - Dead bit fire anim
  &ag_set_1D   ;1D - Explosion sparkle B
  &ag_set_1E   ;1E - Final Core move
  &ag_set_1F   ;1F - Final Core damage 1
  &ag_set_20   ;20 - Final Core damage 2
  &ag_set_21   ;21 - Final Core damage 3
  &ag_set_22   ;22 - Mini fall
  &ag_set_23   ;23 - Mini idle
  &ag_set_24   ;24 - Mini move
  &ag_set_25   ;25 - Mini damage
  &ag_set_26   ;26 - Mini death frame 1
  &ag_set_27   ;27 - Mini death frame 2
  &ag_set_28   ;28 - Body segment
  &ag_set_29   ;29 - Cannon dir 0 (N)
  &ag_set_2A   ;2A - Cannon dir 2 (E)
  &ag_set_2B   ;2B - Cannon dir 6 (W)
  &ag_set_2C   ;2C - Cannon dir 4 (S) / alt
  &ag_set_2D   ;2D - Cannon dir 7 (NW)
  &ag_set_2E   ;2E - Cannon dir 5 (SW)
  &ag_set_2F   ;2F - Cannon dir 3 (SE)
  &ag_set_30   ;30 - Cannon dir 1 (NE)
  &ag_set_31   ;31 - Death explosion
  &ag_set_32   ;32 - Bullet S start
  &ag_set_33   ;33 - Bullet N start
  &ag_set_34   ;34 - Bullet W start
  &ag_set_35   ;35 - Bullet E start
  &ag_set_36   ;36 - Bullet SW start
  &ag_set_37   ;37 - Bullet NW start
  &ag_set_38   ;38 - Bullet NE start
  &ag_set_39   ;39 - Bullet SE start
  &ag_set_3A   ;3A - Bullet S hitbox
  &ag_set_3B   ;3B - Bullet N hitbox
  &ag_set_3C   ;3C - Bullet W hitbox
  &ag_set_3D   ;3D - Bullet E hitbox
  &ag_set_3E   ;3E - Bullet SW hitbox
  &ag_set_3F   ;3F - Bullet NW hitbox
  &ag_set_40   ;40 - Bullet NE hitbox
  &ag_set_41   ;41 - Bullet SE hitbox
  &ag_set_42   ;42 - Final Core damage alt
  &ag_set_43   ;43 - Bubble death pop
  &ag_set_44   ;44 - Floor beam effect
]

; ============================================================
; Sprite Sets (animation sequences)
; Each set is a list of sprite-set < duration, &group > entries.
; Duration $0000 = last frame (no auto-advance).
; ============================================================

; --- Phase 1/2: Core ---

ag_set_00 [
  sprite-set < #$0005, &ag_grp_core_idle_0 >
  sprite-set < #$0005, &ag_grp_core_idle_1 >
  sprite-set < #$0005, &ag_grp_core_idle_0 >
  sprite-set < #$0000, &ag_grp_core_idle_1 >
]

ag_set_01 [
  sprite-set < #$0003, &ag_grp_core_atk_0 >
  sprite-set < #$0003, &ag_grp_core_atk_1 >
  sprite-set < #$0000, &ag_grp_core_atk_0 >
]

ag_set_02 [
  sprite-set < #$0003, &ag_grp_core_atk_1 >
  sprite-set < #$0000, &ag_grp_core_atk_0 >
]

ag_set_03 [
  sprite-set < #$0005, &ag_grp_core_dmg >
  sprite-set < #$0000, &ag_grp_core_idle_0 >
]

ag_set_04 [
  sprite-set < #$0007, &ag_grp_core_dmg >
  sprite-set < #$0007, &ag_grp_core_death >
  sprite-set < #$0000, &ag_grp_empty >
]

; --- Phase 1: Bits ---

ag_set_05 [
  sprite-set < #$0000, &ag_grp_bit_idle >
]

ag_set_06 [
  sprite-set < #$0003, &ag_grp_bit_atk >
  sprite-set < #$0000, &ag_grp_bit_vuln >
]

ag_set_07 [
  sprite-set < #$0003, &ag_grp_bit_vuln >
  sprite-set < #$0000, &ag_grp_bit_atk >
]

ag_set_0B [
  sprite-set < #$0000, &ag_grp_bit_dead >
]

ag_set_16 [
  sprite-set < #$0003, &ag_grp_bit_atk >
  sprite-set < #$0000, &ag_grp_bit_idle >
]

; --- Phase 1: Launchers ---

ag_set_08 [
  sprite-set < #$0000, &ag_grp_launcher_idle >
]

ag_set_09 [
  sprite-set < #$0003, &ag_grp_launcher_fire >
  sprite-set < #$0000, &ag_grp_launcher_idle >
]

ag_set_0A [
  sprite-set < #$0003, &ag_grp_launcher_idle >
  sprite-set < #$0000, &ag_grp_launcher_fire >
]

ag_set_1A [
  sprite-set < #$0003, &ag_grp_launcher_fire >
  sprite-set < #$0000, &ag_grp_launcher_idle >
]

; --- Phase 1: Projectiles ---

ag_set_12 [
  sprite-set < #$0000, &ag_grp_nuke >
]

ag_set_13 [
  sprite-set < #$0003, &ag_grp_nuke_piece >
  sprite-set < #$0000, &ag_grp_nuke_piece >
]

ag_set_15 [
  sprite-set < #$0000, &ag_grp_beam >
]

; --- Phase 2: Core vulnerable ---

ag_set_19 [
  sprite-set < #$0005, &ag_grp_core_atk_0 >
  sprite-set < #$0005, &ag_grp_core_extra >
  sprite-set < #$0000, &ag_grp_core_atk_0 >
]

; --- Phase 2: Dead bit fire ---

ag_set_1C [
  sprite-set < #$0003, &ag_grp_deadbit_fire >
  sprite-set < #$0000, &ag_grp_fire_obj >
]

; --- Nuke attack sequence (code_09B3FD) ---
; The arm death callback spawns this as a meteor/nuke projectile.
; MoveToward(#0C, #02) guides it toward the player, then impact
; check → explosion → debris rain.

; #0C: Nuke descending toward player (MoveToward + AnimOnce)
ag_set_0C [
  sprite-set < #$0003, &ag_grp_nuke >
  sprite-set < #$0000, &ag_grp_nuke >
]

; #0D: Nuke impact explosion (AnimOnce)
ag_set_0D [
  sprite-set < #$0003, &ag_grp_nuke >
  sprite-set < #$0003, &ag_grp_nuke_piece >
  sprite-set < #$0000, &ag_grp_fire_obj >
]

; #0E: Debris falling from impact (StageSpriteLoopMoveY, AnimLoop)
ag_set_0E [
  sprite-set < #$0003, &ag_grp_nuke_piece >
  sprite-set < #$0003, &ag_grp_fire_obj >
  sprite-set < #$0000, &ag_grp_nuke_piece >
]

; #0F: Shrapnel rain pieces (StageSpriteLoopMoveY, AnimLoop)
ag_set_0F [
  sprite-set < #$0003, &ag_grp_fire_obj >
  sprite-set < #$0000, &ag_grp_nuke_piece >
]

; #10: Explosion sparkle A (replaces spriteset_enemies #07)
ag_set_10 [
  sprite-set < #$0003, &ag_grp_fire_obj >
  sprite-set < #$0003, &ag_grp_nuke_piece >
  sprite-set < #$0000, &ag_grp_fire_obj >
]

; --- Arm fire projectile (code_09B500/B541) ---
; Shoulder launchers fire 5 projectiles per arm.
; StageSpriteLoop(#11, #20) for left, (#91, #20) for right (mirrored).
; Flies horizontally via StageMoveX.

; #11: Fire projectile (StageSpriteLoop, AnimLoop)
ag_set_11 [
  sprite-set < #$0003, &ag_grp_fire_obj >
  sprite-set < #$0003, &ag_grp_nuke_piece >
  sprite-set < #$0000, &ag_grp_fire_obj >
]

; --- Floating bomb sequence (code_09B7A8) ---
; Shoulder launchers spawn floating bombs that track the player.
; Spawn → expand → chase → explode on death.

; #14: Floating bomb initial state (small energy orb)
ag_set_14 [
  sprite-set < #$0003, &ag_grp_bubble >
  sprite-set < #$0000, &ag_grp_bubble >
]

; #17: Floating bomb expanded/armed (grows to 16x16)
ag_set_17 [
  sprite-set < #$0003, &ag_grp_nuke >
  sprite-set < #$0000, &ag_grp_nuke >
]

; #18: Floating bomb chasing player (MoveToward + AnimLoop)
ag_set_18 [
  sprite-set < #$0003, &ag_grp_nuke >
  sprite-set < #$0003, &ag_grp_deadbit_fire >
  sprite-set < #$0000, &ag_grp_nuke >
]

; --- Arm bit recovery (code_09B31E / code_09B37A) ---
; Transition between arm attack and idle. Also used mirrored (#9B).

; #1B: Bit recovery animation
ag_set_1B [
  sprite-set < #$0003, &ag_grp_bit_vuln >
  sprite-set < #$0000, &ag_grp_bit_idle >
]

; #1D: Explosion sparkle B (replaces spriteset_enemies #01)
ag_set_1D [
  sprite-set < #$0003, &ag_grp_nuke_piece >
  sprite-set < #$0003, &ag_grp_fire_obj >
  sprite-set < #$0000, &ag_grp_nuke_piece >
]

; #31: Death explosion (replaces spriteset_enemies #02)
ag_set_31 [
  sprite-set < #$0005, &ag_grp_deadbit_fire >
  sprite-set < #$0005, &ag_grp_nuke >
  sprite-set < #$0003, &ag_grp_nuke_piece >
  sprite-set < #$0000, &ag_grp_fire_obj >
]

; --- Bubble death / Floor beam ---

; #43: Bubble death pop — floating bomb burst effect.
; Shows bubble → pop → debris scatter. Use when a floating
; bomb is destroyed, before the death explosion (#31).
ag_set_43 [
  sprite-set < #$0002, &ag_grp_bubble_death >
  sprite-set < #$0002, &ag_grp_bubble_pop >
  sprite-set < #$0000, &ag_grp_bubble_debris >
]

; #44: Floor beam effect — beam impact / ground strike.
; Beam particle expands into a wide floor beam.
ag_set_44 [
  sprite-set < #$0003, &ag_grp_beam >
  sprite-set < #$0000, &ag_grp_floor_beam >
]

; --- Phase 3: Final Core ---

ag_set_1E [
  sprite-set < #$0005, &ag_grp_fcore_move_0 >
  sprite-set < #$0005, &ag_grp_fcore_move_1 >
  sprite-set < #$0000, &ag_grp_fcore_move_0 >
]

ag_set_1F [
  sprite-set < #$0003, &ag_grp_fcore_dmg >
  sprite-set < #$0000, &ag_grp_fcore_move_0 >
]

ag_set_20 [
  sprite-set < #$0005, &ag_grp_fcore_dmg >
  sprite-set < #$0005, &ag_grp_fcore_move_0 >
  sprite-set < #$0000, &ag_grp_fcore_dmg >
]

ag_set_21 [
  sprite-set < #$0003, &ag_grp_fcore_move_1 >
  sprite-set < #$0000, &ag_grp_fcore_move_0 >
]

ag_set_42 [
  sprite-set < #$0007, &ag_grp_fcore_dmg >
  sprite-set < #$0007, &ag_grp_fcore_alt >
  sprite-set < #$0000, &ag_grp_fcore_move_0 >
]

; --- Phase 3: Minis ---

ag_set_22 [
  sprite-set < #$0000, &ag_grp_mini_fall >
]

ag_set_23 [
  sprite-set < #$0000, &ag_grp_mini_idle >
]

ag_set_24 [
  sprite-set < #$0003, &ag_grp_mini_move >
  sprite-set < #$0003, &ag_grp_mini_idle >
  sprite-set < #$0000, &ag_grp_mini_move >
]

ag_set_25 [
  sprite-set < #$0003, &ag_grp_mini_dmg >
  sprite-set < #$0000, &ag_grp_mini_idle >
]

ag_set_26 [
  sprite-set < #$0005, &ag_grp_mini_dmg >
  sprite-set < #$0000, &ag_grp_mini_death >
]

ag_set_27 [
  sprite-set < #$0005, &ag_grp_mini_death >
  sprite-set < #$0000, &ag_grp_empty >
]

; --- Phase 3: Body segment ---

ag_set_28 [
  sprite-set < #$0000, &ag_grp_body_seg >
]

; --- Phase 3: Cannons (8 directions) ---

ag_set_29 [
  sprite-set < #$0000, &ag_grp_cannon_n >
]
ag_set_2A [
  sprite-set < #$0000, &ag_grp_cannon_e >
]
ag_set_2B [
  sprite-set < #$0000, &ag_grp_cannon_w >
]
ag_set_2C [
  sprite-set < #$0000, &ag_grp_cannon_s >
]
ag_set_2D [
  sprite-set < #$0000, &ag_grp_cannon_nw >
]
ag_set_2E [
  sprite-set < #$0000, &ag_grp_cannon_sw >
]
ag_set_2F [
  sprite-set < #$0000, &ag_grp_cannon_se >
]
ag_set_30 [
  sprite-set < #$0000, &ag_grp_cannon_ne >
]

; --- Phase 3: Bullets (8 directions, start + hitbox) ---

ag_set_32 [
  sprite-set < #$0003, &ag_grp_bullet_s_start >
  sprite-set < #$0000, &ag_grp_bullet_s_hit >
]
ag_set_33 [
  sprite-set < #$0003, &ag_grp_bullet_n_start >
  sprite-set < #$0000, &ag_grp_bullet_n_hit >
]
ag_set_34 [
  sprite-set < #$0003, &ag_grp_bullet_w_start >
  sprite-set < #$0000, &ag_grp_bullet_w_hit >
]
ag_set_35 [
  sprite-set < #$0003, &ag_grp_bullet_e_start >
  sprite-set < #$0000, &ag_grp_bullet_e_hit >
]
ag_set_36 [
  sprite-set < #$0003, &ag_grp_bullet_sw_start >
  sprite-set < #$0000, &ag_grp_bullet_sw_hit >
]
ag_set_37 [
  sprite-set < #$0003, &ag_grp_bullet_nw_start >
  sprite-set < #$0000, &ag_grp_bullet_nw_hit >
]
ag_set_38 [
  sprite-set < #$0003, &ag_grp_bullet_ne_start >
  sprite-set < #$0000, &ag_grp_bullet_ne_hit >
]
ag_set_39 [
  sprite-set < #$0003, &ag_grp_bullet_se_start >
  sprite-set < #$0000, &ag_grp_bullet_se_hit >
]

; --- Bullet hitbox-only sets (used by StageSprAndHitbox) ---

ag_set_3A [
  sprite-set < #$0000, &ag_grp_bullet_s_hit >
]
ag_set_3B [
  sprite-set < #$0000, &ag_grp_bullet_n_hit >
]
ag_set_3C [
  sprite-set < #$0000, &ag_grp_bullet_w_hit >
]
ag_set_3D [
  sprite-set < #$0000, &ag_grp_bullet_e_hit >
]
ag_set_3E [
  sprite-set < #$0000, &ag_grp_bullet_sw_hit >
]
ag_set_3F [
  sprite-set < #$0000, &ag_grp_bullet_nw_hit >
]
ag_set_40 [
  sprite-set < #$0000, &ag_grp_bullet_ne_hit >
]
ag_set_41 [
  sprite-set < #$0000, &ag_grp_bullet_se_hit >
]

; ============================================================
; Sprite Groups (metasprite definitions)
; sprite-group < 13 header bytes, part_count, [parts] >
;
; Header bytes: hitbox/bounds data used by UpdateActorAnimation
;   Bytes 0-1: hitbox X origin, Y origin
;   Bytes 2-3: hitbox width, height
;   Bytes 4-11: display bounds (left, top, right, bottom) pairs
;   Byte 12: sprite part count
; ============================================================

; --- Empty placeholder ---
ag_grp_empty [
  sprite-group < #00, #08, #10, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #08, #$0000 >
  ] >
]

; ============================================================
; Phase 1/2 Metasprites (lower page tiles, palette 3 = $06xx)
; Priority 3 = $30xx, palette 3 → $16xx (lower page only)
; Tile attrs: $16nn for lower page
; ============================================================

; --- Core body (32x32 = 4 x 16x16 parts) ---
; Tiles $40-$43 (TL), $44-$47 (TR), $48-$4B (BL), $4C-$4F (BR)
; For 16x16: tile# refers to TL 8x8, HW fetches +1,+16,+17

ag_grp_core_idle_0 [
  sprite-group < #10, #10, #20, #00, #F8, #F0, #01, #01, #F3, #1A, #E5, #1A, #04, [
    sprite-part < #01, #00, #10, #00, #10, #$1640 >
    sprite-part < #01, #10, #00, #00, #10, #$1642 >
    sprite-part < #01, #00, #10, #10, #00, #$1644 >
    sprite-part < #01, #10, #00, #10, #00, #$1646 >
  ] >
]

ag_grp_core_idle_1 [
  sprite-group < #10, #10, #20, #00, #F8, #F0, #01, #01, #F3, #1A, #E5, #1A, #04, [
    sprite-part < #01, #00, #10, #00, #10, #$1648 >
    sprite-part < #01, #10, #00, #00, #10, #$164A >
    sprite-part < #01, #00, #10, #10, #00, #$164C >
    sprite-part < #01, #10, #00, #10, #00, #$164E >
  ] >
]

; Core attack (uses core_atk tiles $50-$53)
ag_grp_core_atk_0 [
  sprite-group < #10, #10, #20, #00, #F8, #F0, #01, #01, #F3, #1A, #E5, #1A, #04, [
    sprite-part < #01, #00, #10, #00, #10, #$1660 >
    sprite-part < #01, #10, #00, #00, #10, #$1662 >
    sprite-part < #01, #00, #10, #10, #00, #$1640 >
    sprite-part < #01, #10, #00, #10, #00, #$1642 >
  ] >
]

ag_grp_core_atk_1 [
  sprite-group < #10, #10, #20, #00, #F8, #F0, #01, #01, #F3, #1A, #E5, #1A, #04, [
    sprite-part < #01, #00, #10, #00, #10, #$1640 >
    sprite-part < #01, #10, #00, #00, #10, #$1642 >
    sprite-part < #01, #00, #10, #10, #00, #$1660 >
    sprite-part < #01, #10, #00, #10, #00, #$1662 >
  ] >
]

; Core damage (tiles $54-$57)
ag_grp_core_dmg [
  sprite-group < #10, #10, #20, #00, #F8, #F0, #01, #01, #F3, #1A, #E5, #1A, #04, [
    sprite-part < #01, #00, #10, #00, #10, #$1664 >
    sprite-part < #01, #10, #00, #00, #10, #$1666 >
    sprite-part < #01, #00, #10, #10, #00, #$1664 >
    sprite-part < #01, #10, #00, #10, #00, #$1666 >
  ] >
]

; Core death (tiles $58-$5B)
ag_grp_core_death [
  sprite-group < #10, #10, #20, #00, #F8, #F0, #01, #01, #F3, #1A, #E5, #1A, #04, [
    sprite-part < #01, #00, #10, #00, #10, #$1668 >
    sprite-part < #01, #10, #00, #00, #10, #$166A >
    sprite-part < #01, #00, #10, #10, #00, #$1668 >
    sprite-part < #01, #10, #00, #10, #00, #$166A >
  ] >
]

; Core extra anim (tiles $84-$87)
ag_grp_core_extra [
  sprite-group < #10, #10, #20, #00, #F8, #F0, #01, #01, #F3, #1A, #E5, #1A, #04, [
    sprite-part < #01, #00, #10, #00, #10, #$166C >
    sprite-part < #01, #10, #00, #00, #10, #$166E >
    sprite-part < #01, #00, #10, #10, #00, #$1640 >
    sprite-part < #01, #10, #00, #10, #00, #$1642 >
  ] >
]

; --- Bits (16x16 each) ---
; Bit idle (tiles $5C-$5F)
ag_grp_bit_idle [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1680 >
  ] >
]

; Bit attack (tiles $60-$63)
ag_grp_bit_atk [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1682 >
  ] >
]

; Bit vulnerable (tiles $64-$67)
ag_grp_bit_vuln [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1684 >
  ] >
]

; Bit dead (tiles $68-$6B)
ag_grp_bit_dead [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1686 >
  ] >
]

; --- Launchers (16x16) ---
; Launcher idle (tiles $6C-$6F)
ag_grp_launcher_idle [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1688 >
  ] >
]

; Launcher fire (tiles $70-$73)
ag_grp_launcher_fire [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$168A >
  ] >
]

; --- Projectiles ---
; Bubble (8x8, tiles $74-$75)
ag_grp_bubble [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16A2 >
  ] >
]

; Beam (8x8, tiles $76-$77)
ag_grp_beam [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16A3 >
  ] >
]

; Nuke (16x16, tiles $78-$7B)
ag_grp_nuke [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$168C >
  ] >
]

; Nuke piece (8x8, tiles $7C-$7D)
ag_grp_nuke_piece [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16A4 >
  ] >
]

; Fire object (8x8, tiles $7E-$7F)
ag_grp_fire_obj [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16A5 >
  ] >
]

; Dead bit fire (16x16, tiles $80-$83)
ag_grp_deadbit_fire [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$168E >
  ] >
]

; --- Bubble death/debris (8x8, tiles $88-$8B) ---
; $88-$89: burst pop frames, $8A-$8B: debris scatter pieces

; Bubble pop frame 1 (tile $88)
ag_grp_bubble_death [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16A6 >
  ] >
]

; Bubble pop frame 2 (tile $8A)
ag_grp_bubble_pop [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16A7 >
  ] >
]

; Bubble debris scatter — 2 pieces flying apart (tiles $8A + $8B)
ag_grp_bubble_debris [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F8, #10, #ED, #12, #02, [
    sprite-part < #00, #00, #08, #00, #08, #$16A7 >
    sprite-part < #00, #08, #00, #08, #00, #$16A8 >
  ] >
]

; --- Floor beam (16x16, tiles $8C-$8F) ---

; Full beam frame (16x16)
ag_grp_floor_beam [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$16A0 >
  ] >
]

; ============================================================
; Phase 3 Metasprites (tiles $40-$BF after DMA to VRAM $4400)
; Tile attrs: $16nn (same palette 3, priority 1 as Phase 1)
; Phase 3 DMA replaces Phase 1 tiles at $40-$BF; shared FX
; tiles ($8C nuke, $8E deadbit, $A4/$A5 8×8 FX) remain at
; their Phase 1 positions so explosions render correctly.
; ============================================================

; --- Final Core (32x32 = 4 x 16x16) ---
; Tiles $40-$4E (same VRAM positions as Phase 1 core idle)

ag_grp_fcore_move_0 [
  sprite-group < #10, #10, #20, #00, #F8, #F0, #01, #01, #F3, #1A, #E5, #1A, #04, [
    sprite-part < #01, #00, #10, #00, #10, #$1640 >
    sprite-part < #01, #10, #00, #00, #10, #$1642 >
    sprite-part < #01, #00, #10, #10, #00, #$1644 >
    sprite-part < #01, #10, #00, #10, #00, #$1646 >
  ] >
]

ag_grp_fcore_move_1 [
  sprite-group < #10, #10, #20, #00, #F8, #F0, #01, #01, #F3, #1A, #E5, #1A, #04, [
    sprite-part < #01, #00, #10, #00, #10, #$1648 >
    sprite-part < #01, #10, #00, #00, #10, #$164A >
    sprite-part < #01, #00, #10, #10, #00, #$164C >
    sprite-part < #01, #10, #00, #10, #00, #$164E >
  ] >
]

; Final Core damage (tiles $60-$62, same position as Phase 1 core action)
ag_grp_fcore_dmg [
  sprite-group < #10, #10, #20, #00, #F8, #F0, #01, #01, #F3, #1A, #E5, #1A, #04, [
    sprite-part < #01, #00, #10, #00, #10, #$1660 >
    sprite-part < #01, #10, #00, #00, #10, #$1662 >
    sprite-part < #01, #00, #10, #10, #00, #$1660 >
    sprite-part < #01, #10, #00, #10, #00, #$1662 >
  ] >
]

; Final Core alt frame (tiles $64-$66)
ag_grp_fcore_alt [
  sprite-group < #10, #10, #20, #00, #F8, #F0, #01, #01, #F3, #1A, #E5, #1A, #04, [
    sprite-part < #01, #00, #10, #00, #10, #$1664 >
    sprite-part < #01, #10, #00, #00, #10, #$1666 >
    sprite-part < #01, #00, #10, #10, #00, #$1664 >
    sprite-part < #01, #10, #00, #10, #00, #$1666 >
  ] >
]

; --- Minis (16x16 each) ---
; Mini fall (tile $68)
ag_grp_mini_fall [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1668 >
  ] >
]

; Mini idle (tile $6A)
ag_grp_mini_idle [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$166A >
  ] >
]

; Mini move (tile $6C)
ag_grp_mini_move [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$166C >
  ] >
]

; Mini damage (tile $6E)
ag_grp_mini_dmg [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$166E >
  ] >
]

; Mini death (tile $80)
ag_grp_mini_death [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1680 >
  ] >
]

; --- Body segment (8x8) ---
; Tile $A8
ag_grp_body_seg [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16A8 >
  ] >
]

; --- Cannons (16x16, 8 directions) ---
; Pair C: N=$82, NE=$84, E=$86, SE=$88, S=$8A
; Pair D: SW=$A0, W=$A2, NW=$A6

ag_grp_cannon_n [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1682 >
  ] >
]
ag_grp_cannon_ne [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1684 >
  ] >
]
ag_grp_cannon_e [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1686 >
  ] >
]
ag_grp_cannon_se [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1688 >
  ] >
]
ag_grp_cannon_s [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$168A >
  ] >
]
ag_grp_cannon_sw [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$16A0 >
  ] >
]
ag_grp_cannon_w [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$16A2 >
  ] >
]
ag_grp_cannon_nw [
  sprite-group < #08, #08, #10, #00, #F8, #F0, #01, #01, #F9, #0E, #F0, #12, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$16A6 >
  ] >
]

; --- Bullets start sprites (8x8 each) ---
; Pair D free 8×8 slots: $A9-$AF, $B4

ag_grp_bullet_n_start [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16A9 >
  ] >
]
ag_grp_bullet_ne_start [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16AA >
  ] >
]
ag_grp_bullet_e_start [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16AB >
  ] >
]
ag_grp_bullet_se_start [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16AC >
  ] >
]
ag_grp_bullet_s_start [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16AD >
  ] >
]
ag_grp_bullet_sw_start [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16AE >
  ] >
]
ag_grp_bullet_w_start [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16AF >
  ] >
]
ag_grp_bullet_nw_start [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16B4 >
  ] >
]

; --- Bullets hitbox sprites (8x8 each) ---
; Pair D free 8×8 slots: $B5, $B8-$BE

ag_grp_bullet_n_hit [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16B5 >
  ] >
]
ag_grp_bullet_ne_hit [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16B8 >
  ] >
]
ag_grp_bullet_e_hit [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16B9 >
  ] >
]
ag_grp_bullet_se_hit [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16BA >
  ] >
]
ag_grp_bullet_s_hit [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16BB >
  ] >
]
ag_grp_bullet_sw_hit [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16BC >
  ] >
]
ag_grp_bullet_w_hit [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16BD >
  ] >
]
ag_grp_bullet_nw_hit [
  sprite-group < #04, #04, #08, #00, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #00, #00, #00, #00, #00, #$16BE >
  ] >
]
