
!scene_current                  0644
!player_flags                   09AE
!VMADDL                         2116

------------------------------------------------
?INCLUDE 'chunk_028000'
------------------------------------------------

load_boot_exprite {
    LDX #$4200
    STX $VMADDL
    LDX #$&gfx_boot_exprite+2
    LDA #$^gfx_boot_exprite
    LDY #$1C00
    JSL $@func_0283A2
    PLP 
    RTL
}

load_title_exprite {
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
?INCLUDE 'chunk_03BAE1'
------------------------------------------------
;Load special sprite asset for boot scene

func_03DFF8 {
    PHP 
    LDA $scene_current
    CMP #$F7
    BEQ code_03E04E
    CMP #$FB
    BEQ load_fb_asset
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

load_fb_asset {
    JML load_boot_exprite
}

load_fc_asset {
    JML load_title_exprite
}
