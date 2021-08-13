//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 20/07/21, 07:55:25
// ----------------------------------------------------
// Method: mapEod
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_TEXT:C284($0)
C_LONGINT:C283($1)

// eod(flag)
// 0 = la giornata è in caricamento o conclusa e il calcolo finale non è ancora stato
// 1 = la giornata è conclusa ed è stato fatto il calcolo finale degli importi

Case of 
	: ($1=0)
		$0:="GIORNATA APERTA"
	: ($1=1)
		$0:="CHIUSURA EFFETTUATA"
	Else 
		$0:="INDEFINITO"
End case 