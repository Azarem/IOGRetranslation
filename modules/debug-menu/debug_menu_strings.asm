; Debug menu — BG3 overlay strings for ConsoleStringRenderer.
;
; All strings use pipe-delimited ConsoleString format rendered via
; direct JSL to ConsoleStringRenderer (bypassing the COP system). The [CUR:lo,hi] token sets the VRAM buffer
; write position: byte offset = hi*256 + lo into the $7F0200 staging
; buffer. Each tilemap row is 64 bytes (32 words).
;
;   Row  = offset / 64
;   Col  = (offset % 64) / 2
;
; ClearVramBufferPartial clears offsets $0140+ (row 5+), so all menu
; text must be placed at row 5 or later to avoid HUD data corruption.
;
; [PTR:@table+offset,addr] reads a 16-bit index from WRAM at $00:addr,
; doubles it as a word offset, adds to (table+offset), reads the
; pointer, and recursively renders the pointed string.
;
; [NHM:n] sets the palette attribute (ConsoleCmd_SetPalette).
;   [NHM:0] = palette 0 (normal text)
;   [NHM:4] = palette 1 (highlighted/accent text)
;
; === WRAM variables (set by debug_menu_core) ===
;   $0BD4 = dm_scroll  (scroll offset — first visible entry index)
;   $0BD6 = dm_phase   (which visible row 0-12 is highlighted)

?INCLUDE 'debug_menu_tables'
?INCLUDE 'system_strings'

---------------------------------------------
; Highlight cursor table for the fast travel list.
; 25 entries (for 13 visible rows): index 12 is the highlight.
;
; Rows use staggered offsets so that exactly one row hits entry 12
; for any valid dm_phase value (0-12):
;
;   Row  0: travel_hl_table + $18 + phase*2  → table[12+phase]
;   Row  1: travel_hl_table + $16 + phase*2  → table[11+phase]
;   Row  2: travel_hl_table + $14 + phase*2  → table[10+phase]
;   ...
;   Row 12: travel_hl_table + $00 + phase*2  → table[ 0+phase]
;
; When phase=N, row N reads table[(12-N)+N] = table[12] → highlight.
; All other rows miss entry 12 → no highlight.

travel_hl_table [
  &hl_off    ; 0
  &hl_off    ; 1
  &hl_off    ; 2
  &hl_off    ; 3
  &hl_off    ; 4
  &hl_off    ; 5
  &hl_off    ; 6
  &hl_off    ; 7
  &hl_off    ; 8
  &hl_off    ; 9
  &hl_off    ; 10
  &hl_off    ; 11
  &hl_on     ; 12  ← highlight entry
  &hl_off    ; 13
  &hl_off    ; 14
  &hl_off    ; 15
  &hl_off    ; 16
  &hl_off    ; 17
  &hl_off    ; 18
  &hl_off    ; 19
  &hl_off    ; 20
  &hl_off    ; 21
  &hl_off    ; 22
  &hl_off    ; 23
  &hl_off    ; 24
]

hl_off |[NHM:0] |
hl_on  |[NHM:4]>|

---------------------------------------------
; Main menu strings — one per cursor position.
;
; Layout (row offsets from $7F0200):
;   Row  8, col 11: "DEBUG MENU"           [CUR:16,2]
;   Row 11, col  4: Fast Travel option     [CUR:C8,2]
;   Row 13, col  4: Inventory option       [CUR:48,3]
;   Row 18, col  5: footer hint            [CUR:8A,4]

debug_main_str0 |[NHM:0][RCT:18,D,1C6][CUR:16,2][NHM:4]DEBUG MENU[CUR:C8,2][NHM:4]> [NHM:0]Fast Travel[CUR:48,3][NHM:0]  Inventory[CUR:8A,4][NHM:0]B Select   Y Close|

debug_main_str1 |[NHM:0][RCT:18,D,1C6][CUR:16,2][NHM:4]DEBUG MENU[CUR:C8,2][NHM:0]  Fast Travel[CUR:48,3][NHM:4]> [NHM:0]Inventory[CUR:8A,4][NHM:0]B Select   Y Close|

debug_main_table [
  &debug_main_str0   ; cursor = 0
  &debug_main_str1   ; cursor = 1
]

---------------------------------------------
; Fast Travel scrollable list — 13 visible rows using staggered PTR.
; Matches the Robotrek debug menu layout exactly.
;
; Each row uses two [PTR] tokens with staggered offsets:
;   [PTR:@travel_hl_table+N,BD6] — highlight (all read dm_phase)
;   [PTR:@scene_name_table+N,BD4] — scene name (all read dm_scroll)
;
; Highlight stagger (descending): +18,+16,+14,+12,+10,+E,+C,+A,+8,+6,+4,+2,+0
; Scene name stagger (ascending): +0,+2,+4,+6,+8,+A,+C,+E,+10,+12,+14,+16,+18
;
; Layout:
;   Row  5: "FAST TRAVEL" title           [CUR:4E,1]
;   Row  6: box top border                [RCT:1A,10,184]
;   Row  7-19: 13 scene entries           [CUR:C6,1] through [CUR:C6,4]
;   Row 20: footer                        [CUR:06,5]
;   Row 21: box bottom border

debug_travel_str |[RCT:1A,10,184][CUR:4E,1][NHM:4]FAST TRAVEL\
[CUR:C6,1][PTR:@travel_hl_table+18,BD6][PTR:@scene_name_table,BD4]\
[CUR:06,2][PTR:@travel_hl_table+16,BD6][PTR:@scene_name_table+2,BD4]\
[CUR:46,2][PTR:@travel_hl_table+14,BD6][PTR:@scene_name_table+4,BD4]\
[CUR:86,2][PTR:@travel_hl_table+12,BD6][PTR:@scene_name_table+6,BD4]\
[CUR:C6,2][PTR:@travel_hl_table+10,BD6][PTR:@scene_name_table+8,BD4]\
[CUR:06,3][PTR:@travel_hl_table+E,BD6][PTR:@scene_name_table+A,BD4]\
[CUR:46,3][PTR:@travel_hl_table+C,BD6][PTR:@scene_name_table+C,BD4]\
[CUR:86,3][PTR:@travel_hl_table+A,BD6][PTR:@scene_name_table+E,BD4]\
[CUR:C6,3][PTR:@travel_hl_table+8,BD6][PTR:@scene_name_table+10,BD4]\
[CUR:06,4][PTR:@travel_hl_table+6,BD6][PTR:@scene_name_table+12,BD4]\
[CUR:46,4][PTR:@travel_hl_table+4,BD6][PTR:@scene_name_table+14,BD4]\
[CUR:86,4][PTR:@travel_hl_table+2,BD6][PTR:@scene_name_table+16,BD4]\
[CUR:C6,4][PTR:@travel_hl_table,BD6][PTR:@scene_name_table+18,BD4]\
[CUR:46,5][NHM:0]A Warp  B Back  L/R Page|

---------------------------------------------
; Inventory scrollable list — 13 visible rows using staggered PTR.
;
; Each row uses two [PTR] tokens:
;   [PTR:@travel_hl_table+N,BD6] — highlight cursor (reads dm_phase)
;   [PTR:@system_strings.item_menu_table,BEx] — item name (reads per-row inv_items)
;
; Item names come from the game's item_menu_table (64 entries).
; Per-row WRAM stores ($0BE4-$0BFC) hold the item ID for each visible row,
; loaded by dm_inv_refill from inventorySlots ($0AB4, 16 byte-sized slots).
;
; Footer uses [PTR:@inv_footer_table,BE2] to switch between scroll/edit hints
; based on dm_inv_state ($0BE2): 0=scroll mode, 1=edit mode.

debug_inventory_str |[RCT:1A,10,184][CUR:4E,1][NHM:4]INVENTORY\
[CUR:C6,1][PTR:@travel_hl_table+18,BD6][PTR:@system_strings.item_menu_table,BE4]\
[CUR:06,2][PTR:@travel_hl_table+16,BD6][PTR:@system_strings.item_menu_table,BE6]\
[CUR:46,2][PTR:@travel_hl_table+14,BD6][PTR:@system_strings.item_menu_table,BE8]\
[CUR:86,2][PTR:@travel_hl_table+12,BD6][PTR:@system_strings.item_menu_table,BEA]\
[CUR:C6,2][PTR:@travel_hl_table+10,BD6][PTR:@system_strings.item_menu_table,BEC]\
[CUR:06,3][PTR:@travel_hl_table+E,BD6][PTR:@system_strings.item_menu_table,BEE]\
[CUR:46,3][PTR:@travel_hl_table+C,BD6][PTR:@system_strings.item_menu_table,BF0]\
[CUR:86,3][PTR:@travel_hl_table+A,BD6][PTR:@system_strings.item_menu_table,BF2]\
[CUR:C6,3][PTR:@travel_hl_table+8,BD6][PTR:@system_strings.item_menu_table,BF4]\
[CUR:06,4][PTR:@travel_hl_table+6,BD6][PTR:@system_strings.item_menu_table,BF6]\
[CUR:46,4][PTR:@travel_hl_table+4,BD6][PTR:@system_strings.item_menu_table,BF8]\
[CUR:86,4][PTR:@travel_hl_table+2,BD6][PTR:@system_strings.item_menu_table,BFA]\
[CUR:C6,4][PTR:@travel_hl_table,BD6][PTR:@system_strings.item_menu_table,BFC]\
[CUR:46,5][PTR:@inv_footer_table,BE2]|

---------------------------------------------
; Inventory footer table — indexed by dm_inv_state ($0BE2).
; Entry 0 = scroll mode hints, Entry 1 = edit mode hints.

inv_footer_table [
  &inv_foot_browse
  &inv_foot_edit
]

inv_foot_browse |[NHM:0]B Edit  Y Back  L/R Page|
inv_foot_edit   |[NHM:4]B OK  Y Cancel  L/R Adj|
