//%attributes = {}
ARRAY LONGINT:C221($arCodiceCatalina; 0)
ARRAY TEXT:C222($arDescrizione; 0)
ARRAY REAL:C219($arSoglia; 0)
ARRAY REAL:C219($arImporto; 0)
ARRAY DATE:C224($arInizio; 0)
ARRAY DATE:C224($arFine; 0)
ARRAY TEXT:C222($arBarcode; 0)

APPEND TO ARRAY:C911($arCodiceCatalina; 15785311)
APPEND TO ARRAY:C911($arDescrizione; "BOLLONE FRANCIACORTA")
APPEND TO ARRAY:C911($arSoglia; 0)
APPEND TO ARRAY:C911($arImporto; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($arFine; !2021-07-29!)
APPEND TO ARRAY:C911($arBarcode; "9980120000313")

APPEND TO ARRAY:C911($arCodiceCatalina; 78823401)
APPEND TO ARRAY:C911($arDescrizione; "BOLLONE FRANCIACORTA")
APPEND TO ARRAY:C911($arSoglia; 0)
APPEND TO ARRAY:C911($arImporto; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($arFine; !2021-07-29!)
APPEND TO ARRAY:C911($arBarcode; "9980120000245")

APPEND TO ARRAY:C911($arCodiceCatalina; 8314999)
APPEND TO ARRAY:C911($arDescrizione; "BOLLONE FRANCIACORTA")
APPEND TO ARRAY:C911($arSoglia; 0)
APPEND TO ARRAY:C911($arImporto; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($arFine; !2021-07-29!)
APPEND TO ARRAY:C911($arBarcode; "9980120000252")

APPEND TO ARRAY:C911($arCodiceCatalina; 58991504)
APPEND TO ARRAY:C911($arDescrizione; "BOLLONE FRANCIACORTA")
APPEND TO ARRAY:C911($arSoglia; 0)
APPEND TO ARRAY:C911($arImporto; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($arFine; !2021-07-29!)
APPEND TO ARRAY:C911($arBarcode; "9980120000269")

APPEND TO ARRAY:C911($arCodiceCatalina; 89936958)
APPEND TO ARRAY:C911($arDescrizione; "BOLLONE FRANCIACORTA")
APPEND TO ARRAY:C911($arSoglia; 0)
APPEND TO ARRAY:C911($arImporto; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($arFine; !2021-08-01!)
APPEND TO ARRAY:C911($arBarcode; "9980120000276")

APPEND TO ARRAY:C911($arCodiceCatalina; 59164127)
APPEND TO ARRAY:C911($arDescrizione; "BOLLONE FRANCIACORTA")
APPEND TO ARRAY:C911($arSoglia; 0)
APPEND TO ARRAY:C911($arImporto; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($arFine; !2021-08-01!)
APPEND TO ARRAY:C911($arBarcode; "9980120000283")

APPEND TO ARRAY:C911($arCodiceCatalina; 96083036)
APPEND TO ARRAY:C911($arDescrizione; "BOLLONE FRANCIACORTA")
APPEND TO ARRAY:C911($arSoglia; 0)
APPEND TO ARRAY:C911($arImporto; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($arFine; !2021-08-04!)
APPEND TO ARRAY:C911($arBarcode; "9980120000290")

APPEND TO ARRAY:C911($arCodiceCatalina; 89959393)
APPEND TO ARRAY:C911($arDescrizione; "BOLLONE FRANCIACORTA")
APPEND TO ARRAY:C911($arSoglia; 0)
APPEND TO ARRAY:C911($arImporto; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($arFine; !2021-08-04!)
APPEND TO ARRAY:C911($arBarcode; "9980120000306")


For ($i; 1; Size of array:C274($arInizio))
	catalinaCaricamento_0492($arCodiceCatalina{$i}; $arDescrizione{$i}; $arSoglia{$i}; $arImporto{$i}; $arInizio{$i}; $arFine{$i}; $arBarcode{$i})
End for 
