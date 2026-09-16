
----------------------------------------
?INCLUDE 'chunk_038000'
----------------------------------------

code_03889A! {
    COP [BF] ( &dialogstring_0388E9 )
    LDA #$0028
    STA $0B22
    JSR $&RemoveEquippedItem
    RTS 
}
