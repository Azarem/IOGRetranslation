
?INCLUDE 'pyD7_actor_08C4EA'

code_08C549 {
    LDA $7F0010, X
    STA $26
    LDA $24
    BPL code_08C564
    COP [C1]
    LDY #$1060
    LDA $0026, Y
    DEC 
    STA $0026, Y
    DEC $26
    BEQ code_08C575
    DEC 
    STA $0026, Y
    DEC $26
    BEQ code_08C575
    RTL 
}


code_08C564 {
    COP [C1]
    LDY #$1060
    LDA $0026, Y
    INC 
    STA $0026, Y
    DEC $26
    BEQ code_08C575
    INC 
    STA $0026, Y
    DEC $26
    BEQ code_08C575
    RTL 
}