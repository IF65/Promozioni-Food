//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 05/07/19, 11:14:04
// ----------------------------------------------------
// Method: pfPromozioni
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_TEXT:C284($1)

$azione:=""
If (Count parameters:C259=1)
	$azione:=$1
End if 

Case of 
	: ($azione="")
		C_LONGINT:C283(<>promozioni1)
		If (<>promozioni1=0)
			<>promozioni1:=New process:C317("pfPromozioni1"; 1024*1024; "Promozioni Food1"; "creaFinestra"; *)
		Else 
			SHOW PROCESS:C325(<>promozioni1)
			BRING TO FRONT:C326(<>promozioni1)
		End if 
	: ($azione="creaFinestra")
		$wRef:=Open form window:C675("pfPromozioni1"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		DIALOG:C40("pfPromozioni1")
		
	: ($azione="inizializzaRicerca")
		$currentDate:=Current date:C33(*)
		COPY ARRAY:C226(<>promoTipo; srcTipoPromozione)
		COPY ARRAY:C226(<>promoTipoCodice; srcTipoPromozioneCodice)
		srcTipoPromozione:=1
		srcBozza:=0
		srcUsaDataCorrente:=True:C214
		srcDataCorrente:=$currentDate
		srcDataDa:=Date:C102(String:C10(Year of:C25($currentDate)-1; "0000")+"-01-01T00:00:00")
		srcDataA:=Date:C102(String:C10(Year of:C25($currentDate)+1; "0000")+"-12-31T00:00:00")
		srcCodicePromozione:=0
		srcBarcode:=""
		srcDescrizione:=""
		
	: ($azione="inizializza")
		cPromozioni:=New collection:C1472()
		
	: ($azione="carica")
		ARRAY TEXT:C222($arHeaderNames; 0)
		ARRAY TEXT:C222($arHeaderValues; 0)
		APPEND TO ARRAY:C911($arHeaderNames; "Content-Type")
		APPEND TO ARRAY:C911($arHeaderValues; "application/json")
		
		//parametri
		C_OBJECT:C1216($request)
		OB SET:C1220($request; "function"; "elencoPromozioni")
		If (srcCodicePromozione#0)
			OB SET:C1220($request; "codice"; srcCodicePromozione)
		End if 
		If (srcBarcode#"")
			OB SET:C1220($request; "barcode"; srcBarcode)
		End if 
		If (srcDescrizione#"")
			OB SET:C1220($request; "descrizione"; srcDescrizione)
		End if 
		If (srcTipoPromozione>1)
			OB SET:C1220($request; "tipo"; srcTipoPromozioneCodice{srcTipoPromozione})
		End if 
		If (srcUsaDataCorrente)
			If (srcDataCorrente#!00-00-00!)
				OB SET:C1220($request; "dataCorrente"; Substring:C12(String:C10(srcDataCorrente; ISO date:K1:8); 1; 10))
			End if 
		Else 
			If (srcDataDa#!00-00-00!)
				OB SET:C1220($request; "dallaData"; Substring:C12(String:C10(srcDataDa; ISO date:K1:8); 1; 10))
			End if 
			If (srcDataA#!00-00-00!)
				OB SET:C1220($request; "allaData"; Substring:C12(String:C10(srcDataA; ISO date:K1:8); 1; 10))
			End if 
		End if 
		If (srcBozza=0)
			OB SET:C1220($request; "bozza"; False:C215)
		End if 
		If (srcBozza=1)
			OB SET:C1220($request; "bozza"; True:C214)
		End if 
		utlTermometro("apri")
		utlTermometro("mostra"; "Caricamento in corso...")
		
		//utlAlpAreaAddColumn(Self; 28; ->arPR_numeroSedi; "Sedi"; 1; 40; 2; ""; 0)
		
		$body:=JSON Stringify:C1217($request)
		//SET TEXT TO PASTEBOARD($body)
		$sql:="/promozioni/src/promozioni.php"
		C_TEXT:C284($response)
		
		<>error:=0
		HTTP SET OPTION:C1160(HTTP timeout:K71:10; 45)
		ON ERR CALL:C155("utlOnErrCall")
		$httpResponse:=HTTP Request:C1158(HTTP POST method:K71:2; <>itmServer+$sql; $body; $response; $arHeaderNames; $arHeaderValues)
		ON ERR CALL:C155("")
		If ($httpResponse=200) & (<>error=0)
			pfPromozioni1("inizializza")
			ARRAY OBJECT:C1221($elencoPromozioni; 0)
			JSON PARSE ARRAY:C1219($response; $elencoPromozioni)
			
			ARRAY TO COLLECTION:C1563(cPromozioni; $elencoPromozioni)
			For ($i; 0; cPromozioni.count()-1)
				cPromozioni[$i].tipoCliente:=Num:C11(cPromozioni[$i].tipoCliente)
				cPromozioni[$i].categoria:=Num:C11(cPromozioni[$i].categoria)
				cPromozioni[$i].codice:=Num:C11(cPromozioni[$i].codice)
				cPromozioni[$i].codiceCatalina:=Num:C11(cPromozioni[$i].codiceCatalina)
				cPromozioni[$i].soglia:=0
				cPromozioni[$i].importo:=0
				If (cPromozioni[$i].ricompense.count()=1)
					cPromozioni[$i].soglia:=Num:C11(cPromozioni[$i].ricompense[0].soglia; ".")
					cPromozioni[$i].importo:=Num:C11(cPromozioni[$i].ricompense[0].ammontare; ".")
				End if 
			End for 
		End if 
		
		utlTermometro("chiudi")
		
	: ($azione="modificaPromozione")
		pfPromozioniInserimento("creaFinestra")
		pfPromozioni1("updateDisplay")
		
	: ($azione="nuovaPromozione")
		promozioneSelezionata:=0
		pfPromozioni1("modificaPromozione")
		
	: ($azione="stampaPdf")
		
		
		
	: ($azione="stampaExcel")
		
		$fileName:="promozioni_"+Substring:C12(Replace string:C233(Replace string:C233(Timestamp:C1445; ":"; ""); "-"; ""); 1; 15)
		
		VP NEW DOCUMENT("promozioniVP")
		
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 0; 0); "Numero")
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 1; 0); "Codice Catalina")
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 2; 0); "Tipo")
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 3; 0); "Descrizione")
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 4; 0); "Data Inizio")
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 5; 0); "Data Fine")
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 6; 0); "Soglia")
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 7; 0); "Importo")
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 8; 0); "Tipo Cliente")
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 9; 0); "Categoria")
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 10; 0); "Barcode")
		VP SET TEXT VALUE(VP Cell("promozioniVP"; 11; 0); "Numero Sedi")
		For ($i; 1; cPromozioni.count())
			VP SET NUM VALUE(VP Cell("promozioniVP"; 0; $i); cPromozioni[$i-1].codice)
			VP SET NUM VALUE(VP Cell("promozioniVP"; 1; $i); cPromozioni[$i-1].codiceCatalina)
			VP SET TEXT VALUE(VP Cell("promozioniVP"; 2; $i); OB Get:C1224(<>promozioniDescrizione; cPromozioni[$i-1].tipo; Is text:K8:3))
			VP SET TEXT VALUE(VP Cell("promozioniVP"; 3; $i); cPromozioni[$i-1].descrizione)
			VP SET DATE VALUE(VP Cell("promozioniVP"; 4; $i); Date:C102(cPromozioni[$i-1].dataInizio); "d/m/yy")
			VP SET DATE VALUE(VP Cell("promozioniVP"; 5; $i); Date:C102(cPromozioni[$i-1].dataFine); "d/m/yy")
			VP SET NUM VALUE(VP Cell("promozioniVP"; 6; $i); cPromozioni[$i-1].soglia)
			VP SET NUM VALUE(VP Cell("promozioniVP"; 7; $i); cPromozioni[$i-1].importo)
			VP SET NUM VALUE(VP Cell("promozioniVP"; 8; $i); cPromozioni[$i-1].tipoCliente)
			VP SET NUM VALUE(VP Cell("promozioniVP"; 9; $i); cPromozioni[$i-1].categoria)
			VP SET TEXT VALUE(VP Cell("promozioniVP"; 10; $i); cPromozioni[$i-1].barcode)
			VP SET NUM VALUE(VP Cell("promozioniVP"; 11; $i); cPromozioni[$i-1].sedi.count())
		End for 
		
		$font:=VP Font to object("14pt Calibri")
		
		$style:=New object:C1471()
		$style.name:="Default"
		$style.vAlign:=vk vertical align center:K89:50
		$style.font:=VP Object to font($font)
		VP SET DEFAULT STYLE("promozioniVP"; $style)
		
		$style.name:="Titoli"
		$style.hAlign:=vk horizontal align center:K89:40
		$font.weight:=vk font weight bold:K89:64
		$style.font:=VP Object to font($font)
		VP SET CELL STYLE(VP Row("promozioniVP"; 0); $style)
		
		$panes:=New object:C1471()
		$panes.rowCount:=1
		VP SET FROZEN PANES("promozioniVP"; $panes)
		
		VP SET ROW ATTRIBUTES(VP All("promozioniVP"); New object:C1471("height"; 48))
		VP COLUMN AUTOFIT(VP All("promozioniVP"))
		
		VP EXPORT DOCUMENT("promozioniVP"; System folder:C487(Desktop:K41:16)+$fileName; New object:C1471("format"; vk MS Excel format:K89:2))
		
End case 
