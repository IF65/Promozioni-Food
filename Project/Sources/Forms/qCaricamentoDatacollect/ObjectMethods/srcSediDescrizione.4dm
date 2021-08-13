Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (srcSediDescrizione{0}#srcSediDescrizione{srcSediDescrizione})
			srcSediDescrizione{0}:=srcSediDescrizione{srcSediDescrizione}
			srcSedeCodice:=srcSediCodice{srcSediDescrizione}
		End if 
End case 
