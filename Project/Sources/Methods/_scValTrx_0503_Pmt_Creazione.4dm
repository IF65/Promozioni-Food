//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 27/01/22, 17:29:05
// ----------------------------------------------------
// Method: _scValTrx_0503_Pmt_Creazione
// Description
// 
//
// Parameters
// ----------------------------------------------------


C_BOOLEAN:C305($0)

$0:=False:C215

C_TEXT:C284($1)  //sede
C_TEXT:C284($2)  //promovar_bp
C_TEXT:C284($3)  //promovar_rp


$template:=_ScValTrx_0503_Pmt_Template

$codicePromozione:=utlProgressivoCrea(<>progPromozione)

/** VARIABILI 16*/

$STATUS:="A"
$PROMOTION_NUMBER:=String:C10($codicePromozione)
$Description:="SCV TRX "+$1
$STARTING_DATE:="20220128"
$ENDING_DATE:="20220131"
$PromoLimit:="0"
$PromovarLimite:="0"
$ActivationDays:="127"
$AMOUNT:="500"
$PROMOVAR_EPP_OPERATORE_CONFRONT:="1"
$PROMOVAR_EPP:=$2
$PROMOVAR_EPP_VALORE:="1"
$THRESHOLD:="2500"
$RewardDescription40:=fill_right("SCV TRX"; 40; " ")
$PROMOVAR_RP:=$3
$RECORD_M15:=fill_right("00:0503-"+String:C10($codicePromozione); 15; " ")

$template:=Replace string:C233($template; "@STATUS@"; $STATUS)
$template:=Replace string:C233($template; "@PROMOTION_NUMBER@"; $PROMOTION_NUMBER)
$template:=Replace string:C233($template; "@Description@"; $Description)
$template:=Replace string:C233($template; "@STARTING_DATE@"; $STARTING_DATE)
$template:=Replace string:C233($template; "@ENDING_DATE@"; $ENDING_DATE)
$template:=Replace string:C233($template; "@PromoLimit@"; $PromoLimit)
$template:=Replace string:C233($template; "@PromovarLimite@"; $PromovarLimite)
$template:=Replace string:C233($template; "@ActivationDays@"; $ActivationDays)
$template:=Replace string:C233($template; "@AMOUNT@"; $AMOUNT)
$template:=Replace string:C233($template; "@PROMOVAR_EPP_OPERATORE_CONFRONTO@"; $PROMOVAR_EPP_OPERATORE_CONFRONT)
$template:=Replace string:C233($template; "@PROMOVAR_EPP@"; $PROMOVAR_EPP)
$template:=Replace string:C233($template; "@PROMOVAR_EPP_VALORE@"; $PROMOVAR_EPP_VALORE)
$template:=Replace string:C233($template; "@THRESHOLD@"; $THRESHOLD)
$template:=Replace string:C233($template; "@RewardDescription40@"; $RewardDescription40)
$template:=Replace string:C233($template; "@PROMOVAR_RP@"; $PROMOVAR_RP)
$template:=Replace string:C233($template; "@RECORD_M15@"; $RECORD_M15)

C_OBJECT:C1216($promozione)
$idPromozione:=Generate UUID:C1066
OB SET:C1220($promozione; "id"; $idPromozione)
OB SET:C1220($promozione; "codice"; $codicePromozione)
OB SET:C1220($promozione; "codiceCatalina"; 0)
OB SET:C1220($promozione; "tipo"; "0503")
OB SET:C1220($promozione; "sottoTipo"; "")
OB SET:C1220($promozione; "descrizione"; "SEGMENTO 6 - SCVTRX - "+$1)
OB SET:C1220($promozione; "ripetibilita"; 1)
OB SET:C1220($promozione; "dataInizio"; !2022-01-28!)
OB SET:C1220($promozione; "dataFine"; !2022-01-31!)
OB SET:C1220($promozione; "oraInizio"; "00:00:00")
OB SET:C1220($promozione; "oraFine"; "23:59:00")
OB SET:C1220($promozione; "calendarioSettimanale"; "1111111")
OB SET:C1220($promozione; "tipoCliente"; 1)
OB SET:C1220($promozione; "categoria"; 0)
OB SET:C1220($promozione; "sottoreparti"; 0)
OB SET:C1220($promozione; "bozza"; 0)
OB SET:C1220($promozione; "stampato"; 0)
OB SET:C1220($promozione; "pmt"; 1)
OB SET:C1220($promozione; "barcode"; "")
OB SET:C1220($promozione; "testo"; $template)

C_OBJECT:C1216($ricompensa)
ARRAY OBJECT:C1221($ricompense; 0)
OB SET:C1220($ricompensa; "id"; Generate UUID:C1066)
OB SET:C1220($ricompensa; "idPromozioni"; $idPromozione)
OB SET:C1220($ricompensa; "soglia"; 25)
OB SET:C1220($ricompensa; "ammontare"; 5)
OB SET:C1220($ricompensa; "limiteSconto"; 0)
OB SET:C1220($ricompensa; "taglio"; 0.01)
OB SET:C1220($ricompensa; "descrizione"; "SCONTO")
OB SET:C1220($ricompensa; "recordM"; "00:0503-"+String:C10($codicePromozione))
OB SET:C1220($ricompensa; "accumulatore"; "")
OB SET:C1220($ricompensa; "promovar"; Num:C11($3))
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
				If ($codice=$1)
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

