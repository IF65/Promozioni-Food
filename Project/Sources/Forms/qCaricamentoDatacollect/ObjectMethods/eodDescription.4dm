Case of 
	: (Form event code:C388=On Data Change:K2:15)
		cStatoQuadrature[currentItemPosition-1].eod:=Num:C11(<>qEod2Code[cStatoQuadrature[currentItemPosition-1].eodDescription])
		qCaricamentoDatacollect("aggiornaStatoQuadratura")
		
End case 