//%attributes = {}
// ----------------------------------------------------
// User name (OS): if65
// Date and time: 19/12/19, 22:02:38
// ----------------------------------------------------
// Method: pfPromozioniInserimento
// Description
// 
//
// Parameters
// ----------------------------------------------------
C_TEXT:C284($1)
C_LONGINT:C283($2)

$azione:=""
If (Count parameters:C259>=1)
	$azione:=$1
End if 

Case of 
	: ($azione="") | ($azione="creaFinestra")
		$wRef:=Open form window:C675("pfPromozioniInserimento1"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		DIALOG:C40("pfPromozioniInserimento1")
		If (ok=1)
			
		End if 
		
		
End case 
