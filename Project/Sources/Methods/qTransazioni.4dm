//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 21/07/21, 11:02:14
// ----------------------------------------------------
// Method: qTransazioni
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
		C_LONGINT:C283(<>qTransazioni)
		If (<>qTransazioni=0)
			<>qTransazioni:=New process:C317("qTransazioni"; 1024*1024; "Consultazione transazioni"; "creaFinestra"; *)
		Else 
			SHOW PROCESS:C325(<>qTransazioni)
			BRING TO FRONT:C326(<>qTransazioni)
		End if 
	: ($azione="creaFinestra")
		$wRef:=Open form window:C675("qTransazioni"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		DIALOG:C40("qTransazioni")
		
	: ($azione="inizializzaRicerca")
		ARRAY TEXT:C222(srcSediDescrizione; 0)
		ARRAY TEXT:C222(srcSediCodice; 0)
		OB GET PROPERTY NAMES:C1232(<>sediDescrizione; srcSediCodice)
		SORT ARRAY:C229(srcSediCodice; >)
		For ($i; 1; Size of array:C274(srcSediCodice))
			APPEND TO ARRAY:C911(srcSediDescrizione; srcSediCodice{$i}+" - "+OB Get:C1224(<>sediDescrizione; srcSediCodice{$i}; Is text:K8:3))
		End for 
		INSERT IN ARRAY:C227(srcSediDescrizione; 1; 2)
		INSERT IN ARRAY:C227(srcSediCodice; 1; 2)
		srcSediDescrizione{1}:="TUTTE LE SEDI"
		srcSediCodice{1}:=""
		srcSediDescrizione{2}:="-"
		srcSediCodice{2}:=""
		srcSediDescrizione:=1
		
		srcSedeCodice:=""
		srcData:=Current date:C33()
		
	: ($azione="inizializza")
		cElencoTransazioni:=New collection:C1472()
		cDatacollect:=New collection:C1472()
		
		regCount:=0
		transactionCount:=0
		totalAmount:=0
		description:=""
		
	: ($azione="carica")
		ARRAY TEXT:C222($arHeaderNames; 0)
		ARRAY TEXT:C222($arHeaderValues; 0)
		APPEND TO ARRAY:C911($arHeaderNames; "Content-Type")
		APPEND TO ARRAY:C911($arHeaderValues; "application/json")
		
		//parametri
		C_OBJECT:C1216($request)
		OB SET:C1220($request; "function"; "elencoTransazioni")
		OB SET:C1220($request; "store"; srcSedeCodice)
		OB SET:C1220($request; "ddate"; srcData)
		
		utlTermometro("apri")
		utlTermometro("mostra"; "Caricamento in corso...")
		
		$body:=JSON Stringify:C1217($request)
		SET TEXT TO PASTEBOARD:C523($body)
		$sql:="/eDatacollect/src/eDatacollect.php"
		C_TEXT:C284($response)
		
		<>error:=0
		HTTP SET OPTION:C1160(HTTP timeout:K71:10; 45)
		ON ERR CALL:C155("utlOnErrCall")
		$httpResponse:=HTTP Request:C1158(HTTP POST method:K71:2; <>qServer+$sql; $body; $response; $arHeaderNames; $arHeaderValues)
		ON ERR CALL:C155("")
		If ($httpResponse=200) & (<>error=0)
			qTransazioni("inizializza")
			ARRAY OBJECT:C1221($elencoTransazioni; 0)
			JSON PARSE ARRAY:C1219($response; $elencoTransazioni)
			
			For ($i; 1; Size of array:C274($elencoTransazioni))
				$element:=New object:C1471(\
					"store"; OB Get:C1224($elencoTransazioni{$i}; "store"; Is text:K8:3); \
					"ddate"; OB Get:C1224($elencoTransazioni{$i}; "ddate"; Is date:K8:7); \
					"reg"; OB Get:C1224($elencoTransazioni{$i}; "reg"; Is text:K8:3); \
					"trans"; OB Get:C1224($elencoTransazioni{$i}; "trans"; Is longint:K8:6); \
					"ttime"; OB Get:C1224($elencoTransazioni{$i}; "ttime"; Is text:K8:3); \
					"totalAmount"; OB Get:C1224($elencoTransazioni{$i}; "totalamount"; Is real:K8:4); \
					)
				
				cElencoTransazioni.push($element)
			End for 
		End if 
		
		qTransazioni("caricaDatacollect")
		qTransazioni("totali")
		
		utlTermometro("chiudi")
		
	: ($azione="caricaDatacollect")
		ARRAY TEXT:C222($arHeaderNames; 0)
		ARRAY TEXT:C222($arHeaderValues; 0)
		APPEND TO ARRAY:C911($arHeaderNames; "Content-Type")
		APPEND TO ARRAY:C911($arHeaderValues; "application/json")
		
		//parametri
		C_OBJECT:C1216($request)
		OB SET:C1220($request; "function"; "creazioneDatacollect")
		OB SET:C1220($request; "sede"; srcSedeCodice)
		OB SET:C1220($request; "data"; srcData)
		
		$body:=JSON Stringify:C1217($request)
		SET TEXT TO PASTEBOARD:C523($body)
		$sql:="/eDatacollect/src/eDatacollect.php"
		C_TEXT:C284($response)
		
		<>error:=0
		HTTP SET OPTION:C1160(HTTP timeout:K71:10; 45)
		ON ERR CALL:C155("utlOnErrCall")
		$httpResponse:=HTTP Request:C1158(HTTP POST method:K71:2; <>qServer+$sql; $body; $response; $arHeaderNames; $arHeaderValues)
		ON ERR CALL:C155("")
		If ($httpResponse=200) & (<>error=0)
			cDatacollect:=New collection:C1472()
			For each ($currentItem; Split string:C1554($response; "\r\n"))
				cDatacollect.push(New object:C1471("row"; $currentItem; "articleCode"; ""; "articleDescription"; ""))
			End for each 
		End if 
		
		cDatacollectSelection:=cDatacollect.copy()
		
	: ($azione="esportaDatacollect")
		$data:=Replace string:C233(Substring:C12(String:C10(srcData; ISO date:K1:8); 3; 8); "-"; "")
		$fileName:=srcSedeCodice+"_20"+$data+"_"+$data+"_DC.TXT"
		$text:=cDatacollectSelection.extract("row").join("\r\n"; ck ignore null or empty:K85:5)+"\r\n"
		TEXT TO DOCUMENT:C1237(System folder:C487(Desktop:K41:16)+$fileName; $text; "ISO-8859-1"; Document with CRLF:K24:20)
		
		
	: ($azione="totali")
		If (selectedItems.count()#0)
			totalAmount:=selectedItems.sum("totalAmount")
			transactionCount:=selectedItems.count()
			$reg:=selectedItems.distinct("reg")
			regCount:=$reg.count()
		Else 
			totalAmount:=cElencoTransazioni.sum("totalAmount")
			transactionCount:=cElencoTransazioni.count()
			$reg:=cElencoTransazioni.distinct("reg")
			regCount:=$reg.count()
		End if 
		
		Case of 
			: (selectedItems.count()=0) & (cElencoTransazioni.count()=0)
				description:=""
			: (selectedItems.count()=0)
				description:="Selezionate 0 righe su "+String:C10(cElencoTransazioni.count())
			: (selectedItems.count()=1)
				description:="Selelezionata "+String:C10(selectedItems.count())+" riga su "+String:C10(cElencoTransazioni.count())
			Else 
				description:="Selelezionate "+String:C10(selectedItems.count())+" righe su "+String:C10(cElencoTransazioni.count())
		End case 
		
	: ($azione="stampa")
		
		//ARRAY TEXT(arQ_id;0)
		//ARRAY LONGINT(arQ_codice;0)
		//ARRAY TEXT(arQ_tipo;0)
		//ARRAY TEXT(arQ_descrizione;0)
		//ARRAY LONGINT(arQ_ripetibilita;0)
		//ARRAY DATE(arQ_dataInizio;0)
		//ARRAY DATE(arQ_dataFine;0)
		//ARRAY TEXT(arQ_oraInizio;0)
		//ARRAY TEXT(arQ_oraFine;0)
		//ARRAY LONGINT(arQ_tipoCliente;0)
		//ARRAY LONGINT(arQ_categoria;0)
		//ARRAY TEXT(arQ_calendarioSettimanale;0)
		//ARRAY BOOLEAN(arQ_Do;0)
		//ARRAY BOOLEAN(arQ_Lu;0)
		//ARRAY BOOLEAN(arQ_Ma;0)
		//ARRAY BOOLEAN(arQ_Me;0)
		//ARRAY BOOLEAN(arQ_Gi;0)
		//ARRAY BOOLEAN(arQ_Ve;0)
		//ARRAY BOOLEAN(arQ_Sa;0)
		//ARRAY LONGINT(arQ_sottoreparti;0)
		//ARRAY BOOLEAN(arQ_bozza;0)
		//ARRAY BOOLEAN(arQ_stampato;0)
		//ARRAY TEXT(arQ_barcode;0)
		//ARRAY TEXT(arQ_testo;0)
		//ARRAY REAL(arQ_soglia;0)
		//ARRAY REAL(arQ_importo;0)
		//ARRAY LONGINT(arQ_numeroSedi;0)
		//ARRAY BLOB(arQ_immagineBarcode;0)
		
		ARRAY LONGINT:C221($selezione; 0)
		$err:=AL_GetObjects(alpQuadrature; ALP_Object_Selection; $selezione)
		If (Size of array:C274($selezione)>0)
			
			C_REAL:C285(hPaper; wPaper)
			GET PRINTABLE AREA:C703(hPaper; wPaper)  // Paper size
			
			pagina:=1
			stPagina:="Pag."+String:C10(pagina)
			stOra:=String:C10(Current date:C33; ISO date:K1:8; Current time:C178)
			
			
			$h:=Print form:C5("stampaListaPromozioni"; Form header:K43:3)
			For ($i; 1; Size of array:C274($selezione))
				st_codice:=arQ_codice{$i}
				st_tipo:=arQ_tipo{$i}
				st_descrizione:=arQ_descrizione{$i}
				//st_ripetibilita:=arQ_ripetibilita{$i}
				st_dataInizio:=String:C10(arQ_dataInizio{$i})
				st_dataFine:=String:C10(arQ_dataFine{$i})
				st_oraInizio:=arQ_oraInizio{$i}
				st_oraFine:=arQ_oraFine{$i}
				//st_tipoCliente:=arQ_tipoCliente{$i}
				//st_categoria:=arQ_categoria{$i}
				st_calendarioSettimanale:=arQ_calendarioSettimanale{$i}
				//st_Do:=arQ_Do{$i}
				//st_Lu:=arQ_Lu{$i}
				//st_Ma:=arQ_Ma{$i}
				//st_Me:=arQ_Me{$i}
				//st_Gi:=arQ_Gi{$i}
				//st_Ve:=arQ_Ve{$i}
				//st_Sa:=arQ_Sa{$i}
				//st_sottoreparti:=arQ_sottoreparti{$i}
				//st_bozza:=arQ_bozza{$i}
				//st_stampato:=arQ_stampato{$i}
				//st_barcode:=arQ_barcode{$i}
				//st_testo:=arQ_testo{$i}
				//st_soglia:=arQ_soglia{$i}
				//st_importo:=arQ_importo{$i}
				
				
				
				
				C_PICTURE:C286($picture)
				BLOB TO PICTURE:C682(arQ_immagineBarcode{$i}; $picture; "image/jpeg")
				st_immagineBarcode:=$picture
				
				If ($h>(hPaper-120))
					//$h:=Print form("stampaListaPromozioni";Form footer)
					PAGE BREAK:C6(>)
					//$h:=Print form("stampaListaPromozioni";Form header)
					//pagina:=pagina+1
					//stPagina:="Pag."+String(pagina)
				End if 
				
				$h:=$h+Print form:C5("stampaListaPromozioni"; Form detail:K43:1)
			End for 
			//While ($h<(hPaper-45))
			//$h:=$h+Print form("stampaListaPromozioni";Form break0)
			//If ($h>(hPaper-45))
			//$h:=$h+Print form("stampaListaPromozioni";Form footer)
			//End if 
			//End while 
			PAGE BREAK:C6
		End if 
		
		
End case 
