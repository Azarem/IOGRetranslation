

!scene_current                  0644
!joypad_mask_std                065A
!player_flags                   09AE
!INIDISP                        2100
!VMADDL                         2116
!_TM                            212C

------------------------------------------------
?INCLUDE 'system_strings'
------------------------------------------------
string_01DA47 |[NHM:4][CUR:50,4]PUSH█START█BUTTON|
;string_01DA5E |[NHM:4][CUR:55,3]RETRANSLATED|
string_01DA5E |[NHM:14][CUR:9C,3]RETRANSLATED[NHM:0][CUR:48,6](C)█1994██QUINTET/ENIX[CUR:C8,6]MARIKO█OHARA/MOTO█HAGIO|

------------------------------------------------
?INCLUDE 'scene_meta'
------------------------------------------------

entry_FC [
  ppu < #25 >
  music < #1F, #00, @bgm_illusion_of_gaia >
  bitmap < #00, #20, #00, @gfx_title, #00 >
  palette < #00, #80, #00, @pal_title >
  tileset < #00, #20, #00, #03, @set_title >
  tilemap < #01, @map_title_main >
  tilemap < #02, @map_title_effect >
  bitmap < #00, #10, #10, @gfx_title_actors, #01 >
  palette < #00, #60, #A0, @pal_title_actors >
  spritemap < #$04F4, #00, @spm_title_actors >
]

------------------------------------------------
?INCLUDE 'scene_thinkers'
------------------------------------------------

thinker_0CEB2F [
  thinker < #74, @thinker_00B520 >
  thinker < #00, @thinker_00BCDF >
  thinker < #00, @thinker_00BCB3 >
  thinker < #24, @parallax_thinker >
  thinker < #00, @thinker_00BC91 >
]

------------------------------------------------
?INCLUDE 'sFC_actor_0BC924'
------------------------------------------------

e_sFC_actor_0BC924 {
    LDA #$4001
    TSB $09EC
    LDA #$0000
    STA $7F0A00
    COP [50] ( @pal_title, #00, #00, #08 )
    COP [50] ( @palette_1E1D35, #00, #00, #08 )
    COP [A0] ( @code_0BC933, #$0060, #$00B6, #$1800 )
    COP [A0] ( @code_0BC945, #$0080, #$00B6, #$1800 )
    COP [A0] ( @code_0BC957, #$00A0, #$00B6, #$1800 )
    COP [A0] ( @code_0BC988, #$0080, #$0048, #$1800 )
    COP [A0] ( @title_sprite, #$0080, #$0048, #$2000 )
    SEP #$20
    LDA #$17
    STA $_TM
    REP #$20
    LDA #$0804
    STA $064A
    COP [DA] ( #B3 )
    COP [BD] ( @string_01DA5E )
    COP [DA] ( #77 )
    COP [BD] ( @string_01DA47 )
    COP [DB] ( #$09D3 )
    COP [CC] ( #F4 )
    LDA #$0804
    STA $064A
    COP [26] ( #8C, #$0000, #$0000, #00, #$1100 )
    COP [C1]
    RTL 
}


code_0BC933 {
    COP [B6] ( #30 )
    COP [9C] ( @code_0BC969, #$1000 )
    COP [C1]
    COP [80] ( #00 )
    COP [89]
    RTL 
}


code_0BC945 {
    COP [B6] ( #30 )
    COP [9C] ( @code_0BC969, #$1000 )
    COP [C1]
    COP [80] ( #01 )
    COP [89]
    RTL 
}


code_0BC957 {
    COP [B6] ( #30 )
    COP [9C] ( @code_0BC969, #$1000 )
    COP [C1]
    COP [80] ( #02 )
    COP [89]
    RTL 
}


code_0BC969 {
    COP [B7] ( #0A )
    COP [B6] ( #30 )
    COP [C1]
    COP [80] ( #03 )
    COP [89]
    RTL 
}

code_0BC988 {
    COP [B6] ( #20 )
    COP [84] ( #04, #F0 )
    COP [8A]
    COP [85] ( #04, #3A, #02 )
    COP [8A]
    COP [DA] ( #3B )
    ;SEP #$20    
    ;LDA #$16
    ;STA $_TM
    ;REP #$20
    COP [C1]
    ;COP [80] ( #04 )
    ;COP [89]
    RTL 
}

title_sprite {
    COP [80] ( #05 )
    COP [DA] ( #A8 )
    LDA #$0000
    STA $7F0BC2
    STA $7F0BC4
    STA $7F0BC6
    STA $7F0BC8
    STA $7F0BCA
    STA $7F0BCC
    STA $7F0BCE
    STA $7F0BD0
    STA $7F0BD2
    STA $7F0BD4
    STA $7F0BD6
    STA $7F0BD8
    STA $7F0BDA
    STA $7F0BDC
    STA $7F0BDE
    COP [B6] ( #30 )
    LDA #$1800
    STA $10
    COP [3C] ( @title_thinker )
    COP [C1]
    COP [80] ( #05 )
    COP [89]
    RTL 
}

title_thinker {
    COP [37] ( #80 )
    COP [39]
    COP [3D]
    RTL 
}

------------------------------------------------
?INCLUDE 'sFC_actor_0BC9AE'
------------------------------------------------
;Immediate start press

e_sFC_actor_0BC9AE {
    BRA e_sFC_actor_0BC9BD
}


------------------------------------------------
?INCLUDE 'chunk_03BAE1'
------------------------------------------------
;Load special sprite asset for title scene

func_03DFF8 {
    PHP 
    LDA $scene_current
    CMP #$F7
    BEQ code_03E04E
    CMP #$FC
    BEQ load_fc_asset
    CMP #$FE
    BEQ code_03E04E
    CMP #$8C
    BEQ code_03E04E
    LDX #$4200
    STX $VMADDL
    LDX #$&bmp_000000
    LDA #$^bmp_000000
    LDY #$1C00
    JSL $@func_0283A2
    LDA $player_flags
    BIT #$08
    BEQ code_03E035
    LDX #$4400
    STX $VMADDL
    LDX #$&misc_fx_1CD580
    LDA #$^misc_fx_1CD580
    LDY #$0800
    JSL $@func_0283A2
    PLP 
    RTL 
}

load_fc_asset {
    LDX #$4200
    STX $VMADDL
    LDX #$&gfx_title_exprite+2
    LDA #$^gfx_title_exprite
    LDY #$1C00
    JSL $@func_0283A2
    PLP 
    RTL
}

------------------------------------------------
?INCLUDE 'palette_bundles'
------------------------------------------------

palette_bundles [
  &bundle_168100   ;00
  &bundle_16818D   ;01
  &bundle_168204   ;02
  &bundle_1682AB   ;03
  &bundle_1682D2   ;04
  &bundle_168319   ;05
  &bundle_1683F0   ;06
  &bundle_168467   ;07
  &bundle_16849E   ;08
  &bundle_1684D5   ;09
  &bundle_1685D2   ;0A
  &bundle_1685F7   ;0B
  &bundle_16861C   ;0C
  &bundle_168641   ;0D
  &bundle_168666   ;0E
  &bundle_16868B   ;0F
  &bundle_168792   ;10
  &bundle_168899   ;11
  &bundle_1688E0   ;12
  &bundle_168927   ;13
  &bundle_1689AE   ;14
  &bundle_168A3F   ;15
  &bundle_168B46   ;16
  &bundle_168B95   ;17
  &bundle_168BDC   ;18
  &bundle_168C43   ;19
  &bundle_168CAA   ;1A
  &bundle_168D21   ;1B
  &bundle_168D88   ;1C
  &bundle_168DEF   ;1D
  &bundle_168E0E   ;1E
  &bundle_168E55   ;1F
  &bundle_168F5C   ;20
  &bundle_1690B7   ;21
  &bundle_169190   ;22
  &bundle_1691B7   ;23
  &bundle_1692D8   ;24
  &bundle_1693F9   ;25
  &bundle_169470   ;26
  &bundle_169957   ;27
  &bundle_169A60   ;28
  &bundle_169A93   ;29
  &bundle_169BEE   ;2A
  &bundle_169D33   ;2B
  &bundle_169E78   ;2C
  &bundle_169FBD   ;2D
  &bundle_16A0C4   ;2E
  &bundle_16A19D   ;2F
  &bundle_16A204   ;30
  &bundle_16A271   ;31
  &bundle_16A2DE   ;32
  &bundle_16A325   ;33
  &bundle_16A39C   ;34
  &bundle_16A3CB   ;35
  &bundle_16A492   ;36
  &bundle_16A4E1   ;37
  &bundle_16A5F0   ;38
  &bundle_16A669   ;39
  &bundle_16A75A   ;3A
  &bundle_16A7D1   ;3B
  &bundle_16A802   ;3C
  &bundle_16A847   ;3D
  &bundle_16A878   ;3E
  &bundle_16A8BD   ;3F
  &bundle_16A8DA   ;40
  &bundle_16A911   ;41
  &bundle_16ADF8   ;42
  &bundle_16AE6F   ;43
  &bundle_16AF10   ;44
  &bundle_16AF3F   ;45
  &bundle_16AF8E   ;46
  &bundle_16AFCF   ;47
  &bundle_16AFF6   ;48
  &bundle_16B06D   ;49
  &bundle_16B08A   ;4A
  &bundle_16B1AB   ;4B
  &bundle_16B2F0   ;4C
  &bundle_16B305   ;4D
  &bundle_16B3F2   ;4E
  &bundle_16B4DF   ;4F
  &bundle_16B52E   ;50
  &bundle_16B64F   ;51
  &bundle_16B770   ;52
  &bundle_16B891   ;53
  &bundle_16B9B2   ;54
  &bundle_16BAD3   ;55
  &bundle_16BBF4   ;56
  &bundle_16BD15   ;57
  &bundle_16BE36   ;58
  &bundle_16BF57   ;59
  &bundle_16C078   ;5A
  &bundle_16C1BD   ;5B
  &bundle_16C26E   ;5C
  &bundle_16C293   ;5D
  &bundle_16C2B8   ;5E
  &bundle_16C2E7   ;5F
  &bundle_16C30E   ;60
  &bundle_16C317   ;61
  &bundle_16C34E   ;62
  &bundle_16C46F   ;63
  &bundle_16C4A4   ;64
  &bundle_16C4DB   ;65
  &bundle_16C588   ;66
  &bundle_16C5BC   ;67
  &bundle_16C5F0   ;68
  &bundle_16C621   ;69
  &bundle_16C65E   ;6A
  &bundle_16C78F   ;6B
  &bundle_16C7A4   ;6C
  &bundle_16C7C9   ;6D
  &bundle_16CAF8   ;6E
  &bundle_16CDF7   ;6F
  &bundle_16CE6A   ;70
  &bundle_16CE8F   ;71
  &bundle_16CF40   ;72
  &bundle_16CFCF   ;73
  &bundle_16D046   ;74
  &bundle_16D17B   ;75
  &bundle_16D1C2   ;76
  &bundle_16D209   ;77
  &bundle_16D310   ;78
  &bundle_16D417   ;79
  &bundle_16D466   ;7A
  &bundle_16D48B   ;7B
  &bundle_16D4B0   ;7C
  &bundle_16D591   ;7D
  &bundle_16D6C2   ;7E
  &bundle_16D6FB   ;7F
  &panim01050420
]

panim01050420 [
  bundle < #01, &panim01050420_frame00, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame01, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame02, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame03, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame04, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame05, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame06, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame07, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame08, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame09, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame0A, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame0B, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame0C, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame0D, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame0E, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame0F, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame10, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame11, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame12, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame13, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame14, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame15, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame16, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame17, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame18, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame19, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame1A, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame1B, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame1C, #E1, #1D, #00 >
  bundle < #01, &panim01050420_frame1D, #E1, #1D, #00 >
]

panim01050420_frame00 [
  #$0000
  #$0000
  #$0001
  #$0000
  #$0001
  #$0021
  #$0000
  #$0000
  #$0021
  #$0000
  #$0021
  #$0421
  #$0421
  #$0421
  #$0421
]

panim01050420_frame01 [
  #$0021
  #$0021
  #$0022
  #$0001
  #$0022
  #$0042
  #$0000
  #$0000
  #$0443
  #$0000
  #$0443
  #$0463
  #$0863
  #$0863
  #$0C63
]

panim01050420_frame02 [
  #$0022
  #$0022
  #$0043
  #$0021
  #$0443
  #$0464
  #$0001
  #$0001
  #$0484
  #$0000
  #$0884
  #$0884
  #$0C84
  #$1084
  #$1084
]

panim01050420_frame03 [
  #$0022
  #$0043
  #$0044
  #$0022
  #$0464
  #$0485
  #$0021
  #$0001
  #$08A5
  #$0000
  #$08A5
  #$0CA6
  #$10C6
  #$14C6
  #$18C6
]

panim01050420_frame04 [
  #$0043
  #$0064
  #$0465
  #$0022
  #$0485
  #$08A6
  #$0022
  #$0021
  #$08C7
  #$0400
  #$0CE7
  #$10E7
  #$14E7
  #$18E7
  #$2108
]

panim01050420_frame05 [
  #$0044
  #$0064
  #$0486
  #$0023
  #$04A7
  #$08C7
  #$0022
  #$0022
  #$0CE8
  #$0400
  #$1108
  #$1508
  #$1908
  #$1D29
  #$2529
]

panim01050420_frame06 [
  #$0064
  #$0485
  #$0487
  #$0043
  #$08C8
  #$08E8
  #$0022
  #$0022
  #$0D29
  #$0420
  #$1129
  #$192A
  #$1D4A
  #$254A
  #$294A
]

panim01050420_frame07 [
  #$0065
  #$0486
  #$04A8
  #$0043
  #$08C9
  #$0D09
  #$0043
  #$0022
  #$0D4B
  #$0420
  #$154B
  #$1D6B
  #$216B
  #$296B
  #$318C
]

panim01050420_frame08 [
  #$0085
  #$04A7
  #$04A9
  #$0044
  #$08EA
  #$0D2A
  #$0043
  #$0023
  #$116C
  #$0420
  #$196C
  #$1D8C
  #$258C
  #$2DAD
  #$35AD
]

panim01050420_frame09 [
  #$0086
  #$04A7
  #$04CA
  #$0044
  #$090B
  #$0D4C
  #$0043
  #$0023
  #$118D
  #$0420
  #$19AD
  #$21AD
  #$29AD
  #$31CE
  #$39CE
]

panim01050420_frame0A [
  #$0486
  #$04C8
  #$08CA
  #$0065
  #$0D0C
  #$114D
  #$0444
  #$0443
  #$15AE
  #$0821
  #$1DCE
  #$25CF
  #$2DEF
  #$35EF
  #$4210
]

panim01050420_frame0B [
  #$04A7
  #$04C8
  #$08EB
  #$0065
  #$0D2C
  #$116E
  #$0444
  #$0443
  #$15CF
  #$0821
  #$1DEF
  #$29F0
  #$3210
  #$3A10
  #$4631
]

panim01050420_frame0C [
  #$04A7
  #$04E9
  #$08EC
  #$0066
  #$0D4D
  #$118E
  #$0464
  #$0444
  #$19F0
  #$0821
  #$2210
  #$2A11
  #$3631
  #$3E31
  #$4A52
]

panim01050420_frame0D [
  #$04A8
  #$04EA
  #$090D
  #$0066
  #$0D4E
  #$15AF
  #$0465
  #$0444
  #$1A11
  #$0821
  #$2231
  #$2E32
  #$3652
  #$4273
  #$4E73
]

panim01050420_frame0E [
  #$04C8
  #$090A
  #$090E
  #$0086
  #$116F
  #$15D0
  #$0465
  #$0444
  #$1A32
  #$0841
  #$2652
  #$3253
  #$3A73
  #$4694
  #$5294
]

panim01050420_frame0F [
  #$04C9
  #$090B
  #$092E
  #$0087
  #$1190
  #$15D1
  #$0465
  #$0444
  #$1E53
  #$0841
  #$2673
  #$3274
  #$3E94
  #$4AB5
  #$56B5
]

panim01050420_frame10 [
  #$04C9
  #$090B
  #$092F
  #$0087
  #$1190
  #$15F2
  #$0465
  #$0445
  #$1E74
  #$0841
  #$2A74
  #$3695
  #$42B5
  #$4ED6
  #$5AD6
]

panim01050420_frame11 [
  #$04CA
  #$092C
  #$0D50
  #$0087
  #$11B1
  #$1A13
  #$0466
  #$0465
  #$1E75
  #$0C41
  #$2A95
  #$36B6
  #$42D6
  #$4EF7
  #$5EF7
]

panim01050420_frame12 [
  #$04EA
  #$092C
  #$0D50
  #$0087
  #$11B2
  #$1A13
  #$0486
  #$0465
  #$1E96
  #$0C41
  #$2EB6
  #$3AD7
  #$46F7
  #$52F7
  #$6318
]

panim01050420_frame13 [
  #$04EA
  #$092D
  #$0D51
  #$0088
  #$11D2
  #$1A34
  #$0486
  #$0465
  #$22B7
  #$0C41
  #$2ED7
  #$3AF7
  #$4AF7
  #$5718
  #$6739
]

panim01050420_frame14 [
  #$04EB
  #$094D
  #$0D71
  #$00A8
  #$15D3
  #$1A35
  #$0486
  #$0465
  #$22D7
  #$0C41
  #$2ED7
  #$3EF8
  #$4B18
  #$5B39
  #$6B5A
]

panim01050420_frame15 [
  #$04EB
  #$094D
  #$0D72
  #$00A8
  #$15D4
  #$1A55
  #$0486
  #$0466
  #$22D8
  #$0C41
  #$32F8
  #$3F19
  #$4F39
  #$5B5A
  #$6F7B
]

panim01050420_frame16 [
  #$050B
  #$094E
  #$0D72
  #$00A9
  #$15F4
  #$1E56
  #$0487
  #$0466
  #$26F9
  #$0C41
  #$3319
  #$433A
  #$4F5A
  #$5F7B
  #$6F7B
]

panim01050420_frame17 [
  #$050C
  #$096E
  #$0D93
  #$00A9
  #$15F5
  #$1E77
  #$0487
  #$0466
  #$2719
  #$0C41
  #$3319
  #$433A
  #$535A
  #$637B
  #$739C
]

panim01050420_frame18 [
  #$050C
  #$096F
  #$0D93
  #$00A9
  #$1615
  #$1E77
  #$0487
  #$0466
  #$271A
  #$0C41
  #$373A
  #$475B
  #$537B
  #$639C
  #$77BD
]

panim01050420_frame19 [
  #$050C
  #$096F
  #$0D94
  #$00A9
  #$1616
  #$1E98
  #$0487
  #$0466
  #$273A
  #$0C41
  #$375A
  #$475B
  #$577B
  #$679C
  #$77BD
]

panim01050420_frame1A [
  #$050C
  #$096F
  #$0D94
  #$04A9
  #$1616
  #$1E98
  #$0487
  #$0466
  #$273B
  #$0C41
  #$375B
  #$477C
  #$579C
  #$67BD
  #$7BDE
]

panim01050420_frame1B [
  #$092D
  #$096F
  #$0DB4
  #$04CA
  #$1A36
  #$1E98
  #$08A7
  #$0866
  #$2B5B
  #$0C42
  #$3B5B
  #$4B7C
  #$5B9C
  #$6BDE
  #$7FFF
]

panim01050420_frame1C [
  #$092D
  #$0D90
  #$11B5
  #$04CA
  #$1A37
  #$22B9
  #$08A8
  #$0887
  #$2B5C
  #$1062
  #$3B7C
  #$4B9D
  #$5BBD
  #$6BDE
  #$7FFF
]

panim01050420_frame1D [
  #$092D
  #$0D90
  #$11B5
  #$04CA
  #$1A37
  #$22B9
  #$08A8
  #$0887
  #$2B5C
  #$1062
  #$3B7C
  #$4B9D
  #$5BBD
  #$6BDE
  #$7FFF
]
