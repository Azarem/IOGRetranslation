

!M7SEL                          211A

----------------------------------------------
?INCLUDE 'pr_thinkers'
----------------------------------------------

e_pr_thinker_0BD031 {
    COP [37] ( #75 )
    COP [39]

    LDA $7F0BE0
    STA $7F0B20
    LDA $7F0BE2
    STA $7F0B22
    LDA $7F0BE4
    STA $7F0B24
    LDA $7F0BE6
    STA $7F0B26

    PHX
    PHY

    LDX #$0000
    LDA $00DA
    LSR
    LSR
    TAY

    SEP #$20
    LDA #$23

  palswitch_top:
    DEY
    BMI palswitch_next

    STA $7F0603, X
    INX
    INX
    INX
    INX
    BRA palswitch_top

  palswitch_next:
    REP #$20
    PLY
    PLX

    COP [3D]
    RTL 
}


---------------------------------------------

e_pr_thinker_0BD039 {
    
    PHX
    PHY

    LDX #$0000
    LDA $00DA
    LSR
    LSR
    TAY

    SEP #$20
    LDA #$2F

  palrevert_top:
    DEY
    BMI palrevert_next

    STA $7F0603, X
    INX
    INX
    INX
    INX
    BRA palrevert_top

  palrevert_next:
    REP #$20
    PLY
    PLX

    COP [37] ( #76 )
    COP [39]
    COP [CC] ( #0F )
    COP [3D]
    RTL 
}

----------------------------------------------
?INCLUDE 'sFE_proc_03A940'
----------------------------------------------

e_sFE_proc_03A940 {
    SEP #$20
    LDA #$80
    STA $M7SEL
    REP #$20
    LDA #$7FFF
    STA $7F0B22
    LDA #$53DE
    STA $7F0B24
    LDA #$01B1
    STA $7F0B26
    LDA $0D54
    STA $00CA
    SEC 
    SBC #$0080
    ORA #$8000
    STA $06C6
    LDA $0D56
    STA $00CC
    SEC 
    SBC #$0070
    ORA #$8000
    STA $06CA
    STZ $00B6
    STZ $00BC
    LDA #$0400
    STA $00B8
}

----------------------------------------------
?INCLUDE 'palette_bundles'
----------------------------------------------

bundle_16D17B [
  bundle < #10, &word_16D182, #F1, #05, #04 >   ;00
]

word_16D182 [
  #$0000   ;00
  #$0000   ;01
  #$0000

  #$0842   ;02
  #$0442   ;03
  #$0001

  #$1084   ;04
  #$0884   ;05
  #$0022

  #$18C6   ;06
  #$10C6   ;07
  #$0043

  #$2108   ;08
  #$1508   ;09
  #$0064

  #$294A   ;0A
  #$194A   ;0B
  #$0085

  #$318C   ;0C
  #$218C   ;0D
  #$00A7

  #$39CE   ;0E
  #$25CE   ;0F
  #$00C8

  #$4210   ;10
  #$2A10   ;11
  #$00E9

  #$4A52   ;12
  #$3252   ;13
  #$010A

  #$5294   ;14
  #$3694   ;15
  #$010B

  #$5AD6   ;16
  #$3AD6   ;17
  #$012C
  
  #$6318   ;18
  #$4318   ;19
  #$014D

  #$6B5A   ;1A
  #$475A   ;1B
  #$016F

  #$739C   ;1C
  #$4B9C   ;1D
  #$0190

  #$7FFF   ;1E
  #$53DE   ;1F
  #$01B1
]


bundle_16D1C2 [
  bundle < #10, &word_16D1C9, #F1, #05, #04 >   ;00
]

word_16D1C9 [
  #$7FFF   ;00
  #$53DE   ;01
  #$01B1
  
  #$739C   ;02
  #$4B9C   ;03
  #$0190

  #$6B5A   ;04
  #$475A   ;05
  #$016F

  #$6318   ;06
  #$4318   ;07
  #$014D

  #$5AD6   ;08
  #$3AD6   ;09
  #$012C

  #$5294   ;0A
  #$3694   ;0B
  #$010B

  #$4A52   ;0C
  #$3252   ;0D
  #$010A

  #$4210   ;0E
  #$2A10   ;0F
  #$00E9

  #$39CE   ;10
  #$25CE   ;11
  #$00C8

  #$318C   ;12
  #$218C   ;13
  #$00A7

  #$294A   ;14
  #$194A   ;15
  #$0085

  #$2108   ;16
  #$1508   ;17
  #$0064

  #$18C6   ;18
  #$10C6   ;19
  #$0043

  #$1084   ;1A
  #$0884   ;1B
  #$0022

  #$0842   ;1C
  #$0442   ;1D
  #$0001

  #$0000   ;1E
  #$0000   ;1F
  #$0000
]