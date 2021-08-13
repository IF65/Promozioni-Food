//%attributes = {}
//ARRAY TEXT($arHeaderNames; 0)
//ARRAY TEXT($arHeaderValues; 0)
//APPEND TO ARRAY($arHeaderNames; "Content-Type")
//APPEND TO ARRAY($arHeaderValues; "application/json")

////parametri
//C_OBJECT($request)
//OB SET($request; "function"; "recuperaFatture")


//$body:=JSON Stringify($request)

//$sql:="/eDatacollect/src/eDatacollect.php"
//C_TEXT($response)

//<>error:=0
//HTTP SET OPTION(HTTP timeout; 45)
//ON ERR CALL("utlOnErrCall")
//$httpResponse:=HTTP Request(HTTP POST method; <>qServer+$sql; $body; $response; $arHeaderNames; $arHeaderValues)
//ON ERR CALL("")
//If ($httpResponse=200) & (<>error=0)
//SET TEXT TO PASTEBOARD($response)
//End if 

