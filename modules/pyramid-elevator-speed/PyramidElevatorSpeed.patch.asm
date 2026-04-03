
?INCLUDE 'pyD7_actor_08C4EA'

code_08C549 {
    LDA $7F0010, X
    STA $26
    LDA $24
    BPL loc_08C564
    COP [C1]
    LDY #$1060
    LDA $0026, Y
    DEC 
    STA $0026, Y
    DEC $26
    BEQ loc_08C575
    DEC 
    STA $0026, Y
    DEC $26
    BEQ loc_08C575
    RTL 
}


loc_08C564 {
    COP [C1]
    LDY #$1060
    LDA $0026, Y
    INC 
    STA $0026, Y
    DEC $26
    BEQ loc_08C575
    INC 
    STA $0026, Y
    DEC $26
    BEQ loc_08C575
    RTL 
}