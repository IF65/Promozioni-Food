//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 20/07/21, 07:51:09
// ----------------------------------------------------
// Method: mapStatus
// Description
// 
//
// Parameters
// ----------------------------------------------------

C_TEXT:C284($0)
C_LONGINT:C283($1)

// status(flag)
// 0=caricamento dati in attesa di cominciare o in corso
// 1=caricamento in corso ma giornata fiscalmente chiusa(dati spostati da idc=>idc_eod su mtx)
// 2=giornata fiscalmente chiusa e completamente caricata(è verificato che l'ultimo sequencenumber sia già stato caricato)
// 3=negozio non aperto al pubblico.

Case of 
	: ($1=0)
		$0:="CARICAMENTO IN CORSO"
	: ($1=1)
		$0:="CARICAMENTO TERMINATO"
	: ($1=2)
		$0:="GIORNATA TERMINATA"
	Else 
		$0:="NEGOZIO NON APERTO"
End case 
