
-------------------------------------
?INCLUDE 'ec11_flower'
-------------------------------------


code_09BC4C {
    COP [D1] ( #$0113, #01, &thankful_flower_interact )
    COP [D0] ( #02, #01, &thankful_flower_interact )
    COP [BF] ( &widestring_09BC51 )
    RTL 
}

thankful_flower_interact {
    COP [BF] ( &thankful_flower_str )
    RTL 
}

thankful_flower_str `[TPL:18][TPL:D]Thank you, that was[N]lovely![END]`
