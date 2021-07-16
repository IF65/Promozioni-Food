//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 15/03/20, 11:34:09
// ----------------------------------------------------
// Method: pfCatalina
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
	: ($azione="")
		C_LONGINT:C283(<>catalina)
		If (<>catalina=0)
			<>catalina:=New process:C317("pfCatalina"; 1024*1024; "Catalina Caricamento Promozioni"; "creaFinestra"; *)
		Else 
			SHOW PROCESS:C325(<>catalina)
			BRING TO FRONT:C326(<>catalina)
		End if 
	: ($azione="creaFinestra")
		pfNegozi("inizializza")
		$wRef:=Open form window:C675("pfCatalina"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
		DIALOG:C40("pfCatalina")
		If (ok=1)
			
		End if 
		
	: ($azione="caricaFile")
		C_TIME:C306($f)
		$ref:=Open document:C264(""; ".xlsx"; Get pathname:K24:6)
		If (ok=1)
			If (Test path name:C476(document)=Is a document:K24:1)
				CLOSE DOCUMENT:C267($ref)
				VP IMPORT DOCUMENT("vpImport"; document)
			End if 
		End if 
End case 
