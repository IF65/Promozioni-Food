Case of 
	: (Form event code:C388=On Load:K2:1)
		qTransazioni("inizializzaRicerca")
		qTransazioni("inizializza")
		
	: (Form event code:C388=On Selection Change:K2:29)
		qTransazioni("totali")
		
		If (selectedItems.count()=1)
			cDatacollectSelection:=cDatacollect.copy().filter("filterDatacollect"; currentItem.reg; currentItem.trans)
		Else 
			cDatacollectSelection:=cDatacollect.copy()
		End if 
End case 
