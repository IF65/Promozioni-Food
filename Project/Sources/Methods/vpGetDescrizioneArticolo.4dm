//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 27/05/21, 10:42:03
// ----------------------------------------------------
// Method: vpGetDescrizioneArticolo
// Description
// 
//
// Parameters
// ---------------------------------------------------

C_TEXT:C284($0)
C_TEXT:C284($1)

$0:=""

$codice:="0005050"
If (Count parameters:C259=1)
	$codice:=$1
End if 

ARRAY TEXT:C222($arHeaderNames; 0)
ARRAY TEXT:C222($arHeaderValues; 0)
APPEND TO ARRAY:C911($arHeaderNames; "Content-Type")
APPEND TO ARRAY:C911($arHeaderValues; "application/json")
C_OBJECT:C1216($request)
OB SET:C1220($request; "function"; "cercaArticolo")
OB SET:C1220($request; "codice"; $codice)

$body:=JSON Stringify:C1217($request)
//SET TEXT TO PASTEBOARD($body)
$sql:="/promozioni/src/promozioni.php"
C_TEXT:C284($response)

<>error:=0
HTTP SET OPTION:C1160(HTTP timeout:K71:10; 30)
ON ERR CALL:C155("utlOnErrCall")
$httpResponse:=HTTP Request:C1158(HTTP POST method:K71:2; <>itmServer+$sql; $body; $response; $arHeaderNames; $arHeaderValues)
ON ERR CALL:C155("")
If ($httpResponse=200) & (<>error=0)
	ARRAY OBJECT:C1221($articoli; 0)
	$articolo:=JSON PARSE ARRAY:C1219($response; $articoli)
	$0:=OB Get:C1224($articoli{1}; "descrizione"; Is text:K8:3)
End if 