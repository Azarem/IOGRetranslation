
!scene_current                  0644
!player_flags                   09AE
!VMADDL                         2116

  load_skyd_exprite:
    LDX #$&gfx_sky_delivery_exprite+2
    LDA #$^gfx_sky_delivery_exprite
    LDY #$4200
    STY $VMADDL
    LDY #$1C00
    JSL $@func_0283A2
    JML code_03E04E
    
  load_boot_exprite:
    LDX #$&gfx_boot_exprite+2
    LDA #$^gfx_boot_exprite
    LDY #$4200
    STY $VMADDL
    LDY #$1C00
    JSL $@func_0283A2
    PLP
    RTL

------------------------------------------------
?INCLUDE 'chunk_028000'
?INCLUDE 'chunk_03BAE1'
------------------------------------------------
;Load special sprite asset for boot scene

func_03DFF8 {
    PHP 
    LDA $scene_current
    CMP #$F7
    BEQ load_exit
    CMP #$FB
    BEQ load_fb_asset
    CMP #$FA
    BEQ load_exit
    CMP #$FE
    BEQ load_exit
    CMP #$F0
    BEQ load_exit
    CMP #$90
    BEQ load_exit
    CMP #$8C
    BEQ load_exit
    CMP #$89
    BEQ load_exit
    CMP #$78
    BEQ load_01_asset
    CMP #$32
    BEQ load_01_asset
    CMP #$01
    BEQ load_01_asset
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
    BRA code_03E04E
    
  load_01_asset:
    JML load_skyd_exprite
    
  load_fb_asset:
    JML load_boot_exprite
    
  load_exit:
    PLP
    RTL
}
