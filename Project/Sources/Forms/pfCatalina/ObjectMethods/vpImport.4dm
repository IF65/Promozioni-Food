Case of 
	: (Form event code:C388=On VP Ready:K2:59)
		//C_OBJECT($allowed)
		//$allowed:=New object  //parameter for the command
		
		//$allowed.vpGetDescrizioneArticolo:=New object  //create a second function with parameters named "Byebye"
		//$allowed.vpGetDescrizioneArticolo.method:="VPGETDESCRIZIONEARTICOLO"
		//$allowed.vpGetDescrizioneArticolo.parameters:=New collection
		//$allowed.vpGetDescrizioneArticolo.parameters.push(New object("codice"; "Message"; "codice articolo"; Is text))
		//$allowed.vpGetDescrizioneArticolo.summary:="recupera la descrizione dell'articolo"
		//$allowed.vpGetDescrizioneArticolo.minParams:=1
		//$allowed.vpGetDescrizioneArticolo.maxParams:=1
		
		//VP SET ALLOWED METHODS($allowed)
End case 
