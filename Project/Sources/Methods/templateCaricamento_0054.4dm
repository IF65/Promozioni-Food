//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 26/03/20, 10:43:31
// ----------------------------------------------------
// Method: templateCaricamento_0054
// Description
// Attenzione ai gruppi se si vuole una promo che scatti 
// all'acquisto di 2 (o più) articoli tra n si usa solo 
// gruppo 1
//
// Parameters
// ----------------------------------------------------

APPEND TO ARRAY:C911($arCodiceCatalina; 0)
APPEND TO ARRAY:C911($arDescrizione; "LATTICINI")
APPEND TO ARRAY:C911($arSoglia; 6)
APPEND TO ARRAY:C911($arImporto; 1.5)
APPEND TO ARRAY:C911($arInizio; !2021-11-01!)
APPEND TO ARRAY:C911($arFine; !2021-11-14!)
APPEND TO ARRAY:C911($arBarcode; "")
APPEND TO ARRAY:C911($arCodiceArticolo; "")
APPEND TO ARRAY:C911($arTipo; "0481")

C_BOOLEAN:C305($0)

C_LONGINT:C283($1)
C_TEXT:C284($2)
C_REAL:C285($3; $4)
C_DATE:C307($5; $6)
C_TEXT:C284($7; $8; $9; $10; $11)

$0:=False:C215

If (Count parameters:C259=11)
	$idIF65:=$1
	$denominazione:=$2
	$soglia:=$3
	$percentuale:=$4
	$dataInizio:=$5
	$dataFine:=$6
	
	$barcode1:=$7
	ARRAY TEXT:C222($barcodeGruppo1; 0)
	If ($barcode1#"")
		ARRAY OBJECT:C1221($articoli; 0)
		$json:=utlEsplosioneBarcode($barcode1)
		JSON PARSE ARRAY:C1219($json; $articoli)
		For ($i; 1; Size of array:C274($articoli))
			APPEND TO ARRAY:C911($barcodeGruppo1; OB Get:C1224($articoli{$i}; "barcode"; Is text:K8:3))
		End for 
	End if 
	$codiceArticolo1:=$8
	If ($codiceArticolo1#"")
		ARRAY OBJECT:C1221($articoli; 0)
		$json:=utlCercaBarcodeDaCodiceArticolo($codiceArticolo1)
		JSON PARSE ARRAY:C1219($json; $articoli)
		For ($i; 1; Size of array:C274($articoli))
			$barcode:=OB Get:C1224($articoli{$i}; "barcode"; Is text:K8:3)
			If (Find in array:C230($barcodeGruppo1; $barcode)<0)
				APPEND TO ARRAY:C911($barcodeGruppo1; $barcode)
			End if 
		End for 
	End if 
	If (Size of array:C274($barcodeGruppo1)=0)
		APPEND TO ARRAY:C911($barcodeGruppo1; utlOttieniBarcode8Catalina)
	End if 
	
	$barcode2:=$9
	ARRAY TEXT:C222($barcodeGruppo2; 0)
	If ($barcode2#"")
		ARRAY OBJECT:C1221($articoli; 0)
		$json:=utlEsplosioneBarcode($barcode2)
		JSON PARSE ARRAY:C1219($json; $articoli)
		For ($i; 1; Size of array:C274($articoli))
			APPEND TO ARRAY:C911($barcodeGruppo2; OB Get:C1224($articoli{$i}; "barcode"; Is text:K8:3))
		End for 
	End if 
	$codiceArticolo2:=$10
	If ($codiceArticolo2#"")
		ARRAY OBJECT:C1221($articoli; 0)
		$json:=utlCercaBarcodeDaCodiceArticolo($codiceArticolo2)
		JSON PARSE ARRAY:C1219($json; $articoli)
		For ($i; 1; Size of array:C274($articoli))
			$barcode:=OB Get:C1224($articoli{$i}; "barcode"; Is text:K8:3)
			If (Find in array:C230($barcodeGruppo2; $barcode)<0)
				APPEND TO ARRAY:C911($barcodeGruppo2; $barcode)
			End if 
		End for 
	End if 
	
	ARRAY TEXT:C222($aderenti; 0)
	utlExplode($11; ->$aderenti; ";")
	
	$codicePromozione:=utlProgressivoCrea(<>progPromozione)
	
	C_OBJECT:C1216($promozione)
	$idPromozione:=Generate UUID:C1066
	OB SET:C1220($promozione; "id"; $idPromozione)
	OB SET:C1220($promozione; "codice"; $codicePromozione)
	OB SET:C1220($promozione; "codiceCatalina"; $idIF65)
	OB SET:C1220($promozione; "tipo"; "0054")
	OB SET:C1220($promozione; "descrizione"; $denominazione)
	OB SET:C1220($promozione; "ripetibilita"; 1)
	OB SET:C1220($promozione; "dataInizio"; $dataInizio)
	OB SET:C1220($promozione; "dataFine"; $dataFine)
	OB SET:C1220($promozione; "oraInizio"; "00:00:00")
	OB SET:C1220($promozione; "oraFine"; "23:59:00")
	OB SET:C1220($promozione; "calendarioSettimanale"; "1111111")
	OB SET:C1220($promozione; "tipoCliente"; 1)
	OB SET:C1220($promozione; "categoria"; 0)
	OB SET:C1220($promozione; "sottoreparti"; 0)
	OB SET:C1220($promozione; "bozza"; 0)
	OB SET:C1220($promozione; "stampato"; 0)
	OB SET:C1220($promozione; "pmt"; 0)
	OB SET:C1220($promozione; "barcode"; $barcodeGruppo1{1})
	OB SET:C1220($promozione; "testo"; "")
	
	C_OBJECT:C1216($ricompensa)
	ARRAY OBJECT:C1221($ricompense; 0)
	OB SET:C1220($ricompensa; "id"; Generate UUID:C1066)
	OB SET:C1220($ricompensa; "idPromozioni"; $idPromozione)
	OB SET:C1220($ricompensa; "soglia"; $soglia)
	OB SET:C1220($ricompensa; "ammontare"; $percentuale)
	OB SET:C1220($ricompensa; "limiteSconto"; 0)
	OB SET:C1220($ricompensa; "taglio"; 0)
	OB SET:C1220($ricompensa; "descrizione"; "REGALO")
	OB SET:C1220($ricompensa; "recordM"; "00:0054-"+String:C10($codicePromozione))
	OB SET:C1220($ricompensa; "accumulatore"; "")
	OB SET:C1220($ricompensa; "promovar"; 0)
	OB SET:C1220($ricompensa; "tipoArea"; 0)
	OB SET:C1220($ricompensa; "ordinamentoInArea"; 0)
	OB SET:C1220($ricompensa; "progressivo"; 0)
	APPEND TO ARRAY:C911($ricompense; $ricompensa)
	OB SET ARRAY:C1227($promozione; "ricompense"; $ricompense)
	
	C_OBJECT:C1216($articolo)
	ARRAY OBJECT:C1221($articoli; 0)
	For ($i; 1; Size of array:C274($barcodeGruppo1))
		CLEAR VARIABLE:C89($articolo)
		OB SET:C1220($articolo; "id"; Generate UUID:C1066)
		OB SET:C1220($articolo; "idPromozioni"; $idPromozione)
		OB SET:C1220($articolo; "codiceArticolo"; "")
		OB SET:C1220($articolo; "codiceReparto"; "")
		OB SET:C1220($articolo; "barcode"; $barcodeGruppo1{$i})
		OB SET:C1220($articolo; "descrizione"; "")
		OB SET:C1220($articolo; "molteplicita"; 1)
		OB SET:C1220($articolo; "gruppo"; 1)
		APPEND TO ARRAY:C911($articoli; $articolo)
	End for 
	For ($i; 1; Size of array:C274($barcodeGruppo2))
		CLEAR VARIABLE:C89($articolo)
		OB SET:C1220($articolo; "id"; Generate UUID:C1066)
		OB SET:C1220($articolo; "idPromozioni"; $idPromozione)
		OB SET:C1220($articolo; "codiceArticolo"; "")
		OB SET:C1220($articolo; "codiceReparto"; "")
		OB SET:C1220($articolo; "barcode"; $barcodeGruppo2{$i})
		OB SET:C1220($articolo; "descrizione"; "")
		OB SET:C1220($articolo; "molteplicita"; 1)
		OB SET:C1220($articolo; "gruppo"; 2)
		APPEND TO ARRAY:C911($articoli; $articolo)
	End for 
	OB SET ARRAY:C1227($promozione; "articoli"; $articoli)
	
	$negoziJson:=utlElencoNegozi
	C_OBJECT:C1216($sede)
	ARRAY OBJECT:C1221($sedi; 0)
	If ($negoziJson#"")
		ARRAY OBJECT:C1221($negozi; 0)
		JSON PARSE ARRAY:C1219($negoziJson; $negozi)
		For ($i; 1; Size of array:C274($negozi))
			$dataApertura:=OB Get:C1224($negozi{$i}; "data_inizio"; Is date:K8:7)
			$dataChiusura:=OB Get:C1224($negozi{$i}; "data_fine"; Is date:K8:7)
			$codice:=OB Get:C1224($negozi{$i}; "codice"; Is text:K8:3)
			If (utlMatchRegex("^(?:01|02|04|05|31|36)"; $codice))
				If ($dataChiusura=!00-00-00!)
					CLEAR VARIABLE:C89($sede)
					OB SET:C1220($sede; "id"; Generate UUID:C1066)
					OB SET:C1220($sede; "idPromozioni"; $idPromozione)
					OB SET:C1220($sede; "codiceSede"; $codice)
					If (Size of array:C274($aderenti)=0) | ((Size of array:C274($aderenti)>0) & (Find in array:C230($aderenti; $codice)>0))
						APPEND TO ARRAY:C911($sedi; $sede)
					End if 
				End if 
			End if 
		End for 
	End if 
	OB SET ARRAY:C1227($promozione; "sedi"; $sedi)
	
	ARRAY TEXT:C222($arHeaderNames; 0)
	ARRAY TEXT:C222($arHeaderValues; 0)
	APPEND TO ARRAY:C911($arHeaderNames; "Content-Type")
	APPEND TO ARRAY:C911($arHeaderValues; "application/json")
	
	C_OBJECT:C1216($request)
	OB SET:C1220($request; "function"; "salva")
	OB SET:C1220($request; "promozione"; $promozione)
	
	$body:=JSON Stringify:C1217($request)
	SET TEXT TO PASTEBOARD:C523($body)
	
	$sql:="/promozioni/src/promozioni.php"
	C_TEXT:C284($response)
	
	<>error:=0
	HTTP SET OPTION:C1160(HTTP timeout:K71:10; 30)
	ON ERR CALL:C155("utlOnErrCall")
	$httpResponse:=HTTP Request:C1158(HTTP POST method:K71:2; <>itmServer+$sql; $body; $response; $arHeaderNames; $arHeaderValues)
	ON ERR CALL:C155("")
	If ($httpResponse=200) & (<>error=0)
		$0:=True:C214
	End if 
End if 

