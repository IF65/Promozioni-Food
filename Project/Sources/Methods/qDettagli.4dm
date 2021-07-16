//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 15/04/21, 16:01:40
// ----------------------------------------------------
// Method: qDettagli
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
		C_LONGINT:C283(<>quadrature)
		If (<>quadrature=0)
			<>quadrature:=New process:C317("qDettagli"; 1024*1024; "Dettagli Quadrature"; "creaFinestra"; *)
		Else 
			SHOW PROCESS:C325(<>quadrature)
			BRING TO FRONT:C326(<>quadrature)
		End if 
	: ($azione="creaFinestra")
		$wRef:=Open form window:C675("qDettagli"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		DIALOG:C40("qDettagli")
		
		
	: ($azione="inizializzaArray")
		
		
	: ($azione="caricaArray")
		
		
		
End case 
