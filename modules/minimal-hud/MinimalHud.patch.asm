

LoadHudTilemap! {
    LDA $09ED
    BIT #$40
    BEQ hud_check_combat
    STZ $00DA             ; Full suppress (cutscene): clear icon too
    RTL

  hud_check_combat:
    LDA $playerFlags
    BIT #$08              ; Bit 3 = input lock (non-combat area)
    BEQ loc_03DED5        ; Combat area → load HUD normally
    RTL                   ; Non-combat → skip HUD, keep icon ($00DA preserved)
}

--------------------------------------------------------
?INCLUDE 'system_core'
--------------------------------------------------------
;Suppress HUD stat updates in non-combat areas

UpdateHUD! {
    LDA $09ED
    BIT #$40              ; Bit 6 = full HUD suppression (cutscene)
    BNE hud_update_suppress
    LDA $playerFlags
    BIT #$08              ; Bit 3 = input lock (non-combat area)
    BEQ loc_00820E        ; Neither set → proceed with HUD update
  hud_update_suppress:
    RTL
}
