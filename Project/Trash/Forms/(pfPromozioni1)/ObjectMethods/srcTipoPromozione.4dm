Case of 
	: (Form event code:C388=On Load:K2:1)
		pfPromozioni1("inizializzaRicerca")
	: (Form event code:C388=On Clicked:K2:4)
		If (srcTipoPromozione{0}#String:C10(srcTipoPromozione))
			srcTipoPromozione{0}:=String:C10(srcTipoPromozione)
		End if 
End case 