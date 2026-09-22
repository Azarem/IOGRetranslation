; Debug menu — scene data tables for Fast Travel.
;
; Generated from db-us/groups.json. Contains all 253 entries
; (228 scenes + 25 section headers).
;
; Section headers have scene ID $0000 and cannot be warped to.
; Scene name strings are prefixed with "-" for headers and
; " " (space) for selectable scenes.

---------------------------------------------
; Scene ID table — one word per entry.
; $0000 = section header (non-warpable).

scene_id_table [
  #$0000   ; 00 - -- System --
  #$00E6   ; 01 - Dark Space
  #$00FA   ; 02 - Diary Menu
  #$00FB   ; 03 - Boot Logos
  #$00FC   ; 04 - Title Screen
  #$00FD   ; 05 - Statue Inventory
  #$00FE   ; 06 - World Map
  #$00FF   ; 07 - Inventory
  #$0000   ; 08 - -- South Cape --
  #$0001   ; 09 - South Cape
  #$0002   ; 0A - Coastal Cave
  #$0003   ; 0B - Lance's House
  #$0004   ; 0C - Eric's House
  #$0005   ; 0D - Seth's House
  #$0006   ; 0E - Will's House
  #$0007   ; 0F - Chef's House
  #$0008   ; 10 - Church
  #$0000   ; 11 - -- Edward Castle --
  #$000A   ; 12 - Edward's Castle
  #$000B   ; 13 - Castle Prison
  #$000C   ; 14 - Aqueduct - Entrance
  #$000D   ; 15 - Aqueduct - Main
  #$000E   ; 16 - Aqueduct - Lockway
  #$000F   ; 17 - Aqueduct - Hall
  #$0010   ; 18 - Aqueduct - Treasure Room
  #$0011   ; 19 - Aqueduct - Doorway
  #$0012   ; 1A - Aqueduct - Back
  #$0013   ; 1B - Aqueduct - Exit
  #$0000   ; 1C - -- Itory --
  #$0015   ; 1D - Itory Village
  #$0016   ; 1E - Itory - Legend House
  #$0017   ; 1F - Itory - Lily's House
  #$0018   ; 20 - Itory - Couple's House
  #$0019   ; 21 - Itory - Cave
  #$001A   ; 22 - Moon Tribe - Camp
  #$001B   ; 23 - Moon Tribe - Cave
  #$0000   ; 24 - -- Incan Ruins --
  #$001C   ; 25 - Incan Ruins - Entrance
  #$001D   ; 26 - Larai Cliff
  #$001E   ; 27 - Larai Cliff - Back
  #$001F   ; 28 - Incan Runis - Stone Lord Pressure Plates
  #$0020   ; 29 - Incan Ruins - Secret Hallway
  #$0021   ; 2A - Incan Ruins - River Crossing
  #$0022   ; 2B - Incan Ruins - River Detour
  #$0023   ; 2C - Incan Ruins - Guarded Gap
  #$0024   ; 2D - Incan Ruins - Plate Room
  #$0025   ; 2E - Incan Ruins - Entryway
  #$0026   ; 2F - Incan Ruins - Treasure Room
  #$0027   ; 30 - Incan Ruins - Side Passage
  #$0028   ; 31 - Incan Ruins - Ceiling Trap Room
  #$0029   ; 32 - Incan Ruins - Castoth's Lair
  #$0000   ; 33 - -- Gold Ship --
  #$002A   ; 34 - Will's Dream
  #$002B   ; 35 - Wrecked Ship - Exterior
  #$002C   ; 36 - Gold Ship - Exterior
  #$002D   ; 37 - Wrecked Ship - Interior
  #$002E   ; 38 - Gold Ship - Interior
  #$002F   ; 39 - Adrift
  #$0000   ; 3A - -- Freejia --
  #$0030   ; 3B - Oakton House
  #$0031   ; 3C - Oakton House - Interior
  #$0032   ; 3D - Freejia
  #$0033   ; 3E - Freejia - Erik's Captivity Room
  #$0034   ; 3F - Freejia - Dark Space House
  #$0035   ; 40 - Freejia - Labor Camp
  #$0036   ; 41 - Freejia - Mother's House
  #$0037   ; 42 - Freejia - Thorn Tower
  #$0038   ; 43 - Freejia - Adequacy Manor
  #$0039   ; 44 - Freejia - Hotel
  #$003A   ; 45 - Freejia - Harborer's House
  #$003B   ; 46 - Freejia - Messy House
  #$003C   ; 47 - Freejia - Slave Market
  #$0000   ; 48 - -- Diamond Mine --
  #$003D   ; 49 - Diamond Mine - Promise Passage
  #$003E   ; 4A - Diamond Mine - Entrance
  #$003F   ; 4B - Diamond Mine - Main Chamber
  #$0040   ; 4C - Diamond Mine - Collapsed Tunnel
  #$0041   ; 4D - Diamond Mine - Zigzag Passage
  #$0042   ; 4E - Diamond Mine - Elevator Passage
  #$0043   ; 4F - Diamond Mine - Elevator
  #$0044   ; 50 - Diamond Mine - Sub Foyer
  #$0045   ; 51 - Diamond Mine - Morgue
  #$0046   ; 52 - Diamond Mine - Monster Nest
  #$0047   ; 53 - Diamond Mine - Inner Chamber
  #$0000   ; 54 - -- Nazca --
  #$0049   ; 55 - Neil's Cottage
  #$004B   ; 56 - Nazca Plain
  #$0000   ; 57 - -- Sky Garden --
  #$004C   ; 58 - Sky Garden - Main
  #$004D   ; 59 - Sky Garden - East
  #$004E   ; 5A - Sky Garden - East (Underside)
  #$004F   ; 5B - Sky Garden - Southeast
  #$0050   ; 5C - Sky Garden - Southeast (Underside)
  #$0051   ; 5D - Sky Garden - Southwest
  #$0052   ; 5E - Sky Garden - Southwest (Underside)
  #$0053   ; 5F - Sky Garden - West
  #$0054   ; 60 - Sky Garden - West (Underside)
  #$0055   ; 61 - Sky Garden - Viper's Lair
  #$0056   ; 62 - Sky Garden - Interior
  #$0058   ; 63 - Sky Garden - Descent
  #$0059   ; 64 - Sky Garden - Crash
  #$0000   ; 65 - -- Seaside Palace --
  #$005A   ; 66 - Seabed Palace - Main
  #$005B   ; 67 - Seabed Palace - Rooms
  #$005C   ; 68 - Seabed Palace - Coffins
  #$005D   ; 69 - Seabed Palace - Fountain
  #$005E   ; 6A - Seabed Palace - Mu Passageway
  #$0000   ; 6B - -- Mu --
  #$005F   ; 6C - Mu - Entrance
  #$0060   ; 6D - Mu - East
  #$0061   ; 6E - Mu - South
  #$0062   ; 6F - Mu - West
  #$0063   ; 70 - Mu - Prayer Room
  #$0064   ; 71 - Mu - Connector
  #$0065   ; 72 - Mu - Maze
  #$0066   ; 73 - Mu - Altar Room
  #$0067   ; 74 - Mu - Vampire Lair
  #$0000   ; 75 - -- Angel Village --
  #$0068   ; 76 - Undersea Tunnel
  #$0069   ; 77 - Angel Village - Entrance
  #$006A   ; 78 - Angel Village - Guest Annex
  #$006B   ; 79 - Angel Village
  #$006C   ; 7A - Angel Village - Rooms
  #$006D   ; 7B - Angel Village - Entrance Tunnel
  #$006E   ; 7C - Angel Village - Draco Tunnel
  #$006F   ; 7D - Angel Village - Dark Tunnel
  #$0070   ; 7E - Angel Village - River Tunnel
  #$0071   ; 7F - Angel Village - Windy Tunnel
  #$0072   ; 80 - Angel Village - Statue Tunnel
  #$0073   ; 81 - Angel Village - Waterfall Tunnel
  #$0074   ; 82 - Angel Village - Tunnel Rooms
  #$0075   ; 83 - Angel Village - Ishtar's Test
  #$0000   ; 84 - -- Watermia --
  #$0078   ; 85 - Watermia
  #$0079   ; 86 - Watermia - Luke's House
  #$007A   ; 87 - Watermia - Lance's Father's House
  #$007B   ; 88 - Watermia - Gambling House
  #$007C   ; 89 - Watermia - Dark Space House
  #$007D   ; 8A - Watermia - Glass Player's House
  #$007E   ; 8B - Watermia - Rumor House
  #$007F   ; 8C - Watermia - Lance & Lily's Exchange
  #$0000   ; 8D - -- Great Wall --
  #$0082   ; 8E - Great Wall - Entrance
  #$0083   ; 8F - Great Wall - Long Dive
  #$0085   ; 90 - Great Wall - Rampway
  #$0086   ; 91 - Great Wall - Blind Pit
  #$0087   ; 92 - Great Wall - Switchback
  #$0088   ; 93 - Great Wall - Tomb
  #$008A   ; 94 - Great Wall - Sand Fanger Lair
  #$008B   ; 95 - Great Wall - Inner Chamber
  #$0000   ; 96 - -- Prologue --
  #$008C   ; 97 - Prologue - Prophecy
  #$008D   ; 98 - Prologue - Legends
  #$008E   ; 99 - Prologue - Missing
  #$008F   ; 9A - Prologue - Mishap
  #$0000   ; 9B - -- Ending --
  #$0089   ; 9C - Ending - New Babel
  #$0090   ; 9D - Ending - Changed World
  #$00E5   ; 9E - Ending - Comet
  #$00F0   ; 9F - Ending - Class Dismissed
  #$00F7   ; A0 - Ending - Credits
  #$0000   ; A1 - -- Euro --
  #$0091   ; A2 - Euro
  #$0092   ; A3 - Euro - Geezer Central
  #$0093   ; A4 - Euro - Power House
  #$0094   ; A5 - Euro - Rolek Office
  #$0095   ; A6 - Euro - Rolek Mansion
  #$0096   ; A7 - Euro - Guest Room
  #$0097   ; A8 - Euro - Rolek Market
  #$0098   ; A9 - Euro - Baggage House
  #$0099   ; AA - Euro - Dark Space House
  #$009A   ; AB - Euro - Friezer's House
  #$009B   ; AC - Euro - Gem's House
  #$009C   ; AD - Euro - Mushroom Twins House
  #$009D   ; AE - Euro - Dark Chapel
  #$0000   ; AF - -- Mountain Temple --
  #$00A0   ; B0 - Mt. Temple - Entrance
  #$00A1   ; B1 - Mt. Temple - Twisted Paths
  #$00A2   ; B2 - Mt. Temple - Crossroads
  #$00A3   ; B3 - Mt. Temple - Treasure Gauntlet
  #$00A4   ; B4 - Mt. Temple - Western Loop
  #$00A5   ; B5 - Mt. Temple - Broken Vines
  #$00A6   ; B6 - Mt. Temple - Mushroom Field
  #$00A7   ; B7 - Mt. Temple - Vine Maze
  #$00A8   ; B8 - Mt. Temple - Detour
  #$00A9   ; B9 - Mt. Temple - Summit
  #$0000   ; BA - -- Native Village --
  #$00AC   ; BB - Native Village
  #$00AD   ; BC - Native Village - Vacant Hut
  #$00AE   ; BD - Native Village - Gorgon Hut
  #$0000   ; BE - -- Angkor Wat --
  #$00B0   ; BF - Angkor Wat - Entrance
  #$00B1   ; C0 - Angkor Wat - Outer Gate
  #$00B2   ; C1 - Mt. Temple - Outer East
  #$00B3   ; C2 - Angkor Wat - Outer North
  #$00B4   ; C3 - Angkor Wat - Snake Pit
  #$00B5   ; C4 - Angkor Wat - Outer West
  #$00B6   ; C5 - Angkor Wat - Outer Courtyard
  #$00B7   ; C6 - Angkor Wat - Inner Gate
  #$00B8   ; C7 - Angkor Wat - Inner East
  #$00B9   ; C8 - Angkor Wat - Inner West
  #$00BA   ; C9 - Angkor Wat - Inner Courtyard
  #$00BB   ; CA - Angkor Wat - Main Shrine
  #$00BC   ; CB - Angkor Wat - Crystal Room
  #$00BD   ; CC - Angkor Wat - Deja Vu
  #$00BE   ; CD - Angkor Wat - Upper Shrine
  #$00BF   ; CE - Angkor Wat - Pinnacle
  #$00C0   ; CF - Angkor Wat - Future Vision
  #$0000   ; D0 - -- Dao --
  #$00C3   ; D1 - Dao
  #$00C4   ; D2 - Dao - Hotel
  #$00C5   ; D3 - Dao - Sweatshop
  #$00C6   ; D4 - Dao - Snake Panic
  #$00C7   ; D5 - Dao - Explorer's House
  #$00C8   ; D6 - Dao - Dorm
  #$00C9   ; D7 - Dao - Indecision Room
  #$0000   ; D8 - -- Pyramid --
  #$00CC   ; D9 - Pyramid - Main Chamber
  #$00CD   ; DA - Pyramid - Puzzle Room
  #$00CE   ; DB - Pyramid - Ramptastic A
  #$00CF   ; DC - Pyramid - Ramptastic B
  #$00D0   ; DD - Pyramid - Meltdown A
  #$00D1   ; DE - Pyramid - Meltdown B
  #$00D2   ; DF - Pyramid - Focus A
  #$00D3   ; E0 - Pyramid - Focus B
  #$00D4   ; E1 - Pyramid - Trickle A
  #$00D5   ; E2 - Pyramid - Trickle B
  #$00D6   ; E3 - Pyramid - Vader A
  #$00D7   ; E4 - Pyramid - Vader B
  #$00D8   ; E5 - Pyramid - Dangerslide A
  #$00D9   ; E6 - Pyramid - Dangerslide B
  #$00DA   ; E7 - Pyramid - Hieroglyph Room
  #$00DB   ; E8 - Pyramid - Dangerslide C
  #$00DD   ; E9 - Pyramid - Mummy Queen's Lair
  #$0000   ; EA - -- Babel Tower --
  #$00DC   ; EB - Babel Tower - Flight
  #$00DE   ; EC - Babel Tower - Entrance
  #$00DF   ; ED - Babel Tower - Lower Floors
  #$00E0   ; EE - Babel Tower - Middle Floors
  #$00E1   ; EF - Babel Tower - Light Elevator
  #$00E2   ; F0 - Babel Tower - Exterior
  #$00E3   ; F1 - Babel Tower - Upper Floors
  #$00E4   ; F2 - Babel Tower - Rooftop
  #$00E7   ; F3 - Comet - Space Flight
  #$00E8   ; F4 - Comet - Final Lair
  #$00F2   ; F5 - Babel Tower - Dark Castoth's Lair
  #$00F3   ; F6 - Babel Tower - Dark Viper's Lair
  #$00F4   ; F7 - Babel Tower - Dark Vampire's Lair
  #$00F5   ; F8 - Babel Tower - Dark Fanger's Lair
  #$00F6   ; F9 - Babel Tower - Dark Queen's Lair
  #$0000   ; FA - -- Mansion --
  #$00E9   ; FB - Mansion
  #$00EA   ; FC - Mansion - Solid Arm's Lair
]

---------------------------------------------
; Scene name pointer table — one word per entry.

scene_name_table [
  &sn_000
  &sn_001
  &sn_002
  &sn_003
  &sn_004
  &sn_005
  &sn_006
  &sn_007
  &sn_008
  &sn_009
  &sn_00a
  &sn_00b
  &sn_00c
  &sn_00d
  &sn_00e
  &sn_00f
  &sn_010
  &sn_011
  &sn_012
  &sn_013
  &sn_014
  &sn_015
  &sn_016
  &sn_017
  &sn_018
  &sn_019
  &sn_01a
  &sn_01b
  &sn_01c
  &sn_01d
  &sn_01e
  &sn_01f
  &sn_020
  &sn_021
  &sn_022
  &sn_023
  &sn_024
  &sn_025
  &sn_026
  &sn_027
  &sn_028
  &sn_029
  &sn_02a
  &sn_02b
  &sn_02c
  &sn_02d
  &sn_02e
  &sn_02f
  &sn_030
  &sn_031
  &sn_032
  &sn_033
  &sn_034
  &sn_035
  &sn_036
  &sn_037
  &sn_038
  &sn_039
  &sn_03a
  &sn_03b
  &sn_03c
  &sn_03d
  &sn_03e
  &sn_03f
  &sn_040
  &sn_041
  &sn_042
  &sn_043
  &sn_044
  &sn_045
  &sn_046
  &sn_047
  &sn_048
  &sn_049
  &sn_04a
  &sn_04b
  &sn_04c
  &sn_04d
  &sn_04e
  &sn_04f
  &sn_050
  &sn_051
  &sn_052
  &sn_053
  &sn_054
  &sn_055
  &sn_056
  &sn_057
  &sn_058
  &sn_059
  &sn_05a
  &sn_05b
  &sn_05c
  &sn_05d
  &sn_05e
  &sn_05f
  &sn_060
  &sn_061
  &sn_062
  &sn_063
  &sn_064
  &sn_065
  &sn_066
  &sn_067
  &sn_068
  &sn_069
  &sn_06a
  &sn_06b
  &sn_06c
  &sn_06d
  &sn_06e
  &sn_06f
  &sn_070
  &sn_071
  &sn_072
  &sn_073
  &sn_074
  &sn_075
  &sn_076
  &sn_077
  &sn_078
  &sn_079
  &sn_07a
  &sn_07b
  &sn_07c
  &sn_07d
  &sn_07e
  &sn_07f
  &sn_080
  &sn_081
  &sn_082
  &sn_083
  &sn_084
  &sn_085
  &sn_086
  &sn_087
  &sn_088
  &sn_089
  &sn_08a
  &sn_08b
  &sn_08c
  &sn_08d
  &sn_08e
  &sn_08f
  &sn_090
  &sn_091
  &sn_092
  &sn_093
  &sn_094
  &sn_095
  &sn_096
  &sn_097
  &sn_098
  &sn_099
  &sn_09a
  &sn_09b
  &sn_09c
  &sn_09d
  &sn_09e
  &sn_09f
  &sn_0a0
  &sn_0a1
  &sn_0a2
  &sn_0a3
  &sn_0a4
  &sn_0a5
  &sn_0a6
  &sn_0a7
  &sn_0a8
  &sn_0a9
  &sn_0aa
  &sn_0ab
  &sn_0ac
  &sn_0ad
  &sn_0ae
  &sn_0af
  &sn_0b0
  &sn_0b1
  &sn_0b2
  &sn_0b3
  &sn_0b4
  &sn_0b5
  &sn_0b6
  &sn_0b7
  &sn_0b8
  &sn_0b9
  &sn_0ba
  &sn_0bb
  &sn_0bc
  &sn_0bd
  &sn_0be
  &sn_0bf
  &sn_0c0
  &sn_0c1
  &sn_0c2
  &sn_0c3
  &sn_0c4
  &sn_0c5
  &sn_0c6
  &sn_0c7
  &sn_0c8
  &sn_0c9
  &sn_0ca
  &sn_0cb
  &sn_0cc
  &sn_0cd
  &sn_0ce
  &sn_0cf
  &sn_0d0
  &sn_0d1
  &sn_0d2
  &sn_0d3
  &sn_0d4
  &sn_0d5
  &sn_0d6
  &sn_0d7
  &sn_0d8
  &sn_0d9
  &sn_0da
  &sn_0db
  &sn_0dc
  &sn_0dd
  &sn_0de
  &sn_0df
  &sn_0e0
  &sn_0e1
  &sn_0e2
  &sn_0e3
  &sn_0e4
  &sn_0e5
  &sn_0e6
  &sn_0e7
  &sn_0e8
  &sn_0e9
  &sn_0ea
  &sn_0eb
  &sn_0ec
  &sn_0ed
  &sn_0ee
  &sn_0ef
  &sn_0f0
  &sn_0f1
  &sn_0f2
  &sn_0f3
  &sn_0f4
  &sn_0f5
  &sn_0f6
  &sn_0f7
  &sn_0f8
  &sn_0f9
  &sn_0fa
  &sn_0fb
  &sn_0fc
]


---------------------------------------------
; Scene name strings — generated by gen-scene-names.mjs.
; Headers prefixed with "-", scenes indented with 2 spaces.
; Group name stripped from scene descriptions where redundant.
; Max 24 chars per entry for BG3 display width.

sn_000 |-System|
sn_001 |  Dark Space|
sn_002 |  Diary Menu|
sn_003 |  Boot Logos|
sn_004 |  Title Screen|
sn_005 |  Statue Inventory|
sn_006 |  World Map|
sn_007 |  Inventory|
sn_008 |-South Cape|
sn_009 |  South Cape|
sn_00a |  Coastal Cave|
sn_00b |  Lance's House|
sn_00c |  Eric's House|
sn_00d |  Seth's House|
sn_00e |  Will's House|
sn_00f |  Chef's House|
sn_010 |  Church|
sn_011 |-Edward Castle|
sn_012 |  Edward's Castle|
sn_013 |  Castle Prison|
sn_014 |  Aqueduct - Entrance|
sn_015 |  Aqueduct - Main|
sn_016 |  Aqueduct - Lockway|
sn_017 |  Aqueduct - Hall|
sn_018 |  Aqueduct - Treasure Ro|
sn_019 |  Aqueduct - Doorway|
sn_01a |  Aqueduct - Back|
sn_01b |  Aqueduct - Exit|
sn_01c |-Itory|
sn_01d |  Itory Village|
sn_01e |  Legend House|
sn_01f |  Lily's House|
sn_020 |  Couple's House|
sn_021 |  Cave|
sn_022 |  Moon Tribe - Camp|
sn_023 |  Moon Tribe - Cave|
sn_024 |-Incan Ruins|
sn_025 |  Entrance|
sn_026 |  Larai Cliff|
sn_027 |  Larai Cliff - Back|
sn_028 |  Stone Lord Plates|
sn_029 |  Secret Hallway|
sn_02a |  River Crossing|
sn_02b |  River Detour|
sn_02c |  Guarded Gap|
sn_02d |  Plate Room|
sn_02e |  Entryway|
sn_02f |  Treasure Room|
sn_030 |  Side Passage|
sn_031 |  Ceiling Trap Room|
sn_032 |  Castoth's Lair|
sn_033 |-Gold Ship|
sn_034 |  Will's Dream|
sn_035 |  Wrecked Exterior|
sn_036 |  Exterior|
sn_037 |  Wrecked Interior|
sn_038 |  Interior|
sn_039 |  Adrift|
sn_03a |-Freejia|
sn_03b |  Oakton House|
sn_03c |  Oakton - Interior|
sn_03d |  Freejia|
sn_03e |  Erik's Captivity Room|
sn_03f |  Dark Space House|
sn_040 |  Labor Camp|
sn_041 |  Mother's House|
sn_042 |  Thorn Tower|
sn_043 |  Adequacy Manor|
sn_044 |  Hotel|
sn_045 |  Harborer's House|
sn_046 |  Messy House|
sn_047 |  Slave Market|
sn_048 |-Diamond Mine|
sn_049 |  Promise Passage|
sn_04a |  Entrance|
sn_04b |  Main Chamber|
sn_04c |  Collapsed Tunnel|
sn_04d |  Zigzag Passage|
sn_04e |  Elevator Passage|
sn_04f |  Elevator|
sn_050 |  Sub Foyer|
sn_051 |  Morgue|
sn_052 |  Monster Nest|
sn_053 |  Inner Chamber|
sn_054 |-Nazca|
sn_055 |  Neil's Cottage|
sn_056 |  Nazca Plain|
sn_057 |-Sky Garden|
sn_058 |  Main|
sn_059 |  East|
sn_05a |  East (Underside)|
sn_05b |  Southeast|
sn_05c |  Southeast (Underside)|
sn_05d |  Southwest|
sn_05e |  Southwest (Underside)|
sn_05f |  West|
sn_060 |  West (Underside)|
sn_061 |  Viper's Lair|
sn_062 |  Interior|
sn_063 |  Descent|
sn_064 |  Crash|
sn_065 |-Seaside Palace|
sn_066 |  Main|
sn_067 |  Rooms|
sn_068 |  Coffins|
sn_069 |  Fountain|
sn_06a |  Mu Passageway|
sn_06b |-Mu|
sn_06c |  Entrance|
sn_06d |  East|
sn_06e |  South|
sn_06f |  West|
sn_070 |  Prayer Room|
sn_071 |  Connector|
sn_072 |  Maze|
sn_073 |  Altar Room|
sn_074 |  Vampire Lair|
sn_075 |-Angel Village|
sn_076 |  Undersea Tunnel|
sn_077 |  Entrance|
sn_078 |  Guest Annex|
sn_079 |  Angel Village|
sn_07a |  Rooms|
sn_07b |  Entrance Tunnel|
sn_07c |  Draco Tunnel|
sn_07d |  Dark Tunnel|
sn_07e |  River Tunnel|
sn_07f |  Windy Tunnel|
sn_080 |  Statue Tunnel|
sn_081 |  Waterfall Tunnel|
sn_082 |  Tunnel Rooms|
sn_083 |  Ishtar's Test|
sn_084 |-Watermia|
sn_085 |  Watermia|
sn_086 |  Luke's House|
sn_087 |  Lance's Father's House|
sn_088 |  Gambling House|
sn_089 |  Dark Space House|
sn_08a |  Glass Player's House|
sn_08b |  Rumor House|
sn_08c |  Lance & Lily's Exchang|
sn_08d |-Great Wall|
sn_08e |  Entrance|
sn_08f |  Long Dive|
sn_090 |  Rampway|
sn_091 |  Blind Pit|
sn_092 |  Switchback|
sn_093 |  Tomb|
sn_094 |  Sand Fanger Lair|
sn_095 |  Inner Chamber|
sn_096 |-Prologue|
sn_097 |  Prophecy|
sn_098 |  Legends|
sn_099 |  Missing|
sn_09a |  Mishap|
sn_09b |-Ending|
sn_09c |  New Babel|
sn_09d |  Changed World|
sn_09e |  Comet|
sn_09f |  Class Dismissed|
sn_0a0 |  Credits|
sn_0a1 |-Euro|
sn_0a2 |  Euro|
sn_0a3 |  Geezer Central|
sn_0a4 |  Power House|
sn_0a5 |  Rolek Office|
sn_0a6 |  Rolek Mansion|
sn_0a7 |  Guest Room|
sn_0a8 |  Rolek Market|
sn_0a9 |  Baggage House|
sn_0aa |  Dark Space House|
sn_0ab |  Friezer's House|
sn_0ac |  Gem's House|
sn_0ad |  Mushroom Twins House|
sn_0ae |  Dark Chapel|
sn_0af |-Mountain Temple|
sn_0b0 |  Entrance|
sn_0b1 |  Twisted Paths|
sn_0b2 |  Crossroads|
sn_0b3 |  Treasure Gauntlet|
sn_0b4 |  Western Loop|
sn_0b5 |  Broken Vines|
sn_0b6 |  Mushroom Field|
sn_0b7 |  Vine Maze|
sn_0b8 |  Detour|
sn_0b9 |  Summit|
sn_0ba |-Native Village|
sn_0bb |  Native Village|
sn_0bc |  Vacant Hut|
sn_0bd |  Gorgon Hut|
sn_0be |-Angkor Wat|
sn_0bf |  Entrance|
sn_0c0 |  Outer Gate|
sn_0c1 |  Outer East|
sn_0c2 |  Outer North|
sn_0c3 |  Snake Pit|
sn_0c4 |  Outer West|
sn_0c5 |  Outer Courtyard|
sn_0c6 |  Inner Gate|
sn_0c7 |  Inner East|
sn_0c8 |  Inner West|
sn_0c9 |  Inner Courtyard|
sn_0ca |  Main Shrine|
sn_0cb |  Crystal Room|
sn_0cc |  Deja Vu|
sn_0cd |  Upper Shrine|
sn_0ce |  Pinnacle|
sn_0cf |  Future Vision|
sn_0d0 |-Dao|
sn_0d1 |  Dao|
sn_0d2 |  Hotel|
sn_0d3 |  Sweatshop|
sn_0d4 |  Snake Panic|
sn_0d5 |  Explorer's House|
sn_0d6 |  Dorm|
sn_0d7 |  Indecision Room|
sn_0d8 |-Pyramid|
sn_0d9 |  Main Chamber|
sn_0da |  Puzzle Room|
sn_0db |  Ramptastic A|
sn_0dc |  Ramptastic B|
sn_0dd |  Meltdown A|
sn_0de |  Meltdown B|
sn_0df |  Focus A|
sn_0e0 |  Focus B|
sn_0e1 |  Trickle A|
sn_0e2 |  Trickle B|
sn_0e3 |  Vader A|
sn_0e4 |  Vader B|
sn_0e5 |  Dangerslide A|
sn_0e6 |  Dangerslide B|
sn_0e7 |  Hieroglyph Room|
sn_0e8 |  Dangerslide C|
sn_0e9 |  Mummy Queen's Lair|
sn_0ea |-Babel Tower|
sn_0eb |  Flight|
sn_0ec |  Entrance|
sn_0ed |  Lower Floors|
sn_0ee |  Middle Floors|
sn_0ef |  Light Elevator|
sn_0f0 |  Exterior|
sn_0f1 |  Upper Floors|
sn_0f2 |  Rooftop|
sn_0f3 |  Comet - Space Flight|
sn_0f4 |  Comet - Final Lair|
sn_0f5 |  Dark Castoth's Lair|
sn_0f6 |  Dark Viper's Lair|
sn_0f7 |  Dark Vampire's Lair|
sn_0f8 |  Dark Fanger's Lair|
sn_0f9 |  Dark Queen's Lair|
sn_0fa |-Mansion|
sn_0fb |  Mansion|
sn_0fc |  Solid Arm's Lair|


---------------------------------------------
; Warp prep tables — parallel to scene_id_table.
; One word per entry. Section headers ($0000) have zeroed data.
;
; Sources (priority order):
;   1. debug_man.asm QueueMapChange overrides (developer spawn points)
;   2. scene_warps.asm reverse-mapped incoming warps (first hit)
;   3. Default fallback ($0080, $0080, $00, $1100)
;
; Written to QueueMapChange WRAM registers before scene transition:
;   $064C = spawnX    (warp_x_table)
;   $064E = spawnY    (warp_y_table)
;   $0650 = direction (warp_dir_table) — low byte only, bit 7 clear
;   $0652 = camera    (warp_cam_table)

warp_x_table [
  #$0000   ; 00 - -- System -- [header]
  #$0078   ; 01 - Dark Space [warp]
  #$0100   ; 02 - Diary Menu [script]
  #$0080   ; 03 - Boot Logos [default]
  #$0080   ; 04 - Title Screen [default]
  #$0080   ; 05 - Statue Inventory [default]
  #$0080   ; 06 - World Map [default]
  #$0080   ; 07 - Inventory [default]
  #$0000   ; 08 - -- South Cape -- [header]
  #$0120   ; 09 - South Cape [warp]
  #$0078   ; 0A - Coastal Cave [warp]
  #$0058   ; 0B - Lance's House [warp]
  #$00C8   ; 0C - Eric's House [warp]
  #$0098   ; 0D - Seth's House [warp]
  #$0058   ; 0E - Will's House [warp]
  #$0078   ; 0F - Chef's House [warp]
  #$01B8   ; 10 - Church [warp]
  #$0000   ; 11 - -- Edward Castle -- [header]
  #$01E3   ; 12 - Edward's Castle [debug_man]
  #$00F8   ; 13 - Castle Prison [warp]
  #$0058   ; 14 - Aqueduct - Entrance [warp]
  #$0058   ; 15 - Aqueduct - Main [warp]
  #$0308   ; 16 - Aqueduct - Lockway [warp]
  #$0078   ; 17 - Aqueduct - Hall [debug_man]
  #$0078   ; 18 - Aqueduct - Treasure Room [warp]
  #$00F8   ; 19 - Aqueduct - Doorway [warp]
  #$0278   ; 1A - Aqueduct - Back [warp]
  #$0078   ; 1B - Aqueduct - Exit [warp]
  #$0000   ; 1C - -- Itory -- [header]
  #$0339   ; 1D - Itory Village [debug_man]
  #$0088   ; 1E - Itory - Legend House [warp]
  #$0010   ; 1F - Itory - Lily's House [warp]
  #$0058   ; 20 - Itory - Couple's House [warp]
  #$0078   ; 21 - Itory - Cave [warp]
  #$0110   ; 22 - Moon Tribe - Camp [debug_man]
  #$00F8   ; 23 - Moon Tribe - Cave [warp]
  #$0000   ; 24 - -- Incan Ruins -- [header]
  #$006C   ; 25 - Incan Ruins - Entrance [debug_man]
  #$02A8   ; 26 - Larai Cliff [warp]
  #$03A8   ; 27 - Larai Cliff - Back [warp]
  #$0038   ; 28 - Incan Runis - Stone Lord Pressure Plates [warp]
  #$00B8   ; 29 - Incan Ruins - Secret Hallway [warp]
  #$0138   ; 2A - Incan Ruins - River Crossing [warp]
  #$0058   ; 2B - Incan Ruins - River Detour [warp]
  #$01B8   ; 2C - Incan Ruins - Guarded Gap [warp]
  #$00F8   ; 2D - Incan Ruins - Plate Room [warp]
  #$0198   ; 2E - Incan Ruins - Entryway [warp]
  #$0098   ; 2F - Incan Ruins - Treasure Room [warp]
  #$0178   ; 30 - Incan Ruins - Side Passage [warp]
  #$0178   ; 31 - Incan Ruins - Ceiling Trap Room [warp]
  #$0078   ; 32 - Incan Ruins - Castoth's Lair [warp]
  #$0000   ; 33 - -- Gold Ship -- [header]
  #$00A0   ; 34 - Will's Dream [script]
  #$01E0   ; 35 - Wrecked Ship - Exterior [warp]
  #$0000   ; 36 - Gold Ship - Exterior [warp]
  #$0020   ; 37 - Wrecked Ship - Interior [warp]
  #$0020   ; 38 - Gold Ship - Interior [warp]
  #$0070   ; 39 - Adrift [script]
  #$0000   ; 3A - -- Freejia -- [header]
  #$00C0   ; 3B - Oakton House [warp]
  #$0028   ; 3C - Oakton House - Interior [warp]
  #$0138   ; 3D - Freejia [debug_man]
  #$0028   ; 3E - Freejia - Erik's Captivity Room [warp]
  #$0078   ; 3F - Freejia - Dark Space House [warp]
  #$0118   ; 40 - Freejia - Labor Camp [warp]
  #$00A8   ; 41 - Freejia - Mother's House [warp]
  #$0078   ; 42 - Freejia - Thorn Tower [warp]
  #$00B8   ; 43 - Freejia - Adequacy Manor [warp]
  #$0048   ; 44 - Freejia - Hotel [warp]
  #$0038   ; 45 - Freejia - Harborer's House [warp]
  #$0098   ; 46 - Freejia - Messy House [warp]
  #$0078   ; 47 - Freejia - Slave Market [warp]
  #$0000   ; 48 - -- Diamond Mine -- [header]
  #$0078   ; 49 - Diamond Mine - Promise Passage [warp]
  #$00B0   ; 4A - Diamond Mine - Entrance [debug_man]
  #$00A8   ; 4B - Diamond Mine - Main Chamber [warp]
  #$0070   ; 4C - Diamond Mine - Collapsed Tunnel [warp]
  #$03A0   ; 4D - Diamond Mine - Zigzag Passage [warp]
  #$0278   ; 4E - Diamond Mine - Elevator Passage [warp]
  #$05E0   ; 4F - Diamond Mine - Elevator [warp]
  #$00F0   ; 50 - Diamond Mine - Sub Foyer [warp]
  #$0150   ; 51 - Diamond Mine - Morgue [warp]
  #$0090   ; 52 - Diamond Mine - Monster Nest [warp]
  #$0070   ; 53 - Diamond Mine - Inner Chamber [warp]
  #$0000   ; 54 - -- Nazca -- [header]
  #$0050   ; 55 - Neil's Cottage [script]
  #$0120   ; 56 - Nazca Plain [script]
  #$0000   ; 57 - -- Sky Garden -- [header]
  #$0100   ; 58 - Sky Garden - Main [debug_man]
  #$0010   ; 59 - Sky Garden - East [warp]
  #$00E8   ; 5A - Sky Garden - East (Underside) [warp]
  #$0078   ; 5B - Sky Garden - Southeast [warp]
  #$00B8   ; 5C - Sky Garden - Southeast (Underside) [warp]
  #$0378   ; 5D - Sky Garden - Southwest [warp]
  #$0148   ; 5E - Sky Garden - Southwest (Underside) [warp]
  #$03E0   ; 5F - Sky Garden - West [warp]
  #$01E8   ; 60 - Sky Garden - West (Underside) [warp]
  #$0070   ; 61 - Sky Garden - Viper's Lair [warp]
  #$00A0   ; 62 - Sky Garden - Interior [warp]
  #$0080   ; 63 - Sky Garden - Descent [default]
  #$0080   ; 64 - Sky Garden - Crash [default]
  #$0000   ; 65 - -- Seaside Palace -- [header]
  #$0088   ; 66 - Seabed Palace - Main [debug_man]
  #$0030   ; 67 - Seabed Palace - Rooms [warp]
  #$0080   ; 68 - Seabed Palace - Coffins [warp]
  #$00D0   ; 69 - Seabed Palace - Fountain [warp]
  #$0380   ; 6A - Seabed Palace - Mu Passageway [warp]
  #$0000   ; 6B - -- Mu -- [header]
  #$0088   ; 6C - Mu - Entrance [debug_man]
  #$0010   ; 6D - Mu - East [warp]
  #$0140   ; 6E - Mu - South [warp]
  #$0150   ; 6F - Mu - West [warp]
  #$0180   ; 70 - Mu - Prayer Room [warp]
  #$0190   ; 71 - Mu - Connector [warp]
  #$0010   ; 72 - Mu - Maze [warp]
  #$0278   ; 73 - Mu - Altar Room [warp]
  #$0178   ; 74 - Mu - Vampire Lair [warp]
  #$0000   ; 75 - -- Angel Village -- [header]
  #$0070   ; 76 - Undersea Tunnel [script]
  #$02A8   ; 77 - Angel Village - Entrance [debug_man]
  #$01A0   ; 78 - Angel Village - Guest Annex [warp]
  #$0050   ; 79 - Angel Village [warp]
  #$00A8   ; 7A - Angel Village - Rooms [warp]
  #$0078   ; 7B - Angel Village - Entrance Tunnel [warp]
  #$0060   ; 7C - Angel Village - Draco Tunnel [warp]
  #$0040   ; 7D - Angel Village - Dark Tunnel [warp]
  #$0090   ; 7E - Angel Village - River Tunnel [warp]
  #$0060   ; 7F - Angel Village - Windy Tunnel [warp]
  #$0070   ; 80 - Angel Village - Statue Tunnel [warp]
  #$0080   ; 81 - Angel Village - Waterfall Tunnel [warp]
  #$00B0   ; 82 - Angel Village - Tunnel Rooms [warp]
  #$0088   ; 83 - Angel Village - Ishtar's Test [warp]
  #$0000   ; 84 - -- Watermia -- [header]
  #$027E   ; 85 - Watermia [debug_man]
  #$0080   ; 86 - Watermia - Luke's House [warp]
  #$0070   ; 87 - Watermia - Lance's Father's House [warp]
  #$00F8   ; 88 - Watermia - Gambling House [warp]
  #$0070   ; 89 - Watermia - Dark Space House [warp]
  #$0070   ; 8A - Watermia - Glass Player's House [warp]
  #$0070   ; 8B - Watermia - Rumor House [warp]
  #$02E0   ; 8C - Watermia - Lance & Lily's Exchange [script]
  #$0000   ; 8D - -- Great Wall -- [header]
  #$0020   ; 8E - Great Wall - Entrance [debug_man]
  #$0020   ; 8F - Great Wall - Long Dive [warp]
  #$0010   ; 90 - Great Wall - Rampway [warp]
  #$0010   ; 91 - Great Wall - Blind Pit [warp]
  #$0010   ; 92 - Great Wall - Switchback [warp]
  #$0010   ; 93 - Great Wall - Tomb [warp]
  #$0050   ; 94 - Great Wall - Sand Fanger Lair [warp]
  #$0010   ; 95 - Great Wall - Inner Chamber [warp]
  #$0000   ; 96 - -- Prologue -- [header]
  #$0080   ; 97 - Prologue - Prophecy [default]
  #$0080   ; 98 - Prologue - Legends [default]
  #$0080   ; 99 - Prologue - Missing [default]
  #$0080   ; 9A - Prologue - Mishap [default]
  #$0000   ; 9B - -- Ending -- [header]
  #$0080   ; 9C - Ending - New Babel [default]
  #$0080   ; 9D - Ending - Changed World [default]
  #$00A8   ; 9E - Ending - Comet [debug_man]
  #$0090   ; 9F - Ending - Class Dismissed [script]
  #$0080   ; A0 - Ending - Credits [default]
  #$0000   ; A1 - -- Euro -- [header]
  #$0370   ; A2 - Euro [debug_man]
  #$0098   ; A3 - Euro - Geezer Central [warp]
  #$0078   ; A4 - Euro - Power House [warp]
  #$0078   ; A5 - Euro - Rolek Office [warp]
  #$0198   ; A6 - Euro - Rolek Mansion [warp]
  #$00A8   ; A7 - Euro - Guest Room [warp]
  #$0068   ; A8 - Euro - Rolek Market [warp]
  #$0098   ; A9 - Euro - Baggage House [warp]
  #$0078   ; AA - Euro - Dark Space House [warp]
  #$0078   ; AB - Euro - Friezer's House [warp]
  #$0078   ; AC - Euro - Gem's House [warp]
  #$0078   ; AD - Euro - Mushroom Twins House [warp]
  #$00F8   ; AE - Euro - Dark Chapel [warp]
  #$0000   ; AF - -- Mountain Temple -- [header]
  #$0010   ; B0 - Mt. Temple - Entrance [warp]
  #$03E0   ; B1 - Mt. Temple - Twisted Paths [warp]
  #$0068   ; B2 - Mt. Temple - Crossroads [warp]
  #$0010   ; B3 - Mt. Temple - Treasure Gauntlet [warp]
  #$03E0   ; B4 - Mt. Temple - Western Loop [warp]
  #$0048   ; B5 - Mt. Temple - Broken Vines [warp]
  #$0010   ; B6 - Mt. Temple - Mushroom Field [warp]
  #$0348   ; B7 - Mt. Temple - Vine Maze [warp]
  #$03E0   ; B8 - Mt. Temple - Detour [warp]
  #$0048   ; B9 - Mt. Temple - Summit [warp]
  #$0000   ; BA - -- Native Village -- [header]
  #$01C0   ; BB - Native Village [debug_man]
  #$0078   ; BC - Native Village - Vacant Hut [warp]
  #$0078   ; BD - Native Village - Gorgon Hut [warp]
  #$0000   ; BE - -- Angkor Wat -- [header]
  #$0200   ; BF - Angkor Wat - Entrance [debug_man]
  #$03F8   ; C0 - Angkor Wat - Outer Gate [warp]
  #$0078   ; C1 - Mt. Temple - Outer East [warp]
  #$0778   ; C2 - Angkor Wat - Outer North [warp]
  #$0570   ; C3 - Angkor Wat - Snake Pit [warp]
  #$0078   ; C4 - Angkor Wat - Outer West [warp]
  #$02F8   ; C5 - Angkor Wat - Outer Courtyard [warp]
  #$02F8   ; C6 - Angkor Wat - Inner Gate [warp]
  #$0078   ; C7 - Angkor Wat - Inner East [warp]
  #$0048   ; C8 - Angkor Wat - Inner West [warp]
  #$01F8   ; C9 - Angkor Wat - Inner Courtyard [warp]
  #$0178   ; CA - Angkor Wat - Main Shrine [warp]
  #$0178   ; CB - Angkor Wat - Crystal Room [warp]
  #$0178   ; CC - Angkor Wat - Deja Vu [warp]
  #$0078   ; CD - Angkor Wat - Upper Shrine [warp]
  #$00F8   ; CE - Angkor Wat - Pinnacle [warp]
  #$0080   ; CF - Angkor Wat - Future Vision [default]
  #$0000   ; D0 - -- Dao -- [header]
  #$0010   ; D1 - Dao [debug_man]
  #$0078   ; D2 - Dao - Hotel [warp]
  #$0078   ; D3 - Dao - Sweatshop [warp]
  #$0078   ; D4 - Dao - Snake Panic [warp]
  #$0078   ; D5 - Dao - Explorer's House [warp]
  #$0078   ; D6 - Dao - Dorm [warp]
  #$0078   ; D7 - Dao - Indecision Room [warp]
  #$0000   ; D8 - -- Pyramid -- [header]
  #$002C   ; D9 - Pyramid - Main Chamber [debug_man]
  #$0080   ; DA - Pyramid - Puzzle Room [warp]
  #$0570   ; DB - Pyramid - Ramptastic A [warp]
  #$0570   ; DC - Pyramid - Ramptastic B [warp]
  #$0470   ; DD - Pyramid - Meltdown A [warp]
  #$0080   ; DE - Pyramid - Meltdown B [warp]
  #$0070   ; DF - Pyramid - Focus A [warp]
  #$0070   ; E0 - Pyramid - Focus B [warp]
  #$0070   ; E1 - Pyramid - Trickle A [warp]
  #$0070   ; E2 - Pyramid - Trickle B [warp]
  #$0070   ; E3 - Pyramid - Vader A [warp]
  #$0070   ; E4 - Pyramid - Vader B [warp]
  #$0480   ; E5 - Pyramid - Dangerslide A [warp]
  #$0080   ; E6 - Pyramid - Dangerslide B [warp]
  #$0078   ; E7 - Pyramid - Hieroglyph Room [warp]
  #$0028   ; E8 - Pyramid - Dangerslide C [warp]
  #$00F8   ; E9 - Pyramid - Mummy Queen's Lair [script]
  #$0000   ; EA - -- Babel Tower -- [header]
  #$0080   ; EB - Babel Tower - Flight [default]
  #$0078   ; EC - Babel Tower - Entrance [warp]
  #$0078   ; ED - Babel Tower - Lower Floors [warp]
  #$0098   ; EE - Babel Tower - Middle Floors [warp]
  #$0078   ; EF - Babel Tower - Light Elevator [warp]
  #$00D0   ; F0 - Babel Tower - Exterior [warp]
  #$0098   ; F1 - Babel Tower - Upper Floors [warp]
  #$00F0   ; F2 - Babel Tower - Rooftop [script]
  #$0050   ; F3 - Comet - Space Flight [script]
  #$0080   ; F4 - Comet - Final Lair [default]
  #$0078   ; F5 - Babel Tower - Dark Castoth's Lair [warp]
  #$0100   ; F6 - Babel Tower - Dark Viper's Lair [warp]
  #$0078   ; F7 - Babel Tower - Dark Vampire's Lair [warp]
  #$0180   ; F8 - Babel Tower - Dark Fanger's Lair [warp]
  #$0100   ; F9 - Babel Tower - Dark Queen's Lair [warp]
  #$0000   ; FA - -- Mansion -- [header]
  #$0330   ; FB - Mansion [script]
  #$0078   ; FC - Mansion - Solid Arm's Lair [warp]
]

warp_y_table [
  #$0000   ; 00 - -- System -- [header]
  #$00C0   ; 01 - Dark Space [warp]
  #$0370   ; 02 - Diary Menu [script]
  #$0080   ; 03 - Boot Logos [default]
  #$0080   ; 04 - Title Screen [default]
  #$0080   ; 05 - Statue Inventory [default]
  #$0080   ; 06 - World Map [default]
  #$0080   ; 07 - Inventory [default]
  #$0000   ; 08 - -- South Cape -- [header]
  #$0250   ; 09 - South Cape [warp]
  #$00C0   ; 0A - Coastal Cave [warp]
  #$00C0   ; 0B - Lance's House [warp]
  #$01C0   ; 0C - Eric's House [warp]
  #$00C0   ; 0D - Seth's House [warp]
  #$01C0   ; 0E - Will's House [warp]
  #$00C0   ; 0F - Chef's House [warp]
  #$0080   ; 10 - Church [warp]
  #$0000   ; 11 - -- Edward Castle -- [header]
  #$00A0   ; 12 - Edward's Castle [debug_man]
  #$02D0   ; 13 - Castle Prison [warp]
  #$0050   ; 14 - Aqueduct - Entrance [warp]
  #$0050   ; 15 - Aqueduct - Main [warp]
  #$0060   ; 16 - Aqueduct - Lockway [warp]
  #$05D0   ; 17 - Aqueduct - Hall [debug_man]
  #$00C0   ; 18 - Aqueduct - Treasure Room [warp]
  #$00C0   ; 19 - Aqueduct - Doorway [warp]
  #$05D0   ; 1A - Aqueduct - Back [warp]
  #$0050   ; 1B - Aqueduct - Exit [warp]
  #$0000   ; 1C - -- Itory -- [header]
  #$01B0   ; 1D - Itory Village [debug_man]
  #$00C0   ; 1E - Itory - Legend House [warp]
  #$00A8   ; 1F - Itory - Lily's House [warp]
  #$00C0   ; 20 - Itory - Couple's House [warp]
  #$01C0   ; 21 - Itory - Cave [warp]
  #$00C3   ; 22 - Moon Tribe - Camp [debug_man]
  #$01C0   ; 23 - Moon Tribe - Cave [warp]
  #$0000   ; 24 - -- Incan Ruins -- [header]
  #$0174   ; 25 - Incan Ruins - Entrance [debug_man]
  #$0060   ; 26 - Larai Cliff [warp]
  #$0040   ; 27 - Larai Cliff - Back [warp]
  #$01D0   ; 28 - Incan Runis - Stone Lord Pressure Plates [warp]
  #$01C0   ; 29 - Incan Ruins - Secret Hallway [warp]
  #$03D0   ; 2A - Incan Ruins - River Crossing [warp]
  #$03D0   ; 2B - Incan Ruins - River Detour [warp]
  #$02D0   ; 2C - Incan Ruins - Guarded Gap [warp]
  #$01D0   ; 2D - Incan Ruins - Plate Room [warp]
  #$01C0   ; 2E - Incan Ruins - Entryway [warp]
  #$02C0   ; 2F - Incan Ruins - Treasure Room [warp]
  #$01C0   ; 30 - Incan Ruins - Side Passage [warp]
  #$02C0   ; 31 - Incan Ruins - Ceiling Trap Room [warp]
  #$00C0   ; 32 - Incan Ruins - Castoth's Lair [warp]
  #$0000   ; 33 - -- Gold Ship -- [header]
  #$0070   ; 34 - Will's Dream [script]
  #$0250   ; 35 - Wrecked Ship - Exterior [warp]
  #$0000   ; 36 - Gold Ship - Exterior [warp]
  #$00A0   ; 37 - Wrecked Ship - Interior [warp]
  #$00A0   ; 38 - Gold Ship - Interior [warp]
  #$0090   ; 39 - Adrift [script]
  #$0000   ; 3A - -- Freejia -- [header]
  #$0090   ; 3B - Oakton House [warp]
  #$00C0   ; 3C - Oakton House - Interior [warp]
  #$0360   ; 3D - Freejia [debug_man]
  #$00C0   ; 3E - Freejia - Erik's Captivity Room [warp]
  #$00C0   ; 3F - Freejia - Dark Space House [warp]
  #$00C0   ; 40 - Freejia - Labor Camp [warp]
  #$01C0   ; 41 - Freejia - Mother's House [warp]
  #$01C0   ; 42 - Freejia - Thorn Tower [warp]
  #$01C0   ; 43 - Freejia - Adequacy Manor [warp]
  #$01C0   ; 44 - Freejia - Hotel [warp]
  #$00C0   ; 45 - Freejia - Harborer's House [warp]
  #$00C0   ; 46 - Freejia - Messy House [warp]
  #$00C0   ; 47 - Freejia - Slave Market [warp]
  #$0000   ; 48 - -- Diamond Mine -- [header]
  #$05D0   ; 49 - Diamond Mine - Promise Passage [warp]
  #$03D0   ; 4A - Diamond Mine - Entrance [debug_man]
  #$03B0   ; 4B - Diamond Mine - Main Chamber [warp]
  #$0040   ; 4C - Diamond Mine - Collapsed Tunnel [warp]
  #$00E0   ; 4D - Diamond Mine - Zigzag Passage [warp]
  #$00C0   ; 4E - Diamond Mine - Elevator Passage [warp]
  #$0340   ; 4F - Diamond Mine - Elevator [warp]
  #$0060   ; 50 - Diamond Mine - Sub Foyer [warp]
  #$0060   ; 51 - Diamond Mine - Morgue [warp]
  #$0060   ; 52 - Diamond Mine - Monster Nest [warp]
  #$0040   ; 53 - Diamond Mine - Inner Chamber [warp]
  #$0000   ; 54 - -- Nazca -- [header]
  #$00D0   ; 55 - Neil's Cottage [script]
  #$0080   ; 56 - Nazca Plain [script]
  #$0000   ; 57 - -- Sky Garden -- [header]
  #$0136   ; 58 - Sky Garden - Main [debug_man]
  #$00E8   ; 59 - Sky Garden - East [warp]
  #$0280   ; 5A - Sky Garden - East (Underside) [warp]
  #$0030   ; 5B - Sky Garden - Southeast [warp]
  #$0100   ; 5C - Sky Garden - Southeast (Underside) [warp]
  #$0030   ; 5D - Sky Garden - Southwest [warp]
  #$0130   ; 5E - Sky Garden - Southwest (Underside) [warp]
  #$0068   ; 5F - Sky Garden - West [warp]
  #$0270   ; 60 - Sky Garden - West (Underside) [warp]
  #$01E0   ; 61 - Sky Garden - Viper's Lair [warp]
  #$00B0   ; 62 - Sky Garden - Interior [warp]
  #$0080   ; 63 - Sky Garden - Descent [default]
  #$0080   ; 64 - Sky Garden - Crash [default]
  #$0000   ; 65 - -- Seaside Palace -- [header]
  #$00A0   ; 66 - Seabed Palace - Main [debug_man]
  #$0090   ; 67 - Seabed Palace - Rooms [warp]
  #$0070   ; 68 - Seabed Palace - Coffins [warp]
  #$0100   ; 69 - Seabed Palace - Fountain [warp]
  #$00B0   ; 6A - Seabed Palace - Mu Passageway [warp]
  #$0000   ; 6B - -- Mu -- [header]
  #$0050   ; 6C - Mu - Entrance [debug_man]
  #$0090   ; 6D - Mu - East [warp]
  #$0030   ; 6E - Mu - South [warp]
  #$0030   ; 6F - Mu - West [warp]
  #$00B0   ; 70 - Mu - Prayer Room [warp]
  #$0030   ; 71 - Mu - Connector [warp]
  #$02A0   ; 72 - Mu - Maze [warp]
  #$00B0   ; 73 - Mu - Altar Room [warp]
  #$01D0   ; 74 - Mu - Vampire Lair [warp]
  #$0000   ; 75 - -- Angel Village -- [header]
  #$01A0   ; 76 - Undersea Tunnel [script]
  #$00A0   ; 77 - Angel Village - Entrance [debug_man]
  #$0030   ; 78 - Angel Village - Guest Annex [warp]
  #$0030   ; 79 - Angel Village [warp]
  #$00B0   ; 7A - Angel Village - Rooms [warp]
  #$0070   ; 7B - Angel Village - Entrance Tunnel [warp]
  #$0070   ; 7C - Angel Village - Draco Tunnel [warp]
  #$00A0   ; 7D - Angel Village - Dark Tunnel [warp]
  #$0070   ; 7E - Angel Village - River Tunnel [warp]
  #$0080   ; 7F - Angel Village - Windy Tunnel [warp]
  #$00C0   ; 80 - Angel Village - Statue Tunnel [warp]
  #$01C0   ; 81 - Angel Village - Waterfall Tunnel [warp]
  #$00B0   ; 82 - Angel Village - Tunnel Rooms [warp]
  #$01C0   ; 83 - Angel Village - Ishtar's Test [warp]
  #$0000   ; 84 - -- Watermia -- [header]
  #$03A0   ; 85 - Watermia [debug_man]
  #$00B0   ; 86 - Watermia - Luke's House [warp]
  #$0080   ; 87 - Watermia - Lance's Father's House [warp]
  #$00C0   ; 88 - Watermia - Gambling House [warp]
  #$0080   ; 89 - Watermia - Dark Space House [warp]
  #$0080   ; 8A - Watermia - Glass Player's House [warp]
  #$0080   ; 8B - Watermia - Rumor House [warp]
  #$00B0   ; 8C - Watermia - Lance & Lily's Exchange [script]
  #$0000   ; 8D - -- Great Wall -- [header]
  #$0090   ; 8E - Great Wall - Entrance [debug_man]
  #$0090   ; 8F - Great Wall - Long Dive [warp]
  #$0070   ; 90 - Great Wall - Rampway [warp]
  #$0090   ; 91 - Great Wall - Blind Pit [warp]
  #$0090   ; 92 - Great Wall - Switchback [warp]
  #$0090   ; 93 - Great Wall - Tomb [warp]
  #$0090   ; 94 - Great Wall - Sand Fanger Lair [warp]
  #$0090   ; 95 - Great Wall - Inner Chamber [warp]
  #$0000   ; 96 - -- Prologue -- [header]
  #$0080   ; 97 - Prologue - Prophecy [default]
  #$0080   ; 98 - Prologue - Legends [default]
  #$0080   ; 99 - Prologue - Missing [default]
  #$0080   ; 9A - Prologue - Mishap [default]
  #$0000   ; 9B - -- Ending -- [header]
  #$0080   ; 9C - Ending - New Babel [default]
  #$0080   ; 9D - Ending - Changed World [default]
  #$00A0   ; 9E - Ending - Comet [debug_man]
  #$0178   ; 9F - Ending - Class Dismissed [script]
  #$0080   ; A0 - Ending - Credits [default]
  #$0000   ; A1 - -- Euro -- [header]
  #$0430   ; A2 - Euro [debug_man]
  #$00C0   ; A3 - Euro - Geezer Central [warp]
  #$00C0   ; A4 - Euro - Power House [warp]
  #$01C0   ; A5 - Euro - Rolek Office [warp]
  #$01C0   ; A6 - Euro - Rolek Mansion [warp]
  #$00C0   ; A7 - Euro - Guest Room [warp]
  #$00C0   ; A8 - Euro - Rolek Market [warp]
  #$00C0   ; A9 - Euro - Baggage House [warp]
  #$01C0   ; AA - Euro - Dark Space House [warp]
  #$00C0   ; AB - Euro - Friezer's House [warp]
  #$00C0   ; AC - Euro - Gem's House [warp]
  #$00C0   ; AD - Euro - Mushroom Twins House [warp]
  #$00C0   ; AE - Euro - Dark Chapel [warp]
  #$0000   ; AF - -- Mountain Temple -- [header]
  #$0040   ; B0 - Mt. Temple - Entrance [warp]
  #$0330   ; B1 - Mt. Temple - Twisted Paths [warp]
  #$03E0   ; B2 - Mt. Temple - Crossroads [warp]
  #$01A0   ; B3 - Mt. Temple - Treasure Gauntlet [warp]
  #$0190   ; B4 - Mt. Temple - Western Loop [warp]
  #$03E0   ; B5 - Mt. Temple - Broken Vines [warp]
  #$0360   ; B6 - Mt. Temple - Mushroom Field [warp]
  #$03E0   ; B7 - Mt. Temple - Vine Maze [warp]
  #$0060   ; B8 - Mt. Temple - Detour [warp]
  #$03E0   ; B9 - Mt. Temple - Summit [warp]
  #$0000   ; BA - -- Native Village -- [header]
  #$01D0   ; BB - Native Village [debug_man]
  #$00C0   ; BC - Native Village - Vacant Hut [warp]
  #$00C0   ; BD - Native Village - Gorgon Hut [warp]
  #$0000   ; BE - -- Angkor Wat -- [header]
  #$04D0   ; BF - Angkor Wat - Entrance [debug_man]
  #$01C0   ; C0 - Angkor Wat - Outer Gate [warp]
  #$07C0   ; C1 - Mt. Temple - Outer East [warp]
  #$01C0   ; C2 - Angkor Wat - Outer North [warp]
  #$0000   ; C3 - Angkor Wat - Snake Pit [warp]
  #$07C0   ; C4 - Angkor Wat - Outer West [warp]
  #$03D0   ; C5 - Angkor Wat - Outer Courtyard [warp]
  #$01C0   ; C6 - Angkor Wat - Inner Gate [warp]
  #$05D0   ; C7 - Angkor Wat - Inner East [warp]
  #$05D0   ; C8 - Angkor Wat - Inner West [warp]
  #$05D0   ; C9 - Angkor Wat - Inner Courtyard [warp]
  #$02C0   ; CA - Angkor Wat - Main Shrine [warp]
  #$0090   ; CB - Angkor Wat - Crystal Room [warp]
  #$0200   ; CC - Angkor Wat - Deja Vu [warp]
  #$0080   ; CD - Angkor Wat - Upper Shrine [warp]
  #$0170   ; CE - Angkor Wat - Pinnacle [warp]
  #$0080   ; CF - Angkor Wat - Future Vision [default]
  #$0000   ; D0 - -- Dao -- [header]
  #$00E8   ; D1 - Dao [debug_man]
  #$00C0   ; D2 - Dao - Hotel [warp]
  #$00C0   ; D3 - Dao - Sweatshop [warp]
  #$00C0   ; D4 - Dao - Snake Panic [warp]
  #$00C0   ; D5 - Dao - Explorer's House [warp]
  #$00C0   ; D6 - Dao - Dorm [warp]
  #$00C0   ; D7 - Dao - Indecision Room [warp]
  #$0000   ; D8 - -- Pyramid -- [header]
  #$00E0   ; D9 - Pyramid - Main Chamber [debug_man]
  #$00C0   ; DA - Pyramid - Puzzle Room [warp]
  #$00C0   ; DB - Pyramid - Ramptastic A [warp]
  #$00C0   ; DC - Pyramid - Ramptastic B [warp]
  #$00C0   ; DD - Pyramid - Meltdown A [warp]
  #$00C0   ; DE - Pyramid - Meltdown B [warp]
  #$00C0   ; DF - Pyramid - Focus A [warp]
  #$00C0   ; E0 - Pyramid - Focus B [warp]
  #$00C0   ; E1 - Pyramid - Trickle A [warp]
  #$00C0   ; E2 - Pyramid - Trickle B [warp]
  #$00C0   ; E3 - Pyramid - Vader A [warp]
  #$01C0   ; E4 - Pyramid - Vader B [warp]
  #$00C0   ; E5 - Pyramid - Dangerslide A [warp]
  #$00C0   ; E6 - Pyramid - Dangerslide B [warp]
  #$00C0   ; E7 - Pyramid - Hieroglyph Room [warp]
  #$00B8   ; E8 - Pyramid - Dangerslide C [warp]
  #$01B0   ; E9 - Pyramid - Mummy Queen's Lair [script]
  #$0000   ; EA - -- Babel Tower -- [header]
  #$0080   ; EB - Babel Tower - Flight [default]
  #$0080   ; EC - Babel Tower - Entrance [warp]
  #$01C0   ; ED - Babel Tower - Lower Floors [warp]
  #$0390   ; EE - Babel Tower - Middle Floors [warp]
  #$0790   ; EF - Babel Tower - Light Elevator [warp]
  #$06E0   ; F0 - Babel Tower - Exterior [warp]
  #$0090   ; F1 - Babel Tower - Upper Floors [warp]
  #$0140   ; F2 - Babel Tower - Rooftop [script]
  #$0090   ; F3 - Comet - Space Flight [script]
  #$0080   ; F4 - Comet - Final Lair [default]
  #$00B0   ; F5 - Babel Tower - Dark Castoth's Lair [warp]
  #$0080   ; F6 - Babel Tower - Dark Viper's Lair [warp]
  #$01C0   ; F7 - Babel Tower - Dark Vampire's Lair [warp]
  #$02C0   ; F8 - Babel Tower - Dark Fanger's Lair [warp]
  #$0190   ; F9 - Babel Tower - Dark Queen's Lair [warp]
  #$0000   ; FA - -- Mansion -- [header]
  #$03D0   ; FB - Mansion [script]
  #$00C0   ; FC - Mansion - Solid Arm's Lair [warp]
]

warp_dir_table [
  #$0000   ; 00 - -- System -- [header]
  #$0000   ; 01 - Dark Space [warp]
  #$0000   ; 02 - Diary Menu [script]
  #$0000   ; 03 - Boot Logos [default]
  #$0000   ; 04 - Title Screen [default]
  #$0000   ; 05 - Statue Inventory [default]
  #$0000   ; 06 - World Map [default]
  #$0000   ; 07 - Inventory [default]
  #$0000   ; 08 - -- South Cape -- [header]
  #$0003   ; 09 - South Cape [warp]
  #$0000   ; 0A - Coastal Cave [warp]
  #$0000   ; 0B - Lance's House [warp]
  #$0000   ; 0C - Eric's House [warp]
  #$0000   ; 0D - Seth's House [warp]
  #$0000   ; 0E - Will's House [warp]
  #$0000   ; 0F - Chef's House [warp]
  #$0000   ; 10 - Church [warp]
  #$0000   ; 11 - -- Edward Castle -- [header]
  #$0003   ; 12 - Edward's Castle [debug_man]
  #$0000   ; 13 - Castle Prison [warp]
  #$0003   ; 14 - Aqueduct - Entrance [warp]
  #$0003   ; 15 - Aqueduct - Main [warp]
  #$0003   ; 16 - Aqueduct - Lockway [warp]
  #$0000   ; 17 - Aqueduct - Hall [debug_man]
  #$0000   ; 18 - Aqueduct - Treasure Room [warp]
  #$0000   ; 19 - Aqueduct - Doorway [warp]
  #$0000   ; 1A - Aqueduct - Back [warp]
  #$0003   ; 1B - Aqueduct - Exit [warp]
  #$0000   ; 1C - -- Itory -- [header]
  #$0000   ; 1D - Itory Village [debug_man]
  #$0000   ; 1E - Itory - Legend House [warp]
  #$0007   ; 1F - Itory - Lily's House [warp]
  #$0000   ; 20 - Itory - Couple's House [warp]
  #$0000   ; 21 - Itory - Cave [warp]
  #$0000   ; 22 - Moon Tribe - Camp [debug_man]
  #$0000   ; 23 - Moon Tribe - Cave [warp]
  #$0000   ; 24 - -- Incan Ruins -- [header]
  #$0007   ; 25 - Incan Ruins - Entrance [debug_man]
  #$0003   ; 26 - Larai Cliff [warp]
  #$0003   ; 27 - Larai Cliff - Back [warp]
  #$0000   ; 28 - Incan Runis - Stone Lord Pressure Plates [warp]
  #$0000   ; 29 - Incan Ruins - Secret Hallway [warp]
  #$0000   ; 2A - Incan Ruins - River Crossing [warp]
  #$0000   ; 2B - Incan Ruins - River Detour [warp]
  #$0000   ; 2C - Incan Ruins - Guarded Gap [warp]
  #$0000   ; 2D - Incan Ruins - Plate Room [warp]
  #$0000   ; 2E - Incan Ruins - Entryway [warp]
  #$0000   ; 2F - Incan Ruins - Treasure Room [warp]
  #$0000   ; 30 - Incan Ruins - Side Passage [warp]
  #$0000   ; 31 - Incan Ruins - Ceiling Trap Room [warp]
  #$0000   ; 32 - Incan Ruins - Castoth's Lair [warp]
  #$0000   ; 33 - -- Gold Ship -- [header]
  #$0003   ; 34 - Will's Dream [script]
  #$0006   ; 35 - Wrecked Ship - Exterior [warp]
  #$0000   ; 36 - Gold Ship - Exterior [warp]
  #$0007   ; 37 - Wrecked Ship - Interior [warp]
  #$0007   ; 38 - Gold Ship - Interior [warp]
  #$0000   ; 39 - Adrift [script]
  #$0000   ; 3A - -- Freejia -- [header]
  #$0003   ; 3B - Oakton House [warp]
  #$0000   ; 3C - Oakton House - Interior [warp]
  #$0007   ; 3D - Freejia [debug_man]
  #$0000   ; 3E - Freejia - Erik's Captivity Room [warp]
  #$0000   ; 3F - Freejia - Dark Space House [warp]
  #$0000   ; 40 - Freejia - Labor Camp [warp]
  #$0000   ; 41 - Freejia - Mother's House [warp]
  #$0000   ; 42 - Freejia - Thorn Tower [warp]
  #$0000   ; 43 - Freejia - Adequacy Manor [warp]
  #$0000   ; 44 - Freejia - Hotel [warp]
  #$0000   ; 45 - Freejia - Harborer's House [warp]
  #$0000   ; 46 - Freejia - Messy House [warp]
  #$0000   ; 47 - Freejia - Slave Market [warp]
  #$0000   ; 48 - -- Diamond Mine -- [header]
  #$0000   ; 49 - Diamond Mine - Promise Passage [warp]
  #$0007   ; 4A - Diamond Mine - Entrance [debug_man]
  #$0000   ; 4B - Diamond Mine - Main Chamber [warp]
  #$0003   ; 4C - Diamond Mine - Collapsed Tunnel [warp]
  #$0003   ; 4D - Diamond Mine - Zigzag Passage [warp]
  #$0000   ; 4E - Diamond Mine - Elevator Passage [warp]
  #$0006   ; 4F - Diamond Mine - Elevator [warp]
  #$0003   ; 50 - Diamond Mine - Sub Foyer [warp]
  #$0003   ; 51 - Diamond Mine - Morgue [warp]
  #$0003   ; 52 - Diamond Mine - Monster Nest [warp]
  #$0003   ; 53 - Diamond Mine - Inner Chamber [warp]
  #$0000   ; 54 - -- Nazca -- [header]
  #$0000   ; 55 - Neil's Cottage [script]
  #$0000   ; 56 - Nazca Plain [script]
  #$0000   ; 57 - -- Sky Garden -- [header]
  #$0007   ; 58 - Sky Garden - Main [debug_man]
  #$0007   ; 59 - Sky Garden - East [warp]
  #$0000   ; 5A - Sky Garden - East (Underside) [warp]
  #$0003   ; 5B - Sky Garden - Southeast [warp]
  #$0000   ; 5C - Sky Garden - Southeast (Underside) [warp]
  #$0003   ; 5D - Sky Garden - Southwest [warp]
  #$0003   ; 5E - Sky Garden - Southwest (Underside) [warp]
  #$0006   ; 5F - Sky Garden - West [warp]
  #$0003   ; 60 - Sky Garden - West (Underside) [warp]
  #$0000   ; 61 - Sky Garden - Viper's Lair [warp]
  #$0000   ; 62 - Sky Garden - Interior [warp]
  #$0000   ; 63 - Sky Garden - Descent [default]
  #$0000   ; 64 - Sky Garden - Crash [default]
  #$0000   ; 65 - -- Seaside Palace -- [header]
  #$0007   ; 66 - Seabed Palace - Main [debug_man]
  #$0007   ; 67 - Seabed Palace - Rooms [warp]
  #$0003   ; 68 - Seabed Palace - Coffins [warp]
  #$0003   ; 69 - Seabed Palace - Fountain [warp]
  #$0000   ; 6A - Seabed Palace - Mu Passageway [warp]
  #$0000   ; 6B - -- Mu -- [header]
  #$0007   ; 6C - Mu - Entrance [debug_man]
  #$0007   ; 6D - Mu - East [warp]
  #$0003   ; 6E - Mu - South [warp]
  #$0003   ; 6F - Mu - West [warp]
  #$0000   ; 70 - Mu - Prayer Room [warp]
  #$0003   ; 71 - Mu - Connector [warp]
  #$0007   ; 72 - Mu - Maze [warp]
  #$0000   ; 73 - Mu - Altar Room [warp]
  #$0000   ; 74 - Mu - Vampire Lair [warp]
  #$0000   ; 75 - -- Angel Village -- [header]
  #$0003   ; 76 - Undersea Tunnel [script]
  #$0007   ; 77 - Angel Village - Entrance [debug_man]
  #$0000   ; 78 - Angel Village - Guest Annex [warp]
  #$0000   ; 79 - Angel Village [warp]
  #$0000   ; 7A - Angel Village - Rooms [warp]
  #$0003   ; 7B - Angel Village - Entrance Tunnel [warp]
  #$0003   ; 7C - Angel Village - Draco Tunnel [warp]
  #$0003   ; 7D - Angel Village - Dark Tunnel [warp]
  #$0003   ; 7E - Angel Village - River Tunnel [warp]
  #$0003   ; 7F - Angel Village - Windy Tunnel [warp]
  #$0000   ; 80 - Angel Village - Statue Tunnel [warp]
  #$0000   ; 81 - Angel Village - Waterfall Tunnel [warp]
  #$0000   ; 82 - Angel Village - Tunnel Rooms [warp]
  #$0000   ; 83 - Angel Village - Ishtar's Test [warp]
  #$0000   ; 84 - -- Watermia -- [header]
  #$0007   ; 85 - Watermia [debug_man]
  #$0000   ; 86 - Watermia - Luke's House [warp]
  #$0000   ; 87 - Watermia - Lance's Father's House [warp]
  #$0000   ; 88 - Watermia - Gambling House [warp]
  #$0000   ; 89 - Watermia - Dark Space House [warp]
  #$0000   ; 8A - Watermia - Glass Player's House [warp]
  #$0000   ; 8B - Watermia - Rumor House [warp]
  #$0000   ; 8C - Watermia - Lance & Lily's Exchange [script]
  #$0000   ; 8D - -- Great Wall -- [header]
  #$0007   ; 8E - Great Wall - Entrance [debug_man]
  #$0007   ; 8F - Great Wall - Long Dive [warp]
  #$0007   ; 90 - Great Wall - Rampway [warp]
  #$0007   ; 91 - Great Wall - Blind Pit [warp]
  #$0007   ; 92 - Great Wall - Switchback [warp]
  #$0007   ; 93 - Great Wall - Tomb [warp]
  #$0007   ; 94 - Great Wall - Sand Fanger Lair [warp]
  #$0007   ; 95 - Great Wall - Inner Chamber [warp]
  #$0000   ; 96 - -- Prologue -- [header]
  #$0000   ; 97 - Prologue - Prophecy [default]
  #$0000   ; 98 - Prologue - Legends [default]
  #$0000   ; 99 - Prologue - Missing [default]
  #$0000   ; 9A - Prologue - Mishap [default]
  #$0000   ; 9B - -- Ending -- [header]
  #$0000   ; 9C - Ending - New Babel [default]
  #$0000   ; 9D - Ending - Changed World [default]
  #$0000   ; 9E - Ending - Comet [debug_man]
  #$0006   ; 9F - Ending - Class Dismissed [script]
  #$0000   ; A0 - Ending - Credits [default]
  #$0000   ; A1 - -- Euro -- [header]
  #$0003   ; A2 - Euro [debug_man]
  #$0000   ; A3 - Euro - Geezer Central [warp]
  #$0000   ; A4 - Euro - Power House [warp]
  #$0000   ; A5 - Euro - Rolek Office [warp]
  #$0000   ; A6 - Euro - Rolek Mansion [warp]
  #$0000   ; A7 - Euro - Guest Room [warp]
  #$0000   ; A8 - Euro - Rolek Market [warp]
  #$0000   ; A9 - Euro - Baggage House [warp]
  #$0000   ; AA - Euro - Dark Space House [warp]
  #$0000   ; AB - Euro - Friezer's House [warp]
  #$0000   ; AC - Euro - Gem's House [warp]
  #$0000   ; AD - Euro - Mushroom Twins House [warp]
  #$0000   ; AE - Euro - Dark Chapel [warp]
  #$0000   ; AF - -- Mountain Temple -- [header]
  #$0007   ; B0 - Mt. Temple - Entrance [warp]
  #$0006   ; B1 - Mt. Temple - Twisted Paths [warp]
  #$0000   ; B2 - Mt. Temple - Crossroads [warp]
  #$0007   ; B3 - Mt. Temple - Treasure Gauntlet [warp]
  #$0006   ; B4 - Mt. Temple - Western Loop [warp]
  #$0000   ; B5 - Mt. Temple - Broken Vines [warp]
  #$0007   ; B6 - Mt. Temple - Mushroom Field [warp]
  #$0000   ; B7 - Mt. Temple - Vine Maze [warp]
  #$0006   ; B8 - Mt. Temple - Detour [warp]
  #$0000   ; B9 - Mt. Temple - Summit [warp]
  #$0000   ; BA - -- Native Village -- [header]
  #$0007   ; BB - Native Village [debug_man]
  #$0000   ; BC - Native Village - Vacant Hut [warp]
  #$0000   ; BD - Native Village - Gorgon Hut [warp]
  #$0000   ; BE - -- Angkor Wat -- [header]
  #$0007   ; BF - Angkor Wat - Entrance [debug_man]
  #$0000   ; C0 - Angkor Wat - Outer Gate [warp]
  #$0000   ; C1 - Mt. Temple - Outer East [warp]
  #$0000   ; C2 - Angkor Wat - Outer North [warp]
  #$0003   ; C3 - Angkor Wat - Snake Pit [warp]
  #$0000   ; C4 - Angkor Wat - Outer West [warp]
  #$0000   ; C5 - Angkor Wat - Outer Courtyard [warp]
  #$0000   ; C6 - Angkor Wat - Inner Gate [warp]
  #$0000   ; C7 - Angkor Wat - Inner East [warp]
  #$0000   ; C8 - Angkor Wat - Inner West [warp]
  #$0000   ; C9 - Angkor Wat - Inner Courtyard [warp]
  #$0000   ; CA - Angkor Wat - Main Shrine [warp]
  #$0000   ; CB - Angkor Wat - Crystal Room [warp]
  #$0000   ; CC - Angkor Wat - Deja Vu [warp]
  #$0000   ; CD - Angkor Wat - Upper Shrine [warp]
  #$0000   ; CE - Angkor Wat - Pinnacle [warp]
  #$0000   ; CF - Angkor Wat - Future Vision [default]
  #$0000   ; D0 - -- Dao -- [header]
  #$0007   ; D1 - Dao [debug_man]
  #$0000   ; D2 - Dao - Hotel [warp]
  #$0000   ; D3 - Dao - Sweatshop [warp]
  #$0000   ; D4 - Dao - Snake Panic [warp]
  #$0000   ; D5 - Dao - Explorer's House [warp]
  #$0000   ; D6 - Dao - Dorm [warp]
  #$0000   ; D7 - Dao - Indecision Room [warp]
  #$0000   ; D8 - -- Pyramid -- [header]
  #$0007   ; D9 - Pyramid - Main Chamber [debug_man]
  #$0000   ; DA - Pyramid - Puzzle Room [warp]
  #$0000   ; DB - Pyramid - Ramptastic A [warp]
  #$0000   ; DC - Pyramid - Ramptastic B [warp]
  #$0000   ; DD - Pyramid - Meltdown A [warp]
  #$0000   ; DE - Pyramid - Meltdown B [warp]
  #$0000   ; DF - Pyramid - Focus A [warp]
  #$0000   ; E0 - Pyramid - Focus B [warp]
  #$0000   ; E1 - Pyramid - Trickle A [warp]
  #$0000   ; E2 - Pyramid - Trickle B [warp]
  #$0000   ; E3 - Pyramid - Vader A [warp]
  #$0000   ; E4 - Pyramid - Vader B [warp]
  #$0000   ; E5 - Pyramid - Dangerslide A [warp]
  #$0000   ; E6 - Pyramid - Dangerslide B [warp]
  #$0000   ; E7 - Pyramid - Hieroglyph Room [warp]
  #$0007   ; E8 - Pyramid - Dangerslide C [warp]
  #$0000   ; E9 - Pyramid - Mummy Queen's Lair [script]
  #$0000   ; EA - -- Babel Tower -- [header]
  #$0000   ; EB - Babel Tower - Flight [default]
  #$0003   ; EC - Babel Tower - Entrance [warp]
  #$0000   ; ED - Babel Tower - Lower Floors [warp]
  #$0003   ; EE - Babel Tower - Middle Floors [warp]
  #$0003   ; EF - Babel Tower - Light Elevator [warp]
  #$0003   ; F0 - Babel Tower - Exterior [warp]
  #$0003   ; F1 - Babel Tower - Upper Floors [warp]
  #$0000   ; F2 - Babel Tower - Rooftop [script]
  #$0000   ; F3 - Comet - Space Flight [script]
  #$0000   ; F4 - Comet - Final Lair [default]
  #$0003   ; F5 - Babel Tower - Dark Castoth's Lair [warp]
  #$0003   ; F6 - Babel Tower - Dark Viper's Lair [warp]
  #$0003   ; F7 - Babel Tower - Dark Vampire's Lair [warp]
  #$0003   ; F8 - Babel Tower - Dark Fanger's Lair [warp]
  #$0003   ; F9 - Babel Tower - Dark Queen's Lair [warp]
  #$0000   ; FA - -- Mansion -- [header]
  #$0000   ; FB - Mansion [script]
  #$0000   ; FC - Mansion - Solid Arm's Lair [warp]
]

warp_cam_table [
  #$0000   ; 00 - -- System -- [header]
  #$1100   ; 01 - Dark Space [warp]
  #$4400   ; 02 - Diary Menu [script]
  #$1100   ; 03 - Boot Logos [default]
  #$1100   ; 04 - Title Screen [default]
  #$1100   ; 05 - Statue Inventory [default]
  #$1100   ; 06 - World Map [default]
  #$1100   ; 07 - Inventory [default]
  #$0000   ; 08 - -- South Cape -- [header]
  #$4300   ; 09 - South Cape [warp]
  #$1100   ; 0A - Coastal Cave [warp]
  #$1100   ; 0B - Lance's House [warp]
  #$2210   ; 0C - Eric's House [warp]
  #$1100   ; 0D - Seth's House [warp]
  #$2110   ; 0E - Will's House [warp]
  #$1100   ; 0F - Chef's House [warp]
  #$1200   ; 10 - Church [warp]
  #$0000   ; 11 - -- Edward Castle -- [header]
  #$4500   ; 12 - Edward's Castle [debug_man]
  #$3200   ; 13 - Castle Prison [warp]
  #$1200   ; 14 - Aqueduct - Entrance [warp]
  #$4200   ; 15 - Aqueduct - Main [warp]
  #$2400   ; 16 - Aqueduct - Lockway [warp]
  #$6100   ; 17 - Aqueduct - Hall [debug_man]
  #$1100   ; 18 - Aqueduct - Treasure Room [warp]
  #$1200   ; 19 - Aqueduct - Doorway [warp]
  #$6300   ; 1A - Aqueduct - Back [warp]
  #$2100   ; 1B - Aqueduct - Exit [warp]
  #$0000   ; 1C - -- Itory -- [header]
  #$3500   ; 1D - Itory Village [debug_man]
  #$1100   ; 1E - Itory - Legend House [warp]
  #$1100   ; 1F - Itory - Lily's House [warp]
  #$1100   ; 20 - Itory - Couple's House [warp]
  #$2100   ; 21 - Itory - Cave [warp]
  #$2200   ; 22 - Moon Tribe - Camp [debug_man]
  #$2200   ; 23 - Moon Tribe - Cave [warp]
  #$0000   ; 24 - -- Incan Ruins -- [header]
  #$2200   ; 25 - Incan Ruins - Entrance [debug_man]
  #$6300   ; 26 - Larai Cliff [warp]
  #$2400   ; 27 - Larai Cliff - Back [warp]
  #$2200   ; 28 - Incan Runis - Stone Lord Pressure Plates [warp]
  #$2200   ; 29 - Incan Ruins - Secret Hallway [warp]
  #$4400   ; 2A - Incan Ruins - River Crossing [warp]
  #$4400   ; 2B - Incan Ruins - River Detour [warp]
  #$3400   ; 2C - Incan Ruins - Guarded Gap [warp]
  #$2200   ; 2D - Incan Ruins - Plate Room [warp]
  #$2300   ; 2E - Incan Ruins - Entryway [warp]
  #$3200   ; 2F - Incan Ruins - Treasure Room [warp]
  #$2400   ; 30 - Incan Ruins - Side Passage [warp]
  #$3200   ; 31 - Incan Ruins - Ceiling Trap Room [warp]
  #$1100   ; 32 - Incan Ruins - Castoth's Lair [warp]
  #$0000   ; 33 - -- Gold Ship -- [header]
  #$1100   ; 34 - Will's Dream [script]
  #$3300   ; 35 - Wrecked Ship - Exterior [warp]
  #$3300   ; 36 - Gold Ship - Exterior [warp]
  #$1300   ; 37 - Wrecked Ship - Interior [warp]
  #$1300   ; 38 - Gold Ship - Interior [warp]
  #$1100   ; 39 - Adrift [script]
  #$0000   ; 3A - -- Freejia -- [header]
  #$2100   ; 3B - Oakton House [warp]
  #$1100   ; 3C - Oakton House - Interior [warp]
  #$4500   ; 3D - Freejia [debug_man]
  #$1100   ; 3E - Freejia - Erik's Captivity Room [warp]
  #$1100   ; 3F - Freejia - Dark Space House [warp]
  #$1200   ; 40 - Freejia - Labor Camp [warp]
  #$2110   ; 41 - Freejia - Mother's House [warp]
  #$2110   ; 42 - Freejia - Thorn Tower [warp]
  #$2110   ; 43 - Freejia - Adequacy Manor [warp]
  #$2210   ; 44 - Freejia - Hotel [warp]
  #$1100   ; 45 - Freejia - Harborer's House [warp]
  #$1100   ; 46 - Freejia - Messy House [warp]
  #$1100   ; 47 - Freejia - Slave Market [warp]
  #$0000   ; 48 - -- Diamond Mine -- [header]
  #$6100   ; 49 - Diamond Mine - Promise Passage [warp]
  #$4200   ; 4A - Diamond Mine - Entrance [debug_man]
  #$4400   ; 4B - Diamond Mine - Main Chamber [warp]
  #$3200   ; 4C - Diamond Mine - Collapsed Tunnel [warp]
  #$3400   ; 4D - Diamond Mine - Zigzag Passage [warp]
  #$1302   ; 4E - Diamond Mine - Elevator Passage [warp]
  #$4600   ; 4F - Diamond Mine - Elevator [warp]
  #$2200   ; 50 - Diamond Mine - Sub Foyer [warp]
  #$2200   ; 51 - Diamond Mine - Morgue [warp]
  #$2200   ; 52 - Diamond Mine - Monster Nest [warp]
  #$3100   ; 53 - Diamond Mine - Inner Chamber [warp]
  #$0000   ; 54 - -- Nazca -- [header]
  #$1100   ; 55 - Neil's Cottage [script]
  #$4400   ; 56 - Nazca Plain [script]
  #$0000   ; 57 - -- Sky Garden -- [header]
  #$2200   ; 58 - Sky Garden - Main [debug_man]
  #$4400   ; 59 - Sky Garden - East [warp]
  #$4400   ; 5A - Sky Garden - East (Underside) [warp]
  #$4400   ; 5B - Sky Garden - Southeast [warp]
  #$4400   ; 5C - Sky Garden - Southeast (Underside) [warp]
  #$4400   ; 5D - Sky Garden - Southwest [warp]
  #$4400   ; 5E - Sky Garden - Southwest (Underside) [warp]
  #$4400   ; 5F - Sky Garden - West [warp]
  #$4400   ; 60 - Sky Garden - West (Underside) [warp]
  #$2200   ; 61 - Sky Garden - Viper's Lair [warp]
  #$1100   ; 62 - Sky Garden - Interior [warp]
  #$1100   ; 63 - Sky Garden - Descent [default]
  #$1100   ; 64 - Sky Garden - Crash [default]
  #$0000   ; 65 - -- Seaside Palace -- [header]
  #$6400   ; 66 - Seabed Palace - Main [debug_man]
  #$1100   ; 67 - Seabed Palace - Rooms [warp]
  #$2400   ; 68 - Seabed Palace - Coffins [warp]
  #$2300   ; 69 - Seabed Palace - Fountain [warp]
  #$1400   ; 6A - Seabed Palace - Mu Passageway [warp]
  #$0000   ; 6B - -- Mu -- [header]
  #$4400   ; 6C - Mu - Entrance [debug_man]
  #$4400   ; 6D - Mu - East [warp]
  #$4400   ; 6E - Mu - South [warp]
  #$4400   ; 6F - Mu - West [warp]
  #$1201   ; 70 - Mu - Prayer Room [warp]
  #$4200   ; 71 - Mu - Connector [warp]
  #$4400   ; 72 - Mu - Maze [warp]
  #$1302   ; 73 - Mu - Altar Room [warp]
  #$2201   ; 74 - Mu - Vampire Lair [warp]
  #$0000   ; 75 - -- Angel Village -- [header]
  #$2110   ; 76 - Undersea Tunnel [script]
  #$1300   ; 77 - Angel Village - Entrance [debug_man]
  #$1200   ; 78 - Angel Village - Guest Annex [warp]
  #$1300   ; 79 - Angel Village [warp]
  #$1100   ; 7A - Angel Village - Rooms [warp]
  #$1400   ; 7B - Angel Village - Entrance Tunnel [warp]
  #$1400   ; 7C - Angel Village - Draco Tunnel [warp]
  #$1300   ; 7D - Angel Village - Dark Tunnel [warp]
  #$1300   ; 7E - Angel Village - River Tunnel [warp]
  #$1300   ; 7F - Angel Village - Windy Tunnel [warp]
  #$1600   ; 80 - Angel Village - Statue Tunnel [warp]
  #$2410   ; 81 - Angel Village - Waterfall Tunnel [warp]
  #$1100   ; 82 - Angel Village - Tunnel Rooms [warp]
  #$2710   ; 83 - Angel Village - Ishtar's Test [warp]
  #$0000   ; 84 - -- Watermia -- [header]
  #$4500   ; 85 - Watermia [debug_man]
  #$1100   ; 86 - Watermia - Luke's House [warp]
  #$1100   ; 87 - Watermia - Lance's Father's House [warp]
  #$1200   ; 88 - Watermia - Gambling House [warp]
  #$1100   ; 89 - Watermia - Dark Space House [warp]
  #$1100   ; 8A - Watermia - Glass Player's House [warp]
  #$1100   ; 8B - Watermia - Rumor House [warp]
  #$4500   ; 8C - Watermia - Lance & Lily's Exchange [script]
  #$0000   ; 8D - -- Great Wall -- [header]
  #$1800   ; 8E - Great Wall - Entrance [debug_man]
  #$8400   ; 8F - Great Wall - Long Dive [warp]
  #$1800   ; 90 - Great Wall - Rampway [warp]
  #$6300   ; 91 - Great Wall - Blind Pit [warp]
  #$1400   ; 92 - Great Wall - Switchback [warp]
  #$1400   ; 93 - Great Wall - Tomb [warp]
  #$3300   ; 94 - Great Wall - Sand Fanger Lair [warp]
  #$1200   ; 95 - Great Wall - Inner Chamber [warp]
  #$0000   ; 96 - -- Prologue -- [header]
  #$1100   ; 97 - Prologue - Prophecy [default]
  #$1100   ; 98 - Prologue - Legends [default]
  #$1100   ; 99 - Prologue - Missing [default]
  #$1100   ; 9A - Prologue - Mishap [default]
  #$0000   ; 9B - -- Ending -- [header]
  #$1100   ; 9C - Ending - New Babel [default]
  #$1100   ; 9D - Ending - Changed World [default]
  #$1100   ; 9E - Ending - Comet [debug_man]
  #$1201   ; 9F - Ending - Class Dismissed [script]
  #$1100   ; A0 - Ending - Credits [default]
  #$0000   ; A1 - -- Euro -- [header]
  #$5400   ; A2 - Euro [debug_man]
  #$1100   ; A3 - Euro - Geezer Central [warp]
  #$1100   ; A4 - Euro - Power House [warp]
  #$2110   ; A5 - Euro - Rolek Office [warp]
  #$2410   ; A6 - Euro - Rolek Mansion [warp]
  #$1100   ; A7 - Euro - Guest Room [warp]
  #$1200   ; A8 - Euro - Rolek Market [warp]
  #$1100   ; A9 - Euro - Baggage House [warp]
  #$2110   ; AA - Euro - Dark Space House [warp]
  #$1100   ; AB - Euro - Friezer's House [warp]
  #$1100   ; AC - Euro - Gem's House [warp]
  #$1100   ; AD - Euro - Mushroom Twins House [warp]
  #$1200   ; AE - Euro - Dark Chapel [warp]
  #$0000   ; AF - -- Mountain Temple -- [header]
  #$2300   ; B0 - Mt. Temple - Entrance [warp]
  #$4400   ; B1 - Mt. Temple - Twisted Paths [warp]
  #$4200   ; B2 - Mt. Temple - Crossroads [warp]
  #$2800   ; B3 - Mt. Temple - Treasure Gauntlet [warp]
  #$4400   ; B4 - Mt. Temple - Western Loop [warp]
  #$4400   ; B5 - Mt. Temple - Broken Vines [warp]
  #$4400   ; B6 - Mt. Temple - Mushroom Field [warp]
  #$4800   ; B7 - Mt. Temple - Vine Maze [warp]
  #$2400   ; B8 - Mt. Temple - Detour [warp]
  #$4200   ; B9 - Mt. Temple - Summit [warp]
  #$0000   ; BA - -- Native Village -- [header]
  #$2200   ; BB - Native Village [debug_man]
  #$1100   ; BC - Native Village - Vacant Hut [warp]
  #$1100   ; BD - Native Village - Gorgon Hut [warp]
  #$0000   ; BE - -- Angkor Wat -- [header]
  #$5400   ; BF - Angkor Wat - Entrance [debug_man]
  #$2800   ; C0 - Angkor Wat - Outer Gate [warp]
  #$8100   ; C1 - Mt. Temple - Outer East [warp]
  #$2800   ; C2 - Angkor Wat - Outer North [warp]
  #$2600   ; C3 - Angkor Wat - Snake Pit [warp]
  #$8100   ; C4 - Angkor Wat - Outer West [warp]
  #$4600   ; C5 - Angkor Wat - Outer Courtyard [warp]
  #$2600   ; C6 - Angkor Wat - Inner Gate [warp]
  #$6100   ; C7 - Angkor Wat - Inner East [warp]
  #$6100   ; C8 - Angkor Wat - Inner West [warp]
  #$6400   ; C9 - Angkor Wat - Inner Courtyard [warp]
  #$3300   ; CA - Angkor Wat - Main Shrine [warp]
  #$3300   ; CB - Angkor Wat - Crystal Room [warp]
  #$3300   ; CC - Angkor Wat - Deja Vu [warp]
  #$3300   ; CD - Angkor Wat - Upper Shrine [warp]
  #$2200   ; CE - Angkor Wat - Pinnacle [warp]
  #$1100   ; CF - Angkor Wat - Future Vision [default]
  #$0000   ; D0 - -- Dao -- [header]
  #$2300   ; D1 - Dao [debug_man]
  #$1100   ; D2 - Dao - Hotel [warp]
  #$1100   ; D3 - Dao - Sweatshop [warp]
  #$1100   ; D4 - Dao - Snake Panic [warp]
  #$1100   ; D5 - Dao - Explorer's House [warp]
  #$1100   ; D6 - Dao - Dorm [warp]
  #$1100   ; D7 - Dao - Indecision Room [warp]
  #$0000   ; D8 - -- Pyramid -- [header]
  #$4400   ; D9 - Pyramid - Main Chamber [debug_man]
  #$1100   ; DA - Pyramid - Puzzle Room [warp]
  #$4600   ; DB - Pyramid - Ramptastic A [warp]
  #$4600   ; DC - Pyramid - Ramptastic B [warp]
  #$5500   ; DD - Pyramid - Meltdown A [warp]
  #$6400   ; DE - Pyramid - Meltdown B [warp]
  #$4600   ; DF - Pyramid - Focus A [warp]
  #$3800   ; E0 - Pyramid - Focus B [warp]
  #$5500   ; E1 - Pyramid - Trickle A [warp]
  #$5500   ; E2 - Pyramid - Trickle B [warp]
  #$5500   ; E3 - Pyramid - Vader A [warp]
  #$6400   ; E4 - Pyramid - Vader B [warp]
  #$5500   ; E5 - Pyramid - Dangerslide A [warp]
  #$3800   ; E6 - Pyramid - Dangerslide B [warp]
  #$1100   ; E7 - Pyramid - Hieroglyph Room [warp]
  #$2800   ; E8 - Pyramid - Dangerslide C [warp]
  #$2200   ; E9 - Pyramid - Mummy Queen's Lair [script]
  #$0000   ; EA - -- Babel Tower -- [header]
  #$1100   ; EB - Babel Tower - Flight [default]
  #$1100   ; EC - Babel Tower - Entrance [warp]
  #$2800   ; ED - Babel Tower - Lower Floors [warp]
  #$4830   ; EE - Babel Tower - Middle Floors [warp]
  #$8100   ; EF - Babel Tower - Light Elevator [warp]
  #$8400   ; F0 - Babel Tower - Exterior [warp]
  #$1300   ; F1 - Babel Tower - Upper Floors [warp]
  #$2200   ; F2 - Babel Tower - Rooftop [script]
  #$1100   ; F3 - Comet - Space Flight [script]
  #$1100   ; F4 - Comet - Final Lair [default]
  #$1100   ; F5 - Babel Tower - Dark Castoth's Lair [warp]
  #$1200   ; F6 - Babel Tower - Dark Viper's Lair [warp]
  #$2100   ; F7 - Babel Tower - Dark Vampire's Lair [warp]
  #$3320   ; F8 - Babel Tower - Dark Fanger's Lair [warp]
  #$2200   ; F9 - Babel Tower - Dark Queen's Lair [warp]
  #$0000   ; FA - -- Mansion -- [header]
  #$4400   ; FB - Mansion [script]
  #$1100   ; FC - Mansion - Solid Arm's Lair [warp]
]

