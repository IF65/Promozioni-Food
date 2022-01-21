//%attributes = {}
ARRAY LONGINT:C221($arCodiceCatalina; 0)
ARRAY TEXT:C222($arDescrizione; 0)
ARRAY REAL:C219($arImporto; 0)
ARRAY TEXT:C222($arTipo; 0)
ARRAY REAL:C219($arSoglia; 0)
ARRAY DATE:C224($arInizio; 0)
ARRAY DATE:C224($arFine; 0)
ARRAY TEXT:C222($arBarcode; 0)

APPEND TO ARRAY:C911($arCodiceCatalina; 66724247)
APPEND TO ARRAY:C911($arDescrizione; "LATTICINI")
APPEND TO ARRAY:C911($arImporto; 1.5)
APPEND TO ARRAY:C911($arTipo; "0481")
APPEND TO ARRAY:C911($arSoglia; 6)
APPEND TO ARRAY:C911($arInizio; !2021-11-01!)
APPEND TO ARRAY:C911($arFine; !2021-11-14!)
APPEND TO ARRAY:C911($arBarcode; "")







For ($i; 1; Size of array:C274($arInizio))
	templateCaricamento_0054($arCodiceCatalina{$i}; $arDescrizione{$i}; $arSoglia{$i}; $arImporto{$i}; $arInizio{$i}; $arFine{$i}; ->$arBarcode{$i})
End for 

$text:=""
For ($i; 1; Size of array:C274($arBarcode))
	$text:=$text+String:C10($arCodiceCatalina{$i})+"\t"+$arBarcode{$i}+"\n"
End for 
SET TEXT TO PASTEBOARD:C523($text)
