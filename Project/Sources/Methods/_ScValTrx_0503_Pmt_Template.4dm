//%attributes = {}

// ----------------------------------------------------
// User name (OS): if65
// Date and time: 27/01/22, 15:30:07
// ----------------------------------------------------
// Method: _ScValTrx_0503_Pmt_Template
// Description
// restituisce il template utilizzato in formato testo
//
// Parameters
// ----------------------------------------------------

C_TEXT:C284($0)

$template:=""
$template:=$template+"3.01.02,@STATUS@,@PROMOTION_NUMBER@,7,@Description@,@STARTING_DATE@,0,@ENDING_DATE@,2359,@PromoLimit@,@PromovarLimite@,0,,,,,0,20,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,@ActivationDays@,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,1,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0"
$template:=$template+",0,9,1,0,@THRESHOLD@,0,0,0,,,,,,,,,,,,0,0,4,0,0,0,0,0,6,@PROMOVAR_EPP_OPERATORE_CONFRONTO@,@PROMOVAR_EPP@,@PROMOVAR_EPP_VALORE@,0,0,0,,,,,,,,,,,,0,0,5,0,1,0,0,0,0,0,0,@AMOUNT@,0,0,1,1,0,4,1,;,;,;,;,;,;,1;@RewardDescription40@;000;00;000;D6            "
$template:=$template+" ;          ;,;,;,;,;,;,0,0,6,0,1,0,0,0,16,0,@PROMOVAR_RP@,1,0,0,1,1,0,4,1,;,;,;,;,;,;,0;@RewardDescription40@;016;00;000;               ;          ;,;,;,;,;,;,0,0,7,0,1,0,0,0,29,0,0,0,0,0,1,1,0,4,1,;,;,;,;,;,;,1;@RewardDescription40@;136;00;000;     "
$template:=$template+"          ;          ;__@RECORD_M15@,;,;,;,;,;,0,0"

$0:=$template