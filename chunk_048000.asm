?BANK 04
?INCLUDE 'chunk_00B520'
?INCLUDE 'chunk_00DA78'
?INCLUDE 'table_0EDA00'
?INCLUDE 'table_0EE000'
?INCLUDE 'chunk_03BAE1'

!joypad_mask_std                065A
!camera_bounds_y                06DC
!player_x_pos                   09A2
!player_y_pos                   09A4
!player_actor                   09AA
!player_flags                   09AE
!player_speed_ew                09B2
!INIDISP                        2100
!_TM                            212C
!CGWSEL                         2130
!CGADSUB                        2131
!APUIO1                         2141

---------------------------------------------

head_048000 [
  h_event < #01, #00, #03 >   ;00
]

---------------------------------------------

func_048003 {
    RTL 
}


---------------------------------------------

head_048004 [
  h_event < #23, #00, #18 >   ;00
]

---------------------------------------------

func_048007 {
    LDA #$0200
    TSB $12
    COP [B2]
    COP [B6] ( #30 )

  code_048011:
    COP [C1]
    COP [23]
    STA $08
    PHA 
    AND #$001F
    CLC 
    ADC #$0010
    ASL 
    ASL 
    ASL 
    ASL 
    STA $16
    PLA 
    AND #$0001
    BNE code_04802E
    JMP $&code_048069
}


code_04802E {
    LDA #$0320
    STA $14
    COP [C2]
    COP [CA] ( #03 )
    COP [87] ( #23, #20, #04, #01 )
    COP [8A]
    COP [83] ( #24, #04, #11 )
    COP [89]
    COP [83] ( #24, #04, #13 )
    COP [89]
    COP [81] ( #24, #04 )
    COP [89]
    COP [87] ( #23, #18, #04, #13 )
    COP [8A]
    COP [87] ( #23, #18, #04, #11 )
    COP [8A]
    COP [CB]
    JMP $&code_048011
}


code_048069 {
    LDA #$FFE0
    STA $14
    COP [C2]
    COP [CA] ( #03 )
    COP [87] ( #23, #20, #03, #01 )
    COP [8A]
    COP [83] ( #24, #03, #11 )
    COP [89]
    COP [83] ( #24, #03, #13 )
    COP [89]
    COP [81] ( #24, #03 )
    COP [89]
    COP [87] ( #23, #18, #03, #13 )
    COP [8A]
    COP [87] ( #23, #18, #03, #11 )
    COP [8A]
    COP [CB]
    JMP $&code_048011
    COP [07] ( #18 )
    RTL 
}


---------------------------------------------

head_0480A8 [
  h_event < #35, #00, #10 >   ;00
]

---------------------------------------------

func_0480AB {
    LDA #$0200
    TSB $12
    COP [0B]

  code_0480B2:
    COP [C1]

  code_0480B4:
    COP [84] ( #32, #06 )
    COP [8A]
    COP [CC] ( #02 )
    COP [C0] ( &code_0480F0 )
    COP [84] ( #34, #46 )
    COP [8A]
    COP [CE] ( #02 )
    COP [84] ( #34, #1E )
    COP [8A]
    COP [C0] ( &code_0480F5 )
    COP [84] ( #32, #06 )
    COP [8A]
    COP [84] ( #35, #3C )
    COP [8A]
    COP [D0] ( #03, #00, &code_0480B4 )
    COP [C0] ( &code_0480FA )
    COP [D2] ( #03, #00 )
    BRA code_0480B2
}


code_0480F0 {
    COP [BF] ( &widestring_0480FF )
    RTL 
}


code_0480F5 {
    COP [BF] ( &widestring_048112 )
    RTL 
}


code_0480FA {
    COP [BF] ( &widestring_048125 )
    RTL 
}


widestring_0480FF `[DEF][DLY:2]1..2..3..4..5..[END]`

widestring_048112 `[DEF][DLY:2]6..7..8..9..10![END]`

widestring_048125 `[DEF]Mmmm. [LU1:38]me...[END]`

---------------------------------------------

head_048134 [
  h_event < #1C, #00, #10 >   ;00
]

---------------------------------------------

func_048137 {
    COP [C0] ( &code_048166 )

  code_04813B:
    COP [0B]

  code_04813D:
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [85] ( #20, #02, #14 )
    COP [8A]
    COP [0B]
    COP [17] ( &code_048152 )
    BRA code_04813D
}


code_048152 {
    COP [CC] ( #03 )
    COP [0C]
    COP [85] ( #21, #06, #11 )
    COP [8A]
    COP [CE] ( #02 )
    COP [CE] ( #03 )
    BRA code_04813B
}


code_048166 {
    COP [BF] ( &widestring_04816B )
    RTL 
}


widestring_04816B `[DEF][LU1:1D]strange. This [N]game is like[N]"Red Light, [N]Green Lightˮ....[END]`

---------------------------------------------

head_0481A8 [
  h_event < #1C, #00, #10 >   ;00
]

---------------------------------------------

func_0481AB {
    COP [C0] ( &code_0481D1 )

  code_0481AF:
    COP [0B]

  code_0481B1:
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [85] ( #20, #02, #14 )
    COP [8A]
    COP [0B]
    COP [D0] ( #03, #00, &code_0481B1 )
    COP [0C]
    COP [85] ( #21, #06, #11 )
    COP [8A]
    BRA code_0481AF
}


code_0481D1 {
    COP [BF] ( &widestring_0481D6 )
    RTL 
}


widestring_0481D6 `[DEF]How [LU1:A6][LU1:98]we [LU1:70][N][LU1:C4]this?[END]`

---------------------------------------------

head_0481ED [
  h_event < #0C, #00, #10 >   ;00
]

---------------------------------------------

func_0481F0 {
    COP [C0] ( &code_0482CD )
    COP [C1]
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [86] ( #0E, #01, #11 )
    COP [8A]
    COP [85] ( #10, #0D, #12 )
    COP [8A]
    COP [86] ( #0F, #01, #12 )
    COP [8A]
    COP [0B]
    COP [84] ( #0B, #78 )
    COP [8A]
    COP [0C]
    COP [86] ( #0E, #01, #11 )
    COP [8A]
    COP [85] ( #10, #07, #12 )
    COP [8A]
    COP [86] ( #0E, #04, #11 )
    COP [8A]
    COP [85] ( #11, #01, #11 )
    COP [8A]
    COP [87] ( #11, #03, #11, #11 )
    COP [8A]
    COP [85] ( #11, #01, #11 )
    COP [8A]
    COP [86] ( #0E, #0B, #11 )
    COP [8A]
    COP [85] ( #11, #04, #11 )
    COP [8A]
    COP [0B]
    COP [84] ( #0B, #78 )
    COP [8A]
    COP [0C]
    COP [85] ( #10, #06, #12 )
    COP [8A]
    COP [87] ( #10, #04, #12, #11 )
    COP [8A]
    COP [85] ( #10, #06, #12 )
    COP [8A]
    COP [0B]
    COP [84] ( #0B, #78 )
    COP [8A]
    COP [0C]
    COP [85] ( #10, #06, #12 )
    COP [8A]
    COP [86] ( #0E, #01, #11 )
    COP [8A]
    COP [85] ( #10, #05, #12 )
    COP [8A]
    COP [86] ( #0F, #01, #12 )
    COP [8A]
    COP [0B]
    COP [84] ( #0B, #78 )
    COP [8A]
    COP [0C]
    COP [86] ( #0E, #01, #11 )
    COP [8A]
    COP [85] ( #11, #0C, #11 )
    COP [8A]
    COP [86] ( #0E, #01, #11 )
    COP [8A]
    COP [80] ( #0A )
    COP [89]
    COP [C0] ( &code_0482D2 )
    COP [0B]
    LDA #$0200
    TSB $12
    COP [C1]
    RTL 
}


code_0482CD {
    COP [BF] ( &widestring_0482D7 )
    RTL 
}


code_0482D2 {
    COP [BF] ( &widestring_04835C )
    RTL 
}


widestring_0482D7 `[DEF]Salesman: I travel[N][LU1:6D]to people's[N][LU2:77]selling weapons[N][LU2:BB]to fight demons.[FIN]We may [LU1:AF]in troubled[N]times, but I [LU1:FA]sell[N]a weapon to a child.[END]`

widestring_04835C `[DEF]Salesman:[N]Hmmm...[END]`

---------------------------------------------

head_04836F [
  h_event < #22, #00, #10 >   ;00
]

---------------------------------------------

func_048372 {
    LDA #$0200
    TSB $12
    COP [23]
    CMP #$00F8
    BCS code_0483AA
    CMP #$00C8
    BCS code_048393
    COP [C0] ( &code_0483E7 )
    COP [25] ( #06, #2F )
    COP [0B]
    COP [BC] ( #04, #00 )
    BRA code_0483D0
}


code_048393 {
    COP [C0] ( &code_0483EC )
    COP [25] ( #0B, #33 )
    COP [BB]
    LDA #$0002
    TSB $12
    COP [0B]
    COP [BC] ( #FC, #00 )
    BRA code_0483D0
}


code_0483AA {
    COP [D0] ( #D7, #01, &code_048393 )
    COP [C0] ( &code_0483F1 )
    COP [25] ( #29, #30 )
    COP [9E] ( %func_04844F, #$FFF0, #$0000, #$1000 )
    COP [BB]
    LDA #$0002
    TSB $12
    COP [0B]
    COP [BC] ( #FC, #FE )
}


code_0483D0 {
    COP [C1]
    COP [80] ( #22 )
    COP [89]
    LDA $player_y_pos
    CMP #$0250
    BCC code_0483E3
    COP [CC] ( #00 )
    RTL 
}


code_0483E3 {
    COP [CE] ( #00 )
    RTL 
}


code_0483E7 {
    COP [BF] ( &widestring_0483F6 )
    RTL 
}


code_0483EC {
    COP [BF] ( &widestring_04840F )
    RTL 
}


code_0483F1 {
    COP [BF] ( &widestring_048436 )
    RTL 
}


widestring_0483F6 `[DEF]Gosh.[N]I [LU1:78]pull it up...[END]`

widestring_04840F `[DEF][LU1:12]if I [LU1:B5]to[N][LU1:6E]place[N]I [LU1:78]pull it up...[END]`

widestring_048436 `[DEF]He lifted the[N][LU1:C7]teapot.[END]`

---------------------------------------------

func_04844F {
    LDA #$0200
    TSB $12
    COP [80] ( #3E )
    COP [89]
    COP [0B]
    COP [C0] ( &code_048462 )
    COP [C1]
    RTL 
}


code_048462 {
    COP [D0] ( #D7, #01, &code_048474 )
    COP [D4] ( #01, &code_048475 )
    COP [BF] ( &widestring_048479 )
    COP [CC] ( #D7 )
}


code_048474 {
    RTL 
}


code_048475 {
    JML $%code_00C6A1
}


widestring_048479 `[DLG:3,11][SIZ:D,3][LU1:67]found[N]a Red Jewel![END]`

---------------------------------------------

head_048494 [
  h_event < #0D, #00, #10 >   ;00
]

---------------------------------------------

func_048497 {
    LDA #$000A
    STA $7F0026, X
    JSL $%func_00C718
    COP [C0] ( &code_0484B2 )

  code_0484A6:
    JSL $%func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_0484A6
}


code_0484B2 {
    COP [BF] ( &widestring_0484B7 )
    RTL 
}


widestring_0484B7 `[DEF][LU1:1C]Will. How many[N][LU2:AA][LU1:98]I told you[N]not to [LU1:79]up here...[FIN]You [LU1:98]a habit of[N]jumping down from[N]places. [LU1:63]I guess[N]I [LU1:78][LU2:95]stop you.[END]`

---------------------------------------------

head_048531 [
  h_event < #02, #00, #10 >   ;00
]

---------------------------------------------

func_048534 {
    COP [D0] ( #27, #01, &code_04859B )
    COP [0B]
    COP [C1]
    LDA $player_y_pos
    CMP #$00B0
    BCS code_048573
    COP [0C]
    COP [0D] ( #FF, #FF )
    COP [0D] ( #FE, #FF )
    COP [81] ( #08, #12 )
    COP [89]
    COP [82] ( #07, #12 )
    COP [89]
    COP [81] ( #08, #14 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [D0] ( #35, #01, &code_048574 )
    COP [C0] ( &code_0485A4 )
    COP [C1]
}


code_048573 {
    RTL 
}


code_048574 {
    COP [C0] ( &code_0485A9 )
    COP [D2] ( #27, #01 )
    COP [10] ( #17, #06 )
    COP [10] ( #18, #06 )
    COP [81] ( #09, #13 )
    COP [89]
    COP [82] ( #06, #11 )
    COP [89]
    COP [81] ( #09, #11 )
    COP [89]
    COP [80] ( #04 )
    COP [89]
}


code_04859B {
    COP [0B]
    COP [C0] ( &code_0485B1 )
    COP [C1]
    RTL 
}


code_0485A4 {
    COP [BF] ( &widestring_0485B6 )
    RTL 
}


code_0485A9 {
    COP [BF] ( &widestring_048612 )
    COP [CC] ( #27 )
    RTL 
}


code_0485B1 {
    COP [BF] ( &widestring_048647 )
    RTL 
}


widestring_0485B6 `[DEF]Hold it! [LU2:20][LU1:87][N]are prowling [LU1:6D][N][LU1:BF]the town. [FIN][LU2:7][LU1:FE]teacher warn[N]you not to [LU1:AC]town[N][LU1:F8][LU1:FE]parents?[END]`

widestring_048612 `[DEF][LU1:27][LU1:11]has summoned[N]you to the castle?[N][LU1:63][LU1:A3]be careful.[END]`

widestring_048647 `[DEF]Be careful.[END]`

---------------------------------------------

head_048654 [
  h_event < #15, #00, #10 >   ;00
]

---------------------------------------------

func_048657 {
    COP [C0] ( &code_048719 )
    COP [0B]
    COP [DA] ( #B3 )
    COP [80] ( #14 )
    COP [89]
    COP [DA] ( #77 )
    COP [80] ( #15 )
    COP [89]
    COP [C3] ( %code_048674, #$053C )
}


code_048674 {
    COP [4B] ( #2C, #0E, #F9 )
    LDA #$0200
    TSB $12
    COP [80] ( #3C )
    COP [89]
    LDA #$0200
    TRB $12
    COP [0C]
    COP [82] ( #2E, #11 )
    COP [89]
    COP [85] ( #30, #10, #12 )
    COP [8A]
    COP [82] ( #2F, #12 )
    COP [89]
    COP [80] ( #2C )
    COP [89]
    COP [DA] ( #1D )
    COP [80] ( #2D )
    COP [89]
    LDA #$0200
    TSB $12
    COP [80] ( #3D )
    COP [89]
    LDA #$0200
    TRB $12
    COP [4B] ( #1C, #0E, #F8 )
    COP [80] ( #14 )
    COP [89]
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [80] ( #15 )
    COP [89]
    COP [4B] ( #1C, #0E, #F9 )
    LDA #$0200
    TSB $12
    COP [80] ( #3C )
    COP [89]
    LDA #$0200
    TRB $12
    COP [82] ( #2E, #11 )
    COP [89]
    COP [85] ( #31, #10, #11 )
    COP [8A]
    COP [82] ( #2F, #12 )
    COP [89]
    COP [80] ( #2D )
    COP [89]
    LDA #$0200
    TSB $12
    COP [80] ( #3D )
    COP [89]
    LDA #$0200
    TRB $12
    COP [4B] ( #2C, #0E, #F8 )
    COP [80] ( #15 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}


code_048719 {
    COP [BF] ( &widestring_04871E )
    RTL 
}


widestring_04871E `[DEF]I'm worried. There's[N][LU1:70]a lot of strange[N][LU2:86]lately[N]doing business...[END]`

---------------------------------------------

head_048762 [
  h_event < #14, #00, #10 >   ;00
]

---------------------------------------------

func_048765 {
    COP [C0] ( &code_0487BA )
    COP [0B]
    COP [C1]
    COP [28] ( #$02A8, #$01C8, &code_048776 )
    RTL 
}


code_048776 {
    COP [0C]
    COP [25] ( #28, #25 )
    COP [85] ( #19, #01, #11 )
    COP [8A]
    COP [C1]
    COP [28] ( #$02A8, #$0250, &code_04878E )
    RTL 
}


code_04878E {
    COP [C3] ( %code_048795, #$0010 )
}


code_048795 {
    COP [BF] ( &widestring_0487BF )
    COP [C0] ( &code_0487B5 )
    COP [85] ( #18, #04, #12 )
    COP [8A]
    COP [86] ( #17, #02, #12 )
    COP [8A]
    COP [0B]
    COP [C1]
    RTL 
    COP [BF] ( &widestring_0487BF )
    RTL 
}


code_0487B5 {
    COP [BF] ( &widestring_0487F1 )
    RTL 
}


code_0487BA {
    COP [BF] ( &widestring_0487F5 )
    RTL 
}


widestring_0487BF `[DEF]Oh, no![FIN][LU1:62]are you doing![N]This child![N]Honestly...[END]`

widestring_0487F1 `[DEF][JMP:87C8]`

widestring_0487F5 `[DEF]I envy you [LU1:F6]I see [N]the sea breeze blowing [N][LU1:FE]hair [LU1:A5]that... [FIN]Not [LU1:A5]mine,[N][LU1:EA][LU1:D6]scarf.... [END]`

---------------------------------------------

head_04884F [
  h_event < #02, #00, #10 >   ;00
]

---------------------------------------------

func_048852 {
    COP [C0] ( &code_0488F6 )
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [86] ( #07, #02, #12 )
    COP [8A]
    COP [85] ( #09, #03, #11 )
    COP [8A]
    COP [87] ( #09, #04, #11, #12 )
    COP [8A]
    COP [85] ( #09, #05, #11 )
    COP [8A]
    COP [86] ( #06, #02, #11 )
    COP [8A]
    COP [85] ( #09, #02, #11 )
    COP [8A]
    COP [80] ( #05 )
    COP [89]
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [85] ( #08, #02, #12 )
    COP [8A]
    COP [82] ( #07, #12 )
    COP [89]
    COP [85] ( #08, #02, #12 )
    COP [8A]
    COP [86] ( #07, #0C, #12 )
    COP [8A]
    COP [85] ( #08, #02, #12 )
    COP [8A]
    COP [87] ( #08, #03, #12, #12 )
    COP [8A]
    COP [85] ( #08, #06, #12 )
    COP [8A]
    COP [86] ( #07, #05, #12 )
    COP [8A]
    COP [85] ( #09, #06, #11 )
    COP [8A]
    COP [80] ( #05 )
    COP [89]
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [86] ( #07, #02, #12 )
    COP [8A]
    COP [81] ( #09, #11 )
    COP [89]
    COP [80] ( #04 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}


code_0488F6 {
    COP [BF] ( &widestring_0488FB )
    RTL 
}


widestring_0488FB `[DEF]My astronomer friend[N][LU1:D4][LU1:C8]very[N]strange: a star is[N][LU2:45]the Earth.[END]`

---------------------------------------------

head_04893A [
  h_event < #14, #00, #10 >   ;00
]

---------------------------------------------

func_04893D {
    COP [C0] ( &code_048999 )
    COP [0B]
    COP [DA] ( #EF )
    COP [0C]
    COP [85] ( #19, #0C, #11 )
    COP [8A]
    COP [82] ( #17, #12 )
    COP [89]
    COP [80] ( #18 )
    COP [89]
    COP [4B] ( #15, #24, #F9 )
    LDA #$0200
    TSB $12
    COP [80] ( #3A )
    COP [89]
    LDA #$0200
    TRB $12
    COP [82] ( #2E, #11 )
    COP [89]
    COP [85] ( #30, #0C, #12 )
    COP [8A]
    LDA #$0200
    TSB $12
    COP [80] ( #3B )
    COP [89]
    LDA #$0200
    TRB $12
    COP [4B] ( #09, #25, #F8 )
    COP [80] ( #14 )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}


code_048999 {
    COP [BF] ( &widestring_04899E )
    RTL 
}


widestring_04899E `[DEF]I [LU1:91]sorry[N]for Seth.[FIN]I [LU1:E9]why.  [N]He hates to see[N]his parents fighting[N]every day.[END]`

---------------------------------------------

head_0489EE [
  h_event < #05, #00, #10 >   ;00
]

---------------------------------------------

func_0489F1 {
    RTL 
}


---------------------------------------------

head_0489F2 [
  h_event < #00, #00, #10 >   ;00
]

---------------------------------------------

func_0489F5 {
    COP [B2]
    COP [4B] ( #2C, #0E, #F8 )
    COP [4B] ( #15, #24, #F8 )
    COP [D0] ( #11, #01, &code_048A46 )
    COP [C1]
    COP [28] ( #$0078, #$025E, &code_048A12 )
    RTL 
}


code_048A12 {
    COP [CC] ( #11 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [07] ( #1E )
    COP [82] ( #3F, #21 )
    COP [89]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [B4]
    COP [BF] ( &widestring_048A48 )
    COP [CA] ( #10 )
    LDA #$2000
    TSB $10
    COP [C2]
    LDA #$2000
    TRB $10
    COP [C2]
    COP [CB]
}


code_048A46 {
    COP [E0]
}


widestring_048A48 `[TPL:10][TPL:0]No sooner was the door[N]to Seth's [LU2:70]opened[N][LU2:B5]a jar [LU1:80]flying[N]out![END]`

---------------------------------------------

head_048A8C [
  h_event < #35, #00, #10 >   ;00
]

---------------------------------------------

func_048A8F {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_048AD9 )
    COP [0B]
    COP [D0] ( #10, #00, &code_048AA3 )
    COP [C1]
    RTL 
}


code_048AA3 {
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$0400
    STA $064A
    COP [DA] ( #1D )
    COP [BF] ( &widestring_048AE9 )
    COP [DA] ( #3B )
    COP [CA] ( #06 )
    COP [08] ( #$0909 )
    COP [C3] ( %code_048AC7, #$001E )
}


code_048AC7 {
    COP [CB]
    COP [DA] ( #3B )
    COP [BF] ( &widestring_048C01 )
    COP [DA] ( #3B )
    COP [CC] ( #10 )
    COP [C1]
    RTL 
}


code_048AD9 {
    COP [D0] ( #21, #01, &code_048AE4 )
    COP [BF] ( &widestring_048C98 )
    RTL 
}


code_048AE4 {
    COP [BF] ( &widestring_048CDB )
    RTL 
}


widestring_048AE9 `[DLG:3,6][SIZ:D,3][TPL:0][DLY:0]My name is Will.[FIN]A year has passed since[N]I [LU2:C1]to the Tower of[N]Babel [LU1:F0]my father.[FIN]My [LU2:67]and his party[N]met [LU1:F0]disaster.[FIN]Somehow, I [LU1:B3]it[N][LU1:73]to [LU1:47]Cape...[FIN]I [LU1:D3][LU1:78]believe[N]my [LU2:67]is gone.[N][LU1:1F][LU1:BB]believe it...[FIN][LU1:61]I grow up, I'll[N]be an [LU1:8A]and[N]see the world.[FIN]Somewhere, I [LU1:EF]meet[N]my father...[END]`

widestring_048C01 `[DEF]Teacher:[N]That's all for[N]today's lesson.[FIN]You four do [LU1:FE]best[N]not to fall behind.[FIN]Demons [LU1:98]appeared[N][LU1:BF]of town. If you[N]go [LU1:ED]far, you must[N]go [LU1:F0][LU1:FE]parents.[END]`

widestring_048C98 `[DEF]Oh, Will. [N][LU1:3B]recite [LU1:F0]me.[FIN]The [LU1:F5]shines[N]on brightly[N][LU1:DC]eternity....[END]`

widestring_048CDB `[DEF][LU1:62]is it, Will? Looking[N]at [LU1:FE]face, I wonder[N]if [LU1:FF]plotting[N][LU1:C8]again....[END]`

---------------------------------------------

head_048D21 [
  h_event < #03, #00, #10 >   ;00
]

---------------------------------------------

func_048D24 {
    COP [C0] ( &code_048D35 )
    COP [D0] ( #10, #00, &code_048D30 )
    COP [E0]
}


code_048D30 {
    COP [0B]
    COP [C1]
    RTL 
}


code_048D35 {
    COP [BF] ( &widestring_048D3A )
    RTL 
}


widestring_048D3A `[TPL:B][TPL:4]Lance:[N]Like always, the cave[N]at the seashore![PAL:0][END]`

---------------------------------------------

head_048D6E [
  h_event < #13, #00, #18 >   ;00
]

---------------------------------------------

func_048D71 {
    COP [D0] ( #10, #01, &code_048D93 )
    COP [D2] ( #10, #01 )
    COP [84] ( #14, #22 )
    COP [8A]
    COP [D2] ( #01, #01 )
    COP [86] ( #17, #02, #12 )
    COP [8A]
    COP [85] ( #19, #04, #11 )
    COP [8A]
}


code_048D93 {
    COP [E0]
}


---------------------------------------------

head_048D95 [
  h_event < #0B, #00, #10 >   ;00
]

---------------------------------------------

func_048D98 {
    COP [D0] ( #10, #01, &code_048DCF )
    COP [D2] ( #10, #01 )
    COP [84] ( #0C, #1E )
    COP [8A]
    COP [BF] ( &widestring_048DD1 )
    COP [CC] ( #01 )
    COP [DA] ( #1D )
    COP [BF] ( &widestring_048E00 )
    COP [81] ( #11, #01 )
    COP [89]
    COP [82] ( #0F, #02 )
    COP [89]
    COP [85] ( #11, #02, #01 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
}


code_048DCF {
    COP [E0]
}


widestring_048DD1 `[TPL:B][TPL:5]Seth:[N][LU1:1F]see you guys[N]at the usual place![PAL:0][END]`

widestring_048E00 `[TPL:B][TPL:3]Erik:[N]I [LU1:98]to go home[N]first. [LU1:1F]see you guys[N][LU1:D9]later.[FIN]If you [LU1:82]hurry home, [N][LU1:FE][LU2:85][LU1:EF][LU1:DA][N][LU1:D7]you [LU1:F2]kept after [N]school....Heh heh heh.[PAL:0][END]`

---------------------------------------------

head_048E84 [
  h_event < #13, #00, #10 >   ;00
]

---------------------------------------------

func_048E87 {
    COP [C0] ( &code_048F14 )

  code_048E8B:
    COP [81] ( #18, #12 )
    COP [89]
    COP [84] ( #13, #3C )
    COP [8A]
    COP [85] ( #19, #03, #11 )
    COP [8A]
    COP [84] ( #13, #3C )
    COP [8A]
    COP [85] ( #19, #03, #11 )
    COP [8A]
    COP [86] ( #17, #02, #12 )
    COP [8A]
    COP [82] ( #17, #14 )
    COP [89]
    LDA #$01B0
    STA $16
    COP [82] ( #16, #11 )
    COP [89]
    COP [85] ( #18, #04, #12 )
    COP [8A]
    COP [86] ( #17, #03, #12 )
    COP [8A]
    COP [84] ( #13, #3C )
    COP [8A]
    COP [81] ( #18, #12 )
    COP [89]
    COP [84] ( #13, #3C )
    COP [8A]
    COP [86] ( #16, #03, #11 )
    COP [8A]
    COP [85] ( #19, #05, #11 )
    COP [8A]
    COP [86] ( #17, #02, #12 )
    COP [8A]
    LDA #$0070
    STA $16
    COP [86] ( #16, #02, #11 )
    COP [8A]
    COP [85] ( #18, #05, #12 )
    COP [8A]
    COP [84] ( #13, #3C )
    COP [8A]
    JMP $&code_048E8B
}


code_048F14 {
    COP [BF] ( &widestring_048F19 )
    RTL 
}


widestring_048F19 `[DEF]Lance's mother: Your[N][LU2:67]has [LU1:70][LU2:7A]at[N]the Tower of Babel[N]for a year now...[FIN]It [LU1:CC]like[N][LU2:89]yesterday...[END]`

---------------------------------------------

head_048F7A [
  h_event < #15, #00, #10 >   ;00
]

---------------------------------------------

func_048F7D {
    LDA #$0012
    STA $7F0026, X
    JSL $%func_00C718
    COP [C0] ( &code_048F98 )

  code_048F8C:
    JSL $%func_00C725
    COP [C2]
    COP [C1]
    COP [89]
    BRA code_048F8C
}


code_048F98 {
    COP [BF] ( &widestring_048F9D )
    RTL 
}


widestring_048F9D `[DEF][LU1:1D]the [LU1:A7]things[N]in [LU1:B0][LU1:D7][LU2:84]you[N]rich or poor.[FIN][LU1:63][LU1:99]any good[N]stories?[END]`

---------------------------------------------

head_048FDE [
  h_event < #03, #00, #10 >   ;00
]

---------------------------------------------

func_048FE1 {
    COP [C0] ( &code_048FEA )
    COP [0B]
    COP [C1]
    RTL 
}


code_048FEA {
    COP [BF] ( &widestring_048FEF )
    RTL 
}


widestring_048FEF `[DEF]Erik's father:[N]Everyone is jealous[N]of [LU1:D6]big house...[FIN][LU1:1D]nothing.[N]We moved to [LU1:D6]town[N][LU1:74]anyone else.[END]`

---------------------------------------------

head_049052 [
  h_event < #14, #00, #10 >   ;00
]

---------------------------------------------

func_049055 {
    COP [9E] ( %code_04906E, #$0009, #$FFF8, #$1002 )
    COP [C0] ( &code_049076 )
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C1]
    RTL 
}


code_04906E {
    COP [80] ( #01 )
    COP [89]
    COP [C1]
    RTL 
}


code_049076 {
    COP [BF] ( &widestring_04907B )
    RTL 
}


widestring_04907B `[DEF]Erik's mother: Don't[N]worry, I'm not on fire.[N][LU1:1D][LU1:A3]a treatment[N]for my sore body.[FIN]Cleaning [LU1:D6]big house[N]all day makes my[N]brain ache...[END]`

---------------------------------------------

head_0490FF [
  h_event < #14, #00, #10 >   ;00
]

---------------------------------------------

func_049102 {
    COP [C0] ( &code_04910B )
    COP [0B]
    COP [C1]
    RTL 
}


code_04910B {
    COP [BF] ( &widestring_049110 )
    RTL 
}


widestring_049110 `[TPL:B]Seth's mother:[N][LU1:1D]no joke![N]That man![FIN]I put up [LU1:F0]it for[N]Seth's sake, but if it[N]weren't for him, I'd have[N][LU1:AE][LU1:A6]ago![END]`

---------------------------------------------

head_049182 [
  h_event < #05, #00, #10 >   ;00
]

---------------------------------------------

func_049185 {
    COP [C0] ( &code_04918E )
    COP [0B]
    COP [C1]
    RTL 
}


code_04918E {
    COP [BF] ( &widestring_049193 )
    RTL 
}


widestring_049193 `[TPL:B]Seth's father:[N][LU1:64]wrong with[N]having a [LU1:A7]fun with[N]my hard-earned money!![END]`

---------------------------------------------

head_0491DC [
  h_event < #05, #00, #10 >   ;00
]

---------------------------------------------

func_0491DF {
    COP [C0] ( &code_0491E8 )
    COP [0B]
    COP [C1]
    RTL 
}


code_0491E8 {
    COP [BF] ( &widestring_0491ED )
    RTL 
}


widestring_0491ED `[TPL:A]Mmmm, nice smell.[N]There's no stove, so[N]I'm cooking in [LU1:D6]pot.[END]`

---------------------------------------------

head_04922C [
  h_event < #02, #00, #10 >   ;00
]

---------------------------------------------

func_04922F {
    COP [C0] ( &code_049238 )
    COP [0B]
    COP [C1]
    RTL 
}


code_049238 {
    COP [BF] ( &widestring_04923D )
    RTL 
}


widestring_04923D `[DEF]You [LU1:A9][LU1:A5]a fast[N]runner. To run, push the[N]Control Pad twice.[END]`

---------------------------------------------

head_049279 [
  h_event < #02, #00, #10 >   ;00
]

---------------------------------------------

func_04927C {
    COP [D0] ( #21, #01, &code_0493EE )
    COP [D0] ( #1C, #01, &code_0493E1 )
    COP [D0] ( #3E, #01, &code_0493D9 )
    COP [D0] ( #1B, #01, &code_049349 )
    COP [D0] ( #16, #01, &code_0492A3 )
    COP [0B]
    COP [C0] ( &code_0493F0 )
    COP [C1]
    RTL 
}


code_0492A3 {
    COP [25] ( #08, #09 )
    COP [0B]
    COP [C0] ( &code_0493F5 )
    COP [D2] ( #04, #01 )
    COP [DA] ( #1D )
    COP [04] ( #1B )
    COP [DA] ( #59 )
    COP [BF] ( &widestring_04953E )
    COP [04] ( #06 )
    COP [09] ( #0A )
    COP [DA] ( #59 )
    COP [CC] ( #05 )
    COP [84] ( #05, #10 )
    COP [8A]
    COP [84] ( #02, #10 )
    COP [8A]
    COP [84] ( #04, #10 )
    COP [8A]
    COP [84] ( #02, #10 )
    COP [8A]
    COP [BF] ( &widestring_04956D )
    COP [C0] ( $840000 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [CC] ( #06 )
    LDA #$0800
    TSB $10
    COP [0C]
    COP [82] ( #06, #11 )
    COP [89]
    COP [85] ( #08, #05, #12 )
    COP [8A]
    COP [82] ( #07, #12 )
    COP [89]
    COP [25] ( #03, #19 )
    COP [82] ( #06, #11 )
    COP [89]
    COP [85] ( #09, #02, #11 )
    COP [8A]
    COP [80] ( #05 )
    COP [89]
    LDA #$0800
    TRB $10
    COP [D2] ( #1B, #01 )
    LDA #$1000
    TSB $12
    COP [05] ( #1C )
    COP [85] ( #09, #05, #11 )
    COP [8A]
    COP [80] ( #02 )
    COP [89]
    COP [DA] ( #EF )
    LDA #$CFF0
    TRB $joypad_mask_std
}


code_049349 {
    COP [80] ( #02 )
    COP [89]
    COP [25] ( #0A, #1A )
    COP [0B]
    COP [C0] ( &code_049413 )
    COP [D2] ( #0A, #01 )
    COP [BF] ( &widestring_0495C9 )
    COP [81] ( #08, #12 )
    COP [89]
    COP [80] ( #04 )
    COP [89]
    COP [BF] ( &widestring_0495EB )
    COP [81] ( #09, #11 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [CC] ( #0B )

  code_04937D:
    COP [C0] ( &code_049418 )
    COP [C1]
    COP [45] ( #03, #17, #04, #19, &code_04938C )
    RTL 
}


code_04938C {
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$0800
    TSB $10
    COP [CA] ( #09 )
    LDA #$0800
    STA $09AC
    COP [CB]
    LDA #$000F
    STA $7F0010, X

  code_0493A9:
    LDA $7F0010, X
    DEC 
    BMI code_0493C2
    STA $7F0010, X
    SEP #$20
    STA $INIDISP
    REP #$20
    COP [C3] ( %code_0493A9, #$0003 )
}


code_0493C2 {
    LDA #$0001
    STA $0648
    COP [26] ( #06, #$0000, #$0200, #00, #$3120 )
    LDA #$CFF0
    TRB $joypad_mask_std
    RTL 
}


code_0493D9 {
    COP [25] ( #0A, #1A )
    COP [0B]
    BRA code_04937D
}


code_0493E1 {
    COP [25] ( #0A, #1A )
    COP [0B]
    COP [C0] ( &code_049403 )
    COP [C1]
    RTL 
}


code_0493EE {
    COP [E0]
}


code_0493F0 {
    COP [BF] ( &widestring_04941D )
    RTL 
}


code_0493F5 {
    COP [BF] ( &widestring_0494B1 )
    COP [CC] ( #03 )
    LDA #$CFF0
    TSB $joypad_mask_std
    RTL 
}


code_049403 {
    COP [D0] ( #35, #01, &code_04940E )
    COP [BF] ( &widestring_049828 )
    RTL 
}


code_04940E {
    COP [BF] ( &widestring_04977F )
    RTL 
}


code_049413 {
    COP [BF] ( &widestring_04958A )
    RTL 
}


code_049418 {
    COP [BF] ( &widestring_049685 )
    RTL 
}


widestring_04941D `[TPL:B][TPL:4][LU1:6]Coming home[N]at [LU1:D6]hour probably[N]means you had to stay[N]after school again.[FIN]Ha ha. Excellent! Even[N]if a boy [LU1:78]study,[N]he [LU1:CA]show a[N][LU1:A7]initiative.[PAL:0][END]`

widestring_0494B1 `[TPL:B][TPL:4][LU1:6][N]Oh, my! I haven't sung [N][LU1:A5][LU1:D6]in a [LU1:A6]time.[FIN][LU1:68]grandmother Lola[N][LU2:BB]to be a singer.[FIN]I fell in love [LU1:F0]her[N]voice. That's why I[N]married her.[PAL:0][END]`

widestring_04953E `[TPL:8][TPL:1][DLY:0]No-o-o-o-o!!![FIN][PAL:0][SFX:10]A scream [LU1:8E]downstairs![END]`

widestring_04956D `[TPL:9][TPL:4][LU1:6][LU1:1D]that[N][LU2:6C]screaming!![PAL:0][END]`

widestring_04958A `[TPL:A][TPL:4][LU1:6]So, [LU1:D7]girl[N]likes to play practical[N]jokes. Heh heh heh.[PAL:0][END]`

widestring_0495C9 `[PAU:1E][TPL:A][TPL:4][LU1:6]I [LU2:BB]to be[N]an architect.[PAL:0][END]`

widestring_0495EB `[TPL:B][TPL:4]There's a prison[N][LU1:EA]the castle.[FIN][LU1:1D]built [LU1:A5]a maze[N]to keep the prisoners[N][LU1:8E]escaping.[FIN]I [LU1:91]bad [LU1:D7]I built[N]a [LU2:91][LU1:F4]people[N]disappear and are never[N][LU1:99][LU1:8E]again.[PAL:0][END]`

widestring_049685 `[TPL:B][TPL:4][LU1:6]Will, do you think[N][LU1:2D]meals [LU1:98][LU1:70]a[N][LU1:A7][LU1:C7]lately?[FIN]Last night, licorice and[N]rice. Before that, mouse[N]fritters.[N]I [LU1:78]stand it anymore![FIN][LU1:4A]old people,[N]if [LU2:B0]surrounded by[N]problems, get a little[N]forgetful. [FIN][LU1:30][LU1:DB]something[N]bothering her [LU1:D7]she[N][LU1:78][LU2:AC]about...[PAL:0][END]`

widestring_04977F `[TPL:B][TPL:4]Bill:[N]A crystal ring...?[N]Never [LU1:99]of it.[FIN]There was nothing[N][LU1:A5][LU1:D7]in the luggage[N][LU1:FE]father, Olman,[N][LU1:AE]behind.[FIN][LU1:30]we [LU1:7A]go to[N][LU1:11]Castle. We could[N]see the princess.[N]Heh heh.[PAL:0][END]`

widestring_049828 `[TPL:A][TPL:4][LU1:6]I had [LU1:B7]snail[N]pie for breakfast.[N]I [LU1:AE]you a slice.[PAL:0][END]`

---------------------------------------------

head_049862 [
  h_event < #0B, #00, #10 >   ;00
]

---------------------------------------------

func_049865 {
    COP [D0] ( #21, #01, &code_0499B9 )
    COP [D0] ( #1C, #01, &code_049968 )
    COP [D0] ( #3E, #01, &code_04995B )
    COP [D0] ( #1B, #01, &code_049934 )
    COP [D0] ( #16, #01, &code_04988C )
    COP [C0] ( &code_0499BB )
    COP [0B]
    COP [C1]
    RTL 
}


code_04988C {
    COP [25] ( #07, #09 )
    COP [0B]
    COP [80] ( #0A )
    COP [89]
    COP [C0] ( &code_0499C0 )
    COP [D2] ( #03, #01 )
    COP [84] ( #0D, #1E )
    COP [8A]
    COP [BF] ( &widestring_049A3F )
    COP [CC] ( #04 )
    COP [D2] ( #05, #01 )
    COP [DA] ( #0B )
    COP [84] ( #0D, #10 )
    COP [8A]
    COP [84] ( #0A, #10 )
    COP [8A]
    COP [84] ( #0C, #10 )
    COP [8A]
    COP [84] ( #0A, #10 )
    COP [8A]
    COP [C0] ( $840000 )
    COP [D2] ( #06, #01 )
    LDA #$0800
    TSB $10
    COP [DA] ( #3F )
    COP [0C]
    COP [82] ( #0E, #11 )
    COP [89]
    COP [85] ( #10, #04, #12 )
    COP [8A]
    COP [82] ( #0F, #12 )
    COP [89]
    COP [25] ( #03, #19 )
    COP [CA] ( #02 )
    COP [82] ( #0E, #11 )
    COP [89]
    COP [81] ( #11, #11 )
    COP [89]
    COP [CB]
    COP [80] ( #0D )
    COP [89]
    LDA #$0800
    TRB $10
    COP [D2] ( #1B, #01 )
    LDA #$1000
    TSB $12
    COP [85] ( #11, #03, #11 )
    COP [8A]
    COP [86] ( #0F, #02, #12 )
    COP [8A]
    COP [85] ( #11, #04, #11 )
    COP [8A]
    COP [86] ( #0E, #02, #11 )
    COP [8A]
}


code_049934 {
    COP [80] ( #0C )
    COP [89]
    COP [25] ( #0C, #1B )
    COP [0B]
    COP [C0] ( &code_0499C5 )
    COP [D2] ( #0B, #01 )
    COP [BF] ( &widestring_049B82 )
    COP [CC] ( #3E )
    LDA #$CFF0
    TRB $joypad_mask_std

  code_049954:
    COP [C0] ( &code_0499D3 )
    COP [C1]
    RTL 
}


code_04995B {
    COP [80] ( #0C )
    COP [89]
    COP [25] ( #0C, #1B )
    COP [0B]
    BRA code_049954
}


code_049968 {
    COP [25] ( #0C, #1B )
    COP [C0] ( &code_0499D8 )
    COP [0B]
    COP [80] ( #0C )
    COP [89]
    COP [D0] ( #35, #01, &code_0499B6 )
    COP [C1]
    COP [D6] ( #09, &code_049985 )
    RTL 
}


code_049985 {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [CC] ( #35 )
    COP [04] ( #19 )
    COP [DA] ( #59 )
    COP [BF] ( &widestring_049D29 )
    COP [C1]
    SEP #$20
    LDA $APUIO1
    REP #$20
    AND #$00FF
    CMP #$00FF
    BEQ code_0499AA
    RTL 
}


code_0499AA {
    COP [04] ( #1C )
    COP [DA] ( #59 )
    LDA #$FFF0
    TRB $joypad_mask_std
}


code_0499B6 {
    COP [C1]
    RTL 
}


code_0499B9 {
    COP [E0]
}


code_0499BB {
    COP [BF] ( &widestring_0499F1 )
    RTL 
}


code_0499C0 {
    COP [BF] ( &widestring_049ABB )
    RTL 
}


code_0499C5 {
    COP [BF] ( &widestring_049B18 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [CC] ( #0A )
    RTL 
}


code_0499D3 {
    COP [BF] ( &widestring_049B84 )
    RTL 
}


code_0499D8 {
    COP [D0] ( #35, #01, &code_0499E8 )
    COP [BF] ( &widestring_049BE5 )
    COP [D4] ( #09, &code_0499ED )
    RTL 
}


code_0499E8 {
    COP [BF] ( &widestring_049D94 )
    RTL 
}


code_0499ED {
    JML $%code_00C98E
}


widestring_0499F1 `[DEF][TPL:3][LU1:2E]Welcome home,[N]Will. Dinner isn't ready[N]yet. Go [LU1:BF]and[N]play for a while.[PAL:0][END]`

widestring_049A3F `[TPL:A][TPL:3][LU1:2E] Ah ha ha.[N]Oh, you!! Bringing up[N]a [LU1:E3][LU1:A5]that![FIN]Will, you [LU2:A8]be[N][LU2:A5]to [LU1:9B]that.[FIN]The [LU2:6C]who was singing[N][LU1:F0]me a minute ago...[PAL:0][END]`

widestring_049ABB `[TPL:B][TPL:3][LU1:2E]Welcome home,[N]Will. [LU1:61]I sing opera,[N]I [LU2:81]track of[N]the time...[FIN]Dinner's not ready yet.[PAL:0][END]`

widestring_049B18 `[TPL:A][TPL:3][LU1:2E][LU1:11]Castle...[N]There's a big viaduct[N][LU1:EA]the castle.[FIN][LU1:68]grandfather designed[N]it.[FIN][TPL:0]Will: [N]What! Really?[PAL:0][END]`

widestring_049B82 `[PAU:40]`

widestring_049B84 `[TPL:A][TPL:3]Lola:[N]Enough serious talk.[N][LU1:2B]eat dinner.[FIN][LU1:20][LU1:B3]a delicious[N]pie. [LU1:2B]sit at the[N]table upstairs.[PAL:0][END]`

widestring_049BE5 `[TPL:B][TPL:3][LU1:2E][N]Good morning, Will.[N]A [LU2:7F]has [LU1:79]for[N]you [LU1:8E][LU1:27]Edward.[FIN][PAL:0][DLG:3,6][SIZ:D,4]This is [LU1:F7]is written[N]in the letter.[FIN][TPL:B][TPL:4]Bring the [LU1:7]Ring[N][LU1:8E]Olman's things[N]to [LU1:11]Castle.[N]           [LU1:27]Edward[FIN][TPL:3][LU1:2E][LU1:20][LU1:70]in a[N]bad mood [LU2:5D][LU2:A4]I[N]saw [LU1:D6]letter.[FIN]Oh, Will. [LU1:1F]teach[N]you a spell. [LU1:61]I'm[N]upset, humming [LU1:D6]tune[N]makes me [LU1:91]better.[FIN]Lola hummed a strange[N]melody.[PAL:0][END]`

widestring_049D29 `[TPL:A][TPL:0][SFX:0][DLY:5]That's pretty.[N][PAU:78][CLR][LU1:12]though Will had[N][LU1:BB][LU1:99]it before,[N]it [LU2:A0]oddly familiar.[PAU:F0][CLR][PAL:0][LU1:67]learned[N][LU1:2D]melody![PAU:FF][CLD]`

widestring_049D94 `[TPL:B][TPL:3]Lola:[N]Be careful.[PAL:0][END]`

---------------------------------------------

head_049DAC [
  h_event < #12, #00, #30 >   ;00
]

---------------------------------------------

func_049DAF {
    COP [D0] ( #1B, #01, &code_049EA0 )
    COP [D0] ( #3D, #01, &code_049EA2 )
    COP [D0] ( #16, #00, &code_049EA0 )
    COP [D2] ( #01, #01 )
    LDA #$2000
    TRB $10
    COP [86] ( #16, #02, #11 )
    COP [8A]
    COP [81] ( #19, #11 )
    COP [89]
    COP [80] ( #15 )
    COP [89]
    COP [BF] ( &widestring_049EB4 )
    LDA #$0002
    JSL $%func_00C6E4
    COP [81] ( #19, #11 )
    COP [89]
    COP [82] ( #17, #12 )
    COP [89]
    COP [85] ( #19, #02, #11 )
    COP [8A]
    COP [84] ( #12, #3C )
    COP [8A]
    LDA #$0001
    JSL $%func_00C6E4
    COP [C2]
    COP [BF] ( &widestring_049F09 )
    COP [CC] ( #02 )
    COP [85] ( #19, #03, #11 )
    COP [8A]
    COP [80] ( #13 )
    COP [89]
    LDA #$0003
    JSL $%func_00C6E4
    COP [C2]
    COP [BF] ( &widestring_049F71 )
    COP [84] ( #14, #10 )
    COP [8A]
    COP [BF] ( &widestring_049FBC )
    COP [84] ( #13, #18 )
    COP [8A]
    COP [84] ( #14, #18 )
    COP [8A]
    COP [84] ( #12, #18 )
    COP [8A]
    COP [84] ( #14, #1E )
    COP [8A]
    COP [0B]
    COP [BF] ( &widestring_04A04C )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [CC] ( #3D )

  code_049E5A:
    COP [C0] ( &code_049EAF )
    COP [D2] ( #04, #01 )
    COP [0C]
    COP [25] ( #0D, #19 )
    COP [80] ( #14 )
    COP [89]
    COP [D2] ( #07, #01 )
    COP [84] ( #15, #1E )
    COP [8A]
    COP [BF] ( &widestring_04A0D7 )
    COP [CC] ( #08 )
    COP [DA] ( #1F )
    COP [85] ( #15, #E0, #12 )
    COP [8A]
    COP [86] ( #13, #A0, #11 )
    COP [8A]
    COP [CC] ( #09 )
    COP [BF] ( &widestring_04A15A )
    COP [86] ( #16, #04, #11 )
    COP [8A]
    COP [CC] ( #1B )
}


code_049EA0 {
    COP [E0]
}


code_049EA2 {
    COP [25] ( #0A, #19 )
    COP [0B]
    LDA #$2000
    TRB $10
    BRA code_049E5A
}


code_049EAF {
    COP [BF] ( &widestring_04A0D2 )
    RTL 
}


widestring_049EB4 `[TPL:A][TPL:1][LU1:25][N]Hamlet! You shouldn't[N]snort at strangers![FIN]Is [LU1:D6][LU1:FE]house?[FIN][TPL:0]Will: [N]Yeah...so?[PAL:0][END]`

widestring_049F09 `[TPL:9][TPL:1][LU1:25]Frankly, you look[N]a [LU1:A7]shabby....[FIN][TPL:0]Will: [N][LU1:63]excuse me...!![FIN][TPL:1][LU1:25][LU1:68]father?[N]Mother? Not here, huh?[PAL:0][END]`

widestring_049F71 `[DLG:3,13][SIZ:D,2][TPL:1][LU1:25]Is [LU1:D6]a picture[N]of [LU1:FE]parents?[FIN][TPL:0]Will: My [LU1:92]an[N]explorer, he.....[PAL:0][END]`

widestring_049FBC `[TPL:A][TPL:1][LU1:25]I know. Olman,[N]the [LU2:5F]They say[N]he was lost.[FIN][TPL:0]Will: He'll come[N][LU1:73][LU1:D0]day.[FIN][TPL:1][LU1:25][N]Are you sad?[N]...No?[FIN]I'd be sad, if it were[N]me.[N]I'm sorry...[PAL:0][END]`

widestring_04A04C `[TPL:A][TPL:1][LU1:25][N]Anyway, is [LU1:D9]a[N]piano here?[FIN][TPL:0]Will: No, [LU1:D9]isn't![N]But [LU1:17]Lola is a[N][LU1:95]singer.[FIN][TPL:1][LU1:25][LU1:5D]singing[N]upstairs now. They[N][LU1:98][LU1:CE]loud voices!![PAL:0][END]`

widestring_04A0D2 `[TPL:A][JMP:A09D]`

widestring_04A0D7 `[TPL:A][TPL:1]Kara:[N][LU1:62]do I [LU2:57]if you[N][LU2:81][LU1:FE]head?[FIN][PAL:0][LU1:45]Princess![FIN]Do you [LU1:DA]I have[N][LU1:B9][LU2:50]to do[N][LU2:B5]chase you down?[FIN]I [LU1:B2][LU1:E7]you home.[N][LU1:1D]the King's orders![END]`

widestring_04A15A `[TPL:B][TPL:1][LU1:25]I'm sorry I lied[N]to [LU2:C7]I'm King[N]Edward's daughter, Kara.[FIN]Will. [N]I [LU1:91]as though we've[N]met before, as if we[N][LU1:F2][LU1:94]friends.[PAL:0][END]`

---------------------------------------------

head_04A1D7 [
  h_event < #23, #00, #10 >   ;00
]

---------------------------------------------

func_04A1DA {
    COP [D0] ( #1B, #01, &code_04A2EB )
    COP [D0] ( #3D, #01, &code_04A2ED )
    COP [D0] ( #16, #00, &code_04A2EB )
    COP [C0] ( &code_04A30C )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [84] ( #27, #02 )
    COP [8A]
    COP [80] ( #23 )
    COP [89]
    COP [BF] ( &widestring_04A311 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [0B]
    COP [C1]
    COP [28] ( #$0038, #$01A0, &code_04A238 )
    COP [28] ( #$0038, #$019F, &code_04A238 )
    COP [28] ( #$0038, #$019E, &code_04A238 )
    COP [28] ( #$0038, #$019D, &code_04A238 )
    COP [28] ( #$0038, #$019C, &code_04A238 )
    RTL 
}


code_04A238 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [0C]
    COP [CA] ( #1E )
    LDY $player_actor
    LDA #$0038
    STA $0014, Y
    LDA #$01A0
    STA $0016, Y
    COP [CB]
    COP [82] ( #26, #01 )
    COP [89]
    COP [85] ( #28, #06, #02 )
    COP [8A]
    COP [82] ( #27, #12 )
    COP [89]
    COP [84] ( #29, #04 )
    COP [8A]
    COP [9C] ( %code_04A2F9, #$2000 )
    COP [85] ( #29, #08, #11 )
    COP [8A]
    COP [80] ( #25 )
    COP [89]
    COP [CC] ( #01 )
    LDA #$0800
    TSB $10

  code_04A288:
    COP [80] ( #25 )
    COP [89]
    COP [D0] ( #02, #00, &code_04A288 )
    COP [82] ( #27, #12 )
    COP [89]
    COP [85] ( #29, #06, #11 )
    COP [8A]
    COP [82] ( #26, #11 )
    COP [89]
    COP [85] ( #29, #04, #11 )
    COP [8A]
    COP [82] ( #27, #12 )
    COP [89]
    COP [0B]

  code_04A2B5:
    COP [80] ( #28 )
    COP [89]
    COP [D0] ( #04, #00, &code_04A2B5 )
    COP [0C]
    COP [25] ( #0D, #1A )

  code_04A2C6:
    COP [80] ( #28 )
    COP [89]
    COP [D0] ( #09, #00, &code_04A2C6 )
    LDA #$0800
    TSB $10
    COP [86] ( #26, #03, #11 )
    COP [8A]
    COP [85] ( #28, #10, #12 )
    COP [8A]
    COP [86] ( #26, #03, #11 )
    COP [8A]
}


code_04A2EB {
    COP [E0]
}


code_04A2ED {
    COP [25] ( #0B, #19 )
    COP [0B]
    COP [C0] ( &code_04A30C )
    BRA code_04A2B5
}


code_04A2F9 {
    COP [CA] ( #40 )
    LDY $player_actor
    LDA $0014, Y
    INC 
    STA $0014, Y
    COP [C2]
    COP [CB]
    COP [E0]
}


code_04A30C {
    COP [BF] ( &widestring_04A356 )
    RTL 
}


widestring_04A311 `[TPL:9][TPL:0]The pig's wrecking[N]the room![FIN]But why is there[N]a pig in my house?[END]`

widestring_04A356 `[TPL:8][LU1:3A] oink[END]`

---------------------------------------------

head_04A360 [
  h_event < #1A, #00, #30 >   ;00
]

---------------------------------------------

func_04A363 {
    COP [D0] ( #1B, #01, &code_04A3B9 )
    COP [D2] ( #04, #01 )
    LDA #$2000
    TRB $10
    COP [25] ( #0A, #19 )
    COP [80] ( #1D )
    COP [89]
    COP [C1]
    COP [45] ( #04, #19, #0E, #1D, &code_04A386 )
    RTL 
}


code_04A386 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [81] ( #21, #11 )
    COP [89]
    COP [80] ( #1D )
    COP [89]
    COP [BF] ( &widestring_04A3BB )
    COP [CC] ( #07 )
    COP [D2] ( #08, #01 )
    COP [81] ( #21, #11 )
    COP [89]
    COP [85] ( #20, #06, #12 )
    COP [8A]
    COP [86] ( #1E, #0A, #11 )
    COP [8A]
}


code_04A3B9 {
    COP [E0]
}


widestring_04A3BB `[TPL:B][LU1:45]Princess! I've[N][LU1:70][LU1:AB]for you![FIN][TPL:1][LU1:25][N]I [LU1:82][LU1:A4]you.[N]Be gone![FIN][PAL:0][SFX:10][LU1:45][LU1:62]are you [N]saying? If I [LU1:82][LU1:E7][N]you home,[N][LU1:1F][LU2:81]my head? [END]`

---------------------------------------------

head_04A42F [
  h_event < #1A, #00, #30 >   ;00
]

---------------------------------------------

func_04A432 {
    COP [D0] ( #1B, #01, &code_04A45F )
    COP [D2] ( #04, #01 )
    LDA #$2000
    TRB $10
    COP [25] ( #09, #1A )
    COP [80] ( #1D )
    COP [89]
    COP [D2] ( #08, #01 )
    COP [DA] ( #3F )
    COP [85] ( #20, #03, #12 )
    COP [8A]
    COP [86] ( #1E, #09, #11 )
    COP [8A]
}


code_04A45F {
    COP [E0]
}


---------------------------------------------

head_04A461 [
  h_event < #00, #00, #30 >   ;00
]

---------------------------------------------

func_04A464 {
    COP [D0] ( #1D, #01, &code_04A4CA )
    COP [D0] ( #1C, #01, &code_04A4B4 )
    COP [C1]
    COP [28] ( #$0008, #$0210, &code_04A47B )
    RTL 
}


code_04A47B {
    LDA #$EFF0
    TSB $joypad_mask_std
    SEP #$20
    LDA #$04
    STA $_TM
    REP #$20
    LDA #$0000
    STA $7F0A00
    COP [DA] ( #77 )
    COP [BF] ( &widestring_04A4CC )
    COP [CC] ( #1C )
    LDA #$0404
    STA $064A
    LDA #$0200
    STA $0648
    COP [26] ( #06, #$00A0, #$0078, #03, #$1100 )
    COP [C1]
    RTL 
}


code_04A4B4 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #3B )
    COP [CC] ( #1D )
    COP [BF] ( &widestring_04A582 )
    LDA #$CFF0
    TRB $joypad_mask_std
}


code_04A4CA {
    COP [E0]
}


widestring_04A4CC `[DLG:3,B][SIZ:D,3][TPL:0]Will: We sat down to[N]a feast of snail pie...[N][LU1:F0]whipped cream![FIN]I [LU2:89]got one piece,[N]but [LU1:1A]Bill ate[N]half the pie.[FIN]That night Will dreamed[N][LU1:D7][LU1:26]and he took a[N]trip [LU1:6D]the world...[PAL:0][END]`

widestring_04A582 `[DLG:3,11][SIZ:D,3]And the [LU1:BC]morning[N][LU1:C8]began to[N]happen...[END]`

---------------------------------------------

head_04A5AF [
  h_event < #1B, #00, #10 >   ;00
]

---------------------------------------------

func_04A5B2 {
    COP [D0] ( #26, #01, &code_04A693 )
    COP [D0] ( #25, #01, &code_04A695 )
    COP [D0] ( #21, #00, &code_04A734 )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDY $player_actor
    LDA $0014, Y
    CLC 
    ADC #$0008
    STA $0014, Y
    COP [9C] ( %code_04AF48, #$2000 )
    COP [DA] ( #3B )
    COP [BF] ( &widestring_04A746 )
    COP [84] ( #1D, #1E )
    COP [8A]
    COP [BF] ( &widestring_04A766 )
    COP [82] ( #1F, #12 )
    COP [89]
    COP [80] ( #1B )
    COP [89]
    COP [BF] ( &widestring_04A7A8 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [81] ( #20, #02 )
    COP [89]
    COP [86] ( #1F, #02, #02 )
    COP [8A]
    COP [25] ( #03, #08 )
    COP [82] ( #1E, #01 )
    COP [89]
    COP [85] ( #21, #04, #01 )
    COP [8A]
    COP [82] ( #1E, #01 )
    COP [89]
    COP [84] ( #1C, #18 )
    COP [8A]
    COP [84] ( #1A, #18 )
    COP [8A]
    COP [84] ( #1D, #18 )
    COP [8A]
    COP [84] ( #1A, #28 )
    COP [8A]
    COP [82] ( #1F, #02 )
    COP [89]
    COP [81] ( #20, #02 )
    COP [89]
    COP [82] ( #1F, #02 )
    COP [89]
    COP [80] ( #1B )
    COP [89]
    COP [0B]
    COP [BF] ( &widestring_04A7E1 )
    COP [C0] ( &code_04A736 )
    COP [D2] ( #01, #01 )
    COP [D2] ( #02, #01 )
    COP [0C]
    COP [81] ( #20, #12 )
    COP [89]
    COP [82] ( #1E, #11 )
    COP [89]
    COP [80] ( #1C )
    COP [89]
    COP [0B]
    COP [BF] ( &widestring_04A945 )
    COP [CE] ( #02 )
    COP [CC] ( #25 )
    COP [CF] ( #$0119 )
    COP [C0] ( &code_04A73E )
    COP [C1]
    RTL 
}


code_04A693 {
    COP [E0]
}


code_04A695 {
    COP [25] ( #0C, #1B )
    COP [C0] ( &code_04A73E )
    COP [80] ( #1C )
    COP [89]
    COP [0B]
    COP [D2] ( #04, #01 )
    COP [0C]
    COP [82] ( #1F, #12 )
    COP [89]
    COP [81] ( #20, #12 )
    COP [89]
    COP [BF] ( &widestring_04A9F8 )
    COP [CC] ( #02 )
    COP [D2] ( #02, #00 )
    COP [81] ( #20, #14 )
    COP [89]
    COP [BF] ( &widestring_04AA0D )
    COP [CC] ( #03 )
    COP [D2] ( #03, #00 )
    COP [82] ( #1F, #12 )
    COP [89]
    COP [85] ( #20, #02, #12 )
    COP [8A]
    COP [80] ( #1A )
    COP [89]
    COP [CC] ( #26 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [BF] ( &widestring_04AA20 )
    COP [BE] ( #02, #00, &code_list_04A6F7 )
}


code_list_04A6F7 [
  &code_04A703   ;00
  &code_04A6FD   ;01
  &code_04A703   ;02
]

code_04A6FD {
    COP [BF] ( &widestring_04AA7D )
    BRA code_04A707
}


code_04A703 {
    COP [BF] ( &widestring_04AAAD )
}


code_04A707 {
    LDA #$0000
    STA $0D60
    LDA #$0001
    STA $0D62
    LDA #$0002
    STA $0D64
    LDA #$0404
    STA $064A
    COP [65] ( #$00D4, #$03A4, #00, #03 )
    COP [26] ( #15, #$02D8, #$0370, #00, #$4500 )
    COP [C1]
    RTL 
}


code_04A734 {
    COP [E0]
}


code_04A736 {
    COP [BF] ( &widestring_04A81F )
    COP [CC] ( #01 )
    RTL 
}


code_04A73E {
    COP [BF] ( &widestring_04A9D7 )
    COP [CC] ( #01 )
    RTL 
}


widestring_04A746 `[TPL:A][TPL:0]Will: What![N][LU1:64]happened...[PAL:0][END]`

widestring_04A766 `[TPL:A][TPL:1][LU1:25][LU1:1D]awful! Who[N][LU1:F3]do [LU1:CE]a thing...[FIN][TPL:0]Will: [N]My Grandparents?![PAL:0][END]`

widestring_04A7A8 `[DLG:3,6][SIZ:D,3][TPL:1][LU1:25][N][LU1:1A]Bill![FIN][TPL:0]Will: [N][LU1:17]Lola![FIN][TPL:1][LU1:25][N][LU1:1F][LU1:A9]upstairs![PAL:0][END]`

widestring_04A7E1 `[TPL:E][TPL:1][LU1:25]Ooooh!!! Will!! [N][LU1:9]here! Quick![N][LU1:1D]terrible, terrible![PAL:0][END]`

widestring_04A81F `[TPL:E][TPL:0]Will: [LU1:62]happened?![FIN][TPL:1][LU1:25]Look at the wall![FIN]This mark, a jackal...[N]The Jackal's here![FIN][TPL:0]Will: [N]Jackal...?[FIN][TPL:1][LU1:25]He's the[N]hunter hired by[N]my mother!![FIN]An evil man who will[N]stop at nothing![FIN][LU1:39]he starts after you,[N][LU1:DB]no stopping him.[FIN]He has no regard[N]for [LU1:9A]life![FIN][TPL:0]Will: My Grandpa[N]and Grandma....[PAL:0][END]`

widestring_04A945 `[TPL:E][TPL:1][LU1:25][N]Who are you?![FIN][TPL:2][LU1:2A][N]I'm Will's friend.[FIN][TPL:0]Will: Lilly, do you know[N][LU1:6C][LU1:6B]this?[FIN][TPL:2][LU1:2A][LU1:1D]OK.[N][LU1:68][LU1:1A]and[N][LU1:17]are safe.[FIN][LU1:5D]in my village.[FIN][TPL:1][LU1:25][LU1:68]village?[PAL:0][END]`

widestring_04A9D7 `[TPL:E][TPL:1]I [LU1:DA][LU1:C8]good[N]is [LU1:93]to happen.[PAL:0][END]`

widestring_04A9F8 `[TPL:A][TPL:1][LU1:25][N][LU1:69]nitpicking.[END]`

widestring_04AA0D `[TPL:A][TPL:1][LU1:25][N]Crazy girl![END]`

widestring_04AA20 `[TPL:B][TPL:1][LU1:25][LU1:1C]Will, [N]aren't you my friend,[N]too!?[FIN][PAL:0] [LU1:6A]of course.[N] I, umm,  I'm [LU1:93][N] to the village.`

widestring_04AA7D `[CLR][TPL:1][LU1:25][N]I'm glad, Will. Let's[N]go hand in hand.[FIN][JMP:AACA]`

widestring_04AAAD `[TPL:2][CLR]Lilly:[N]I'm [LU1:93][LU1:F0]you.[N][LU1:2B]go.[FIN][SFX:10][PAL:0]Together,[N]the three set off for[N][LU2:18]village.[END]`

---------------------------------------------

head_04AAF9 [
  h_event < #36, #00, #30 >   ;00
]

---------------------------------------------

func_04AAFC {
    COP [D0] ( #26, #01, &code_04AB93 )
    COP [D0] ( #25, #01, &code_04AB95 )
    COP [D0] ( #21, #00, &code_04ABDA )
    COP [D2] ( #01, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$2000
    TRB $10
    COP [86] ( #36, #02, #01 )
    COP [8A]
    COP [85] ( #36, #03, #01 )
    COP [8A]
    COP [84] ( #36, #08 )
    COP [8A]
    COP [84] ( #22, #04 )
    COP [8A]
    COP [84] ( #24, #04 )
    COP [8A]
    COP [84] ( #23, #04 )
    COP [8A]
    COP [84] ( #25, #04 )
    COP [8A]
    COP [84] ( #22, #3C )
    COP [8A]
    COP [80] ( #25 )
    COP [89]
    LDA #$0002
    JSL $%func_00C6E4
    COP [C2]
    COP [BF] ( &widestring_04AC0C )
    COP [CC] ( #02 )
    COP [D2] ( #02, #00 )
    COP [84] ( #22, #28 )
    COP [8A]
    COP [BF] ( &widestring_04AC45 )
    COP [84] ( #25, #28 )
    COP [8A]
    COP [BF] ( &widestring_04AC77 )
    COP [0B]
    COP [C0] ( &code_04ABDC )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [D2] ( #04, #01 )
    COP [C0] ( &code_04ABE4 )
    COP [C1]
    RTL 
}


code_04AB93 {
    COP [E0]
}


code_04AB95 {
    COP [25] ( #08, #1B )
    LDA #$2000
    TRB $10
    COP [C0] ( &code_04ABE9 )
    COP [80] ( #25 )
    COP [89]
    COP [0B]
    COP [D2] ( #04, #01 )
    COP [0C]
    COP [82] ( #27, #12 )
    COP [89]
    COP [81] ( #29, #11 )
    COP [89]
    COP [D2] ( #02, #01 )
    COP [81] ( #29, #13 )
    COP [89]
    COP [BF] ( &widestring_04AEC1 )
    COP [CE] ( #02 )
    COP [D2] ( #03, #01 )
    COP [BF] ( &widestring_04AEF7 )
    COP [CE] ( #03 )
    COP [C1]
    RTL 
}


code_04ABDA {
    COP [E0]
}


code_04ABDC {
    COP [BF] ( &widestring_04AD69 )
    COP [CC] ( #04 )
    RTL 
}


code_04ABE4 {
    COP [BF] ( &widestring_04ADCA )
    RTL 
}


code_04ABE9 {
    COP [BF] ( &widestring_04ADFE )
    COP [BE] ( #02, #02, &code_list_04ABF3 )
}


code_list_04ABF3 [
  &code_04ABF9   ;00
  &code_04ABFE   ;01
  &code_04ABF9   ;02
]

code_04ABF9 {
    COP [BF] ( &widestring_04AE24 )
    RTL 
}


code_04ABFE {
    LDA #$EFF0
    TSB $joypad_mask_std
    COP [BF] ( &widestring_04AE61 )
    COP [CC] ( #04 )
    RTL 
}


widestring_04AC0C `[TPL:E][TPL:2]Lilly:[N][LU1:D]worry, you two.[FIN][TPL:0]Will: [N][LU1:69]the one who...[PAL:0][END]`

widestring_04AC45 `[TPL:E][TPL:2][LU1:2A][N]Itory village.[FIN][TPL:1][LU1:25][LU1:20][LU1:BB]heard[N]of [LU1:D6]village![END]`

widestring_04AC77 `[TPL:E][TPL:2][LU1:2A]Naturally. My[N][LU1:EC]has a barrier[N][LU1:6D]it.[FIN]Ordinary [LU1:C1][LU1:A5]you[N][LU1:78]see it. [FIN][LU1:2A][N][LU1:2B]go, Will! [FIN][TPL:0]Will: OK![FIN][TPL:1][LU1:25][N]I'm going, too![FIN][TPL:2][LU1:2A][LU1:1D]far too[N]dangerous[N]for a princess.[FIN][TPL:1][LU1:25]You [LU1:78]stop[N]royalty! I do whatever[N]I want!![FIN][TPL:2]Lilly:[N]Typical of a princess...[PAL:0][END]`

widestring_04AD69 `[TPL:E][TPL:2][LU1:2A]Before we go to[N]my village, [LU1:CA]we[N][LU2:87]the townspeople?[FIN]We might not be back[N][LU2:73]for a [LU1:A6]time.[PAL:0][END]`

widestring_04ADCA `[TPL:E][TPL:2][LU1:2A]Is [LU1:D7]OK?[N]We [LU1:CA]see how[N][LU1:E0]are in the village.[PAL:0][END]`

widestring_04ADFE `[TPL:B][TPL:2][LU1:2A]Are you[N]ready to go?[N][PAL:0] Yes[N] No`

widestring_04AE24 `[CLR][TPL:2][LU1:2A]All right.[N]If you decide to[N]go, [LU1:79][LU1:73]here[N][LU1:F6][LU1:FF]through.[PAL:0][END]`

widestring_04AE61 `[CLR][TPL:1][LU1:25]I think[N][LU1:C8]wonderful[N]is [LU1:93]to happen.[FIN][TPL:2]Lilly:[N]No. [LU2:11][LU2:73]on there[N][LU1:EF]be [LU1:B6]hardships....[N]Hmmmmm.[END]`

widestring_04AEC1 `[TPL:A][TPL:2][LU1:2A]That's [LU1:F7]I[N]expected. [LU2:14]you ever[N][LU1:70][LU1:BF]the castle?[END]`

widestring_04AEF7 `[TPL:A][TPL:2][LU1:2A]Are you totally[N]ignorant of the world!? [FIN][LU1:2A][N]Will is my friend.[N]Understand?[END]`

code_04AF48 {
    COP [0F] ( #05, #1D )
    COP [0F] ( #06, #1D )

  code_04AF50:
    COP [C1]
    COP [D0] ( #25, #01, &code_04AF75 )
    COP [45] ( #05, #1C, #07, #1D, &code_04AF61 )
    RTL 
}


code_04AF61 {
    COP [40] ( #$0400, &code_04AF6C )
    COP [C4] ( %code_04AF50 )
}


code_04AF6C {
    COP [BF] ( &widestring_04AF7F )
    COP [C4] ( %code_04AF50 )
}


code_04AF75 {
    COP [10] ( #05, #1D )
    COP [10] ( #06, #1D )
    COP [E0]
}


widestring_04AF7F `[TPL:A][TPL:0]Will: [N](I suspect [LU1:DB]a[N] clue in the house...)[PAL:0][END]`

---------------------------------------------

head_04AFB2 [
  h_event < #34, #00, #10 >   ;00
]

---------------------------------------------

func_04AFB5 {
    COP [B6] ( #30 )
    COP [BC] ( #08, #00 )
    COP [C1]
    RTL 

  code_04AFBF:
    COP [8D] ( #38 )
    STZ $08
    COP [C1]
    LDA $player_x_pos
    CLC 
    ADC #$0008
    SEC 
    SBC $14
    BPL code_04AFD6
    EOR #$FFFF
    INC 
}


code_04AFD6 {
    CMP #$0008
    BCS code_04AFF6
    LDA $player_y_pos
    CLC 
    ADC #$000A
    SEC 
    SBC $16
    BPL code_04AFEB
    EOR #$FFFF
    INC 
}


code_04AFEB {
    CMP #$0008
    BCS code_04AFF6
    COP [40] ( #$8001, &code_04B000 )
}


code_04AFF6 {
    COP [D0] ( #08, #01, &code_04AFFD )
    RTL 
}


code_04AFFD {
    COP [C1]
    RTL 
}


code_04B000 {
    COP [BF] ( &widestring_04B00F )
    COP [CC] ( #08 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [E0]
}


widestring_04B00F `[DLG:3,6][SIZ:D,3]Will picks up a card.[FIN]It is the Ace of[N]Diamonds, of course![END]`

---------------------------------------------

func_04B051 {
    COP [0B]
    COP [A2] ( %func_00E256, #$2300 )
    COP [C1]
    COP [80] ( #37 )
    COP [89]
    RTL 
}


---------------------------------------------

head_04B062 [
  h_event < #32, #00, #10 >   ;00
]

---------------------------------------------

func_04B065 {
    COP [D0] ( #4C, #01, &code_04B168 )
    COP [0B]
    LDA #$0200
    TSB $12
    COP [D0] ( #20, #01, &code_04B15C )
    COP [D0] ( #16, #01, &code_04B152 )
    COP [C0] ( &code_04B18E )
    LDA #$0800
    TSB $10

  code_04B087:
    COP [80] ( #32 )
    COP [89]
    COP [D0] ( #03, #00, &code_04B087 )
    LDA #$0800
    TRB $10
    LDA #$0200
    TRB $12
    COP [80] ( #02 )
    COP [89]
    COP [D2] ( #03, #00 )
    COP [C0] ( &code_04B196 )
    COP [80] ( #05 )
    COP [89]
    COP [D2] ( #05, #01 )
    COP [C0] ( &code_04B19B )
    COP [D2] ( #06, #01 )
    COP [C8] ( &code_04B16A )
    COP [C0] ( &code_04B1BB )
    COP [D2] ( #07, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [81] ( #08, #12 )
    COP [89]
    COP [86] ( #06, #03, #11 )
    COP [8A]
    COP [CA] ( #04 )
    COP [81] ( #09, #11 )
    COP [89]
    COP [84] ( #03, #1E )
    COP [8A]
    COP [9E] ( %code_04AFBF, #$0000, #$FFF0, #$1001 )
    COP [06] ( #2C )
    COP [CB]
    COP [85] ( #08, #04, #12 )
    COP [8A]
    COP [86] ( #07, #03, #12 )
    COP [8A]
    COP [81] ( #09, #11 )
    COP [89]
    COP [80] ( #02 )
    COP [89]
    COP [BF] ( &widestring_04B2F0 )
    COP [C0] ( &code_04B1C3 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [D2] ( #08, #01 )
    COP [C0] ( $840000 )
    COP [BF] ( &widestring_04B328 )
    COP [C8] ( &code_04B16A )
    COP [D2] ( #0A, #01 )
    COP [80] ( #02 )
    COP [89]
    COP [BF] ( &widestring_04B344 )
    COP [84] ( #05, #1E )
    COP [8A]
    COP [BF] ( &widestring_04B386 )
    COP [CC] ( #0B )
    COP [CE] ( #04 )
    LDA #$CFF0
    TRB $joypad_mask_std
}


code_04B152 {
    LDA #$0800
    TSB $10
    LDA #$0200
    TSB $12
}


code_04B15C {
    COP [C0] ( &code_04B1A0 )
    COP [C1]
    COP [80] ( #32 )
    COP [89]
    RTL 
}


code_04B168 {
    COP [E0]
}


code_04B16A {
    COP [86] ( #05, #04, #04 )
    COP [8A]
    COP [86] ( #05, #04, #03 )
    COP [8A]
    COP [84] ( #05, #10 )
    COP [8A]
    COP [86] ( #05, #04, #04 )
    COP [8A]
    COP [86] ( #05, #04, #03 )
    COP [8A]
    COP [C5]
}


code_04B18E {
    COP [CC] ( #01 )
    COP [BF] ( &widestring_04B1CB )
    RTL 
}


code_04B196 {
    COP [BF] ( &widestring_04B210 )
    RTL 
}


code_04B19B {
    COP [BF] ( &widestring_04B23F )
    RTL 
}


code_04B1A0 {
    COP [D0] ( #25, #01, &code_04B1B6 )
    COP [D0] ( #1C, #01, &code_04B1B1 )
    COP [BF] ( &widestring_04B3AD )
    RTL 
}


code_04B1B1 {
    COP [BF] ( &widestring_04B3DF )
    RTL 
}


code_04B1B6 {
    COP [BF] ( &widestring_04B40D )
    RTL 
}


code_04B1BB {
    COP [BF] ( &widestring_04B27E )
    COP [CC] ( #07 )
    RTL 
}


code_04B1C3 {
    COP [BF] ( &widestring_04B2F0 )
    COP [CC] ( #07 )
    RTL 
}


widestring_04B1CB `[TPL:A][TPL:4]Lance: [N][LU1:62]is it, Will?[N][LU1:1D]late.[FIN]I'm [LU1:C4]cards[N][LU1:F0]Seth.[N][LU2:42]a minute.[PAL:0][END]`

widestring_04B210 `[TPL:A][TPL:4]Lance: [N]Will, get [LU1:BE][LU2:73]and[N]sit [LU1:BC]to Erik.[PAL:0][END]`

widestring_04B23F `[TPL:A][TPL:4]Lance: Draw it to you[N]by spinning the Flute[N][LU1:6D][LU1:A5]a baton.[PAL:0][END]`

widestring_04B27E `[TPL:B][TPL:4]Lance: [N]Next. Pick a[N]card, any card.[FIN][LU1:1F]put four cards face[N]down. Pick the one[N]you [LU1:DA]is the[N]Ace of Diamonds.[PAL:0][END]`

widestring_04B2F0 `[TPL:A][TPL:4]Lance: Pick the one[N]you [LU1:DA]is the[N]Ace of Diamonds.[PAL:0][END]`

widestring_04B328 `[TPL:A][TPL:4]Lance: [N]Ahhh! Right!![PAL:0][END]`

widestring_04B344 `[TPL:A][TPL:4]Lance: [LU1:62]Seth says[N]is too complicated for[N]me to understand.[PAL:0][END]`

widestring_04B386 `[TPL:A][TPL:4]Lance: [N]Seth. [LU1:2B]play[N]one [LU1:B7]game.[PAL:0][END]`

widestring_04B3AD `[TPL:A][TPL:4]Lance: One more[N]game [LU1:F0]Seth[N]and I'm [LU1:93]home.[PAL:0][END]`

widestring_04B3DF `[TPL:A][TPL:4]Lance: [LU1:1D]a day off[N][LU1:8E]school.[N][LU1:2B][LU1:98][LU1:D0]fun.[PAL:0][END]`

widestring_04B40D `[TPL:A][TPL:4]Lance: [LU1:62]happened,[N]Will?[N]You [LU1:A9]so gloomy.[FIN][LU1:4B]you can't[N][LU2:AD]us about?[PAL:0][END]`

---------------------------------------------

head_04B455 [
  h_event < #33, #00, #10 >   ;00
]

---------------------------------------------

func_04B458 {
    COP [A0] ( %func_04B051, #$00E8, #$00C0, #$0300 )
    COP [D0] ( #4C, #01, &code_04B55D )
    COP [B6] ( #30 )
    COP [0B]
    LDA #$0200
    TSB $12
    COP [D0] ( #20, #01, &code_04B583 )
    COP [D0] ( #16, #01, &code_04B551 )
    COP [C0] ( &code_04B58F )
    LDA #$0800
    TSB $10

  code_04B488:
    COP [80] ( #33 )
    COP [89]
    COP [D0] ( #03, #00, &code_04B488 )
    LDA #$0800
    TRB $10
    LDA #$0200
    TRB $12
    COP [DA] ( #1D )
    COP [80] ( #12 )
    COP [89]
    COP [D2] ( #03, #00 )
    COP [C0] ( &code_04B597 )
    COP [80] ( #14 )
    COP [89]
    COP [C1]
    COP [28] ( #$0078, #$0090, &code_04B4BD )
    RTL 
}


code_04B4BD {
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$0000
    JSL $%func_00C6E4
    COP [C2]
    COP [BF] ( &widestring_04B652 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [CC] ( #05 )
    COP [C0] ( &code_04B5AC )
    LDY $06
    LDA $0014, Y
    STA $7F0010, X
    LDA $0016, Y
    STA $7F0012, X
    COP [C1]
    LDY $06
    LDA $0014, Y
    CMP $7F0010, X
    BNE code_04B504
    LDA $0016, Y
    CMP $7F0012, X
    BNE code_04B504
    RTL 
}


code_04B504 {
    COP [DA] ( #1F )
    COP [BF] ( &widestring_04B75D )
    COP [CC] ( #06 )
    COP [C8] ( &code_04B55F )
    COP [C0] ( &code_04B5B1 )
    COP [D2] ( #08, #01 )
    COP [C0] ( $840000 )
    COP [C8] ( &code_04B55F )
    COP [D2] ( #09, #01 )
    COP [82] ( #16, #11 )
    COP [89]
    COP [80] ( #12 )
    COP [89]
    COP [BF] ( &widestring_04B7DE )
    COP [CC] ( #0A )
    LDA #$0800
    TSB $10
    LDA #$0200
    TSB $12
    COP [82] ( #17, #12 )
    COP [89]
    COP [80] ( #14 )
    COP [89]
    COP [D2] ( #0B, #01 )
}


code_04B551 {
    COP [C0] ( &code_04B592 )
    COP [C1]
    COP [80] ( #33 )
    COP [89]
    RTL 
}


code_04B55D {
    COP [E0]
}


code_04B55F {
    COP [86] ( #14, #04, #04 )
    COP [8A]
    COP [86] ( #14, #04, #03 )
    COP [8A]
    COP [84] ( #14, #10 )
    COP [8A]
    COP [86] ( #14, #04, #04 )
    COP [8A]
    COP [86] ( #14, #04, #03 )
    COP [8A]
    COP [C5]
}


code_04B583 {
    COP [C0] ( &code_04B59C )
    COP [C1]
    COP [80] ( #33 )
    COP [89]
    RTL 
}


code_04B58F {
    COP [CC] ( #02 )
}


code_04B592 {
    COP [BF] ( &widestring_04B5B6 )
    RTL 
}


code_04B597 {
    COP [BF] ( &widestring_04B612 )
    RTL 
}


code_04B59C {
    COP [D0] ( #25, #01, &code_04B5A7 )
    COP [BF] ( &widestring_04B5B6 )
    RTL 
}


code_04B5A7 {
    COP [BF] ( &widestring_04B5ED )
    RTL 
}


code_04B5AC {
    COP [BF] ( &widestring_04B72B )
    RTL 
}


code_04B5B1 {
    COP [BF] ( &widestring_04B77C )
    RTL 
}


widestring_04B5B6 `[TPL:A][TPL:5]Seth:[N]Ah ha ha. I'm going[N]to win again for sure.[PAL:0][END]`

widestring_04B5ED `[TPL:A][TPL:5]Seth:[N]Why do I keep losing...?[PAL:0][END]`

widestring_04B612 `[TPL:A][TPL:5]Seth: I'm not[N]interested in girls. I[N][LU1:A5]adventures better.[PAL:0][END]`

widestring_04B652 `[TPL:A][TPL:5]Seth:[N]Everyone's here.[N][LU1:62][LU1:CA]we do today?[FIN][TPL:3]Erik: [N]I [LU1:F1]to see Will's[N]mysterious power.[FIN]You haven't [LU2:A7]it? [N]He can [LU1:B5][LU1:E0][N][LU1:F8]touching them.[FIN][TPL:4]Lance: He moved [N]the [LU1:C9]that's in the[N]corner of the cave.[FIN]Will. [N][LU2:37]me again.[PAL:0][END]`

widestring_04B72B `[TPL:A][TPL:5]Seth: [N]Face the [LU1:C9]and[N]push the L/R Buttons.[PAL:0][END]`

widestring_04B75D `[TPL:A][TPL:4]Lance: Oh![N]It moved!![PAL:0][PAU:28][CLD]`

widestring_04B77C `[TPL:A][TPL:5]Seth: No [LU1:B8]how[N][LU1:B6][LU2:AA]I see it,[N]I'm [LU1:D3]amazed.[FIN]But why can you [LU1:B5]the[N][LU1:C9][LU1:F6]you can't[N][LU1:B5][LU1:6C]else...?[PAL:0][END]`

widestring_04B7DE `[TPL:A][TPL:5]Seth: Yeah, it [LU1:B2]be[N][LU1:D0]kind of psychic[N][LU1:C2]thing.[FIN]If I [LU1:83][LU1:A4]better,[N]I'd [LU1:DA]it was magic.[FIN]Most [LU1:C1]have[N]five senses... [N]sight, [FIN]hearing, [FIN]taste, [FIN]smell, [FIN]and touch. [FIN]I [LU1:DA]Will's psychic[N][LU1:C2]is [LU1:D0]kind[N]of sixth sense.[PAL:0][END]`

---------------------------------------------

head_04B8B1 [
  h_event < #0A, #00, #10 >   ;00
]

---------------------------------------------

func_04B8B4 {
    COP [D0] ( #4C, #01, &code_04B96F )
    COP [C0] ( &code_04B995 )
    COP [D0] ( #20, #01, &code_04B95F )
    COP [D0] ( #16, #01, &code_04B962 )
    COP [D2] ( #01, #01 )
    COP [D2] ( #02, #01 )
    COP [CC] ( #16 )
    COP [CC] ( #04 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [04] ( #1B )
    COP [DA] ( #59 )
    COP [BF] ( &widestring_04B9AF )
    COP [86] ( #0F, #03, #02 )
    COP [8A]
    COP [80] ( #0B )
    COP [89]
    COP [DA] ( #3B )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [BF] ( &widestring_04B9F2 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [CC] ( #03 )
    COP [DA] ( #B3 )
    COP [CE] ( #03 )
    COP [BF] ( &widestring_04BA55 )
    COP [04] ( #1C )
    COP [DA] ( #77 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [85] ( #11, #02, #11 )
    COP [8A]
    COP [86] ( #0F, #03, #12 )
    COP [8A]
    COP [85] ( #10, #02, #12 )
    COP [8A]
    COP [80] ( #0A )
    COP [89]
    COP [0B]
    COP [D2] ( #05, #01 )
    COP [C0] ( &code_04B99A )
    COP [D2] ( #06, #01 )
    COP [C8] ( &code_04B971 )
    COP [C0] ( &code_04B99F )
    COP [D2] ( #08, #01 )
    COP [C8] ( &code_04B971 )
    COP [BF] ( &widestring_04BC16 )
    COP [CC] ( #09 )
}


code_04B95F {
    COP [C1]
    RTL 
}


code_04B962 {
    COP [25] ( #08, #09 )
    COP [0B]
    COP [C0] ( &code_04B99F )
    JMP $&code_04B95F
}


code_04B96F {
    COP [E0]
}


code_04B971 {
    COP [86] ( #0A, #04, #04 )
    COP [8A]
    COP [86] ( #0A, #04, #03 )
    COP [8A]
    COP [84] ( #0A, #10 )
    COP [8A]
    COP [86] ( #0A, #04, #04 )
    COP [8A]
    COP [86] ( #0A, #04, #03 )
    COP [8A]
    COP [C5]
}


code_04B995 {
    COP [BF] ( &widestring_04BB59 )
    RTL 
}


code_04B99A {
    COP [BF] ( &widestring_04BB89 )
    RTL 
}


code_04B99F {
    COP [D0] ( #21, #01, &code_04B9AA )
    COP [BF] ( &widestring_04BBB6 )
    RTL 
}


code_04B9AA {
    COP [BF] ( &widestring_04BBDA )
    RTL 
}


widestring_04B9AF `[DLG:3,6][SIZ:D,3][DLY:0]Suddenly Erik rushed in[N][LU1:F0]a desperate look[N]on his face.[PAU:3C][CLD]`

widestring_04B9F2 `[TPL:A][TPL:3]Erik: Ah! [N]News! Big news![FIN]The Princess of [LU1:11][N]Castle has run away![FIN]They say she [LU1:80]to[N][LU1:47]Cape![PAL:0][END]`

widestring_04BA55 `[TPL:B][TPL:4]Lance: That's all? [FIN]You [LU1:80]in [LU1:CE]a hurry[N][LU1:D7]I [LU1:D8]something[N][LU2:95]big had happened![FIN]The princess is probably[N][LU1:D7]spoiled girl, Kara..[N]The one you like[N]so much![FIN][TPL:3]Erik: LIAR![N][LU1:30]the soldiers[N][LU1:EF][LU1:79]here[N][LU1:AB]for her![FIN]The [LU2:A2]from[N][LU1:11]Castle [LU1:A9]so[N]cool. I [LU1:F1]a steel[N]helmet, too.[PAL:0][END]`

widestring_04BB59 `[TPL:A][TPL:3]Erik: [N]And I [LU1:D8]everyone[N][LU1:F3]be surprised...[PAL:0][END]`

widestring_04BB89 `[TPL:A][TPL:3]Erik: [N]Last [LU1:DF]you moved[N]the [LU1:C9]a [LU1:A6]way.[PAL:0][END]`

widestring_04BBB6 `[TPL:A][TPL:3]Erik: [N]If I [LU1:7A]only[N]do that...[PAL:0][END]`

widestring_04BBDA `[TPL:A][TPL:3]Erik: [LU1:64]the matter?[N][LU1:69]not acting like[N]the [LU1:CD]old Will.[PAL:0][END]`

widestring_04BC16 `[TPL:A][TPL:3]Erik: [N]I'm speechless...[FIN][LU1:1C]Seth.[N]This is [LU1:D0]type of[N]psychic power, right?[PAL:0][END]`

---------------------------------------------

head_04BC65 [
  h_event < #00, #00, #30 >   ;00
]

---------------------------------------------

func_04BC68 {
    COP [C1]
    COP [28] ( #$0208, #$00E0, &code_04BC9B )
    COP [28] ( #$0208, #$00DF, &code_04BC9B )
    COP [28] ( #$0128, #$0258, &code_04BCD8 )
    COP [28] ( #$0228, #$0218, &code_04BCE6 )
    COP [28] ( #$0218, #$0178, &code_04BCE6 )
    COP [28] ( #$0298, #$02C0, &code_04BCF4 )
    RTL 
}


code_04BC9B {
    COP [D0] ( #26, #01, &code_04BCA7 )
    COP [D0] ( #21, #01, &code_04BCBF )
}


code_04BCA7 {
    COP [D0] ( #12, #01, &code_04BCB4 )
    COP [CC] ( #12 )
    COP [BF] ( &widestring_04BD1B )
}


code_04BCB4 {
    COP [26] ( #06, #$0058, #$01C0, #00, #$2110 )
    RTL 
}


code_04BCBF {
    COP [26] ( #06, #$0058, #$01C0, #00, #$2110 )
    RTL 
    COP [D0] ( #12, #01, &code_04BCD7 )
    COP [CC] ( #12 )
    COP [BF] ( &widestring_04BD1B )
}


code_04BCD7 {
    RTL 
}


code_04BCD8 {
    COP [D0] ( #13, #01, &code_04BCE5 )
    COP [CC] ( #13 )
    COP [BF] ( &widestring_04BD5F )
}


code_04BCE5 {
    RTL 
}


code_04BCE6 {
    COP [D0] ( #14, #01, &code_04BCF3 )
    COP [CC] ( #14 )
    COP [BF] ( &widestring_04BD9B )
}


code_04BCF3 {
    RTL 
}


code_04BCF4 {
    COP [D0] ( #17, #01, &code_04BD16 )
    COP [D0] ( #16, #00, &code_04BD16 )
    COP [CC] ( #17 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04BE05 )
    LDA #$CFF0
    TRB $joypad_mask_std
}


code_04BD16 {
    COP [C4] ( %func_04BC68 )
}


widestring_04BD1B `[TPL:10][TPL:0]This is my house.[N]The pie [LU1:D7][N][LU1:17]Lola is making[N]smells [LU2:95]great.[PAL:0][END]`

widestring_04BD5F `[TPL:10][TPL:0]This is Lance's house.[N]He lives [LU2:73][LU1:F0]his[N]frail mother.[PAL:0][END]`

widestring_04BD9B `[TPL:10][TPL:0]My friend Erik [N]lives here.[FIN]This is the biggest[N][LU2:70]in [LU1:47]Cape.[N]Will envied [LU1:C1]born[N]to rich families...[PAL:0][END]`

widestring_04BE05 `[TPL:10][TPL:0]It was already [N][LU2:5C]by the [LU1:DF]Will [N][LU1:AE]the cave.[PAL:0][END]`

---------------------------------------------

head_04BE38 [
  h_event < #00, #00, #30 >   ;00
]

---------------------------------------------

func_04BE3B {
    COP [D0] ( #15, #01, &code_04BE57 )
    COP [CC] ( #15 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04BE87 )
    LDA #$CFF0
    TRB $joypad_mask_std
}


code_04BE57 {
    COP [C1]
    LDA $player_y_pos
    CMP #$00D0
    BEQ code_04BE62
    RTL 
}


code_04BE62 {
    COP [D0] ( #04, #01, &code_04BE73 )
    COP [26] ( #01, #$0290, #$02B0, #03, #$4300 )
    RTL 
}


code_04BE73 {
    COP [40] ( #$0400, &code_04BE7E )
    COP [C4] ( %code_04BE57 )
}


code_04BE7E {
    COP [BF] ( &widestring_04BF35 )
    COP [C4] ( %code_04BE57 )
}


widestring_04BE87 `[DLG:3,6][SIZ:D,4][TPL:0]It was natural for the[N]four friends to call [N][LU1:D6]seaside cave their[N]second home.[FIN]Usually, [LU1:F6]lessons[N][LU1:F2]done at the school,[FIN][LU2:AB]gathered [LU1:D9]to[N][LU2:AC]and play games[N][LU2:BC]sundown.[PAL:0][END]`

widestring_04BF35 `[TPL:A][TPL:4]Lance: [N]What, Will? [N]Going [LU2:72]already?[FIN][LU1:1D]not dinner [LU1:DF][N]yet. [LU1:2B]play a little[N][LU2:BF]longer.[PAL:0][END]`

---------------------------------------------

head_04BF90 [
  h_event < #00, #00, #18 >   ;00
]

---------------------------------------------

func_04BF93 {
    COP [D0] ( #21, #00, &code_04BFB8 )
    COP [BC] ( #04, #03 )
    COP [88] ( %table_0EDA00 )
    COP [8D] ( #06 )
    COP [23]
    AND #$0007
    STA $08
    COP [C2]

  code_04BFAE:
    COP [27] ( #02 )
    COP [80] ( #06 )
    COP [89]
    BRA code_04BFAE
}


code_04BFB8 {
    COP [E0]
}


---------------------------------------------

head_04BFBA [
  h_event < #00, #00, #18 >   ;00
]

---------------------------------------------

func_04BFBD {
    COP [D0] ( #21, #00, &code_04BFE2 )
    COP [BC] ( #FE, #03 )
    COP [88] ( %table_0EDA00 )
    COP [8D] ( #06 )
    COP [23]
    AND #$0007
    STA $08
    COP [C2]

  code_04BFD8:
    COP [27] ( #03 )
    COP [80] ( #06 )
    COP [89]
    BRA code_04BFD8
}


code_04BFE2 {
    COP [E0]
}


---------------------------------------------

head_04BFE4 [
  h_event < #1D, #00, #10 >   ;00
]

---------------------------------------------

func_04BFE7 {
    COP [D0] ( #21, #01, &code_04C04B )
    COP [C0] ( &code_04C05D )
    COP [D0] ( #3F, #01, &code_04BFFD )
    LDA #$CFF0
    TSB $joypad_mask_std
}


code_04BFFD {
    COP [85] ( #21, #07, #11 )
    COP [8A]
    COP [84] ( #1D, #08 )
    COP [8A]
    COP [84] ( #1A, #08 )
    COP [8A]
    COP [D0] ( #3F, #01, &code_04C023 )
    COP [BF] ( &widestring_04C115 )
    COP [CC] ( #3F )
    LDA #$CFF0
    TRB $joypad_mask_std
}


code_04C023 {
    COP [84] ( #1C, #08 )
    COP [8A]
    COP [85] ( #20, #1B, #12 )
    COP [8A]
    COP [84] ( #1C, #08 )
    COP [8A]
    COP [84] ( #1A, #08 )
    COP [8A]
    COP [84] ( #1D, #08 )
    COP [8A]
    COP [85] ( #21, #14, #11 )
    COP [8A]
    BRA code_04BFFD
}


code_04C04B {
    COP [C0] ( &code_04C062 )
    COP [25] ( #06, #27 )
    COP [0B]
    COP [80] ( #1A )
    COP [89]
    COP [C1]
    RTL 
}


code_04C05D {
    COP [BF] ( &widestring_04C067 )
    RTL 
}


code_04C062 {
    COP [BF] ( &widestring_04C0AF )
    RTL 
}


widestring_04C067 `[TPL:A]This is [LU1:27]Edward's[N]castle.[FIN]Go to the second[N][LU2:65]if you [LU1:F1]to[N][LU2:87][LU1:27]Edward.[END]`

widestring_04C0AF `[TPL:B]Ah! [LU1:1D]you![FIN][LU1:67]escaped[N][LU1:8E]the prison...[FIN]Trust [LU1:F7]I say. Run[N][LU1:8E][LU1:D6]castle. It'd[N]be [LU1:DE]if King[N][LU1:11][LU1:8F]you here.[END]`

widestring_04C115 `[TPL:A][LU1:45]This is King[N]Edward's castle. I must[N]report [LU1:D6]intrusion.[FIN][DLG:3,6][SIZ:D,3][TPL:0]Will shows the letter[N]to the guard.[FIN][TPL:A][PAL:0][LU1:45]A guest of the[N]King? I'm sorry, you[N]may pass.[END]`

---------------------------------------------

head_04C1B2 [
  h_event < #1C, #00, #10 >   ;00
]

---------------------------------------------

func_04C1B5 {
    COP [D0] ( #21, #01, &code_04C1F4 )
    COP [C0] ( &code_04C1FF )
    COP [85] ( #20, #07, #12 )
    COP [8A]
    COP [84] ( #1C, #08 )
    COP [8A]
    COP [84] ( #1A, #08 )
    COP [8A]
    COP [84] ( #1D, #08 )
    COP [8A]
    COP [85] ( #21, #1B, #11 )
    COP [8A]
    COP [86] ( #1F, #03, #12 )
    COP [8A]
    COP [85] ( #20, #03, #12 )
    COP [8A]
    COP [C0] ( &code_04C204 )
    COP [C1]
    RTL 
}


code_04C1F4 {
    COP [25] ( #38, #29 )
    COP [C0] ( &code_04C224 )
    COP [C1]
    RTL 
}


code_04C1FF {
    COP [BF] ( &widestring_04C229 )
    RTL 
}


code_04C204 {
    COP [D0] ( #D8, #01, &code_04C21F )
    COP [BF] ( &widestring_04C271 )
    COP [D4] ( #01, &code_04C21B )
    COP [BF] ( &widestring_04C299 )
    COP [CC] ( #D8 )
    RTL 
}


code_04C21B {
    JML $%code_00C6A1
}


code_04C21F {
    COP [BF] ( &widestring_04C2C2 )
    RTL 
}


code_04C224 {
    COP [BF] ( &widestring_04C2E9 )
    RTL 
}


widestring_04C229 `[TPL:B]This is [LU1:27]Edward's[N]castle. Be courteous[N]and [LU1:A4][LU1:D7]the King[N]is [LU1:ED]strict.[END]`

widestring_04C271 `[TPL:9][LU1:D]raise [LU1:FE]voice.[N]And mind [LU1:FE]manners.[FIN]`

widestring_04C299 `In exchange, I [LU1:EF]give[N]you one Red Jewel.[END]`

widestring_04C2C2 `[TPL:9][LU1:D]raise [LU1:FE]voice.[N]And mind [LU1:FE]manners.[END]`

widestring_04C2E9 `[TPL:8]Zzzzzz...Zzzzzz...[END]`

---------------------------------------------

head_04C2FE [
  h_event < #1A, #00, #10 >   ;00
]

---------------------------------------------

func_04C301 {
    COP [0B]
    COP [D0] ( #21, #01, &code_04C32A )
    COP [C0] ( &code_04C336 )
    COP [D2] ( #19, #01 )
    COP [0C]
    COP [82] ( #1E, #11 )
    COP [89]
    COP [85] ( #21, #02, #13 )
    COP [8A]
    COP [80] ( #1C )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}


code_04C32A {
    COP [C0] ( &code_04C346 )
    LDA #$0200
    TSB $12
    COP [C1]
    RTL 
}


code_04C336 {
    COP [D0] ( #19, #01, &code_04C341 )
    COP [BF] ( &widestring_04C34B )
    RTL 
}


code_04C341 {
    COP [BF] ( &widestring_04C379 )
    RTL 
}


code_04C346 {
    COP [BF] ( &widestring_04C3B4 )
    RTL 
}


widestring_04C34B `[DEF][LU1:27][LU1:11]is having[N]breakfast. [LU2:42]a while,[N][LU2:B6]enter.[END]`

widestring_04C379 `[DEF]The interview room is[N][LU1:74][LU2:C7]Climb the[N]stairs to [LU2:87]the king.[END]`

widestring_04C3B4 `[DEF]Zzzzzz...Zzzzzz...[END]`

---------------------------------------------

head_04C3C8 [
  h_event < #2A, #00, #10 >   ;00
]

---------------------------------------------

func_04C3CB {
    LDA #$0200
    TSB $12
    COP [BC] ( #08, #00 )
    COP [C0] ( &code_04C3EC )
    COP [D2] ( #05, #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [CC] ( #0A )
    COP [BF] ( &widestring_04C556 )
    COP [C1]
    RTL 
}


code_04C3EC {
    COP [BF] ( &widestring_04C40E )
    COP [BE] ( #02, #02, &code_list_04C3F6 )
}


code_list_04C3F6 [
  &code_04C3FC   ;00
  &code_04C402   ;01
  &code_04C3FC   ;02
]

code_04C3FC {
    COP [BF] ( &widestring_04C4D5 )
    BRA code_04C406
}


code_04C402 {
    COP [BF] ( &widestring_04C460 )
}


code_04C406 {
    COP [BF] ( &widestring_04C4FB )
    COP [CC] ( #05 )
    RTL 
}


widestring_04C40E `[TPL:F][TPL:4][LU1:27]Edward: [N][LU1:69]Will? [N]You [LU1:A9]so...shabby.[FIN][LU1:63]did you bring[N]the [LU1:7]Ring?[N][PAL:0] Yes[N] No`

widestring_04C460 `[CLR][TPL:4][LU1:18]An honest lad.[N]Give me the Ring.[FIN][TPL:0]Will: [N].............[FIN][TPL:4][LU1:27]Edward:[N]Hmm?[N][PAU:3C]Are you lying [N]to me, young whelp?![FIN]`

widestring_04C4D5 `[CLR][TPL:4]How dare you say such[N]a [LU1:E3]to me!![FIN]`

widestring_04C4FB `[CLR][TPL:4]Guards!! Throw this[N]impudent weasel in[N]prison!![FIN]Then go to Will's house[N]and [LU1:90]the Ring![END]`

widestring_04C556 `[PAU:1E][TPL:8][PAL:0][LU1:45]Yes,sir![PAU:28][CLD]`

---------------------------------------------

head_04C56A [
  h_event < #22, #00, #30 >   ;00
]

---------------------------------------------

func_04C56D {
    RTL 
}


---------------------------------------------

head_04C56E [
  h_event < #2B, #00, #18 >   ;00
]

---------------------------------------------

func_04C571 {
    LDA #$0200
    TSB $12
    COP [BC] ( #08, #00 )
    COP [C0] ( &code_04C588 )
    COP [D2] ( #0B, #01 )
    COP [CC] ( #0C )
    COP [C1]
    RTL 
}


code_04C588 {
    COP [BF] ( &widestring_04C58D )
    RTL 
}


widestring_04C58D `[DEF][TPL:3]Queen Edwina:[N]The [LU1:27]sent you the[N]letter. Talk to him.[PAL:0][END]`

---------------------------------------------

head_04C5C8 [
  h_event < #1C, #00, #10 >   ;00
]

---------------------------------------------

func_04C5CB {
    COP [0B]
    COP [C0] ( &code_04C5D4 )
    COP [C1]
    RTL 
}


code_04C5D4 {
    COP [BF] ( &widestring_04C5D9 )
    RTL 
}


widestring_04C5D9 `[DEF][LU1:45]So you are [N]Will.[FIN][LU2:35]to [LU1:98]kept[N]you waiting. [LU1:2B]go[N]see [LU1:27]Edward.[END]`

---------------------------------------------

head_04C61A [
  h_event < #1D, #00, #18 >   ;00
]

---------------------------------------------

func_04C61D {
    COP [C0] ( &code_04C66A )
    COP [B6] ( #30 )
    COP [0B]
    COP [D2] ( #0A, #01 )
    COP [0C]
    COP [C0] ( $840000 )
    COP [85] ( #21, #04, #11 )
    COP [8A]
    COP [86] ( #1F, #03, #12 )
    COP [8A]
    COP [85] ( #20, #03, #12 )
    COP [8A]
    COP [82] ( #1F, #12 )
    COP [89]
    COP [80] ( #1D )
    COP [89]
    LDA #$0800
    TRB $10
    COP [D2] ( #0C, #01 )
    COP [85] ( #21, #03, #11 )
    COP [8A]
    COP [86] ( #1E, #05, #11 )
    COP [8A]
    COP [C1]
    RTL 
}


code_04C66A {
    COP [BF] ( &widestring_04C66F )
    RTL 
}


widestring_04C66F `[DEF][LU1:45]If you [LU1:F1]to[N]see the King, keep[N][LU1:FE]wits [LU1:6B]you.[END]`

---------------------------------------------

head_04C69F [
  h_event < #1C, #00, #18 >   ;00
]

---------------------------------------------

func_04C6A2 {
    COP [C0] ( &code_04C765 )
    COP [B6] ( #30 )
    COP [0B]
    COP [D2] ( #0A, #01 )
    COP [0C]
    COP [C0] ( $840000 )
    COP [85] ( #20, #04, #12 )
    COP [8A]
    COP [86] ( #1F, #04, #12 )
    COP [8A]
    COP [81] ( #20, #12 )
    COP [89]
    COP [80] ( #1C )
    COP [89]
    LDA #$0800
    TRB $10
    COP [BF] ( &widestring_04C76A )
    COP [CC] ( #0B )
    COP [D2] ( #0C, #01 )
    COP [DA] ( #0B )
    COP [9C] ( %code_04C6F2, #$2000 )
    COP [86] ( #1E, #05, #11 )
    COP [8A]
    COP [C1]
    RTL 
}


code_04C6F2 {
    LDY $player_actor
    LDA $0014, Y
    CMP #$01F8
    BEQ code_04C707
    INC 
    STA $0014, Y
    COP [C2]
    COP [C2]
    BRA code_04C6F2
}


code_04C707 {
    COP [9C] ( %code_04C721, #$2000 )
    COP [CA] ( #50 )
    LDY $player_actor
    LDA $0016, Y
    INC 
    STA $0016, Y
    COP [C2]
    COP [CB]
    COP [E0]
}


code_04C721 {
    COP [DA] ( #1F )
    LDA #$000F
    STA $7F0010, X

  code_04C72B:
    LDA $7F0010, X
    DEC 
    BMI code_04C744
    STA $7F0010, X
    SEP #$20
    STA $INIDISP
    REP #$20
    COP [C3] ( %code_04C72B, #$0004 )
}


code_04C744 {
    COP [CC] ( #21 )
    LDA #$0404
    STA $064A
    LDA #$0301
    STA $0648
    COP [26] ( #0B, #$00E8, #$00A0, #83, #$3200 )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [E0]
}


code_04C765 {
    COP [BF] ( &widestring_04C66F )
    RTL 
}


widestring_04C76A `[TPL:D][TPL:0]Will: [N]Ma'am! Save me!![FIN][TPL:3]Queen Edwina: [N]Did you say Ma'am??![PAL:0][END]`

---------------------------------------------

head_04C7AE [
  h_event < #25, #00, #10 >   ;00
]

---------------------------------------------

func_04C7B1 {
    COP [C0] ( &code_04C7BA )
    COP [0B]
    COP [C1]
    RTL 
}


code_04C7BA {
    COP [BF] ( &widestring_04C7BF )
    RTL 
}


widestring_04C7BF `[DEF]Recently, a hunter was[N]hired.[N]I [LU1:F9][LU1:F7]the King[N]is thinking...[END]`

---------------------------------------------

head_04C7FC [
  h_event < #24, #00, #10 >   ;00
]

---------------------------------------------

func_04C7FF {
    COP [C0] ( &code_04C808 )
    COP [0B]
    COP [C1]
    RTL 
}


code_04C808 {
    COP [D0] ( #21, #01, &code_04C813 )
    COP [BF] ( &widestring_04C818 )
    RTL 
}


code_04C813 {
    COP [BF] ( &widestring_04C85A )
    RTL 
}


widestring_04C818 `[DEF]So [LU1:FF]Will.[N]You [LU1:F2]summoned by[N][LU1:27]Edward?[FIN]Be careful [LU1:F6]you[N][LU2:87][LU1:F0]him.[END]`

widestring_04C85A `[DEF]Are you [LU1:93]to [LU1:E7][N][LU1:26]out of the castle?[FIN][LU1:D]let the [LU1:27]find[N]you... [LU1:3B][LU1:E7][N][LU2:57]of the Princess.[END]`

---------------------------------------------

head_04C8B0 [
  h_event < #1B, #00, #10 >   ;00
]

---------------------------------------------

func_04C8B3 {
    COP [BC] ( #10, #00 )
    COP [0B]
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04C8C5 )
    COP [C1]
    RTL 
}


code_04C8C5 {
    COP [BF] ( &widestring_04C8CA )
    RTL 
}


widestring_04C8CA `[TPL:B][TPL:7]I... I love... you...[PAL:0][END]`

---------------------------------------------

head_04C8E6 [
  h_event < #25, #00, #10 >   ;00
]

---------------------------------------------

func_04C8E9 {
    COP [BC] ( #10, #00 )
    COP [0B]
    COP [C0] ( &code_04C8F6 )
    COP [C1]
    RTL 
}


code_04C8F6 {
    COP [BF] ( &widestring_04C8FB )
    RTL 
}


widestring_04C8FB `[TPL:B][LU1:63]he's[N]shy...[FIN]I'm glad [LU1:D7]somewhere[N]in the [LU1:F5][LU1:D9]is[N][LU1:CF]who is[N]thinking of me.[END]`

---------------------------------------------

head_04C947 [
  h_event < #1D, #00, #10 >   ;00
]

---------------------------------------------

func_04C94A {
    COP [B6] ( #30 )
    COP [D0] ( #21, #01, &code_04C9CC )
    COP [D0] ( #19, #01, &code_04C991 )
    COP [D0] ( #1A, #01, &code_04C991 )
    COP [0B]
    COP [0D] ( #00, #FF )
    COP [0D] ( #00, #01 )
    COP [C0] ( &code_04C9D7 )
    COP [D2] ( #01, #01 )
    COP [C0] ( $840000 )
    COP [D2] ( #02, #01 )
    COP [80] ( #1C )
    COP [89]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04CA41 )
    COP [0C]
    COP [0E] ( #00, #01 )
    LDA #$CFF0
    TRB $joypad_mask_std
}


code_04C991 {
    COP [C0] ( &code_04C9E5 )
    COP [82] ( #1F, #12 )
    COP [89]
    COP [80] ( #1A )
    COP [89]
    COP [0B]
    COP [D2] ( #03, #01 )
    COP [82] ( #1E, #11 )
    COP [89]
    COP [80] ( #1C )
    COP [89]
    COP [BF] ( &widestring_04CB20 )
    COP [CE] ( #03 )
    COP [D2] ( #19, #01 )

  code_04C9BC:
    COP [82] ( #1F, #12 )
    COP [89]
    COP [80] ( #1A )
    COP [89]
    COP [0B]
    COP [C1]
    RTL 
}


code_04C9CC {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04CA08 )
    BRA code_04C9BC
}


code_04C9D7 {
    COP [BF] ( &widestring_04CA0D )
    COP [CC] ( #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    RTL 
}


code_04C9E5 {
    COP [D0] ( #19, #01, &code_04C9F0 )
    COP [BF] ( &widestring_04CAE1 )
    RTL 
}


code_04C9F0 {
    COP [BF] ( &widestring_04CAF5 )
    COP [0C]
    LDA #$0008
    STA $player_speed_ew
    LDA $0656
    ORA #$0100
    STA $0656
    COP [0B]
    RTL 
}


code_04CA08 {
    COP [BF] ( &widestring_04CB3F )
    RTL 
}


widestring_04CA0D `[TPL:A][LU1:45]This is the[N]Princess's room.[N]Strangers [LU1:78]enter.[END]`

widestring_04CA41 `[TPL:A]Soldier:[N]This is [LU1:A3]a shabby boy.[FIN][TPL:0]Will: [N][LU1:1D]me, Kara.[FIN][TPL:1][LU1:25][N]Oh...That voice...[FIN]Let him in, or I'll[N][LU2:AD][LU1:89]your[N]old nickname.[FIN][PAL:0][SFX:10]Soldier:[N]Oh, pardon me![N][LU1:3B]enter![END]`

widestring_04CAE1 `[TPL:8]I'm at a loss... [END]`

widestring_04CAF5 `[TPL:9][LU1:68]business is[N]finished. Get out![FIN]Now![PAU:A][CLD]`

widestring_04CB20 `[TPL:9]Soldier:[N]Princess, let's go.[END]`

widestring_04CB3F `[TPL:9]Soldier:[N]Zzzzz...Zzzzz..[END]`

---------------------------------------------

head_04CB5A [
  h_event < #15, #00, #10 >   ;00
]

---------------------------------------------

func_04CB5D {
    COP [D0] ( #22, #01, &code_04CC5A )
    COP [B6] ( #30 )
    COP [D0] ( #21, #01, &code_04CC07 )
    COP [D0] ( #19, #01, &code_04CBFE )
    COP [D0] ( #1A, #01, &code_04CBAA )
    COP [D2] ( #01, #01 )
    COP [CC] ( #1A )
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04CC6E )
    COP [85] ( #19, #02, #11 )
    COP [8A]
    COP [86] ( #16, #02, #11 )
    COP [8A]
    COP [85] ( #19, #02, #11 )
    COP [8A]
    COP [80] ( #15 )
    COP [89]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04CC84 )
    COP [CC] ( #02 )
}


code_04CBAA {
    COP [80] ( #15 )
    COP [89]
    COP [25] ( #0B, #0C )
    COP [0B]
    COP [C1]
    COP [21] ( #02, &code_04CBBD )
    RTL 
}


code_04CBBD {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [BF] ( &widestring_04CC96 )
    COP [DA] ( #1D )
    COP [CA] ( #02 )
    COP [86] ( #15, #04, #04 )
    COP [8A]
    COP [86] ( #15, #04, #03 )
    COP [8A]
    COP [84] ( #15, #10 )
    COP [8A]
    COP [CB]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04CCE4 )
    COP [CC] ( #03 )
    COP [D2] ( #03, #00 )
    COP [BF] ( &widestring_04CDC0 )
    COP [CC] ( #19 )
    LDA #$CFF0
    TRB $joypad_mask_std
}


code_04CBFE {
    COP [C0] ( &code_04CC61 )
    COP [0B]
    COP [C1]
    RTL 
}


code_04CC07 {
    COP [9C] ( %code_04CF5C, #$2000 )
    COP [25] ( #05, #0A )
    COP [B6] ( #20 )
    COP [0B]
    COP [C0] ( &code_04CC66 )
    COP [80] ( #12 )
    COP [89]
    COP [D2] ( #01, #01 )
    COP [0F] ( #06, #36 )
    COP [0C]
    LDA #$1000
    TRB $10
    LDA #$0300
    TSB $10
    COP [9C] ( %func_00C806, #$2000 )
    TXA 
    TYX 
    TAY 
    LDA #$0000
    STA $7F0010, X
    LDA #$0012
    STA $7F0012, X
    TXA 
    TYX 
    TAY 
    COP [C0] ( $840000 )
    COP [C1]
    COP [C1]
    COP [89]
    RTL 
}


code_04CC5A {
    COP [E0]
    COP [BF] ( &widestring_04CDC0 )
    RTL 
}


code_04CC61 {
    COP [BF] ( &widestring_04CE45 )
    RTL 
}


code_04CC66 {
    COP [BF] ( &widestring_04CE4A )
    COP [CC] ( #01 )
    RTL 
}


widestring_04CC6E `[TPL:9][TPL:1][LU1:25]Who is it?[PAL:0][PAU:5A][CLD]`

widestring_04CC84 `[TPL:9][TPL:1][CLR][LU1:25]A guest?[PAL:0][END]`

widestring_04CC96 `[TPL:B][TPL:1][LU1:25][N]You...yesterday...[FIN][TPL:0]Will: I was told to[N][LU2:4E]the [LU1:7]Ring[N]to [LU1:27]Edward...[PAL:0][END]`

widestring_04CCE4 `[TPL:A][TPL:1][LU1:25][N]Terrible![N][LU1:1D]terrible![FIN]Again my [LU2:67]is[N][LU2:B2]to [LU1:E7]something[N]important [LU1:8E]someone![FIN][LU1:20]escaped [LU1:8E]the[N][LU2:53]before. Now they[N][LU1:FA]let me go out![FIN]Recently, [LU1:C8]very[N][LU1:C7]has [LU1:9D]in[N]the castle.[FIN]My [LU2:85]has hired[N]a famous hunter.[N][LU1:1D]ominous...[PAL:0][END]`

widestring_04CDC0 `[PAU:28][TPL:A][TPL:1][LU1:25] I [LU1:91]scared.[N]My [LU2:67]and mother[N][LU2:9E]to [LU1:98]changed.[FIN][LU1:3B][LU1:D1]me![N]Take me out of here![N]Please...[FIN][SFX:10][PAL:0][LU1:45]Princess...[FIN][TPL:1][LU1:25][N][LU1:3B][LU1:79]back, Will.[PAL:0][END]`

widestring_04CE45 `[TPL:A][JMP:CE2E]`

widestring_04CE4A `[TPL:B][TPL:1][LU1:25][N]Of course, you've come![N]Thank you.[FIN]Was the guard asleep[N]outside? His nickname is[N]"Old Snorehead.ˮ[N]Sleeping again.[FIN][TPL:0]Will: [LU1:68]little[N]pig has come....[FIN][TPL:1][LU1:25]His name is [N]Hamlet. Cute, isn't he?[FIN][TPL:1][LU1:25]He's [LU1:ED]smart.[N]He has [LU1:D0]kind of[N][LU1:C7]pig power...[FIN]Please, [LU1:E7]me out of[N]here![PAL:0][END]`

code_04CF5C {
    COP [D0] ( #22, #01, &code_04CFD9 )
    COP [0F] ( #1E, #2D )
    COP [0F] ( #1F, #2D )
    COP [0F] ( #20, #2D )
    COP [0F] ( #21, #2D )

  code_04CF72:
    COP [C1]
    COP [45] ( #1E, #2C, #22, #2D, &code_04CF7D )
    RTL 
}


code_04CF7D {
    COP [40] ( #$0400, &code_04CF88 )
    COP [C4] ( %code_04CF72 )
}


code_04CF88 {
    COP [D0] ( #01, #00, &code_04CF95 )
    COP [D6] ( #0A, &code_04CFA7 )
    BRA code_04CF9E
}


code_04CF95 {
    COP [BF] ( &widestring_04CFDB )
    COP [C4] ( %code_04CF72 )
}


code_04CF9E {
    COP [BF] ( &widestring_04D012 )
    COP [C4] ( %code_04CF72 )
}


code_04CFA7 {
    COP [CC] ( #22 )
    COP [CD] ( #$0119 )
    COP [BF] ( &widestring_04D069 )
    LDA #$0000
    STA $0D60
    LDA #$0001
    STA $0D62
    LDA #$0402
    STA $064A
    COP [65] ( #$0104, #$0334, #00, #02 )
    COP [26] ( #06, #$0058, #$01C0, #00, #$2110 )
    COP [C1]
    RTL 
}


code_04CFD9 {
    COP [E0]
}


widestring_04CFDB `[TPL:A][TPL:0]Will: [N](If you [LU1:F1]to [LU1:E7]her[N]away, now's the time...)[END]`

widestring_04D012 `[TPL:A][TPL:1]Karen: Oh, wait![N]It [LU1:EF]be a [LU1:A6]trip,[N]we [LU1:CA][LU1:E7]food![FIN]Would you go to the[N]cellar [LU1:F0]me?[PAL:0][END]`

widestring_04D069 `[TPL:A][TPL:1][LU1:25][N]At last, we leave.[FIN][LU1:2B]go to [LU1:FE]house.[N]I'm worried [LU1:6B]your[N]grandparents.[FIN][DLG:3,6][SIZ:D,3][PAL:0]They hurry to Will's.[END]`

---------------------------------------------

head_04D0D3 [
  h_event < #00, #00, #30 >   ;00
]

---------------------------------------------

func_04D0D6 {
    COP [BC] ( #08, #01 )
    COP [D0] ( #46, #01, &code_04D0FF )
    COP [D2] ( #01, #01 )
    COP [C0] ( &code_04D0FA )
    COP [C1]
    COP [45] ( #22, #37, #26, #3D, &code_04D0F3 )
    RTL 
}


code_04D0F3 {
    COP [BF] ( &widestring_04D114 )
    COP [C1]
    RTL 
}


code_04D0FA {
    COP [D4] ( #0A, &code_04D110 )
}


code_04D0FF {
    COP [CC] ( #46 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, %widestring_04D141 )
    COP [E0]
}


code_04D110 {
    JML $%code_00C98E
}


widestring_04D114 `[TPL:A][TPL:1][LU1:25][N]I [LU1:DA][LU1:CF]put food[N]in one of [LU1:E4]barrels.[PAL:0][END]`

widestring_04D141 `[DEF][SFX:0][DLY:9][LU1:67][LU1:8F]a large,[N]yummy roast leg of yak![PAU:FF][FIN][DLY:1][TPL:1][LU1:25][N]Everything's ready![N][LU1:2B]go [LU1:74]the[N][LU2:A2][LU1:90]us![PAL:0][END]`

---------------------------------------------

head_04D19D [
  h_event < #1D, #00, #10 >   ;00
]

---------------------------------------------

func_04D1A0 {
    COP [D0] ( #21, #01, &code_04D1B7 )
    COP [C0] ( &code_04D1B9 )
    COP [0B]
    COP [0D] ( #00, #01 )
    COP [BC] ( #00, #08 )
    COP [C1]
    RTL 
}


code_04D1B7 {
    COP [E0]
}


code_04D1B9 {
    COP [BF] ( &widestring_04D1BE )
    RTL 
}


widestring_04D1BE `[TPL:B]Soldier:[N]This is the underground[N]prison. Innocent people[N][LU1:78]enter.[END]`

---------------------------------------------

head_04D202 [
  h_event < #23, #00, #38 >   ;00
]

---------------------------------------------

func_04D205 {
    COP [D0] ( #24, #01, &code_04D30E )
    COP [A5] ( %code_04DB00, #00, #00, #$2000 )
    COP [0F] ( #0E, #11 )
    COP [0F] ( #0F, #11 )
    LDA #$0800
    TRB $10
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04D42F )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [D2] ( #02, #01 )
    COP [D2] ( #03, #01 )
    COP [D2] ( #04, #01 )
    LDA #$1000
    TRB $10
    COP [C3] ( %code_04D251, #$04B0 )
    LDA #$1000
    TSB $10
}


code_04D251 {
    COP [BF] ( &widestring_04D60A )
    COP [A0] ( %code_04D346, #$0108, #$FFD0, #$1002 )
    COP [D2] ( #01, #01 )
    LDA #$1000
    TRB $10
    COP [C3] ( %code_04D275, #$0258 )
    LDA #$1000
    TSB $10
}


code_04D275 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [BF] ( &widestring_04D679 )
    COP [DA] ( #1D )
    COP [3C] ( %func_00B7E2 )
    COP [DA] ( #BF )
    COP [BF] ( &widestring_04D732 )
    COP [3C] ( %func_00B7EC )
    COP [DA] ( #BF )
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [BF] ( &widestring_04D78A )
    COP [BE] ( #02, #02, &code_list_04D2A6 )
}


code_list_04D2A6 [
  &code_04D2AC   ;00
  &code_04D2AC   ;01
  &code_04D2AC   ;02
]

code_04D2AC {
    COP [BF] ( &widestring_04D87D )
    COP [A0] ( %code_04D408, #$00B8, #$FF70, #$0020 )
    COP [C1]
    LDA $0AD6
    BNE code_04D2C3
    RTL 
}


code_04D2C3 {
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04D8D2 )
    LDA #$1000
    TRB $10
    COP [C3] ( %code_04D2D6, #$012C )
}


code_04D2D6 {
    LDA #$1000
    TSB $10
    LDA #$2000
    TRB $10
    COP [BF] ( &widestring_04D4A5 )
    COP [86] ( #27, #06, #02 )
    COP [8A]
    COP [85] ( #29, #02, #01 )
    COP [8A]
    COP [82] ( #27, #12 )
    COP [89]
    COP [9E] ( %code_04D310, #$0000, #$FFF0, #$1000 )
    COP [D2] ( #23, #01 )
    COP [86] ( #26, #0E, #01 )
    COP [8A]
}


code_04D30E {
    COP [E0]
}


code_04D310 {
    LDA #$0200
    TSB $12
    COP [88] ( %table_0EE000 )
    COP [C0] ( &code_04D329 )
    COP [80] ( #00 )
    COP [89]
    COP [D2] ( #23, #01 )
    COP [E0]
}


code_04D329 {
    COP [BF] ( &widestring_04D4B1 )
    COP [D4] ( #02, &code_04D342 )
    COP [CC] ( #23 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, %widestring_04D5F4 )
    RTL 
}


code_04D342 {
    JML $%code_00C98E
}


code_04D346 {
    LDA #$0800
    TRB $10
    COP [C0] ( $840000 )
    LDA #$0200
    TSB $12
    COP [86] ( #2A, #03, #07 )
    COP [8A]
    COP [07] ( #1D )
    COP [82] ( #2A, #35 )
    COP [89]
    COP [B4]
    COP [0B]
    COP [C0] ( &code_04D36F )
    COP [C1]
    RTL 
}


code_04D36F {
    COP [BF] ( &widestring_04D37A )
    COP [CC] ( #01 )
    COP [0C]
    COP [E0]
}


widestring_04D37A `[DLG:3,11][SIZ:D,3]Will tastes [LU1:D0]of[N]the bread.[FIN]The bread is hard.[N][LU1:1D]the worst thing[N]he's [LU2:5D]tasted.[FIN]For [LU1:D0]reason, he[N][LU2:95]misses Grandma[N][LU1:2D]creative cuisine...[END]`

code_04D408 {
    COP [88] ( %table_0EE000 )
    LDA #$0085
    STA $7F000A, X
    COP [82] ( #06, #07 )
    COP [89]
    COP [A2] ( %func_00E155, #$2300 )
    COP [82] ( #06, #35 )
    COP [89]
    COP [C1]
    COP [80] ( #06 )
    COP [89]
    RTL 
}


widestring_04D42F `[DLG:3,11][SIZ:D,3][TPL:0]Will: [N]I [LU1:F9]why I have[N]to suffer so...[FIN]I [LU1:F9][LU1:F7]will[N][LU1:71]of me now.[FIN]Anyway, I [LU1:98]to[N][LU1:DA]of a way[N]to get out of here.[PAL:0][END]`

widestring_04D4A5 `[TPL:C][LU1:3A]oink[PAU:28][CLD]`

widestring_04D4B1 `[DLG:3,11][SIZ:D,4][TPL:0]Will: [N]I [LU1:F9]if [LU1:D6][N]is Kara's pig...[FIN][LU1:62]luck! There's a[N][LU2:7F]and a key tied[N]to its tail...[FIN][TPL:F][PAL:0]The [LU2:7F]read...[FIN][TPL:1] [LU2:35]to hear[N] [LU1:D7][LU1:FF]in prison.[FIN] [LU1:1D][LU1:DE][LU1:F7]my[N] [LU1:92]done, but hear[N] [LU1:F7]I [LU1:98]to say.[FIN] I too am a prisoner[N] --in a [LU2:91]of silk[N] and gold. [FIN] But tonight I [N] [LU1:EF][LU1:AC]the castle[N] forever. [FIN] You [LU2:48][LU1:EF][N] be free. [N]                  Kara[PAL:0][FIN]`

widestring_04D5F4 `[CLR][SFX:0][DLY:9]You [LU1:98]the key![PAU:FF][END]`

widestring_04D60A `[DLG:3,12][SIZ:D,3]A soldier's whisper[N]comes [LU1:8E]a hole[N]in the ceiling.[FIN][DLG:3,12][SIZ:D,3][LU1:1D]today's ration of[N]bread.[N][LU1:12]moss drinks water.[END]`

widestring_04D679 `[DLG:3,11][SIZ:D,4][TPL:0]Time passes slowly, but[N]the [LU1:A6]day is ending.[FIN]It pains me to [LU1:DA]of[N]the prisoners' feelings,[N]not knowing [LU1:F7]they[N][LU1:CA]do....[FIN]While I was [LU2:B2]to[N][LU1:DA]of a way out,[N]I drifted off to sleep.[PAL:0][END]`

widestring_04D732 `[PAU:78][DLG:3,11][SIZ:D,3][DLY:0]A familiar voice[N]speaks [LU1:8E]the flute.[FIN][TPL:E][TPL:4][LU2:E][N]Will....[FIN]Flute:[N]This is [LU1:FE]father.[END]`

widestring_04D78A `[PAU:3C][TPL:E][TPL:0][DLY:0]Will: [N]Father...? [FIN][TPL:4][LU2:E]You were[N]a cute child, but now[N]you've grown up.[FIN]Isn't [LU1:17]Lola's[N]pie delicious?[FIN][TPL:0]Will: [N]Uh, sure, Dad![N][LU1:65]are you?![FIN][TPL:4]Flute:[N]I [LU1:78][LU2:AD]you now...[FIN][TPL:F][TPL:4]I [LU1:98][LU1:C8]to ask[N]of [LU2:C7]Listen...[N][PAL:0] [LU1:6A]if [LU1:9F][LU1:FE]wish![N] No! You deserted me!`

widestring_04D87D `[CLD][TPL:F][TPL:4][CLR][DLY:0]Flute:[N]I [LU1:F1]you to[N][LU1:D1]me....[FIN]I, [LU2:B7]was once[N]held in [LU1:D6]cell.[N]Look at the[N][LU2:82]wall.[END]`

widestring_04D8D2 `[DEF][TPL:0]Will: [N]...This? [FIN][TPL:4][LU2:E][LU2:14]you[N][LU1:99]anything[N][LU1:8E][LU1:1A]Bill?[FIN][TPL:0]Will: [N]Grandpa?[N]He was an architect...[FIN][TPL:4]Flute:[N][LU1:68][LU1:1A]knows the [N]secret of [LU1:D7]stone.[FIN][TPL:0]Will: [N]Secret...?[FIN][TPL:4][LU2:E]Starting now,[N]you [LU1:EF]encounter[N]a [LU1:DE]thing.[FIN][TPL:0]Will: [N]Do I [LU1:98]to...?[FIN][TPL:4][LU2:E]Pick up the[N][LU2:9D][LU1:FE]enemy left.[FIN]The [LU1:C2]of the[N][LU1:7]is contained[N]there.[FIN]That [LU1:C2][LU1:EF]prove[N]to be [LU1:FE]ally....[FIN]You [LU1:B2][LU2:84]a[N]pilgrimage to the ruins[N]of the [LU1:F5]to [LU1:90][N]the Mystic Statues.[FIN]The closer you get to [N]the Crystal, [N]the stronger the evil[N][LU1:C2][LU1:EF]be...[FIN]Will... No time...[N]Quickly... First[N]to the Incan ruins...[FIN][PAL:0][SFX:10]The flute's [LU1:EE]fades[N]and disappears.[END]`

code_04DB00 {
    COP [4F] ( @bmp_000000+A00, #$4700, #$0200 )
    COP [C2]
    COP [D0] ( #00, #00, &code_04DB00 )
    RTL 
}


---------------------------------------------

head_04DB12 [
  h_event < #00, #00, #10 >   ;00
]

---------------------------------------------

func_04DB15 {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DB24 )
    COP [D2] ( #24, #01 )
    COP [E0]
}


code_04DB24 {
    COP [BF] ( &widestring_04DB2D )
    COP [CC] ( #02 )
    COP [E0]
}


widestring_04DB2D `[DLG:3,12][SIZ:D,3][TPL:0]Will: [N][LU1:1D]locked...[PAL:0][END]`

---------------------------------------------

head_04DB4A [
  h_event < #00, #00, #10 >   ;00
]

---------------------------------------------

func_04DB4D {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DB59 )
    COP [C1]
    RTL 
}


code_04DB59 {
    COP [BF] ( &widestring_04DB62 )
    COP [CC] ( #03 )
    COP [E0]
}


widestring_04DB62 `[TPL:E][TPL:0]Will: This moss has seen[N][LU2:B8]of prisoners [N][LU1:79]and go... [FIN]Those prisoners [LU1:B2][N][LU1:98][LU1:70]encouraged [N]by any sign of life....[PAL:0][END]`

---------------------------------------------

head_04DBD9 [
  h_event < #00, #00, #10 >   ;00
]

---------------------------------------------

func_04DBDC {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DBE8 )
    COP [C1]
    RTL 
}


code_04DBE8 {
    COP [BF] ( &widestring_04DBF1 )
    COP [CC] ( #04 )
    COP [E0]
}


widestring_04DBF1 `[TPL:E][TPL:0]Will: [LU1:4D]was [N]chained to [LU1:D6]ball...[PAL:0][END]`

---------------------------------------------

head_04DC19 [
  h_event < #1B, #00, #10 >   ;00
]

---------------------------------------------

func_04DC1C {
    COP [D0] ( #42, #00, &code_04DC26 )
    COP [12] ( #09, #17 )
}


code_04DC26 {
    COP [D0] ( #43, #00, &code_04DC30 )
    COP [12] ( #14, #17 )
}


code_04DC30 {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DC59 )
    COP [0B]
    COP [C1]
    COP [45] ( #0D, #12, #11, #14, &code_04DC4F )
    LDY $player_actor
    LDA #$2000
    STA $000E, Y
    RTL 
}


code_04DC4F {
    LDY $player_actor
    LDA #$3000
    STA $000E, Y
    RTL 
}


code_04DC59 {
    COP [BF] ( &widestring_04DC5E )
    RTL 
}


widestring_04DC5E `[TPL:E]I [LU1:82][LU1:BA]anyone's[N]help... I can[N]get out by myself...[END]`

---------------------------------------------

head_04DC92 [
  h_event < #00, #00, #20 >   ;00
]

---------------------------------------------

func_04DC95 {
    LDA $0ACA
    CMP #$0008
    BNE code_04DCBB
    COP [C1]
    LDA $0ACA
    CMP #$0008
    BNE code_04DCA8
    RTL 
}


code_04DCA8 {
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #27 )
    COP [BF] ( &widestring_04DCBD )
    LDA #$CFF0
    TRB $joypad_mask_std
}


code_04DCBB {
    COP [E0]
}


widestring_04DCBD `[DEF][TPL:0][DLY:0]Will:[N][LU1:61]you defeat all of[N]the [LU1:8C][LU1:6D]you,[N]a Jewel [LU1:EF]appear.[PAL:0][END]`

---------------------------------------------

head_04DCFD [
  h_event < #04, #00, #10 >   ;00
]

---------------------------------------------

func_04DD00 {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DD1B )
    COP [88] ( %table_0EDA00 )
    COP [8D] ( #04 )
    COP [0B]
    COP [C1]
    COP [80] ( #04 )
    COP [89]
    RTL 
}


code_04DD1B {
    COP [BF] ( &widestring_04DD20 )
    RTL 
}


widestring_04DD20 `[DEF][LU1:61]you defeat the[N]enemies, a shiny silver[N][LU1:C]Gem [LU1:EF]appear.[FIN]If you collect 100 of[N]these, you gain[N]one life...[FIN][LU1:12]if [LU1:FF]defeated,[N]you [LU1:FA][LU1:98]to go[N][LU1:73][LU1:ED]far...[END]`

---------------------------------------------

head_04DDB6 [
  h_event < #02, #00, #10 >   ;00
]

---------------------------------------------

func_04DDB9 {
    COP [0B]
    COP [C0] ( &code_04DDC2 )
    COP [C1]
    RTL 
}


code_04DDC2 {
    COP [BF] ( &widestring_04DDC7 )
    RTL 
}


widestring_04DDC7 `[TPL:A][LU2:20][LU1:C1]have[N][LU1:79][LU2:73]to gather[N]Incan gold.[FIN]But [LU1:B6]who set foot[N]in the Incan [LU2:98]have[N][LU1:BB]returned...[END]`

---------------------------------------------

head_04DE21 [
  h_event < #02, #00, #10 >   ;00
]

---------------------------------------------

func_04DE24 {
    COP [0B]
    COP [C0] ( &code_04DE2D )
    COP [C1]
    RTL 
}


code_04DE2D {
    COP [BF] ( &widestring_04DE32 )
    RTL 
}


widestring_04DE32 `[DEF]Try [LU2:97]down that[N]hill, and keep running.[N]You'll be surprised.[END]`

---------------------------------------------

head_04DE70 [
  h_event < #0C, #00, #10 >   ;00
]

---------------------------------------------

func_04DE73 {
    COP [0B]
    COP [C0] ( &code_04DE7C )
    COP [C1]
    RTL 
}


code_04DE7C {
    COP [BF] ( &widestring_04DE81 )
    RTL 
}


widestring_04DE81 `[TPL:A]The [LU2:98]are an ancient[N]tomb. Why [LU1:78]you[N][LU1:AC][LU1:E6]alone?[END]`

---------------------------------------------

head_04DEB3 [
  h_event < #03, #00, #10 >   ;00
]

---------------------------------------------

func_04DEB6 {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DEC4 )
    COP [0B]
    COP [C1]
    RTL 
}


code_04DEC4 {
    COP [BF] ( &widestring_04DEC9 )
    RTL 
}


widestring_04DEC9 `[DEF][LU1:1D][LU1:D4][LU1:D7]a messenger[N]appeared [LU2:73][LU1:F6]the[N][LU1:6F][LU1:F5]was about[N]to be destroyed.[END]`

---------------------------------------------

head_04DF0C [
  h_event < #0B, #00, #10 >   ;00
]

---------------------------------------------

func_04DF0F {
    LDA #$0200
    TSB $12
    COP [C0] ( &code_04DF1D )
    COP [0B]
    COP [C1]
    RTL 
}


code_04DF1D {
    COP [BF] ( &widestring_04DF22 )
    RTL 
}


widestring_04DF22 `[DEF]Then, all [LU1:6D]the[N]world, disease and[N]famine began to[N]increase...[FIN]This planet had always[N][LU1:70]peaceful.[END]`

---------------------------------------------

head_04DF85 [
  h_event < #0A, #00, #10 >   ;00
]

---------------------------------------------

func_04DF88 {
    COP [C0] ( &code_04DF91 )
    COP [0B]
    COP [C1]
    RTL 
}


code_04DF91 {
    COP [BF] ( &widestring_04DF96 )
    RTL 
}


widestring_04DF96 `[DEF]The Incas who lived here[N][LU1:F2]a tribe without[N]a [LU2:C3]language.[FIN]Their legends are[N][LU1:AE]in song.[FIN][LU1:12]in seemingly[N]meaningless melodies,[N][LU1:D9]is a message.[END]`

---------------------------------------------

head_04E022 [
  h_event < #0A, #00, #10 >   ;00
]

---------------------------------------------

func_04E025 {
    COP [C0] ( &code_04E02E )
    COP [0B]
    COP [C1]
    RTL 
}


code_04E02E {
    COP [BF] ( &widestring_04E033 )
    RTL 
}


widestring_04E033 `[DEF]There are no other[N][LU1:7D][LU2:18]age[N]in the [LU2:BD]Please[N][LU1:71]friends.[END]`

---------------------------------------------

head_04E06A [
  h_event < #12, #00, #10 >   ;00
]

---------------------------------------------

func_04E06D {
    COP [D0] ( #4B, #01, &code_04E110 )
    COP [D0] ( #37, #01, &code_04E112 )
    COP [D0] ( #2B, #00, &code_04E08B )
    COP [D0] ( #3B, #01, &code_04E110 )
    COP [25] ( #41, #27 )
    BRA code_04E0F1
}


code_04E08B {
    COP [D0] ( #26, #00, &code_04E110 )
    COP [D2] ( #01, #01 )
    COP [CA] ( #10 )
    LDA $16
    SEC 
    SBC #$0010
    STA $16
    COP [CB]
    COP [D2] ( #02, #01 )
    COP [80] ( #15 )
    COP [89]
    COP [BF] ( &widestring_04E124 )
    COP [CC] ( #03 )
    LDA #$0800
    TSB $10
    COP [81] ( #19, #11 )
    COP [89]
    COP [82] ( #16, #11 )
    COP [89]
    COP [81] ( #19, #01 )
    COP [89]
    COP [86] ( #16, #02, #01 )
    COP [8A]
    COP [85] ( #19, #06, #01 )
    COP [8A]
    COP [82] ( #16, #11 )
    COP [89]
    COP [85] ( #19, #02, #01 )
    COP [8A]
    COP [86] ( #17, #05, #12 )
    COP [8A]
    COP [81] ( #19, #11 )
    COP [89]
}


code_04E0F1 {
    COP [80] ( #15 )
    COP [89]
    LDA #$0800
    TRB $10
    COP [D2] ( #05, #01 )
    COP [BF] ( &widestring_04E175 )
    COP [86] ( #17, #04, #02 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
}


code_04E110 {
    COP [E0]
}


code_04E112 {
    COP [25] ( #49, #27 )
    COP [0B]
    COP [C0] ( &code_04E11F )
    COP [C1]
    RTL 
}


code_04E11F {
    COP [BF] ( &widestring_04E196 )
    RTL 
}


widestring_04E124 `[TPL:E][TPL:1][LU1:25][N]I [LU1:78]help it. [N]My feet hurt. [FIN][TPL:2][LU1:2A]Oh, OK.[N][LU1:63][LU1:79][LU1:F0]me.[N][LU1:1F]show you my house.[PAL:0][END]`

widestring_04E175 `[TPL:E][TPL:1][LU1:25]Lilly, wait. [N][LU1:1F]go, too.[PAL:0][END]`

widestring_04E196 `[TPL:E][TPL:1][LU1:25]I [LU1:A4]you [N][LU1:82][LU1:BA]me.....[PAL:0][END]`

---------------------------------------------

head_04E1B3 [
  h_event < #13, #00, #10 >   ;00
]

---------------------------------------------

func_04E1B6 {
    COP [D0] ( #37, #01, &code_04E1EF )
    COP [C0] ( &code_04E1F1 )
    COP [0B]
    COP [D2] ( #01, #01 )
    COP [0C]
    COP [85] ( #19, #02, #11 )
    COP [8A]
    COP [80] ( #13 )
    COP [89]
    COP [BF] ( &widestring_04E223 )
    COP [CC] ( #02 )
    COP [D2] ( #02, #00 )
    COP [81] ( #19, #01 )
    COP [89]
    COP [86] ( #16, #02, #01 )
    COP [8A]
    COP [CC] ( #03 )
}


code_04E1EF {
    COP [E0]
}


code_04E1F1 {
    COP [BF] ( &widestring_04E1F6 )
    RTL 
}


widestring_04E1F6 `[TPL:A][TPL:1][LU1:25][LU1:1D]a  [N][LU1:95][LU2:BD]The [N]breeze is refreshing.[PAL:0][END]`

widestring_04E223 `[TPL:A][TPL:1][LU1:25]I'm going, too! [N]I [LU1:F1]to see [N]the [LU1:31]Tribe. [FIN]Since I escaped the[N]confinement of the[N]castle, [FIN]I [LU1:F1]to[N]see and [LU1:9B]everything.[PAL:0][END]`

---------------------------------------------

head_04E2A3 [
  h_event < #1A, #00, #10 >   ;00
]

---------------------------------------------

func_04E2A6 {
    COP [D0] ( #2B, #00, &code_04E2B9 )
    COP [D0] ( #3B, #01, &code_04E3CC )
    COP [25] ( #41, #26 )
    JMP $&code_04E398
}


code_04E2B9 {
    COP [D0] ( #26, #00, &code_04E3CC )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04E3D5 )
    LDA #$6000
    TRB $joypad_mask_std
    LDA #$1000
    TRB $10

  code_04E2D7:
    COP [C1]
    COP [D0] ( #40, #01, &code_04E2E6 )
    COP [40] ( #$0F01, &code_04E3CE )
    RTL 
}


code_04E2E6 {
    LDA #$1000
    TSB $10
    LDA #$EFF0
    TSB $joypad_mask_std
    SEP #$20
    LDA #$80
    STA $CGWSEL
    LDA #$03
    STA $CGADSUB
    REP #$20
    COP [3C] ( %func_00B7CE )
    COP [DA] ( #7F )
    COP [CC] ( #01 )
    COP [CA] ( #10 )
    LDA $06C2
    SEC 
    SBC #$0010
    STA $06C2
    LDY $player_actor
    LDA $0016, Y
    SEC 
    SBC #$0010
    STA $0016, Y
    LDA $16
    SEC 
    SBC #$0010
    STA $16
    COP [CB]
    LDA #$0300
    STA $camera_bounds_y
    COP [CE] ( #01 )
    COP [DA] ( #3B )
    COP [3C] ( %func_00B7D8 )
    COP [DA] ( #9D )
    COP [DA] ( #59 )
    COP [BF] ( &widestring_04E46F )
    COP [CC] ( #02 )
    COP [D2] ( #03, #01 )
    LDA #$EFF0
    TRB $joypad_mask_std
    COP [CC] ( #2B )
    LDA #$0800
    TSB $10
    COP [82] ( #1E, #11 )
    COP [89]
    COP [81] ( #21, #01 )
    COP [89]
    COP [86] ( #1E, #02, #01 )
    COP [8A]
    LDA #$CFF0
    TRB $joypad_mask_std
    COP [85] ( #21, #06, #01 )
    COP [8A]
    COP [82] ( #1E, #11 )
    COP [89]
    COP [85] ( #21, #02, #01 )
    COP [8A]
    COP [86] ( #1F, #06, #12 )
    COP [8A]
    COP [81] ( #21, #11 )
    COP [89]
}


code_04E398 {
    COP [80] ( #1D )
    COP [89]
    LDA #$0800
    TRB $10
    COP [D2] ( #04, #01 )
    LDA #$0001
    JSL $%func_00C6E4
    COP [80] ( #1A )
    COP [89]
    COP [BF] ( &widestring_04E53C )
    LDA #$0800
    TSB $10
    COP [86] ( #1F, #02, #12 )
    COP [8A]
    COP [CC] ( #05 )
    COP [86] ( #1F, #04, #12 )
    COP [8A]
}


code_04E3CC {
    COP [E0]
}


code_04E3CE {
    COP [BF] ( &widestring_04E440 )
    JMP $&code_04E2D7
}


widestring_04E3D5 `[TPL:F][TPL:2][LU1:2A]This is my[N]village, but you're[N][LU2:8F][LU2:A5]that[N][LU1:D9]are no houses.[FIN]Will, try [LU1:C4]the [N][LU1:B4][LU1:D7][LU2:54]to me [N][LU1:EA][LU1:11]Castle.[PAL:0][END]`

widestring_04E440 `[TPL:E][TPL:2][LU1:2A]Will. [LU1:65][N]are you going? [N][LU2:27]the [LU1:B4]here.[PAL:0][END]`

widestring_04E46F `[TPL:F][TPL:2]Lilly:[N]Were you surprised?[FIN]There's a barrier [LU1:6D][N][LU1:D6][LU2:BD]Most [N][LU1:C1][LU1:78]see it. [FIN]The princess is [N]getting to be [N]a bother.... [FIN]On the road, all I [LU1:99][N]was "My feet hurt, I'm [N]thirsty.ˮ I'm tired [N]of hearing it.[PAL:0][END]`

widestring_04E53C `[TPL:F][TPL:2][LU1:2A]We [LU1:83]ask her[N]to [LU1:79]along.[FIN]Will. This is my house. [N]You can [LU1:A9][LU1:6D][N]the village, but [LU2:B6][N][LU1:79][LU1:73]here.[PAL:0][END]`

---------------------------------------------

head_04E5A1 [
  h_event < #1C, #00, #10 >   ;00
]

---------------------------------------------

func_04E5A4 {
    COP [D0] ( #37, #01, &code_04E5F2 )
    COP [C0] ( &code_04E5F4 )
    COP [0B]
    COP [D2] ( #02, #01 )
    COP [80] ( #1A )
    COP [89]
    COP [BF] ( &widestring_04E7C9 )
    COP [CE] ( #02 )
    COP [D2] ( #03, #01 )
    COP [BF] ( &widestring_04E869 )
    COP [CC] ( #37 )
    LDA #$0000
    STA $0D60
    LDA #$0002
    STA $0D62
    LDA #$0404
    STA $064A
    COP [65] ( #$00C4, #$02B4, #00, #05 )
    COP [26] ( #1A, #$0150, #$01A0, #00, #$2200 )
    COP [C1]
    RTL 
}


code_04E5F2 {
    COP [E0]
}


code_04E5F4 {
    COP [D6] ( #03, &code_04E609 )
    COP [D0] ( #47, #01, &code_04E604 )
    COP [BF] ( &widestring_04E62C )
    RTL 
}


code_04E604 {
    COP [BF] ( &widestring_04E679 )
    RTL 
}


code_04E609 {
    COP [BF] ( &widestring_04E6E6 )
    COP [BE] ( #02, #01, &code_list_04E613 )
}


code_list_04E613 [
  &code_04E619   ;00
  &code_04E61E   ;01
  &code_04E619   ;02
]

code_04E619 {
    COP [BF] ( &widestring_04E78B )
    RTL 
}


code_04E61E {
    COP [BF] ( &widestring_04E778 )
    COP [CC] ( #01 )
    LDA #$CFF0
    TSB $joypad_mask_std
    RTL 
}


widestring_04E62C `[TPL:B][TPL:2][LU1:2A]The [LU2:A]is in [N]the [LU2:68]garden. He's [N][LU1:ED]old, but [LU1:ED]wise.[N][LU2:34]we go see him?[PAL:0][END]`

widestring_04E679 `[TPL:A][TPL:2][LU1:2A]What? Inca[N]Statue?[FIN][LU1:1D][LU1:D4]that[N][LU1:9F]in a cave on the[N][LU2:8C]of town....[FIN]Seems [LU1:DB]a wall[N][LU1:D9][LU1:D7]sounds[N][LU1:86][LU1:F6]struck...[PAL:0][END]`

widestring_04E6E6 `[TPL:B][TPL:2]Lilly:[N]What? [LU1:31]Tribe?[FIN]I know.[N]Not a tribe, [LU1:B7]like[N]a [LU1:C7]shadow form.[FIN]A high mountain peak[N]near [LU2:73]has[N][LU1:71][LU1:E1]home.[FIN][LU2:34]we go?[N][PAL:0] [LU1:6A]let's go.[N] [LU1:2B]quit.`

widestring_04E778 `[CLR][TPL:2][LU1:2A]OK.[N][LU1:1F]lead.[PAL:0][END]`

widestring_04E78B `[CLR][TPL:2][LU1:2A]If you[N][LU2:84]him mad, you'll[N][LU2:81][LU1:FE]life,[N]so you'd [LU2:50]stop it.[PAL:0][END]`

widestring_04E7C9 `[TPL:A][TPL:2][LU1:2A]No! [N][LU1:1D]too dangerous [N]for princesses! [FIN]If you [LU1:82][LU1:F1]to [N]bother Will, [LU1:A3][N]wait [LU2:73]quietly. [FIN][TPL:1][LU1:25][N]I [LU2:9E]to be the [LU2:89][N]one [LU1:AE]out. [FIN]So [LU1:1F][LU2:AC]to[N][LU1:17]Lola.[N]Nyaa nyaa!!![PAL:0][END]`

widestring_04E869 `[TPL:A][TPL:0]Will: [N][LU2:33]sulking... [FIN][TPL:2]Lilly:[N][LU1:1D][LU1:94]medicine for[N]a selfish girl.[FIN]The mountain pass will[N]be difficult, but let's[N]do the [LU2:4D]we can.[FIN][DLG:3,6][SIZ:D,3][PAL:0]So Will and [LU1:2C]go to [N]the peak [LU1:F4]the [N][LU1:31]Tribe lives. [END]`

---------------------------------------------

head_04E929 [
  h_event < #22, #00, #30 >   ;00
]

---------------------------------------------

func_04E92C {
    LDA #$0200
    TSB $12
    COP [D0] ( #41, #01, &code_04E958 )
    COP [C1]
    COP [45] ( #04, #1C, #07, #1E, &code_04E942 )
    RTL 
}


code_04E942 {
    COP [BF] ( &widestring_04E9FF )
    COP [CC] ( #41 )
    COP [C1]
    COP [45] ( #08, #19, #0D, #1A, &code_04E954 )
    RTL 
}


code_04E954 {
    COP [BF] ( &widestring_04EA45 )
}


code_04E958 {
    COP [C0] ( &code_04E97A )
    COP [9E] ( %code_04E96A, #$0000, #$0004, #$0B00 )
    COP [C1]
    RTL 
}


code_04E96A {
    COP [0B]
    COP [84] ( #22, #14 )
    COP [8A]
    COP [C1]
    COP [80] ( #23 )
    COP [89]
    RTL 
}


code_04E97A {
    COP [D0] ( #44, #01, &code_04E9F1 )
    COP [D6] ( #04, &code_04E9DC )
    COP [D6] ( #03, &code_04E9E1 )
    COP [D0] ( #47, #01, &code_04E9D4 )
    COP [D0] ( #0E, #01, &code_04E9BC )
    COP [D0] ( #0F, #01, &code_04E9A0 )
    COP [BF] ( &widestring_04EA77 )
}


code_04E9A0 {
    COP [BF] ( &widestring_04EC46 )
    COP [BE] ( #02, #02, &code_list_04E9AA )
}


code_list_04E9AA [
  &code_04E9B0   ;00
  &code_04E9B8   ;01
  &code_04E9B0   ;02
]

code_04E9B0 {
    COP [BF] ( &widestring_04EC76 )
    COP [CC] ( #0F )
    RTL 
}


code_04E9B8 {
    COP [BF] ( &widestring_04ECAB )
}


code_04E9BC {
    COP [BF] ( &widestring_04ECCB )
    COP [BE] ( #02, #01, &code_list_04E9C6 )
}


code_list_04E9C6 [
  &code_04E9CC   ;00
  &code_04E9D4   ;01
  &code_04E9CC   ;02
]

code_04E9CC {
    COP [BF] ( &widestring_04ECEC )
    COP [CC] ( #0E )
    RTL 
}


code_04E9D4 {
    COP [BF] ( &widestring_04ED19 )
    COP [CC] ( #47 )
    RTL 
}


code_04E9DC {
    COP [BF] ( &widestring_04EF6F )
    RTL 
}


code_04E9E1 {
    COP [BF] ( &widestring_04EDF4 )

  code_04E9E5:
    COP [BE] ( #02, #01, &code_list_04E9EB )
}


code_list_04E9EB [
  &code_04E9F1   ;00
  &code_04E9F7   ;01
  &code_04E9F1   ;02
]

code_04E9F1 {
    COP [BF] ( &widestring_04EF1C )
    BRA code_04E9E5
}


code_04E9F7 {
    COP [BF] ( &widestring_04EF23 )
    COP [CC] ( #44 )
    RTL 
}


widestring_04E9FF `[DLG:3,11][SIZ:D,2]Will hears a quiet [N][LU1:EE][LU2:51]him... [FIN][TPL:D][TPL:4][LU1:46]Voice: [N][LU1:67]come, Will...[PAL:0][END]`

widestring_04EA45 `[TPL:E][TPL:4][LU1:13]I'm [LU2:74][N]In the flowers. [N][LU1:20]lived too long.[PAL:0][END]`

widestring_04EA77 `[DEF][TPL:4][LU1:13]I [LU1:78][LU1:AF][N][LU1:F8]the protection [N]of the Flower Spirit. [FIN]You [LU2:95][LU1:A9]like[N][LU1:FE]father.[FIN]It [LU1:CC][LU1:A5]only[N]yesterday [LU1:D7]he came[N]to [LU1:D6]village.[FIN][TPL:0]Will: [N]My father... [FIN][TPL:4][LU1:13][LU1:68]mother, Shira,[N]was the [LU2:89]daughter[N]of [LU1:FE]grandparents,[N]Bill and Lola.[FIN]She was [LU1:ED]beautiful.[FIN][LU1:68][LU2:67]fell in love[N][LU1:F0]her and took her[N][LU1:8E]the village.[FIN]All of the Itory tribe[N][LU1:98]a [LU1:C7]power, [N]but Shira's was [N]especially strong. [FIN]She [LU1:B3]a barrier to[N]hide the town, but[N][LU1:FE][LU2:67]came[N][LU1:DC]it easily.[FIN][LU1:9]to [LU1:DA]of it, he[N]was unusual, too...[FIN]`

widestring_04EC46 `[DEF][TPL:4]Were you summoned  [N]by [LU1:FE]father? [N][PAL:0] Yes[N] No`

widestring_04EC76 `[CLR][TPL:4][LU1:13]What? If you[N]weren't....That's a[N]bad sign....[PAL:0][END]`

widestring_04ECAB `[CLR][TPL:4][LU1:13]That fulfills[N][LU1:2D]prophesy.[FIN]`

widestring_04ECCB `[DEF][TPL:4]Do you plan to go?[N][PAL:0] Yes[N] No`

widestring_04ECEC `[DEF][CLR][TPL:4][LU1:13]A disobedient [N]son, unlike [LU1:FE]father.[PAL:0][END]`

widestring_04ED19 `[DEF][CLR][TPL:4][LU1:13][LU1:18]I [LU1:EF][N]entrust you [LU1:F0]the [N]Incan [LU1:48]handed down [N]to the [LU2:BD][FIN]The [LU1:D2]are the key [N]to the Incan riddle-- [N]untouched by [LU1:9A]hands [N]for hundreds of years. [FIN]One [LU1:C9]is enshrined [N]in the cave below. [N]Use all [LU1:FE]skill to [N][LU1:90]it.[PAL:0][END]`

widestring_04EDF4 `[DEF][TPL:4][LU1:13][N]Oooh, that's the [N]Incan Statue!![N]Good job! [FIN]I [LU1:F9]if you [LU1:F2][N]put on [LU1:D6]earth to [N]solve the Incan[N]riddle... [FIN][LU1:1F][LU2:AD]you a legend[N]handed down by our[N]people.[FIN]Put the [LU1:C9]on the[N][LU2:19]Cliff below the[N][LU2:9A][LU1:F4]the spirits'[N][LU2:4B]cannot reach. [FIN]The winds in the valley[N][LU1:EF]lead you to[N]the [LU1:19]Ship.[FIN]Understand?[N][PAL:0] Yes[N] No`

widestring_04EF1C `[DEF][CLR][TPL:4][JMP:EE8E]`

widestring_04EF23 `[CLR][TPL:4][LU1:13][N][LU1:1D][LU1:D4][LU1:D7]the [LU1:31][N]Tribe has one more. [FIN][LU2:14][LU1:2C]guide you [N]there. Be careful.[PAL:0][END]`

widestring_04EF6F `[DEF][CLR][JMP:EF23]`

---------------------------------------------

head_04EF74 [
  h_event < #2A, #00, #10 >   ;00
]

---------------------------------------------

func_04EF77 {
    COP [C0] ( &code_04EFA4 )
    COP [0B]
    COP [D0] ( #47, #01, &code_04EF9E )
    COP [D0] ( #3B, #01, &code_04EF9B )
    COP [D2] ( #3B, #01 )
    COP [80] ( #2C )
    COP [89]
    COP [D2] ( #05, #01 )
    COP [80] ( #2A )
    COP [89]
}


code_04EF9B {
    COP [C1]
    RTL 
}


code_04EF9E {
    COP [C0] ( &code_04EFA9 )
    BRA code_04EF9B
}


code_04EFA4 {
    COP [BF] ( &widestring_04EFAE )
    RTL 
}


code_04EFA9 {
    COP [BF] ( &widestring_04EFDF )
    RTL 
}


widestring_04EFAE `[DEF][TPL:4]Bill:[N]Meet [LU1:F0]the Elder.[N]He knows something.[PAL:0][END]`

widestring_04EFDF `[DEF][TPL:4][LU1:6]How is the [N]Elder? [FIN][LU1:61]you fought the [N]demon at [LU1:11]Castle, [N]did you [LU1:90]a shiny [N]silver stone? [FIN]There's a [LU1:C7]power[N]in [LU1:D7]stone.[FIN][LU1:12]if defeated by an[N]enemy, if you have[N]100 of them, you[N][LU1:EF][LU1:AF]again.[PAL:0][END]`

---------------------------------------------

head_04F0A3 [
  h_event < #32, #00, #10 >   ;00
]

---------------------------------------------

func_04F0A6 {
    COP [C0] ( &code_04F114 )
    COP [0B]
    COP [D0] ( #47, #01, &code_04F0C6 )
    COP [D0] ( #3B, #01, &code_04F0C3 )
    COP [C1]
    COP [45] ( #40, #26, #42, #28, &code_04F0CC )
    RTL 
}


code_04F0C3 {
    COP [C1]
    RTL 
}


code_04F0C6 {
    COP [C0] ( &code_04F119 )
    BRA code_04F0C3
}


code_04F0CC {
    COP [CC] ( #3B )
    LDA #$CFF0
    TSB $joypad_mask_std
    LDA #$0003
    JSL $%func_00C6E4
    COP [80] ( #34 )
    COP [89]
    COP [BF] ( &widestring_04F11E )
    COP [84] ( #32, #08 )
    COP [8A]
    COP [84] ( #35, #08 )
    COP [8A]
    COP [BF] ( &widestring_04F1BA )
    COP [84] ( #32, #08 )
    COP [8A]
    COP [84] ( #34, #08 )
    COP [8A]
    COP [BF] ( &widestring_04F210 )
    COP [CC] ( #04 )
    COP [D2] ( #05, #01 )
    COP [80] ( #32 )
    COP [89]
    COP [C1]
    RTL 
}


code_04F114 {
    COP [BF] ( &widestring_04F249 )
    RTL 
}


code_04F119 {
    COP [BF] ( &widestring_04F277 )
    RTL 
}


widestring_04F11E `[TPL:E][TPL:3][LU1:2E]Will! Will! [N]Over here! [FIN][TPL:4]Bill:[N][LU1:69]safe.[N]Good...good...[FIN][TPL:3]Lola:[N]A [LU1:DE]thing[N][LU1:9D]to us![FIN]A man [LU2:54]the Jackal[N][LU1:80]to the [LU2:70][N][LU1:F0][LU1:D0]soldiers... [FIN][TPL:4][LU1:6]He[N][LU2:47]got us![PAL:0][END]`

widestring_04F1BA `[TPL:E][TPL:3][LU1:2E][LU1:1A][N]panicked. [FIN]I [LU2:59][LU1:E1][N]digestion [LU1:F0]a [N]poisoned marsupial pie. [FIN]Then I ran away.[PAL:0][END]`

widestring_04F210 `[TPL:F][TPL:3][LU1:2E]Lilly,  [N]thank [LU2:C7]I [LU1:83][N][LU1:A4][LU1:D7]Princess [N][LU1:26]came, too.[PAL:0][END]`

widestring_04F249 `[TPL:F][TPL:3][LU1:2E]I'm afraid that[N][LU1:C8]bad[N]is [LU1:93]to happen.[PAL:0][END]`

widestring_04F277 `[TPL:F][TPL:3]Lola:[N]There's an old legend[N]in [LU1:D6]village.[FIN]A child [LU1:F0]a good[N]heart who controls the[N][LU1:C][LU2:25][LU1:EF]set out[N]to [LU1:D1]the world...[FIN]At [LU1:D7]time, a huge[N][LU1:7B][LU1:EF]enter Earth's[N]orbit, and a [LU1:C]Power[N][LU1:EF]arise...[FIN][LU1:5E]are the words of [N]the Itory legend.[PAL:0][END]`

---------------------------------------------

head_04F359 [
  h_event < #00, #00, #30 >   ;00
]

---------------------------------------------

func_04F35C {
    COP [BC] ( #08, #00 )
    COP [C0] ( &code_04F373 )
    COP [D2] ( #2D, #01 )
    COP [32] ( #1B )
    COP [33]
    COP [CD] ( #$011B )
    COP [E0]
}


code_04F373 {
    COP [D4] ( #03, &code_04F388 )
    COP [CC] ( #2D )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, %widestring_04F38D )
    RTL 
}


code_04F388 {
    COP [BF] ( &widestring_04F3A8 )
    RTL 
}


widestring_04F38D `[TPL:A][SFX:0][DLY:9][LU1:67]found[N]Incan [LU1:48]A.[PAU:FF][END]`

widestring_04F3A8 `[TPL:A][LU1:67][LU1:8F]Incan [N][LU1:48]A! But [LU1:FE][N][LU1:A0]is full! [END]`

---------------------------------------------

head_04F3CD [
  h_event < #00, #00, #01 >   ;00
]

---------------------------------------------

func_04F3D0 {
    COP [D1] ( #$011A, #01, &code_04F3FE )
    COP [9C] ( %code_04F400, #$2000 )
    LDA #$ABF0
    STA $7F0020, X
    LDA #$00FF
    STA $7F0026, X
    COP [88] ( %table_0EE000 )
    COP [80] ( #00 )
    COP [89]
    LDA #$0030
    TSB $12
    COP [C1]
    RTL 
}


code_04F3FE {
    COP [E0]
}


code_04F400 {
    PHX 
    LDX $04
    LDA $7F0026, X
    CMP #$00FF
    BNE code_04F412
    PLX 
    COP [C4] ( %code_04F400 )
}


code_04F412 {
    PLX 
    LDA $player_flags
    BIT #$0002
    BNE code_04F42B
    PHX 
    LDX $04
    LDA #$00FF
    STA $7F0026, X
    PLX 
    COP [C4] ( %code_04F400 )
}


code_04F42B {
    COP [A0] ( %func_00C9B8, #$0098, #$0060, #$2000 )
    COP [32] ( #1A )
    COP [33]
    COP [CD] ( #$011A )
    COP [E0]
}


---------------------------------------------

head_04F441 [
  h_event < #1B, #00, #10 >   ;00
]

---------------------------------------------

func_04F444 {
    COP [D0] ( #4A, #01, &code_04F4E9 )
    COP [9C] ( %code_04F77B, #$2000 )
    COP [9C] ( %code_04F828, #$2000 )
    COP [D0] ( #49, #01, &code_04F4C0 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [80] ( #1C )
    COP [89]
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04F53C )
    LDA #$CFF0
    TRB $joypad_mask_std
    LDA #$1000
    TRB $10
    LDA #$0300
    TSB $10
    COP [9C] ( %func_00C806, #$2000 )
    TXA 
    TYX 
    TAY 
    LDA #$0004
    STA $7F0010, X
    LDA #$001A
    STA $7F0012, X
    TXA 
    TYX 
    TAY 
    COP [C0] ( $840000 )
    COP [C1]
    COP [C1]
    COP [8B]
    COP [D0] ( #49, #01, &code_04F4AC )
    RTL 
}


code_04F4AC {
    COP [A9]
    LDA #$0000
    STA $2A
    COP [C2]
    COP [BF] ( &widestring_04F575 )
    COP [C0] ( &code_04F4EB )
    COP [C1]
    RTL 
}


code_04F4C0 {
    COP [25] ( #0D, #1A )
    COP [80] ( #1A )
    COP [89]
    COP [0B]
    COP [C0] ( &code_04F4F0 )
    COP [D2] ( #4A, #01 )
    COP [0C]
    COP [82] ( #1E, #11 )
    COP [89]
    COP [85] ( #21, #04, #01 )
    COP [8A]
    COP [86] ( #1E, #03, #01 )
    COP [8A]
}


code_04F4E9 {
    COP [E0]
}


code_04F4EB {
    COP [BF] ( &widestring_04F575 )
    RTL 
}


code_04F4F0 {
    COP [D6] ( #04, &code_04F4FA )
    COP [BF] ( &widestring_04F591 )
    RTL 
}


code_04F4FA {
    COP [CC] ( #4A )
    COP [BF] ( &widestring_04F5EA )
    COP [BE] ( #02, #02, &code_list_04F507 )
}


code_list_04F507 [
  &code_04F50D   ;00
  &code_04F511   ;01
  &code_04F50D   ;02
]

code_04F50D {
    COP [BF] ( &widestring_04F653 )
}


code_04F511 {
    COP [BF] ( &widestring_04F68F )
    LDA #$0000
    STA $0D60
    LDA #$0002
    STA $0D62
    LDA #$0404
    STA $064A
    COP [65] ( #$0094, #$0254, #00, #06 )
    COP [26] ( #1C, #$0070, #$0160, #00, #$2200 )
    COP [C1]
    RTL 
}


widestring_04F53C `[DLG:3,6][SIZ:D,3][TPL:2][LU1:2A]Ah, we've[N]arrived. This is the[N][LU1:31]Tribe's home.[END]`

widestring_04F575 `[DLG:3,6][SIZ:D,3][TPL:2]Lilly:[N][LU1:1F]wait here.[END]`

widestring_04F591 `[DLG:3,6][SIZ:D,3][TPL:2]Lilly:[N][LU1:62]happened?[FIN]......... I can see[N]in [LU1:FE]face.....[FIN][LU1:D]be depressed,[N]try again.[END]`

widestring_04F5EA `[DLG:3,6][SIZ:D,4][TPL:2]Lilly:[N]Oh, [LU1:D7]statue![N]You are great!! [FIN]There are two statues. [N]Go to the Incan ruins? [N][PAL:0] Yes[N] No`

widestring_04F653 `[CLR][TPL:2][LU1:2A][N]Will, I [LU1:A4]you're. [N]lying. You [LU1:B2]go [N]no [LU1:B8][LU1:F7]you say. [FIN]`

widestring_04F68F `[CLR][TPL:0]Will: [N]Yes. My [LU2:67][N]summoned me... [FIN]I [LU1:82][LU1:F1]to fight [N]the demons, but if my [N][LU1:92]alive, [LU1:1F]risk [N][LU1:6C]to see him. [FIN]You [LU1:82]really[N][LU1:E9][LU2:BC]you[N][LU2:81][LU1:FE]parents...[FIN][TPL:2]Lilly:[N]Typical....[FIN]I understand.[N][LU1:2B]go to the ruins.[FIN][PAL:0][SFX:10]They headed to [N]the Incan ruins. [END]`

code_04F77B {
    COP [0F] ( #15, #1C )
    COP [0F] ( #16, #1C )

  code_04F783:
    COP [C1]
    COP [D0] ( #4A, #01, &code_04F7B7 )
    COP [45] ( #15, #1B, #17, #1C, &code_04F794 )
    RTL 
}


code_04F794 {
    COP [40] ( #$0400, &code_04F79F )
    COP [C4] ( %code_04F783 )
}


code_04F79F {
    COP [D0] ( #49, #01, &code_04F7AE )
    COP [BF] ( &widestring_04F7C1 )
    COP [C4] ( %code_04F783 )
}


code_04F7AE {
    COP [BF] ( &widestring_04F7F7 )
    COP [C4] ( %code_04F783 )
}


code_04F7B7 {
    COP [10] ( #15, #1C )
    COP [10] ( #16, #1C )
    COP [E0]
}


widestring_04F7C1 `[DLG:3,6][SIZ:D,3][TPL:2][LU1:2A]Wait! We came[N][LU2:73]for a reason! We[N][LU1:78][LU1:A3]leave![END]`

widestring_04F7F7 `[DLG:3,6][SIZ:D,3][TPL:0]Will: [N](I [LU1:78]go [LU1:F8]the [N]Incan Statue...)[PAL:0][END]`

code_04F828 {
    COP [0F] ( #0C, #18 )
    COP [D0] ( #2A, #01, &code_04F857 )

  code_04F832:
    COP [C1]
    COP [45] ( #0C, #19, #0D, #1A, &code_04F83D )
    RTL 
}


code_04F83D {
    COP [40] ( #$0800, &code_04F848 )
    COP [C4] ( %code_04F832 )
}


code_04F848 {
    COP [D0] ( #2A, #01, &code_04F857 )
    COP [BF] ( &widestring_04F860 )
    COP [C4] ( %code_04F832 )
}


code_04F857 {
    COP [CC] ( #49 )
    COP [10] ( #0C, #18 )
    COP [E0]
}


widestring_04F860 `[DLG:3,6][SIZ:D,3][TPL:2][LU1:2A][LU1:2B][LU2:AC]to the[N][LU1:31]Tribe, and then[N][LU1:98]a [LU1:A9]around.[END]`

---------------------------------------------

head_04F895 [
  h_event < #00, #00, #30 >   ;00
]

---------------------------------------------

func_04F898 {
    COP [D1] ( #$011C, #01, &code_04F902 )
    LDA #$CFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04F941 )
    LDA #$CFF0
    TRB $joypad_mask_std
    LDA #$2200
    STA $0E
    LDA #$0020
    STA $7F0010, X
    LDA #$003C
    STA $7F0012, X
    COP [C1]
    LDA $0AEC
    BEQ code_04F904
    LDA $7F0012, X
    DEC 
    BEQ code_04F8D9
    STA $7F0012, X
    BRA code_04F8F3
}


code_04F8D9 {
    LDA #$003C
    STA $7F0012, X
    SED 
    LDA $7F0010, X
    SEC 
    SBC #$0001
    CLD 
    STA $7F0010, X
    BEQ code_04F904
    COP [07] ( #10 )
}


code_04F8F3 {
    JSR $&sub_04FAB2
    LDA $7F0010, X
    STA $0000
    JSL $%func_03BAF1
    RTL 
}


code_04F902 {
    COP [E0]
}


code_04F904 {
    JSR $&sub_04FAB2
    LDA $7F0010, X
    STA $0000
    JSL $%func_03BAF1
    LDA $0AEC
    BEQ code_04F91E
    COP [BF] ( &widestring_04FA25 )
    COP [C1]
    RTL 
}


code_04F91E {
    LDA #$FFF0
    TSB $joypad_mask_std
    COP [DA] ( #1D )
    COP [BF] ( &widestring_04FA65 )
    LDA #$FFF0
    TRB $joypad_mask_std
    COP [08] ( #$0F0F )
    COP [32] ( #1C )
    COP [33]
    COP [CD] ( #$011C )
    COP [C1]
    RTL 
}


widestring_04F941 `[DLG:3,6][SIZ:D,4][LU1:31]Tribe: This[N]is the final shape[N]of those touched[N]by the [LU2:55]light.[FIN]They are horrible[N]creatures whose hearts [N]are filled [LU1:F0][N]hatred and destruction.[FIN]If you can [LU1:88][LU1:E6][N]within 20 seconds, [LU1:1F][N][LU1:97]you the Incan [N]Statue. Ku ku ku... [END]`

widestring_04FA25 `[DLG:3,11][SIZ:D,4][LU1:31]Tribe: [N]In [LU1:D7]case, I [LU1:78][N][LU1:97]you the statue. [N]Ku ku ku... [END]`

widestring_04FA65 `[DLG:3,11][SIZ:D,3][LU1:31]Tribe:[N][LU1:1C]hey! Good boy![N]Ku ku ku...[FIN]Then [LU1:1F][LU1:97]you [N]the Incan Statue. [END]`

---------------------------------------------

sub_04FAB2 {
    LDA $player_x_pos
    CLC 
    ADC #$0007
    STA $14
    LDA $player_y_pos
    SEC 
    SBC #$0020
    STA $16
    RTS 
}


---------------------------------------------

head_04FAC5 [
  h_event < #00, #00, #30 >   ;00
]

---------------------------------------------

func_04FAC8 {
    COP [BC] ( #08, #00 )
    COP [C0] ( &code_04FADF )
    COP [D2] ( #48, #01 )
    COP [32] ( #1D )
    COP [33]
    COP [CD] ( #$011D )
    COP [E0]
}


code_04FADF {
    COP [D4] ( #04, &code_04FAF4 )
    COP [CC] ( #48 )
    LDA #$0080
    TSB $09EC
    COP [19] ( #17, %widestring_04FAF9 )
    RTL 
}


code_04FAF4 {
    COP [BF] ( &widestring_04FB16 )
    RTL 
}


widestring_04FAF9 `[DLG:3,6][SIZ:D,3][SFX:0][DLY:9][LU1:67]got[N]Incan [LU1:48]B![PAU:FF][END]`

widestring_04FB16 `[DLG:3,6][SIZ:D,3][LU1:67][LU1:8F]Incan [N][LU1:48]B! But [LU1:FE][N][LU1:A0]is full! [END]`

