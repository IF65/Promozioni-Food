//%attributes = {}

ARRAY LONGINT:C221($idCatalina;0)
ARRAY DATE:C224($inizio;0)
ARRAY DATE:C224($fine;0)
ARRAY REAL:C219($soglia;0)
ARRAY TEXT:C222($barcode1;0)

  //APPEND TO ARRAY($idCatalina;86314457)
  //APPEND TO ARRAY($inizio;!2021-09-06!)
  //APPEND TO ARRAY($fine;!2021-09-19!)
  //APPEND TO ARRAY($soglia;1.09)
  //APPEND TO ARRAY($barcode1;"")
  //APPEND TO ARRAY($articoli1;"")
  //APPEND TO ARRAY($barcode2;"")
  //APPEND TO ARRAY($articoli2;"")
  //APPEND TO ARRAY($descrizione;"REGALO ACQUA NATURALE")

APPEND TO ARRAY:C911($idCatalina;44982331)
APPEND TO ARRAY:C911($inizio;!2021-07-26!)
APPEND TO ARRAY:C911($fine;!2021-08-08!)
APPEND TO ARRAY:C911($soglia;30)
APPEND TO ARRAY:C911($barcode1;"")
APPEND TO ARRAY:C911($articoli1;"")
APPEND TO ARRAY:C911($barcode2;"")
APPEND TO ARRAY:C911($articoli2;"2175657")
APPEND TO ARRAY:C911($descrizione;"REGALO DET. CHANTECLAIR")

  //APPEND TO ARRAY($idCatalina;23955802)
  //APPEND TO ARRAY($inizio;!2021-09-06!)
  //APPEND TO ARRAY($fine;!2021-09-19!)
  //APPEND TO ARRAY($soglia;1.09)
  //APPEND TO ARRAY($barcode1;"")
  //APPEND TO ARRAY($articoli1;"")
  //APPEND TO ARRAY($barcode2;"")
  //APPEND TO ARRAY($articoli2;"")
  //APPEND TO ARRAY($descrizione;"REGALO ACQUA NATURALE")

APPEND TO ARRAY:C911($idCatalina;7469527)
APPEND TO ARRAY:C911($inizio;!2021-07-26!)
APPEND TO ARRAY:C911($fine;!2021-08-11!)
APPEND TO ARRAY:C911($soglia;30)
APPEND TO ARRAY:C911($barcode1;"")
APPEND TO ARRAY:C911($articoli1;"")
APPEND TO ARRAY:C911($barcode2;"")
APPEND TO ARRAY:C911($articoli2;"2175657")
APPEND TO ARRAY:C911($descrizione;"REGALO DET. CHANTECLAIR")

  //APPEND TO ARRAY($idCatalina;76245581)
  //APPEND TO ARRAY($inizio;!2021-09-06!)
  //APPEND TO ARRAY($fine;!2021-09-22!)
  //APPEND TO ARRAY($soglia;0.95)
  //APPEND TO ARRAY($barcode1;"")
  //APPEND TO ARRAY($articoli1;"")
  //APPEND TO ARRAY($barcode2;"")
  //APPEND TO ARRAY($articoli2;"")
  //APPEND TO ARRAY($descrizione;"REGALO LATTE UHT")

APPEND TO ARRAY:C911($idCatalina;48586527)
APPEND TO ARRAY:C911($inizio;!2021-07-26!)
APPEND TO ARRAY:C911($fine;!2021-08-11!)
APPEND TO ARRAY:C911($soglia;80)
APPEND TO ARRAY:C911($barcode1;"")
APPEND TO ARRAY:C911($articoli1;"")
APPEND TO ARRAY:C911($barcode2;"")
APPEND TO ARRAY:C911($articoli2;"0602155")
APPEND TO ARRAY:C911($descrizione;"REGALO POLPA MUTTI")

APPEND TO ARRAY:C911($idCatalina;98828696)
APPEND TO ARRAY:C911($inizio;!2021-07-26!)
APPEND TO ARRAY:C911($fine;!2021-08-15!)
APPEND TO ARRAY:C911($soglia;35)
APPEND TO ARRAY:C911($barcode1;"")
APPEND TO ARRAY:C911($articoli1;"")
APPEND TO ARRAY:C911($barcode2;"")
APPEND TO ARRAY:C911($articoli2;"2175657")
APPEND TO ARRAY:C911($descrizione;"REGALO DET. CHANTECLAIR")

APPEND TO ARRAY:C911($idCatalina;30739383)
APPEND TO ARRAY:C911($inizio;!2021-07-26!)
APPEND TO ARRAY:C911($fine;!2021-08-08!)
APPEND TO ARRAY:C911($soglia;30)
APPEND TO ARRAY:C911($barcode1;"")
APPEND TO ARRAY:C911($articoli1;"")
APPEND TO ARRAY:C911($barcode2;"")
APPEND TO ARRAY:C911($articoli2;"2175657")
APPEND TO ARRAY:C911($descrizione;"REGALO DET. CHANTECLAIR")

$sedi:="0203"

For ($i;1;Size of array:C274($idCatalina))
	$result:=templateCaricamento_0054 (\
		$idCatalina{$i};\
		$descrizione{$i};\
		$soglia{$i};\
		100;\
		$inizio{$i};\
		$fine{$i};\
		$barcode1{$i};\
		$articoli1{$i};\
		$barcode2{$i};\
		$articoli2{$i};\
		$sedi\
		)
	
End for 

