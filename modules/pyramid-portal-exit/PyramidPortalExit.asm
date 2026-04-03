
!scene_current                  0644
!player_actor                   09AA

-------------------------------------------------
?INCLUDE 'pyCC_entrance_portal'
-------------------------------------------------

code_08B6C6 {
    COP [BF] ( &widestring_08B74B )
    LDY $player_actor
    LDA $0010, Y
    ORA #$2000
    STA $0010, Y
    COP [9C] ( @e_py_actor_08B6F4, #$1800 )
    LDA #$0303
    STA $0648
    LDA #$0303
    STA $064A
    LDA $scene_current
    CMP #$00CC
    BEQ entrance_portal_top
    COP [26] ( #CC, #$01F8, #$0380, #03, #$4400 )
    RTL 

  entrance_portal_top:
    COP [26] ( #CC, #$01F8, #$0130, #03, #$4400 )
    RTL 
}