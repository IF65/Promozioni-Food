//%attributes = {}
// ----------------------------------------------------
// User name (OS): if65
// Date and time: 22/07/21, 11:00:58
// ----------------------------------------------------
// Method: filterDatacollect
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_OBJECT:C1216($1)

C_TEXT:C284($2)
C_LONGINT:C283($3)

If (Count parameters:C259=1)
	$1.result:=True:C214
Else 
	$1.result:=False:C215
	
	$regex:="^.{4}:"+$2+":.{13}:"+String:C10($3; "0000")
	If (utlMatchRegex($regex; $1.value.row))
		$1.result:=True:C214
	End if 
End if 
