//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 27/02/21, 11:39:44
// ----------------------------------------------------
// Method: templateCaricamento_0501
// Description
// 
//
// Parameters
// ----------------------------------------------------


C_BOOLEAN:C305($0)

C_TEXT:C284($1)
C_REAL:C285($2)
C_DATE:C307($3; $4)
C_TEXT:C284($5; $6; $7; $8; $9)

$0:=False:C215

If (Count parameters:C259=9)
	$denominazione:=$1
	$importo:=$2
	$dataInizio:=$3
	$dataFine:=$4
	$sedeDestinataria:=$5
	$promoVar:=$6
	$dettaglio:=$7
	
	ARRAY TEXT:C222($aderenti; 0)
	utlExplode($8; ->$aderenti; ";")
	$aderentiGruppo:=$9
	
	$testo:=""
	$testo:=$testo+"&NfBegin&$NewLine$>    SOLO DA TRONY                                                                                      \n"
	$testo:=$testo+"&NfBegin&$NewLine$&DH&                @sedeDestinataria$NewLine$                                                           \n"
	$testo:=$testo+"$NewLine$>&Amt_@promoVar& E DI SCONTO$NewLine$                                                                               \n"
	$testo:=$testo+"$NewLine$In regalo per te con carta Fan Trony                                                                             \n"
	$testo:=$testo+"$NewLine$@dettaglio$NewLine$Escluse promo - smartphone - servizi                                \n"
	$testo:=$testo+"$NewLine$&Barcode_995112345&                                                                                              \n"
	
	$testo:=Replace string:C233($testo; "@sedeDestinataria"; $sedeDestinataria)
	$testo:=Replace string:C233($testo; "@promoVar"; $promoVar)
	$testo:=Replace string:C233($testo; "@dettaglio"; $dettaglio)
	
	$promoOk:=True:C214
	
	If ($promoOk)
		$codicePromozione:=utlProgressivoCrea(<>progPromozione)
		
		C_OBJECT:C1216($promozione)
		$idPromozione:=Generate UUID:C1066
		OB SET:C1220($promozione; "id"; $idPromozione)
		OB SET:C1220($promozione; "codice"; $codicePromozione)
		OB SET:C1220($promozione; "codiceCatalina"; 0)
		OB SET:C1220($promozione; "tipo"; "0501")
		OB SET:C1220($promozione; "descrizione"; $denominazione)
		OB SET:C1220($promozione; "ripetibilita"; 1)
		OB SET:C1220($promozione; "dataInizio"; $dataInizio)
		OB SET:C1220($promozione; "dataFine"; $dataFine)
		OB SET:C1220($promozione; "oraInizio"; "00:00:00")
		OB SET:C1220($promozione; "oraFine"; "23:59:00")
		OB SET:C1220($promozione; "calendarioSettimanale"; "1111111")
		OB SET:C1220($promozione; "tipoCliente"; 0)
		OB SET:C1220($promozione; "categoria"; 0)
		OB SET:C1220($promozione; "sottoreparti"; 0)
		OB SET:C1220($promozione; "bozza"; 0)
		OB SET:C1220($promozione; "stampato"; 0)
		OB SET:C1220($promozione; "pmt"; 0)
		OB SET:C1220($promozione; "barcode"; "")
		OB SET:C1220($promozione; "testo"; $testo)
		
		C_OBJECT:C1216($ricompensa)
		ARRAY OBJECT:C1221($ricompense; 0)
		OB SET:C1220($ricompensa; "id"; Generate UUID:C1066)
		OB SET:C1220($ricompensa; "idPromozioni"; $idPromozione)
		OB SET:C1220($ricompensa; "soglia"; 0)
		OB SET:C1220($ricompensa; "ammontare"; $importo)
		OB SET:C1220($ricompensa; "limiteSconto"; 0)
		OB SET:C1220($ricompensa; "taglio"; 0)
		OB SET:C1220($ricompensa; "descrizione"; "VOUCHER")
		OB SET:C1220($ricompensa; "recordM"; "00:0501-"+String:C10($codicePromozione))
		OB SET:C1220($ricompensa; "accumulatore"; "")
		OB SET:C1220($ricompensa; "promovar"; fill_left($promoVar; 8; "0"))
		OB SET:C1220($ricompensa; "tipoArea"; 0)
		OB SET:C1220($ricompensa; "ordinamentoInArea"; 0)
		OB SET:C1220($ricompensa; "progressivo"; 0)
		APPEND TO ARRAY:C911($ricompense; $ricompensa)
		OB SET ARRAY:C1227($promozione; "ricompense"; $ricompense)
		
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
						If (Find in array:C230($aderenti; $codice)>0)
							CLEAR VARIABLE:C89($sede)
							OB SET:C1220($sede; "id"; Generate UUID:C1066)
							OB SET:C1220($sede; "idPromozioni"; $idPromozione)
							OB SET:C1220($sede; "codiceSede"; $codice)
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
	
End if 
//TRACE
