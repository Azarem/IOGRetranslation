; Debug menu core — blocking menu loop called via JSL from the
; patched GlobalInputHandler.
;
; Entry: JSL $@debug_menu_core (16-bit accumulator expected)
; Exit:  RTL — if $0642 (sceneNext) is nonzero, a warp was requested.
;        The caller handles VRAM cleanup and brightness restoration.
;
; The debug menu dims the screen and enters a blocking input loop
; similar to the original hold-to-view radar/pause loop. Each frame
; syncs to VBlank, processes edge-triggered joypad input, and
; re-renders the BG3 overlay when state changes.
;
; === MODES ===
;   0 = main menu (Fast Travel / Inventory selection)
;   1 = fast travel submenu (scrollable scene list with warp)
;   2 = inventory submenu (scrollable item editor)
;
; === WRAM SCRATCH ($0BD0-$0BFC) ===
;   $0BD0 = mode         (0/1/2)
;   $0BD2 = cursor       (absolute index in current list)
;   $0BD4 = scroll       (first visible entry — read by PTR tokens)
;   $0BD6 = phase        (highlighted visible row 0-12 — read by PTR tokens)
;   $0BD8 = max_scroll   (list_len - list_height)
;   $0BDA = list_len     (total entries in current list)
;   $0BDC = list_last    (list_len - 1)
;   $0BDE = saved_mask   (joypadMaskStd backup on menu open)
;   $0BE0 = saved_inv    (joypadMaskInv backup on menu open)
;   $0BE2 = inv_state    (0=scroll mode, 1=edit mode)
;   $0BE4-$0BFC = inv_items[13]  (item IDs for 13 visible inventory rows)

?INCLUDE 'debug_menu_strings'
?INCLUDE 'ConsoleStringRenderer'
?INCLUDE 'vblank_joypad'
?INCLUDE 'vram_buffer_clear'
?INCLUDE 'system_core'
?INCLUDE 'DmaWordToVram'

; --- Hardware / engine addresses ---

!sceneNext                      0642
!spawnX                         064C
!spawnY                         064E
!direction                      0650
!cameraBounds                   0652
!joypadCurrent                  0656
!joypadHeld                     0658
!joypadMaskStd                  065A
!joypadMaskInv                  065C
!sfxQueueCh2                    06F9
!displayModeFlags               09EC
!inventorySlots                 0AB4
!INIDISP                        2100
!VMADDL                         2116

; --- Menu state WRAM ---

!dm_mode                        0BD0
!dm_cursor                      0BD2
!dm_scroll                      0BD4
!dm_phase                       0BD6
!dm_max                         0BD8
!dm_list_len                    0BDA
!dm_list_last                   0BDC
!dm_saved_mask                  0BDE
!dm_saved_inv                   0BE0
!dm_inv_state                   0BE2
!dm_inv_items                   0BE4

; --- Scene list constants (hex) ---
; Total entries     = 253 ($FD)
; Visible rows      = 13  ($0D)
; Center row        = 6   ($06)  (height / 2)
; Max scroll        = 240 ($F0)  (253 - 13)
; Last valid index  = 252 ($FC)
;
; IMPORTANT: Constants MUST be 2-byte hex values (e.g. 00FD, not FD).
; The assembler uses the constant's byte width to size immediate operands.
; With M=0 (16-bit accumulator), LDA #$constant needs a 2-byte operand.
; A 1-byte constant like FD produces a 1-byte immediate — the CPU reads
; the next instruction byte as part of the operand, corrupting the
; instruction stream and causing stack corruption or crashes.

!list_len                       00FD
!list_last                      00FC
!list_height                    000D
!list_center                    0006
!list_max_scroll                00F0
!list_len_bytes                 01FA

; --- Inventory constants (hex, 2-byte) ---
; Total slots  = 16  ($10)  — inventorySlots at $0AB4
; Item IDs     = 64  ($40)  — item_menu_table entries $00-$3F
; Visible rows = 13  ($0D)  — shared with travel list
; Max scroll   = 3   ($03)  — 16 - 13

!inv_slots                      0010
!inv_last                       000F
!inv_max_scroll                 0003
!inv_item_count                 0040
!inv_item_last                  003F

!sceneCurrent                   0644

; ===================================================================

debug_menu_core {
    PHP 
    REP #$20

    ; Save input masks — cutscenes lock inputs via joypadMaskStd, making
    ; the menu unusable. Save current masks and clear them so all buttons
    ; are visible during the menu. Restored in dm_close.
    LDA $joypadMaskStd
    STA $dm_saved_mask
    LDA $joypadMaskInv
    STA $dm_saved_inv
    STZ $joypadMaskStd
    LDA #$0F00            ; Enable D-pad auto-repeat in menu
    STA $joypadMaskInv

    ; Initialize menu state
    LDA #$0000
    STA $dm_mode
    STA $dm_cursor
    STA $dm_scroll
    STA $dm_phase
    STA $dm_inv_state

    ; Render initial main menu
    JSR $&dm_render_main

    ; Clear dialogue-mode flag so NMI takes full DMA path
    SEP #$20
    LDA #$08
    TRB $displayModeFlags
    REP #$20

    ; Sync one VBlank to flush buffer before dimming
    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly

    ; Force blank and upload debug font tiles to VRAM.
    ; Overwrites tiles $12-$7F (printable characters) with box-optimized
    ; glyphs from gfx_fonts_debug. The standard font has character tiles
    ; drawn for transparent backgrounds; the debug font fills the glyph
    ; background for use inside DrawBox rectangles.
    SEP #$20
    LDA #$80              ; Force blank on — safe VRAM writes
    STA $INIDISP
    LDX #$6000            ; VRAM word address: tile $12 × 8 words/tile
    STX $VMADDL
    LDX #$&gfx_fonts_debug
    LDA #$^gfx_fonts_debug
    LDY #$0800            ; (0x80 - 0x12) tiles × 16 bytes = $06E0
    JSL $@DmaWordToVram

    ; Dim screen for menu overlay
    LDA #$0F
    STA $INIDISP
    REP #$20

    ; Consume all currently-held buttons so they don't bleed into the menu
    LDA $joypadCurrent
    TSB $joypadHeld

    ; ===================
    ; MAIN FRAME LOOP
    ; ===================

  dm_loop:
    ; Clear dialogue-mode flag each frame so NMI runs full VRAM DMA
    SEP #$20
    LDA #$08
    TRB $displayModeFlags
    REP #$20

    JSL $@vblank_joypad.EnableNmiAndJoypad
    JSL $@vblank_joypad.VBlankWaitAndJoypad
    JSL $@vblank_joypad.EnableNmiOnly
    REP #$20

    ; Start button closes the entire menu from any mode
    LDA $joypadCurrent
    BIT #$1000
    BEQ dm_dispatch
    JMP $&dm_close

  dm_dispatch:
    LDA $dm_mode
    BEQ dm_main_tick
    DEC
    BEQ dm_go_travel
    DEC
    BEQ dm_go_inventory
    JMP $&dm_loop

  dm_go_travel:
    JMP $&dm_travel_tick

  dm_go_inventory:
    JMP $&dm_inventory_tick

    ; ===================
    ; CLOSE MENU
    ; ===================
    ; IOG button flags (post-remap):
    ;   $8000 = B  (Attack/Talk — CONFIRM)
    ;   $4000 = Y  (Item — CANCEL)
    ;   $1000 = Start (Pause — CLOSE)
    ;   $0800/$0400 = Up/Down
    ;   $0020/$0010 = L/R (Spin — PAGE)

  dm_close:
    LDA $joypadCurrent
    TSB $joypadHeld
    ; Restore input masks saved on menu open
    LDA $dm_saved_mask
    STA $joypadMaskStd
    LDA $dm_saved_inv
    STA $joypadMaskInv
    PLP 
    RTL 

    ; ===================
    ; MAIN MENU INPUT
    ; ===================

  dm_main_tick:
    LDA $joypadCurrent
    BIT #$4000
    BEQ dm_main_no_cancel
    JMP $&dm_close

  dm_main_no_cancel:
    LDA $joypadCurrent
    BIT #$8000
    BEQ dm_main_no_confirm
    JMP $&dm_main_confirm

  dm_main_no_confirm:
    LDA $joypadCurrent
    BIT #$0800
    BEQ dm_main_no_up
    JMP $&dm_main_up

  dm_main_no_up:
    LDA $joypadCurrent
    BIT #$0400
    BEQ dm_main_no_down
    JMP $&dm_main_down

  dm_main_no_down:
    JMP $&dm_loop

  dm_main_up:
    LDA #$0800
    TSB $joypadHeld
    LDA $dm_cursor
    BEQ dm_main_wrap_bottom
    DEC 
    BRA dm_main_set_cursor

  dm_main_wrap_bottom:
    LDA #$0001

  dm_main_set_cursor:
    STA $dm_cursor
    JSR $&dm_play_sfx
    JSR $&dm_render_main
    JMP $&dm_loop

  dm_main_down:
    LDA #$0400
    TSB $joypadHeld
    LDA $dm_cursor
    CMP #$0001
    BEQ dm_main_wrap_top
    INC 
    BRA dm_main_set_cursor

  dm_main_wrap_top:
    LDA #$0000
    BRA dm_main_set_cursor

  dm_main_confirm:
    LDA $joypadCurrent
    TSB $joypadHeld
    LDA $dm_cursor
    BEQ dm_enter_travel
    CMP #$0001
    BEQ dm_enter_inventory
    JMP $&dm_loop

    ; ===================
    ; ENTER FAST TRAVEL
    ; ===================

  dm_enter_travel:
    LDA #$0001
    STA $dm_mode

    ; Set travel list parameters
    LDA #$list_len
    STA $dm_list_len
    LDA #$list_last
    STA $dm_list_last
    LDA #$list_max_scroll
    STA $dm_max

    ; Auto-select current scene in the list
    LDA $sceneCurrent
    AND #$00FF
    JSR $&dm_find_scene

    JSR $&dm_play_confirm_sfx
    JSR $&dm_render_travel
    JMP $&dm_loop

    ; ===================
    ; ENTER INVENTORY
    ; ===================

  dm_enter_inventory:
    LDA #$0002
    STA $dm_mode

    ; Set inventory list parameters
    LDA #$inv_slots
    STA $dm_list_len
    LDA #$inv_last
    STA $dm_list_last
    LDA #$inv_max_scroll
    STA $dm_max

    ; Reset cursor/scroll/phase to top
    LDA #$0000
    STA $dm_cursor
    STA $dm_scroll
    STA $dm_phase
    STA $dm_inv_state

    ; Load item data for visible rows
    JSR $&dm_inv_refill

    JSR $&dm_play_confirm_sfx
    JSR $&dm_render_inventory
    JMP $&dm_loop

    ; ===================
    ; FAST TRAVEL INPUT
    ; ===================

  dm_travel_tick:
    LDA $joypadCurrent
    BIT #$4000
    BEQ dm_trav_no_cancel
    JMP $&dm_travel_back

  dm_trav_no_cancel:
    LDA $joypadCurrent
    BIT #$0800
    BEQ dm_trav_no_up
    JMP $&dm_travel_up

  dm_trav_no_up:
    LDA $joypadCurrent
    BIT #$0400
    BEQ dm_trav_no_down
    JMP $&dm_travel_down

  dm_trav_no_down:
    LDA $joypadCurrent
    BIT #$0220
    BEQ dm_trav_no_l
    JMP $&dm_travel_pgup

  dm_trav_no_l:
    LDA $joypadCurrent
    BIT #$0110
    BEQ dm_trav_no_r
    JMP $&dm_travel_pgdn

  dm_trav_no_r:
    LDA $joypadCurrent
    BIT #$8000
    BEQ dm_trav_no_confirm
    JMP $&dm_travel_warp

  dm_trav_no_confirm:
    JMP $&dm_loop

    ; --- TRAVEL: Back to main menu ---

  dm_travel_back:
    LDA $joypadCurrent
    TSB $joypadHeld
    LDA #$0000
    STA $dm_mode
    STA $dm_cursor
    JSR $&dm_play_sfx
    JSR $&dm_render_main
    JMP $&dm_loop

    ; --- TRAVEL: Cursor up ---

  dm_travel_up:
    LDA #$0800
    TSB $joypadHeld
    LDA $dm_cursor
    DEC 
    JSR $&dm_update_selection
    BEQ dm_trav_no_change
    JSR $&dm_play_sfx
    JSR $&dm_render_travel
    JMP $&dm_loop

  dm_trav_no_change:
    JMP $&dm_loop

    ; --- TRAVEL: Cursor down ---

  dm_travel_down:
    LDA #$0400
    TSB $joypadHeld
    LDA $dm_cursor
    INC 
    JSR $&dm_update_selection
    BEQ dm_trav_no_change2
    JSR $&dm_play_sfx
    JSR $&dm_render_travel
    JMP $&dm_loop

  dm_trav_no_change2:
    JMP $&dm_loop

    ; --- TRAVEL: Page up (L button) ---

  dm_travel_pgup:
    LDA #$0220
    TSB $joypadHeld
    LDA $dm_cursor
    SEC 
    SBC #$list_height
    JSR $&dm_update_selection
    BEQ dm_trav_no_change3
    JSR $&dm_play_sfx
    JSR $&dm_render_travel
    JMP $&dm_loop

  dm_trav_no_change3:
    JMP $&dm_loop

    ; --- TRAVEL: Page down (R button) ---

  dm_travel_pgdn:
    LDA #$0110
    TSB $joypadHeld
    LDA $dm_cursor
    CLC 
    ADC #$list_height
    JSR $&dm_update_selection
    BEQ dm_trav_no_change4
    JSR $&dm_play_sfx
    JSR $&dm_render_travel
    JMP $&dm_loop

  dm_trav_no_change4:
    JMP $&dm_loop

    ; --- TRAVEL: Warp to selected scene ---

  dm_travel_warp:
    LDA $dm_cursor
    ASL 
    TAX 
    LDA $@debug_menu_tables.scene_id_table, X
    AND #$00FF
    BEQ dm_trav_warp_skip

    ; Write scene ID
    STA $sceneNext

    ; Load warp prep data from parallel tables
    LDA $@debug_menu_tables.warp_x_table, X
    STA $spawnX
    LDA $@debug_menu_tables.warp_y_table, X
    STA $spawnY
    LDA $@debug_menu_tables.warp_dir_table, X
    STA $direction
    LDA $@debug_menu_tables.warp_cam_table, X
    STA $cameraBounds

    ; Play confirmation sound and exit
    JSR $&dm_play_confirm_sfx
    LDA $joypadCurrent
    TSB $joypadHeld
    PLP 
    RTL 

  dm_trav_warp_skip:
    JMP $&dm_loop

    ; ===================
    ; INVENTORY INPUT
    ; ===================
    ; Two states controlled by dm_inv_state ($0BE2):
    ;   0 = scroll mode — navigate slots, B enters edit
    ;   1 = edit mode  — Left/Right cycle items, B confirms, Y cancels

  dm_inventory_tick:
    LDA $dm_inv_state
    BNE dm_inv_edit_tick

    ; --- SCROLL MODE ---
    LDA $joypadCurrent
    BIT #$4000            ; Y = back to main menu
    BEQ dm_inv_no_cancel
    JMP $&dm_inv_back

  dm_inv_no_cancel:
    LDA $joypadCurrent
    BIT #$8000            ; B = enter edit mode
    BEQ dm_inv_no_edit
    JMP $&dm_inv_enter_edit

  dm_inv_no_edit:
    LDA $joypadCurrent
    BIT #$0800            ; Up
    BEQ dm_inv_no_up
    JMP $&dm_inv_up

  dm_inv_no_up:
    LDA $joypadCurrent
    BIT #$0400            ; Down
    BEQ dm_inv_no_down
    JMP $&dm_inv_down

  dm_inv_no_down:
    LDA $joypadCurrent
    BIT #$0220            ; Left + L = page up
    BEQ dm_inv_no_pgup
    JMP $&dm_inv_pgup

  dm_inv_no_pgup:
    LDA $joypadCurrent
    BIT #$0110            ; Right + R = page down
    BEQ dm_inv_no_pgdn
    JMP $&dm_inv_pgdn

  dm_inv_no_pgdn:
    JMP $&dm_loop

    ; --- EDIT MODE ---
  dm_inv_edit_tick:
    LDA $joypadCurrent
    BIT #$4000            ; Y = cancel edit (restore original)
    BEQ dm_inv_no_ecancel
    JMP $&dm_inv_cancel_edit

  dm_inv_no_ecancel:
    LDA $joypadCurrent
    BIT #$8000            ; B = confirm edit (write to slot)
    BEQ dm_inv_no_econfirm
    JMP $&dm_inv_confirm_edit

  dm_inv_no_econfirm:
    LDA $joypadCurrent
    BIT #$0200            ; Left = prev item
    BEQ dm_inv_no_eleft
    JMP $&dm_inv_item_left

  dm_inv_no_eleft:
    LDA $joypadCurrent
    BIT #$0100            ; Right = next item
    BEQ dm_inv_no_eright
    JMP $&dm_inv_item_right

  dm_inv_no_eright:
    LDA $joypadCurrent
    BIT #$0020            ; L = fast prev (8 items)
    BEQ dm_inv_no_elpg
    JMP $&dm_inv_item_pgleft

  dm_inv_no_elpg:
    LDA $joypadCurrent
    BIT #$0010            ; R = fast next (8 items)
    BEQ dm_inv_no_erpg
    JMP $&dm_inv_item_pgright

  dm_inv_no_erpg:
    JMP $&dm_loop

    ; --- INVENTORY: Back to main menu ---

  dm_inv_back:
    LDA $joypadCurrent
    TSB $joypadHeld
    LDA #$0000
    STA $dm_mode
    STA $dm_cursor
    JSR $&dm_play_sfx
    JSR $&dm_render_main
    JMP $&dm_loop

    ; --- INVENTORY: Cursor up ---

  dm_inv_up:
    LDA #$0800
    TSB $joypadHeld
    LDA $dm_cursor
    DEC 
    JSR $&dm_update_selection
    BEQ dm_inv_no_change
    JSR $&dm_inv_refill
    JSR $&dm_play_sfx
    JSR $&dm_render_inventory

  dm_inv_no_change:
    JMP $&dm_loop

    ; --- INVENTORY: Cursor down ---

  dm_inv_down:
    LDA #$0400
    TSB $joypadHeld
    LDA $dm_cursor
    INC 
    JSR $&dm_update_selection
    BEQ dm_inv_no_change2
    JSR $&dm_inv_refill
    JSR $&dm_play_sfx
    JSR $&dm_render_inventory

  dm_inv_no_change2:
    JMP $&dm_loop

    ; --- INVENTORY: Page up (Left/L) ---

  dm_inv_pgup:
    LDA #$0220
    TSB $joypadHeld
    LDA $dm_cursor
    SEC 
    SBC #$list_height
    JSR $&dm_update_selection
    BEQ dm_inv_no_change3
    JSR $&dm_inv_refill
    JSR $&dm_play_sfx
    JSR $&dm_render_inventory

  dm_inv_no_change3:
    JMP $&dm_loop

    ; --- INVENTORY: Page down (Right/R) ---

  dm_inv_pgdn:
    LDA #$0110
    TSB $joypadHeld
    LDA $dm_cursor
    CLC 
    ADC #$list_height
    JSR $&dm_update_selection
    BEQ dm_inv_no_change4
    JSR $&dm_inv_refill
    JSR $&dm_play_sfx
    JSR $&dm_render_inventory

  dm_inv_no_change4:
    JMP $&dm_loop

    ; --- INVENTORY: Enter edit mode ---

  dm_inv_enter_edit:
    LDA $joypadCurrent
    TSB $joypadHeld
    LDA #$0001
    STA $dm_inv_state
    JSR $&dm_play_confirm_sfx
    JSR $&dm_render_inventory
    JMP $&dm_loop

    ; --- INVENTORY: Confirm edit (write item to slot) ---

  dm_inv_confirm_edit:
    LDA $joypadCurrent
    TSB $joypadHeld
    ; Read new item ID from per-row store
    LDA $dm_phase
    ASL 
    TAY 
    LDA $dm_inv_items, Y
    ; Write to inventory slot (byte-sized at $0AB4+cursor)
    LDX $dm_cursor
    SEP #$20
    STA $inventorySlots, X
    REP #$20
    ; Return to scroll mode
    STZ $dm_inv_state
    JSR $&dm_play_confirm_sfx
    JSR $&dm_render_inventory
    JMP $&dm_loop

    ; --- INVENTORY: Cancel edit (restore original data) ---

  dm_inv_cancel_edit:
    LDA $joypadCurrent
    TSB $joypadHeld
    JSR $&dm_inv_refill
    STZ $dm_inv_state
    JSR $&dm_play_sfx
    JSR $&dm_render_inventory
    JMP $&dm_loop

    ; --- INVENTORY: Cycle item left (prev by 1) ---

  dm_inv_item_left:
    LDA #$0200
    TSB $joypadHeld
    LDA $dm_phase
    ASL 
    TAX 
    LDA $dm_inv_items, X
    DEC 
    BPL dm_inv_ileft_ok
    LDA #$inv_item_last
  dm_inv_ileft_ok:
    STA $dm_inv_items, X
    JSR $&dm_play_sfx
    JSR $&dm_render_inventory
    JMP $&dm_loop

    ; --- INVENTORY: Cycle item right (next by 1) ---

  dm_inv_item_right:
    LDA #$0100
    TSB $joypadHeld
    LDA $dm_phase
    ASL 
    TAX 
    LDA $dm_inv_items, X
    INC 
    CMP #$inv_item_count
    BCC dm_inv_iright_ok
    LDA #$0000
  dm_inv_iright_ok:
    STA $dm_inv_items, X
    JSR $&dm_play_sfx
    JSR $&dm_render_inventory
    JMP $&dm_loop

    ; --- INVENTORY: Fast cycle left (prev by 8) ---

  dm_inv_item_pgleft:
    LDA #$0020
    TSB $joypadHeld
    LDA $dm_phase
    ASL 
    TAX 
    LDA $dm_inv_items, X
    SEC 
    SBC #$0008
    BPL dm_inv_ipgl_ok
    CLC 
    ADC #$inv_item_count    ; Wrap around: -N → 64-N
  dm_inv_ipgl_ok:
    STA $dm_inv_items, X
    JSR $&dm_play_sfx
    JSR $&dm_render_inventory
    JMP $&dm_loop

    ; --- INVENTORY: Fast cycle right (next by 8) ---

  dm_inv_item_pgright:
    LDA #$0010
    TSB $joypadHeld
    LDA $dm_phase
    ASL 
    TAX 
    LDA $dm_inv_items, X
    CLC 
    ADC #$0008
    CMP #$inv_item_count
    BCC dm_inv_ipgr_ok
    SEC 
    SBC #$inv_item_count    ; Wrap around: 64+N → N
  dm_inv_ipgr_ok:
    STA $dm_inv_items, X
    JSR $&dm_play_sfx
    JSR $&dm_render_inventory
    JMP $&dm_loop

    ; ===================
    ; FIND SCENE IN LIST
    ; ===================
    ;
    ; Searches scene_id_table for a matching scene ID and sets
    ; dm_cursor / dm_scroll / dm_phase accordingly.
    ; Input:  A = scene ID to find (16-bit, only low byte used)
    ; Trashes: A, X, Y

  dm_find_scene:
    PHA                   ; Push target scene ID onto stack
    LDX #$0000            ; Index into scene_id_table (word offset)

  dm_find_loop:
    CPX #$list_len_bytes  ; Past end of table? (253 entries × 2 bytes = $01FA)
    BCS dm_find_not_found
    LDA $@debug_menu_tables.scene_id_table, X
    AND #$00FF
    CMP $01, S            ; Compare with stacked target (stack-relative)
    BEQ dm_find_hit
    INX 
    INX 
    BRA dm_find_loop

  dm_find_hit:
    PLA                   ; Discard target from stack
    TXA 
    LSR                   ; Word offset → entry index
    JSR $&dm_update_selection
    RTS 

  dm_find_not_found:
    PLA                   ; Discard target from stack
    ; Scene not found — select index 0
    LDA #$0000
    STA $dm_cursor
    STA $dm_scroll
    STA $dm_phase
    LDA #$list_max_scroll
    STA $dm_max
    RTS 

    ; ===================
    ; INVENTORY REFILL
    ; ===================
    ;
    ; Reads 13 inventory slots starting at dm_scroll into the per-row
    ; WRAM stores (dm_inv_items). Each byte-sized slot is masked to 6 bits
    ; ($00-$3F) and zero-extended to a 16-bit word for PTR table lookup.
    ;
    ; Input:  dm_scroll = first visible slot index (0-3)
    ; Output: dm_inv_items[0..12] filled with item IDs

  dm_inv_refill:
    LDX $dm_scroll        ; X = first visible slot index
    LDY #$0000            ; Y = output offset into dm_inv_items
  dm_inv_refill_lp:
    SEP #$20
    LDA $inventorySlots, X
    AND #$3F              ; Mask to 6-bit item ID
    REP #$20
    AND #$00FF            ; Zero-extend to 16-bit
    STA $dm_inv_items, Y
    INX 
    INY 
    INY 
    CPY #$001A            ; 13 × 2 = 26 bytes
    BCC dm_inv_refill_lp
    RTS 

    ; ===================
    ; UPDATE SELECTION
    ; ===================
    ;
    ; Adapted from Robotrek's travel_update_selection.
    ; Input:  A = proposed new cursor index
    ; Output: Z flag clear = index changed (redraw needed)
    ;         Z flag set   = no change (skip redraw)
    ;
    ; Computes dm_scroll and dm_phase from the clamped cursor value.
    ; The string PTR tokens read dm_scroll ($0BD4) and dm_phase ($0BD6).

  dm_update_selection:
    LDX $dm_cursor

    ; Clamp to 0
    CMP #$0000
    BEQ dm_sel_null
    BMI dm_sel_null

    ; Clamp to last valid index
    CMP $dm_list_len
    BCC dm_sel_continue

    ; At or past end — clamp to bottom
    LDA $dm_list_last
    STA $dm_cursor
    LDA #$list_height-1
    BRA dm_sel_bottom

  dm_sel_continue:
    STA $dm_cursor
    TAY 
    SEC 
    SBC #$list_center
    BMI dm_sel_negative

    ; A = cursor - center (non-negative)
    TAY 
    SEC 
    SBC $dm_max
    BPL dm_sel_positive

    ; Middle region: row = cursor - center, phase = center
    STY $dm_scroll
    LDA #$list_center
    STA $dm_phase
    BRA dm_sel_finish

  dm_sel_null:
    STZ $dm_cursor
    STZ $dm_phase
    STZ $dm_scroll
    BRA dm_sel_finish

  dm_sel_negative:
    ; Near top: phase = cursor, scroll = 0
    STY $dm_phase
    STZ $dm_scroll
    BRA dm_sel_finish

  dm_sel_positive:
    ; Near bottom: phase = remainder + center, scroll = max
    CLC 
    ADC #$list_center

  dm_sel_bottom:
    STA $dm_phase
    LDA $dm_max
    STA $dm_scroll

  dm_sel_finish:
    CPX $dm_cursor
    RTS 

    ; ===================
    ; RENDER: MAIN MENU
    ; ===================

  dm_render_main:
    JSL $@vram_buffer_clear.ClearVramBufferPartial
    LDA $dm_cursor
    BNE dm_render_main_1
    LDY #$&debug_menu_strings.debug_main_str0
    JSR $&dm_call_csr
    BRA dm_render_main_done

  dm_render_main_1:
    LDY #$&debug_menu_strings.debug_main_str1
    JSR $&dm_call_csr

  dm_render_main_done:
    SEP #$20
    LDA #$01
    TSB $displayModeFlags
    REP #$20
    RTS 

    ; ===================
    ; RENDER: FAST TRAVEL
    ; ===================

  dm_render_travel:
    JSL $@vram_buffer_clear.ClearVramBufferPartial
    LDY #$&debug_menu_strings.debug_travel_str
    JSR $&dm_call_csr
    SEP #$20
    LDA #$01
    TSB $displayModeFlags
    REP #$20
    RTS 

    ; ===================
    ; RENDER: INVENTORY
    ; ===================

  dm_render_inventory:
    JSL $@vram_buffer_clear.ClearVramBufferPartial
    LDY #$&debug_menu_strings.debug_inventory_str
    JSR $&dm_call_csr
    SEP #$20
    LDA #$01
    TSB $displayModeFlags
    REP #$20
    RTS 

    ; ===================
    ; SOUND EFFECTS
    ; ===================

    ; Navigation SFX (Ch2, $10)
  dm_play_sfx:
    SEP #$20
    LDA #$10
    STA $sfxQueueCh2
    REP #$20
    RTS 

    ; Confirm SFX (Ch2, $11)
  dm_play_confirm_sfx:
    SEP #$20
    LDA #$11
    STA $sfxQueueCh2
    REP #$20
    RTS 

    ; ===================
    ; CONSOLE STRING RENDERER HELPER
    ; ===================
    ;
    ; Calls ConsoleStringRenderer directly, bypassing the COP system.
    ; Input:  Y = 16-bit string address (#$&label, in debug_menu_strings bank)
    ;         REP #$30 (16-bit A/X) expected on entry
    ; Trashes: A, X, Y, DP scratch area ($00-$0F)
    ;
    ; Sets up the same context that RunBg3Script provides:
    ;   DBR = string data bank
    ;   DP  = $0000 (ConsoleStringRenderer uses zero-page scratch)
    ;   X   = $0000 (VRAM buffer start offset)

  dm_call_csr:
    PHD                   ; Save caller's DP
    PHB                   ; Save caller's DBR
    SEP #$20
    LDA #$^debug_menu_strings.debug_main_str0
    PHA 
    PLB                   ; DBR = debug_menu_strings bank
    REP #$20              ; 16-bit A — CSR entry context
    LDA #$0000
    TCD                   ; DP = $0000
    LDX #$0000            ; VRAM buffer start offset
    JSL $@ConsoleStringRenderer
    PLB                   ; Restore caller's DBR
    PLD                   ; Restore caller's DP
    RTS 
}
