//%attributes = {}

  // ----------------------------------------------------
  // User name (OS): if65
  // Date and time: 02/07/21, 14:55:16
  // ----------------------------------------------------
  // Method: utlCreaPmtDeliveryDaTemplate
  // Description
  // 
  //
  // Parameters
  // ----------------------------------------------------

C_TEXT:C284($0)

C_TEXT:C284($1)
C_TEXT:C284($2)
C_LONGINT:C283($3)
C_DATE:C307($4)
C_DATE:C307($5)
C_REAL:C285($6)
C_REAL:C285($7)
C_REAL:C285($8)
C_POINTER:C301($9)

$stato:="A"
$tipo:="DELP"
$codice:="9993"
$dataInizio:=Replace string:C233(Substring:C12(String:C10(!2021-06-17!;ISO date:K1:8);1;10);"-";"")
$dataFine:=Replace string:C233(Substring:C12(String:C10(!2021-12-31!;ISO date:K1:8);1;10);"-";"")
$soglia:=90
$sconto:=100
$limite:=9
$barcode:=""

If (Count parameters:C259=9)
	$stato:=$1
	$tipo:=$2
	$codice:=String:C10($3)
	$dataInizio:=Replace string:C233(Substring:C12(String:C10($4;ISO date:K1:8);1;10);"-";"")
	$dataFine:=Replace string:C233(Substring:C12(String:C10($5;ISO date:K1:8);1;10);"-";"")
	
	$soglia:=$6
	$sconto:=$7
	$limite:=$8
	
	$barcode:=""
	For ($i;1;Size of array:C274($9->))
		$barcode:=$barcode+$9->{$i}
		If ($i<Size of array:C274($9->))
			$barcode:=$barcode+";"
		End if 
	End for 
End if 

$0:=""

Case of 
	: ($tipo="DELC")
		$template:="3.01.02,@STATUS@,@NUMBER@1,5,DELIVERY COLLI,@StartDate@,0,@EndDate@,2359,9,0,0,,,,,0,20,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,127,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,0,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0,0,6,1,1,0,0,0,0,,,,,,,,,,,,0,0,4,0,1,0,16,0,1,1,0,0,0,"+"0,1,1,0,4,1,@EanColli@;,;,;,;,;,;,0;DELIVERY COLLI                          ;001;00;000;               ;          ;,;,;,;,;,;,1,0,@ImportoSconto@,5,0,1,0,16,0,29,0,0,0,0,0,1,1,0,4,1,@EanColli@;,;,;,;,;,;,0;SCO                                     ;136;"+"00;000;               ;          ;__00:SCO       C3,;,;,;,;,;,0,0\n"
		$template:="3.01.02,@STATUS@,@NUMBER@1,5,DELIVERY COLLI,@StartDate@,0,@EndDate@,2359,@Limite@,0,0,,,,,0,20,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,127,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,0,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0,0,6,1,1,0,0,0,0,,,,,,,,,,,,0,0,4,0,1,0,16,0,1,1"+",0,0,0,0,1,1,0,4,1,@EanColli@;,;,;,;,;,;,0;DELIVERY COLLI                          ;001;00;000;               ;          ;,;,;,;,;,;,1,0,@ImportoSconto@,5,0,1,0,16,0,29,0,0,0,0,0,1,1,0,4,1,@EanColli@;,;,;,;,;,;,0;SCO                                   "+"  ;136;00;000;               ;          ;__00:SCO       C3,;,;,;,;,;,0,0\n"
		$template:="3.01.02,@STATUS@,@NUMBER@1,5,DELIVERY COLLI,@StartDate@,0,@EndDate@,2359,@Limite@,0,0,,,,,0,20,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,127,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,0,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0,0,6,1,1,0,0,0,0,,,,,,,,,,,,0,0,4,0,1,0,16,0,1,1"+",0,0,0,0,1,1,0,4,1,@EanColli@;,;,;,;,;,;,0;DELIVERY COLLI                          ;001;00;000;               ;          ;,;,;,;,;,;,1,0,@ImportoSconto@,5,0,1,0,16,0,29,0,0,0,0,0,1,1,0,4,1,@EanColli@;,;,;,;,;,;,0;SCO                                   "+"  ;136;00;000;               ;          ;__00:SCO       C3,;,;,;,;,;,0,0\n"
		
		$template:=Replace string:C233($template;"@EanColli@";$barcode)
		$template:=Replace string:C233($template;"@Limite@";String:C10(Int:C8($limite)))
		
	: ($tipo="DELV")
		$template:="3.01.02,@STATUS@,@NUMBER@2,7,DELIVERY SCV,@StartDate@,0,@EndDate@,2359,0,0,64,,,,,0,5,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,127,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,0,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0,0,9,1,0,@SogliaUno@,0,0,0,,,,,,,,,,,,0,0,4,0,0,0,0,0,6,5"+",9991,0,0,0,0,,,,,,,,,,,,0,0,5,0,1,0,16,0,0,0,0,@ImportoSconto@,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCV                            ;000;00;000;00:SCV       C2;          ;,;,;,;,;,;,0,0,6,0,1,0,0,0,29,0,0,0,0,0,1,1,0,4,1,@EanSpesaCon"+"segna@;,;,;,;,;,;,0;DELIVERY SCV                            ;136;00;000;               ;          ;__00:SCV       C2,;,;,;,;,;,0,0,7,0,1,0,64,65535,16,0,9991,1,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCV                            ;016;"+"00;000;               ;          ;,;,;,;,;,;,0,0\n"
		$template:="3.01.02,@STATUS@,@NUMBER@2,7,DELIVERY SCV,@StartDate@,0,@EndDate@,2359,0,0,64,,,,,0,5,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,127,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,0,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0,0,9,1,0,@SogliaUno@,0,0,0,,,,,,,,,,,,0,0,4,0,0,0,0,0,6,5"+",9991,0,0,0,0,,,,,,,,,,,,0,0,5,0,1,0,0,0,0,0,0,@ImportoSconto@,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCV                            ;000;00;000;00:SCV       C2;          ;,;,;,;,;,;,0,0,6,0,1,0,0,0,29,0,0,0,0,0,1,1,0,4,1,@EanSpesaCons"+"egna@;,;,;,;,;,;,0;DELIVERY SCV                            ;136;00;000;               ;          ;__00:SCV       C2,;,;,;,;,;,0,0,7,0,1,0,64,65535,16,0,9991,1,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCV                            ;016;0"+"0;000;               ;          ;,;,;,;,;,;,0,0\n"
		$template:="3.01.02,@STATUS@,@NUMBER@2,7,DELIVERY SCV,@StartDate@,0,@EndDate@,2359,0,0,64,,,,,0,5,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,127,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,0,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0,0,9,1,12,@SogliaUno@,0,0,0,,,,,,,,,,,,0,0,4,0,0,0,0,0,6,"+"5,9991,0,0,0,0,,,,,,,,,,,,0,0,5,0,1,0,0,0,0,0,0,@ImportoSconto@,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCV                            ;000;00;000;00:SCV       C2;          ;,;,;,;,;,;,0,0,6,0,1,0,0,0,29,0,0,0,0,0,1,1,0,4,1,@EanSpesaCon"+"segna@;,;,;,;,;,;,0;DELIVERY SCV                            ;136;00;000;               ;          ;__00:SCV       C2,;,;,;,;,;,0,0,7,0,1,0,64,65535,16,0,9991,1,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCV                            ;016;"+"00;000;               ;          ;,;,;,;,;,;,0,0\n"
		$template:="3.01.02,@STATUS@,@NUMBER@2,7,DELIVERY SCV,@StartDate@,0,@EndDate@,2359,0,0,64,,,,,0,5,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,127,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,0,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0,0,6,1,12,@SogliaUno@,0,0,0,,,,,,,,,,,,0,0,4,0,0,0,0,0,6,"+"5,9991,0,0,0,0,,,,,,,,,,,,0,0,5,0,1,0,0,0,0,0,0,@ImportoSconto@,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCV                            ;000;00;000;00:SCV       C2;          ;,;,;,;,;,;,0,0,6,0,1,0,0,0,29,0,0,0,0,0,1,1,0,4,1,@EanSpesaCon"+"segna@;,;,;,;,;,;,0;DELIVERY SCV                            ;136;00;000;               ;          ;__00:SCV       C2,;,;,;,;,;,0,0,7,0,1,0,64,65535,16,0,9991,1,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCV                            ;016;"+"00;000;               ;          ;,;,;,;,;,;,0,0\n"
		
		$template:=Replace string:C233($template;"@SogliaUno@";String:C10(Round:C94($soglia*100;0)))
		$template:=Replace string:C233($template;"@EanSpesaConsegna@";$barcode)
		
	: ($tipo="DELP")
		$template:="3.01.02,@STATUS@,@NUMBER@3,7,DELIVERY SCO,@StartDate@,0,@EndDate@,2359,0,0,64,,,,,0,20,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,127,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,0,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0,0,9,1,0,@SogliaDue@,0,0,0,,,,,,,,,,,,0,0,4,0,0,0,0,0,6,"+"5,9991,0,0,0,0,,,,,,,,,,,,0,0,5,0,1,0,16,0,1,1,0,0,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCO                            ;001;00;000;00:SCO       C3;          ;,;,;,;,;,;,1,0,@ImportoSconto@,6,0,1,0,0,0,29,0,0,0,0,0,1,1,0,4,1,@EanSpesa"+"Consegna@;,;,;,;,;,;,0;DELIVERY SCO                            ;136;00;000;               ;          ;__00:SCO       C3,;,;,;,;,;,0,0,7,0,1,0,0,65535,16,0,9991,1,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCO                           "+" ;016;00;000;               ;          ;,;,;,;,;,;,0,0\n"
		$template:="3.01.02,@STATUS@,@NUMBER@3,7,DELIVERY SCO,@StartDate@,0,@EndDate@,2359,0,0,64,,,,,0,20,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,127,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,0,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0,0,9,1,0,@SogliaDue@,0,0,0,,,,,,,,,,,,0,0,4,0,0,0,0,0,6,"+"5,9991,0,0,0,0,,,,,,,,,,,,0,0,5,0,1,0,0,0,1,1,0,0,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCO                            ;001;00;000;00:SCO       C3;          ;,;,;,;,;,;,1,0,@ImportoSconto@,6,0,1,0,0,0,29,0,0,0,0,0,1,1,0,4,1,@EanSp"+"esaConsegna@;,;,;,;,;,;,0;DELIVERY SCO                            ;136;00;000;               ;          ;__00:SCO       C3,;,;,;,;,;,0,0,7,0,1,0,0,65535,16,0,9991,1,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCO                            "+";016;00;000;               ;          ;,;,;,;,;,;,0,0\n"
		$template:="3.01.02,@STATUS@,@NUMBER@3,7,DELIVERY SCO,@StartDate@,0,@EndDate@,2359,0,0,64,,,,,0,20,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,127,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,0,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0,0,9,1,12,@SogliaDue@,0,0,0,,,,,,,,,,,,0,0,4,0,0,0,0,0,6"+",5,9991,0,0,0,0,,,,,,,,,,,,0,0,5,0,1,0,0,0,1,1,0,0,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCO                            ;001;00;000;00:SCO       C3;          ;,;,;,;,;,;,1,0,@ImportoSconto@,6,0,1,0,0,0,29,0,0,0,0,0,1,1,0,4,1,@EanS"+"pesaConsegna@;,;,;,;,;,;,0;DELIVERY SCO                            ;136;00;000;               ;          ;__00:SCO       C3,;,;,;,;,;,0,0,7,0,1,0,0,65535,16,0,9991,1,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCO                           "+" ;016;00;000;               ;          ;,;,;,;,;,;,0,0\n"
		$template:="3.01.02,@STATUS@,@NUMBER@3,7,DELIVERY SCO,@StartDate@,0,@EndDate@,2359,0,0,64,,,,,0,20,0,0,1,;,0,0,1,0,0,0,0,0,0,4,0,0,127,0,2359,,,,,,,,,,,,0,0,2,0,0,0,0,0,6,1,5,0,0,0,0,,,,,,,,,,,,0,0,3,0,0,0,0,0,6,1,12,@SogliaDue@,0,0,0,,,,,,,,,,,,0,0,4,0,0,0,0,0,6"+",5,9991,0,0,0,0,,,,,,,,,,,,0,0,5,0,1,0,0,0,1,1,0,0,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCO                            ;001;00;000;00:SCO       C3;          ;,;,;,;,;,;,1,0,@ImportoSconto@,6,0,1,0,0,0,29,0,0,0,0,0,1,1,0,4,1,@EanS"+"pesaConsegna@;,;,;,;,;,;,0;DELIVERY SCO                            ;136;00;000;               ;          ;__00:SCO       C3,;,;,;,;,;,0,0,7,0,1,0,0,65535,16,0,9991,1,0,0,1,1,0,4,1,@EanSpesaConsegna@;,;,;,;,;,;,0;DELIVERY SCO                           "+" ;016;00;000;               ;          ;,;,;,;,;,;,0,0\n"
		
		$template:=Replace string:C233($template;"@SogliaDue@";String:C10(Round:C94($soglia*100;0)))
		$template:=Replace string:C233($template;"@EanSpesaConsegna@";$barcode)
		
End case 

  // tag in comune
$template:=Replace string:C233($template;"@STATUS@";$stato)
$template:=Replace string:C233($template;"@NUMBER@";$codice)
$template:=Replace string:C233($template;"@StartDate@";$dataInizio)
$template:=Replace string:C233($template;"@EndDate@";$dataFine)
$template:=Replace string:C233($template;"@ImportoSconto@";String:C10(Round:C94($sconto*100;0)))

  //SET TEXT TO PASTEBOARD($template)
$0:=$template
