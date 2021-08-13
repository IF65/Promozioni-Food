Case of 
	: (Form event code:C388=On Data Change:K2:15)
		cStatoQuadrature[currentItemPosition-1].status:=Num:C11(<>qStatus2Code[cStatoQuadrature[currentItemPosition-1].statusDescription])
		qCaricamentoDatacollect("aggiornaStatoQuadratura")
		
	: (Form event code:C388=On Header Click:K2:40)
		LISTBOX SORT COLUMNS:C916(*; "lStatoQuadrature"; 5; <)
		
End case 
