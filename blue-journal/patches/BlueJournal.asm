
!letter_read_flag           8E
!journal_collected_flag     8F

---------------------------------------------------
?INCLUDE 'wa7A_lances_father'
---------------------------------------------------


code_07B3AF {
    COP [D0] ( #A5, #01, &code_07B3BD )
    COP [D0] ( #journal_collected_flag, #01, &lances_father_default )
    COP [D0] ( #letter_read_flag, #01, &lances_father_journal )
  lances_father_default:
    COP [BF] ( &widestring_07B3C2 )
    COP [CC] ( #01 )
    RTL 
}

code_07B3BD {
    COP [D0] ( #journal_collected_flag, #00, &lances_father_return )
    COP [BF] ( &widestring_07B412 )
    RTL 
}

lances_father_return {
    COP [BF] ( &lances_father_return_str )
    BRA lances_father_give_journal
}

lances_father_journal {
    COP [BF] ( &lances_father_collect_str )
  lances_father_give_journal:
    COP [D4] ( #15, &lances_father_inv_full )
    COP [CC] ( #journal_collected_flag )
    RTL 
}

lances_father_inv_full {
    COP [BF] ( &lances_father_inv_full_str )
    RTL
}

lances_father_collect_str   `[TPL:3][TPL:B][NAM:4]'s father: you say[N][NAM:4] went on an adventure[N]to some kind of "great[N]wall"? Neeeat![FIN]I found this funny book[N]about a great wall...[N]maybe it will help you[N]out![END]`
lances_father_return_str    `[TPL:3][TPL:B][NAM:4]'s father: Hey, I[N]found a journal among some[N]of my old belongings.[FIN]I still don't remember[N]much, but you can have it.[N]I only ask that you make[N]good use of it.[END]`
lances_father_inv_full_str  `[TPL:3][TPL:A]Boy, you sure are a heavy[N]adventurer. You can't[N]possibly carry this now.[END]`

---------------------------------------------------
?INCLUDE 'chunk_038000'
---------------------------------------------------

widestring_03944D `[DEF]He [LU2:8B]Lance's father's[N]journal. [FIN]Read which entry? [N] Tower of Babel [N] Mystic Statues [N] [LU1:16]Wall of China `

widestring_0394B5 `[DEF]He closes the journal. [END]`

widestring_0394CE `[DEF]The Tower of Babel...[END]`

widestring_0394E5 `[DEF]The Mystic Statues... [END]`

widestring_0394FD `[DEF]The [LU1:16]Wall...[END]`