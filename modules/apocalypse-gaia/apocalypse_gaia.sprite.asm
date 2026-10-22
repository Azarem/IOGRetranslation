; Apocalypse Gaia boss spritemap
; 
; Defines sprite animation sets ($00-$44) for the unused Mode 7 boss.
; Phase 1/2 tiles occupy upper OBJ page (tiles $100-$1FF).
; Phase 3 tiles occupy lower OBJ page (tiles $40-$FF, VRAM $4400-$4FFF).
;
; Tile index formula: tile = $100 + col + row * $10
;   on the 128x128 sprite page (16x16 grid of 8x8 tiles).
;   16×16 OAM sprites use tiles at base, base+1, base+16, base+17.
;   All Phase 1/2 sprite tiles are large (16x16).
;
;   Phase 1/2 (upper OBJ page, tiles $100-$1FF):
;     Core body left half: (0,0)-(4,6), palette 3
;       3 wide × 4 tall large tiles = 12 parts (96x64 with H-mirror)
;       $100,$102,$104 / $120,$122,$124 / $140,$142,$144 / $160,$162,$164
;     Left Bit: (6,0)(8,0)(6,2)(8,2), palette 6
;       2x2 large tiles = 32x32 px
;       $106,$108,$126,$128
;     Left Launcher: (6,4)-(8,C), palette 4
;       2x5 large tiles = 32x80 px
;       $146,$148 / $166,$168 / $186,$188 / $1A6,$1A8 / $1C6,$1C8
;     Bubble projectile: (0,E)-(6,E), palette 5, 4 frames
;       $1E0,$1E2,$1E4,$1E6
;     Bit shotgun: (C,C)(E,C), palette 5, 4 frames (+ H-flip)
;       $1CC,$1CE
;     Bubble death: (E,C)(C,E)(E,E), palette 5, 5 frames (+ H-flip)
;       $1CE,$1EC,$1EE
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
;       $88: can SE  $8A: can S  $8C: meteor(shared)  $8E: deadbit(shared)
;     Pair D ($A0-$BF): 3 Cannons + Shared FX 8×8 + Bullets
;       $A0: can SW  $A2: can W  $A4: shotgun_2(sh)  $A5: shotgun_1(sh)
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
; The engine EORs tile attrs with actor field $0E (base priority $2000
; from display preset $0C). XOR $20 on upper byte → OAM priority 3.
; Phase 1/2: upper page, N=1. Palette varies per element:
;   Palette 3 (core):       $17xx XOR $20 = $37xx → pri 3, pal 3
;   Palette 4 (launcher):   $19xx XOR $20 = $39xx → pri 3, pal 4
;   Palette 5 (projectile): $1Bxx XOR $20 = $3Bxx → pri 3, pal 5
;   Palette 6 (bits):       $1Dxx XOR $20 = $3Dxx → pri 3, pal 6
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
  &ag_set_0B   ;0B - Dead bit idle
  &ag_set_0C   ;0C - Meteor descent (MoveToward)
  &ag_set_0D   ;0D - Meteor impact explosion
  &ag_set_0E   ;0E - Meteor debris falling (loop)
  &ag_set_0F   ;0F - Meteor shrapnel rain (loop)
  &ag_set_10   ;10 - Explosion sparkle A
  &ag_set_11   ;11 - Bit fire projectile (loop)
  &ag_set_12   ;12 - Nuke ball descent
  &ag_set_13   ;13 - Ring projectile
  &ag_set_14   ;14 - Floating bomb spawn
  &ag_set_15   ;15 - Falling star particle
  &ag_set_16   ;16 - Bit attack return
  &ag_set_17   ;17 - Floating bomb expanded
  &ag_set_18   ;18 - Floating bomb chase (loop)
  &ag_set_19   ;19 - Core P2 attack anim
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
  sprite-set < #$0000, &ag_grp_core_idle >
]

ag_set_01 [
  sprite-set < #$0000, &ag_grp_core_idle >
]

ag_set_02 [
  sprite-set < #$0000, &ag_grp_core_idle >
]

ag_set_03 [
  sprite-set < #$0005, &ag_grp_core_idle >
  sprite-set < #$0000, &ag_grp_core_idle >
]

ag_set_04 [
  sprite-set < #$0007, &ag_grp_core_idle >
  sprite-set < #$0007, &ag_grp_core_idle >
  sprite-set < #$0000, &ag_grp_empty >
]

; --- Phase 1: Bits ---

ag_set_05 [
  sprite-set < #$0000, &ag_grp_bit_idle >
]

ag_set_06 [
  sprite-set < #$0003, &ag_grp_bit_idle >
  sprite-set < #$0000, &ag_grp_bit_idle >
]

ag_set_07 [
  sprite-set < #$0003, &ag_grp_bit_idle >
  sprite-set < #$0000, &ag_grp_bit_idle >
]

ag_set_0B [
  sprite-set < #$0000, &ag_grp_bit_idle >
]

ag_set_16 [
  sprite-set < #$0003, &ag_grp_bit_idle >
  sprite-set < #$0000, &ag_grp_bit_idle >
]

; --- Phase 1: Launchers ---

ag_set_08 [
  sprite-set < #$0000, &ag_grp_launcher_idle >
]

ag_set_09 [
  sprite-set < #$0003, &ag_grp_launcher_idle >
  sprite-set < #$0000, &ag_grp_launcher_idle >
]

ag_set_0A [
  sprite-set < #$0003, &ag_grp_launcher_idle >
  sprite-set < #$0000, &ag_grp_launcher_idle >
]

ag_set_1A [
  sprite-set < #$0003, &ag_grp_launcher_idle >
  sprite-set < #$0000, &ag_grp_launcher_idle >
]

; --- Phase 1/2: Projectiles ---

; #12: Nuke ball descent (code_09B8B6, P2 attack)
ag_set_12 [
  sprite-set < #$0000, &ag_grp_bubble2 >
]

; #13: Ring projectile expand (code_09B8F3, spawned by nuke ball)
ag_set_13 [
  sprite-set < #$0003, &ag_grp_shotgun_2 >
  sprite-set < #$0000, &ag_grp_shotgun_2 >
]

; #15: Falling star particle (code_09B787)
ag_set_15 [
  sprite-set < #$0000, &ag_grp_shotgun_0 >
]

; --- Phase 2: Core vulnerable ---

; #19: Core P2 attack anim (loc_09AB8B)
ag_set_19 [
  sprite-set < #$0000, &ag_grp_core_idle >
]

; --- Phase 2: Dead bit fire ---

; #1C: Dead bit fire animation (code_09B3EA)
ag_set_1C [
  sprite-set < #$0003, &ag_grp_bubble3 >
  sprite-set < #$0000, &ag_grp_shotgun_1 >
]

; --- Meteor attack sequence (code_09B3FD) ---
; Dead bit fire callback spawns this as a meteor projectile.
; MoveToward(#0C, #02) guides it toward the player, then impact
; check → explosion → debris rain.

; #0C: Meteor descending toward player (MoveToward + AnimOnce)
ag_set_0C [
  sprite-set < #$0003, &ag_grp_bubble2 >
  sprite-set < #$0000, &ag_grp_bubble2 >
]

; #0D: Meteor impact explosion (AnimOnce)
ag_set_0D [
  sprite-set < #$0003, &ag_grp_bubble2 >
  sprite-set < #$0003, &ag_grp_shotgun_2 >
  sprite-set < #$0000, &ag_grp_shotgun_1 >
]

; #0E: Meteor debris falling (StageSpriteLoopMoveY, AnimLoop)
ag_set_0E [
  sprite-set < #$0003, &ag_grp_shotgun_1 >
  sprite-set < #$0003, &ag_grp_shotgun_2 >
  sprite-set < #$0003, &ag_grp_shotgun_3 >
  sprite-set < #$0003, &ag_grp_shotgun_4 >
  sprite-set < #$0000, &ag_grp_shotgun_1 >
]

; #0F: Meteor shrapnel rain (StageSpriteLoopMoveY, AnimLoop)
ag_set_0F [
  sprite-set < #$0003, &ag_grp_shotgun_1 >
  sprite-set < #$0000, &ag_grp_shotgun_2 >
]

; #10: Explosion sparkle A (replaces spriteset_enemies #07)
ag_set_10 [
  sprite-set < #$0003, &ag_grp_shotgun_1 >
  sprite-set < #$0003, &ag_grp_shotgun_2 >
  sprite-set < #$0000, &ag_grp_shotgun_1 >
]

; --- Bit fire projectile (code_09B500/B541) ---
; Arm bits fire 5 projectiles per arm.
; StageSpriteLoop(#11, #20) for right, (#91, #20) for left (mirrored).
; Flies horizontally via StageMoveX.

; #11: Bit fire projectile (StageSpriteLoop, AnimLoop)
ag_set_11 [
  sprite-set < #$0003, &ag_grp_shotgun_1 >
  sprite-set < #$0003, &ag_grp_shotgun_2 >
  sprite-set < #$0003, &ag_grp_shotgun_3 >
  sprite-set < #$0003, &ag_grp_shotgun_4 >
  sprite-set < #$0000, &ag_grp_shotgun_1 >
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
  sprite-set < #$0003, &ag_grp_bubble2 >
  sprite-set < #$0000, &ag_grp_bubble2 >
]

; #18: Floating bomb chasing player (MoveToward + AnimLoop)
ag_set_18 [
  sprite-set < #$0003, &ag_grp_bubble >
  sprite-set < #$0003, &ag_grp_bubble2 >
  sprite-set < #$0003, &ag_grp_bubble3 >
  sprite-set < #$0003, &ag_grp_bubble4 >
]

; --- Arm bit recovery (code_09B31E / code_09B37A) ---
; Transition between arm attack and idle. Also used mirrored (#9B).

; #1B: Bit recovery animation
ag_set_1B [
  sprite-set < #$0003, &ag_grp_bit_idle >
  sprite-set < #$0000, &ag_grp_bit_idle >
]

; #1D: Explosion sparkle B (replaces spriteset_enemies #01)
ag_set_1D [
  sprite-set < #$0003, &ag_grp_shotgun_2 >
  sprite-set < #$0003, &ag_grp_shotgun_1 >
  sprite-set < #$0000, &ag_grp_shotgun_2 >
]

; #31: Death explosion (replaces spriteset_enemies #02)
ag_set_31 [
  sprite-set < #$0003, &ag_grp_bubble_pop1 >
  sprite-set < #$0003, &ag_grp_bubble_pop2 >
  sprite-set < #$0003, &ag_grp_bubble_pop3 >
  sprite-set < #$0003, &ag_grp_bubble_pop4 >
  sprite-set < #$0003, &ag_grp_bubble_pop5 >
]

; --- Bubble death / Floor beam ---

; #43: Bubble death pop — floating bomb burst effect.
; Shows bubble → pop → debris scatter. Use when a floating
; bomb is destroyed, before the death explosion (#31).
ag_set_43 [
  sprite-set < #$0002, &ag_grp_bubble_death >
  sprite-set < #$0002, &ag_grp_bubble_pop >
  sprite-set < #$0002, &ag_grp_bubble_debris >
  sprite-set < #$0002, &ag_grp_bdeath_3 >
  sprite-set < #$0000, &ag_grp_bdeath_4 >
]

; #44: Floor beam effect — beam impact / ground strike.
; Beam particle expands into a wide floor beam.
ag_set_44 [
  sprite-set < #$0003, &ag_grp_shotgun_0 >
  sprite-set < #$0000, &ag_grp_bubble4 >
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
; Phase 1/2 Metasprites (upper page tiles $100+)
;
; Tile index = $100 + col + row*$10 on the 128x128 sprite page.
; All sprite tiles are large (16x16, size=1).
;
; Tile attr encoding: VHOOPPPn nnnnnnnn
;   OO=01 stored → OO=11 (priority 3) after $20 XOR
;   n bit 8 = 1 (upper page)
;
; Palette attr prefixes (upper page):
;   Palette 3 (core):     $17xx normal, $57xx H-flip
;   Palette 4 (launcher): $19xx normal, $59xx H-flip
;   Palette 5 (proj):     $1Bxx normal, $5Bxx H-flip
;   Palette 6 (bits):     $1Dxx normal, $5Dxx H-flip
; ============================================================

; --- Core body (96x64 = 12L left + 12L H-mirrored right) ---
; Left half: (0,0)-(4,6), palette 3, tiles $100-$164
; Right half: same tiles with H-flip, mirrored column order
; Full body: 6 large tiles wide x 4 tall = 96x64 px
; x_mirr = $50 - x, y_vflip = $30 - y

ag_grp_core_idle [
  sprite-group < #28, #28, #20, #18, #F8, #F0, #01, #01, #D0, #60, #C0, #40, #14, [
    ; Left half — palette 3 ($17xx)
    sprite-part < #01, #00, #50, #00, #38, #$1700 >
    sprite-part < #01, #10, #40, #00, #38, #$1702 >
    sprite-part < #01, #18, #38, #00, #38, #$1703 >
    sprite-part < #01, #00, #50, #10, #28, #$1720 >
    sprite-part < #01, #10, #40, #10, #28, #$1722 >
    sprite-part < #01, #18, #38, #10, #28, #$1723 >
    sprite-part < #01, #00, #50, #20, #18, #$1740 >
    sprite-part < #01, #10, #40, #20, #18, #$1742 >
    sprite-part < #01, #18, #38, #20, #18, #$1743 >
    sprite-part < #01, #18, #38, #28, #10, #$1753 >
    ; Right half — palette 3 H-flipped ($57xx), columns reversed
    sprite-part < #01, #28, #28, #00, #38, #$5703 >
    sprite-part < #01, #30, #20, #00, #38, #$5702 >
    sprite-part < #01, #40, #10, #00, #38, #$5700 >
    sprite-part < #01, #28, #28, #10, #28, #$5723 >
    sprite-part < #01, #30, #20, #10, #28, #$5722 >
    sprite-part < #01, #40, #10, #10, #28, #$5720 >
    sprite-part < #01, #28, #28, #20, #18, #$5743 >
    sprite-part < #01, #30, #20, #20, #18, #$5742 >
    sprite-part < #01, #40, #10, #20, #18, #$5740 >
    sprite-part < #01, #28, #28, #28, #10, #$5753 >
  ] >
]

; --- Left Bit (32x32 = 2x2 large tiles) ---
; Tiles at (6,0)(8,0)(6,2)(8,2), palette 6
; Right bit uses engine H-mirror (x_mirr + XOR H-flip)
; x_mirr = $10 - x, y_vflip = $10 - y

ag_grp_bit_idle [
  sprite-group < #10, #10, #10, #10, #F8, #F0, #01, #01, #F0, #10, #F0, #10, #04, [
    sprite-part < #01, #00, #20, #00, #20, #$1D05 >
    sprite-part < #01, #10, #10, #00, #20, #$1D07 >
    sprite-part < #01, #00, #20, #10, #10, #$1D25 >
    sprite-part < #01, #10, #10, #10, #10, #$1D27 >
  ] >
]

; --- Left Launcher (32x80 = 2x5 large tiles) ---
; Tiles at (6,4)(8,4)(6,6)(8,6)(6,8)(8,8)(6,A)(8,A)(6,C)(8,C), palette 4
; Right launcher uses engine H-mirror
; x_mirr = $10 - x, y_vflip = $40 - y

ag_grp_launcher_idle [
  sprite-group < #10, #10, #20, #28, #F8, #F0, #01, #01, #F0, #10, #DC, #24, #0A, [
    sprite-part < #01, #00, #20, #00, #48, #$1945 >
    sprite-part < #01, #08, #18, #00, #48, #$1946 >
    sprite-part < #01, #00, #20, #10, #38, #$1965 >
    sprite-part < #01, #08, #18, #10, #38, #$1966 >
    sprite-part < #01, #00, #20, #20, #28, #$1985 >
    sprite-part < #01, #08, #18, #20, #28, #$1986 >
    sprite-part < #01, #00, #20, #30, #18, #$19A5 >
    sprite-part < #01, #10, #10, #30, #18, #$19A7 >
    sprite-part < #01, #00, #20, #40, #08, #$19C5 >
    sprite-part < #01, #10, #10, #40, #08, #$19C7 >
  ] >
]

; --- Launcher bubble projectile (16x16 each, 4 frames) ---
; Tiles at (0,E)(2,E)(4,E)(6,E), palette 5

ag_grp_bubble [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1DE0 >
  ] >
]

ag_grp_bubble2 [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1DE2 >
  ] >
]

ag_grp_bubble3 [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1DE4 >
  ] >
]

ag_grp_bubble4 [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1DE6 >
  ] >
]
ag_grp_bubble_pop1 [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #08, #F8, #08, #01, [
    sprite-part < #01, #00, #10, #00, #10, #$1DCE >
  ] >
]

ag_grp_bubble_pop2 [
  sprite-group < #10, #10, #10, #10, #F8, #F0, #01, #01, #F8, #08, #F8, #08, #04, [
    sprite-part < #01, #00, #20, #00, #20, #$1DE8 >
    sprite-part < #01, #10, #10, #00, #20, #$5DE8 >
    sprite-part < #01, #00, #20, #10, #10, #$9DE8 >
    sprite-part < #01, #10, #10, #10, #10, #$DDE8 >
  ] >
]

ag_grp_bubble_pop3 [
  sprite-group < #10, #10, #10, #10, #F8, #F0, #01, #01, #F8, #08, #F8, #08, #01, [
    sprite-part < #01, #00, #20, #00, #20, #$1DEA >
    sprite-part < #01, #10, #10, #00, #20, #$5DEA >
    sprite-part < #01, #00, #20, #10, #10, #$9DEA >
    sprite-part < #01, #10, #10, #10, #10, #$DDEA >
  ] >
]

ag_grp_bubble_pop4 [
  sprite-group < #10, #10, #10, #10, #F8, #F0, #01, #01, #F8, #08, #F8, #08, #04, [
    sprite-part < #01, #00, #20, #00, #20, #$1DEC >
    sprite-part < #01, #10, #10, #00, #20, #$5DEC >
    sprite-part < #01, #00, #20, #10, #10, #$9DEC >
    sprite-part < #01, #10, #10, #10, #10, #$DDEC >
  ] >
]

ag_grp_bubble_pop5 [
  sprite-group < #10, #10, #10, #10, #F8, #F0, #01, #01, #F8, #08, #F8, #08, #01, [
    sprite-part < #01, #00, #20, #00, #20, #$1DEE >
    sprite-part < #01, #10, #10, #00, #20, #$5DEE >
    sprite-part < #01, #00, #20, #10, #10, #$9DEE >
    sprite-part < #01, #10, #10, #10, #10, #$DDEE >
  ] >
]

; --- Bit shotgun projectile (16x16 each, 4 frames) ---
; Tiles at (C,C)(E,C), palette 6; frames 2-3 use H-flip variants
; Frame 0: tile $1CC, Frame 1: tile $1CE
; Frame 2: tile $1CC H-flip, Frame 3: tile $1CE H-flip

ag_grp_shotgun_0 [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1DCC >
  ] >
]

ag_grp_shotgun_1 [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #08, #F8, #08, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1D88 >
  ] >
]

ag_grp_shotgun_2 [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #08, #F8, #08, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$5D8A >
  ] >
]

ag_grp_shotgun_3 [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #08, #F8, #08, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$5D8C >
  ] >
]

ag_grp_shotgun_4 [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #08, #F8, #08, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$5D8E >
  ] >
]

; --- Bubble death (16x16 each, 5 frames) ---
; Frame 0: (E,C) tile $1CE; Frames 1-2: (C,E)(E,E) tiles $1EC,$1EE
; Frames 3-4: H-flip variants of $1CE and $1EC

ag_grp_bubble_death [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1DCE >
  ] >
]

ag_grp_bubble_pop [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1DEC >
  ] >
]

ag_grp_bubble_debris [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$1DEE >
  ] >
]

ag_grp_bdeath_3 [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$5DCE >
  ] >
]

ag_grp_bdeath_4 [
  sprite-group < #08, #08, #10, #10, #F8, #F0, #01, #01, #F8, #10, #F0, #10, #01, [
    sprite-part < #01, #00, #00, #00, #00, #$5DEC >
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
