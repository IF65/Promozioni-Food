//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 14/08/21, 10:09:12
// ----------------------------------------------------
// Method: mapPromoTipo2Descrizione
// Description
//
//
// Parameters
// ----------------------------------------------------

C_TEXT:C284($0)
C_TEXT:C284($1)

$n:=Find in array:C230(<>promoTipoCodice; $1)
If ($n>0)
	$0:=<>promoTipo{$n}
Else 
	$0:="0000 - TIPO NON DEFINITO"
End if 
