

--------------------------------------------
?INCLUDE 'sc08_priest'
--------------------------------------------


code_048AD9 {
    COP [D0] ( #8D, #01, &sc08_priest_return )
    COP [D0] ( #21, #01, &code_048AE4 )
    COP [BF] ( &widestring_048C98 )
    RTL 
}

sc08_priest_return {
    COP [BF] ( &sc08_priest_return_text )
    RTL 
}

sc08_priest_return_text `This is a test`