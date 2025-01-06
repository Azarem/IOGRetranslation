

!flag             8D

--------------------------------------------
?INCLUDE 'sc01_astronomer'
--------------------------------------------

code_0488F6 {
    COP [D0] ( #flag, #01, &sc01_astronomer_return )
    COP [BF] ( &widestring_0488FB )
    RTL 
}

sc01_astronomer_return {
    COP [BF] ( &sc01_astronomer_return_text )
    RTL 
}

sc01_astronomer_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`


--------------------------------------------
?INCLUDE 'sc01_guard'
--------------------------------------------

code_0485B1 {
    COP [D0] ( #flag, #01, &sc01_guard_return )
    COP [BF] ( &widestring_048647 )
    RTL 
}

sc01_guard_return {
    COP [BF] ( &sc01_guard_return_text )
    RTL 
}

sc01_guard_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`


--------------------------------------------
?INCLUDE 'sc01_roof_man'
--------------------------------------------

code_0484B2 {
    COP [D0] ( #flag, #01, &sc01_roof_man_return )
    COP [BF] ( &widestring_0484B7 )
    RTL 
}

sc01_roof_man_return {
    COP [BF] ( &sc01_roof_man_return_text )
    RTL 
}

sc01_roof_man_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc01_salesman'
--------------------------------------------

code_0482CD {
    COP [D0] ( #flag, #01, &sc01_salesman_return )
    COP [BF] ( &widestring_0482D7 )
    RTL 
}

sc01_salesman_return {
    COP [BF] ( &sc01_salesman_return_text )
    RTL 
}

sc01_salesman_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc01_sprint_man'
--------------------------------------------

code_049238 {
    COP [D0] ( #flag, #01, &sc01_sprint_man_return )
    COP [BF] ( &widestring_04923D )
    RTL 
}

sc01_sprint_man_return {
    COP [BF] ( &sc01_sprint_man_return_text )
    RTL 
}

sc01_sprint_man_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc01_startled_woman'
--------------------------------------------

code_0487BA {
    COP [D0] ( #flag, #01, &sc01_startled_woman_return )
    COP [BF] ( &widestring_0487F5 )
    RTL 
}

sc01_startled_woman_return {
    COP [BF] ( &sc01_startled_woman_return_text )
    RTL 
}

sc01_startled_woman_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc01_sympathetic_woman'
--------------------------------------------

code_048999 {
    COP [D0] ( #flag, #01, &sc01_sympathetic_woman_return )
    COP [BF] ( &widestring_04899E )
    RTL 
}

sc01_sympathetic_woman_return {
    COP [BF] ( &sc01_sympathetic_woman_return_text )
    RTL 
}

sc01_sympathetic_woman_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc01_worried_woman'
--------------------------------------------

code_048719 {
    COP [D0] ( #flag, #01, &sc01_worried_woman_return )
    COP [BF] ( &widestring_04871E )
    RTL 
}

sc01_worried_woman_return {
    COP [BF] ( &sc01_worried_woman_return_text )
    RTL 
}

sc01_worried_woman_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`


--------------------------------------------
?INCLUDE 'sc03_lances_mother'
--------------------------------------------

code_048F14 {
    COP [D0] ( #flag, #01, &sc03_lances_mother_return )
    COP [BF] ( &widestring_048F19 )
    RTL 
}

sc03_lances_mother_return {
    COP [BF] ( &sc03_lances_mother_return_text )
    RTL 
}

sc03_lances_mother_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc04_eriks_father'
--------------------------------------------

code_048FEA {
    COP [D0] ( #flag, #01, &sc04_eriks_father_return )
    COP [BF] ( &widestring_048FEF )
    RTL 
}

sc04_eriks_father_return {
    COP [BF] ( &sc04_eriks_father_return_text )
    RTL 
}

sc04_eriks_father_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc04_eriks_mother'
--------------------------------------------

code_048F98 {
    COP [D0] ( #flag, #01, &sc04_eriks_mother_return )
    COP [BF] ( &widestring_048F9D )
    RTL 
}

sc04_eriks_mother_return {
    COP [BF] ( &sc04_eriks_mother_return_text )
    RTL 
}

sc04_eriks_mother_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc04_poverty'
--------------------------------------------

code_049076 {
    COP [D0] ( #flag, #01, &sc04_poverty_return )
    COP [BF] ( &widestring_04907B )
    RTL 
}

sc04_poverty_return {
    COP [BF] ( &sc04_poverty_return_text )
    RTL 
}

sc04_poverty_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc05_seths_father'
--------------------------------------------

code_04918E {
    COP [D0] ( #flag, #01, &sc05_seths_father_return )
    COP [BF] ( &widestring_049193 )
    RTL 
}

sc05_seths_father_return {
    COP [BF] ( &sc05_seths_father_return_text )
    RTL 
}

sc05_seths_father_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc05_seths_mother'
--------------------------------------------

code_04910B {
    COP [D0] ( #flag, #01, &sc05_seths_mother_return )
    COP [BF] ( &widestring_049110 )
    RTL 
}

sc05_seths_mother_return {
    COP [BF] ( &sc05_seths_mother_return_text )
    RTL 
}

sc05_seths_mother_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc07_chef'
--------------------------------------------

code_0491E8 {
    COP [D0] ( #flag, #01, &sc07_chef_return )
    COP [BF] ( &widestring_0491ED )
    RTL 
}

sc07_chef_return {
    COP [BF] ( &sc07_chef_return_text )
    RTL 
}

sc07_chef_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`

--------------------------------------------
?INCLUDE 'sc08_priest'
--------------------------------------------

code_048AD9 {
    COP [D0] ( #flag, #01, &sc08_priest_return )
    COP [D0] ( #21, #01, &code_048AE4 )
    COP [BF] ( &widestring_048C98 )
    RTL 
}

sc08_priest_return {
    COP [BF] ( &sc08_priest_return_text )
    RTL 
}

sc08_priest_return_text `[TPL:16][TPL:C]Welcome back [NAM:0]![END]`