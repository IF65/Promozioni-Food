//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 06/05/21, 11:19:24
// ----------------------------------------------------
// Method: utlQuadratureCaricaDettagli
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_TEXT:C284($0)
C_TEXT:C284($1)
C_DATE:C307($2)

$0:="{}"

ARRAY TEXT:C222($arHeaderNames; 0)
ARRAY TEXT:C222($arHeaderValues; 0)
APPEND TO ARRAY:C911($arHeaderNames; "Content-Type")
APPEND TO ARRAY:C911($arHeaderValues; "application/json")
C_OBJECT:C1216($request)
OB SET:C1220($request; "function"; "caricaDettagli")
OB SET:C1220($request; "sede"; $1)
OB SET:C1220($request; "data"; $2)

$body:=JSON Stringify:C1217($request)
//SET TEXT TO PASTEBOARD($body)
$sql:="/cruscottoQuadrature"
C_TEXT:C284($response)

<>error:=0
HTTP SET OPTION:C1160(HTTP timeout:K71:10; 30)
ON ERR CALL:C155("utlOnErrCall")
$httpResponse:=HTTP Request:C1158(HTTP POST method:K71:2; "10.11.14.74"+$sql; $body; $response; $arHeaderNames; $arHeaderValues)
ON ERR CALL:C155("")
If ($httpResponse=200) & (<>error=0)
	$0:=$response
End if 