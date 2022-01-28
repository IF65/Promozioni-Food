Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (selSottoTipo{0}#selSottoTipo{selSottoTipo})
			vPR_sottoTipo:=selSottoTipoCodice{selSottoTipo}
			pfPromozioniInserimento("visualizzaRicompense")
			
			selSottoTipo{0}:=selSottoTipo{selSottoTipo}
		End if 
End case 
