
!slave_captured_flag       5A
!return_flag               8D
!dao_return_flag           B6
!slave_reward_flag       0107

-------------------------------------------
?INCLUDE 'fr32_locked_door'
-------------------------------------------

h_fr32_locked_door [
  h_actor < #01, #00, #18 >   ;00
]

fr32_locked_door_return {
    COP [D0] ( #slave_captured_flag, #01, &locked_door_normal )
    COP [D0] ( #dao_return_flag, #01, &locked_door_normal )
    COP [D1] ( #$slave_reward_flag, #01, &locked_door_normal )
    BRA e_fr32_locked_door

  locked_door_normal:
    LDA #&town_door+3
    STA $00
    LDA #*town_door
    STA $02
    JML @town_door+3
}

-------------------------------------------
?INCLUDE 'fr3A_sympathetic'
-------------------------------------------

e_fr3A_sympathetic {
    COP [D0] ( #slave_captured_flag, #01, &code_05C325 )
    COP [D1] ( #$slave_reward_flag, #01, &code_05C325 )
    LDA #$0200
    TSB $12
    COP [0B]
    COP [C0] ( &code_05C327 )
    COP [C1]
    RTL 
}

code_05C327 {
    COP [D1] ( #$slave_reward_flag, #01, &freejia_slave_farewell_begin )
    COP [D0] ( #return_flag, #01, &freejia_slave_return_begin )
    COP [BF] ( &widestring_05C32F )
    COP [CC] ( #59 )
    RTL 
}

freejia_slave_return_begin {
    COP [D0] ( #59, #01, &freejia_slave_recognize_begin )
    COP [BF] ( &freejia_slave_return_str )
    BRA freejia_slave_give_jewel
}

freejia_slave_recognize_begin {
    COP [BF] ( &freejia_slave_recognize_str )
}

freejia_slave_give_jewel {
    COP [D4] ( #01, &freejia_slave_inv_full )
    COP [CD] ( #$slave_reward_flag )
    RTL
}

freejia_slave_inv_full {
    COP [BF] ( &freejia_slave_inv_full_str )
    RTL
}

freejia_slave_farewell_begin {
    COP [BF] ( &freejia_slave_farewell_str )
    RTL
}

freejia_slave_return_str    `[TPL:20][TPL:A]I've been hiding from the[N]slave traders, but I think[N]it's time to move on.[FIN][JMP:freejia_slave_recognize_str+M]`
freejia_slave_recognize_str `[TPL:20][TPL:9]Hey, it's you! Thanks for[N]what you did back then.[FIN][TPL:A][::]I've been holding on to[N]this rare jewel. Here,[N]let me give it to you.[END]`
freejia_slave_inv_full_str  `[TPL:20][TPL:A]Hey now, your pockets are[N]full! Come back when you[N]have less junk.[END]`
freejia_slave_farewell_str  `[TPL:20][TPL:A]I suppose I should be[N]taking off now that the[N]coast is clear.[END]`

-------------------------------------------
?INCLUDE 'fr3A_harborer'
-------------------------------------------

h_fr3A_harborer [
  h_actor < #02, #00, #10 >   ;00
]

freejia_harborer_logic {
    COP [D0] ( #dao_return_flag, #01, &freejia_harborer_stub )
}

e_fr3A_harborer {
    COP [D0] ( #slave_captured_flag, #01, &code_05BC68 )
  freejia_harborer_stub:
    COP [C0] ( &code_05BC6A )
    COP [0B]
    COP [C1]
    RTL 
}

code_05BC6A {
    COP [D0] ( #slave_captured_flag, #01, &freejia_harborer_escaped )
    COP [D0] ( #dao_return_flag, #01, &freejia_harborer_rumor )
    COP [D1] ( #$slave_reward_flag, #00, &freejia_harborer_default )
    COP [D0] ( #return_flag, #01, &freejia_harborer_return )

  freejia_harborer_default:
    COP [BF] ( &widestring_05BC6F )
    RTL 
}

freejia_harborer_return {
    COP [BF] ( &freejia_harborer_return_str )
    RTL 
}

freejia_harborer_escaped {
    COP [BF] ( &freejia_harborer_escaped_str )
    RTL 
}

freejia_harborer_rumor {
    COP [BF] ( &freejia_harborer_rumor_str )
    RTL 
}

freejia_harborer_return_str  `[TPL:20][TPL:A]Hey it's you! Things have[N]quieted down around here[N]after our friend left.[FIN]Let's hope we never have[N]to do something like that[N]again.[END]`
freejia_harborer_escaped_str `[TPL:20][TPL:A]Now that the slave trade[N]is being abolished, I was[N]let off easy.[FIN][TPL:B]Things could have ended[N]much worse for me. Here's[N]hoping our friend is as[N]lucky.[END]`
freejia_harborer_rumor_str   `[TPL:20][TPL:B]Rumor has it that the new[N]president of Roleck[N]corporation is trying to[N]abolish the slave trade.[FIN]Maybe things will start[N]looking up for our friend.[END]`

-------------------------------------------
?INCLUDE 'fr32_slaver1'
-------------------------------------------

e_fr32_slaver1 {
    COP [D0] ( #slave_captured_flag, #01, &code_05B839 )
    COP [D0] ( #dao_return_flag, #01, &code_05B839 )
    COP [D1] ( #$slave_reward_flag, #01, &code_05B839 )
    COP [0B]
    COP [C0] ( &code_05B83B )
}

-------------------------------------------
?INCLUDE 'fr32_slaver2'
-------------------------------------------

e_fr32_slaver2 {
    COP [D0] ( #slave_captured_flag, #01, &code_05B87E )
    COP [D0] ( #dao_return_flag, #01, &code_05B87E )
    COP [D1] ( #$slave_reward_flag, #01, &code_05B87E )
    COP [0B]
    COP [C0] ( &code_05B880 )
    COP [DA] ( #07 )
}
