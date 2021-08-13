Case of 
	: (Form event code:C388=On Load:K2:1)
		qCaricamentoDatacollect("inizializzaRicerca")
		qCaricamentoDatacollect("inizializzaArray")
		
		//<>qCode2Status
		//<>qStatus2Code
		OBJECT SET LIST BY REFERENCE:C1266(*; "statusDescription"; Choice list:K42:19; <>qStatusDescriptionList)
		OBJECT SET LIST BY REFERENCE:C1266(*; "eodDescription"; Choice list:K42:19; <>qEodDescriptionList)
		
	: (Form event code:C388=On Selection Change:K2:29)
		qCaricamentoDatacollect("totali")
End case 
