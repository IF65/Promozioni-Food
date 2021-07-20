//%attributes = {}

  // ----------------------------------------------------
  // User name (OS): if65
  // Date and time: 19/07/21, 08:45:57
  // ----------------------------------------------------
  // Method: qQuadratureModifica
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
		C_LONGINT:C283(<>quadratureModifica)
		If (<>quadratureModifica=0)
			<>quadratureModifica:=New process:C317("qQuadratureModifica";1024*1024;"Modifica Quadratura";"creaFinestra";*)
		Else 
			SHOW PROCESS:C325(<>quadratureModifica)
			BRING TO FRONT:C326(<>quadratureModifica)
		End if 
	: ($azione="creaFinestra")
		$wRef:=Open form window:C675("qQuadratureModifica";Plain form window:K39:10;Horizontally centered:K39:1;Vertically centered:K39:4)
		DIALOG:C40("qQuadratureModifica")
		If (ok=1)
			  //pfPromozioniInserimento ("salvaPromozione")
		End if 
		
End case 
