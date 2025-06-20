
!_TM                            212C
!_TS                            212D
!CGWSEL                         2130
!CGADSUB                            2131

------------------------------------
?INCLUDE 'sE5_epilogue'
------------------------------------

h_sE5_epilogue [
  h_actor < #1B, #00, #10 >   ;00
    SEP #$20
    LDA #$13
    STA $_TM
    LDA #$04
    STA $_TS
    LDA #$82
    STA $CGWSEL
    LDA #$03
    STA $CGADSUB
    REP #$20
]

