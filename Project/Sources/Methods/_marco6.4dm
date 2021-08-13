//%attributes = {}

ARRAY LONGINT:C221($idCatalina; 0)
ARRAY DATE:C224($inizio; 0)
ARRAY DATE:C224($fine; 0)
ARRAY REAL:C219($soglia; 0)
ARRAY TEXT:C222($barcode1; 0)

APPEND TO ARRAY:C911($idCatalina; 0)
APPEND TO ARRAY:C911($inizio; !2021-07-28!)
APPEND TO ARRAY:C911($fine; !2021-09-30!)
APPEND TO ARRAY:C911($soglia; 0)
APPEND TO ARRAY:C911($barcode1; "")
APPEND TO ARRAY:C911($articoli1; "2001504")
APPEND TO ARRAY:C911($barcode2; "")
APPEND TO ARRAY:C911($articoli2; "")
APPEND TO ARRAY:C911($descrizione; "PELLETS 2021")


$sedi:="0203"

For ($i; 1; Size of array:C274($idCatalina))
	$result:=templateCaricamento_0054(\
		$idCatalina{$i}; \
		$descrizione{$i}; \
		$soglia{$i}; \
		20; \
		$inizio{$i}; \
		$fine{$i}; \
		$barcode1{$i}; \
		$articoli1{$i}; \
		$barcode2{$i}; \
		$articoli2{$i}; \
		$sedi\
		)
	
End for 

