//%attributes = {}
ARRAY LONGINT:C221($arCodiceCatalina; 0)
ARRAY TEXT:C222($arDescrizione; 0)
ARRAY REAL:C219($arImporto; 0)
ARRAY TEXT:C222($arTipo; 0)
ARRAY REAL:C219($arSoglia; 0)
ARRAY DATE:C224($arInizio; 0)
ARRAY DATE:C224($aFine; 0)

APPEND TO ARRAY:C911($arCodiceCatalina; 25017740)
APPEND TO ARRAY:C911($arDescrizione; "Total Store")
APPEND TO ARRAY:C911($arImporto; 300)
APPEND TO ARRAY:C911($arTipo; "ACPT")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-07-29!)
APPEND TO ARRAY:C911($arBarcode; "29907311")

APPEND TO ARRAY:C911($arCodiceCatalina; 76175287)
APPEND TO ARRAY:C911($arDescrizione; "Total Store")
APPEND TO ARRAY:C911($arImporto; 300)
APPEND TO ARRAY:C911($arTipo; "ACPT")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-07-29!)
APPEND TO ARRAY:C911($arBarcode; "29907328")

APPEND TO ARRAY:C911($arCodiceCatalina; 23850259)
APPEND TO ARRAY:C911($arDescrizione; "Total Store")
APPEND TO ARRAY:C911($arImporto; 300)
APPEND TO ARRAY:C911($arTipo; "ACPT")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-07-29!)
APPEND TO ARRAY:C911($arBarcode; "29907335")

APPEND TO ARRAY:C911($arCodiceCatalina; 72016191)
APPEND TO ARRAY:C911($arDescrizione; "Total Store")
APPEND TO ARRAY:C911($arImporto; 300)
APPEND TO ARRAY:C911($arTipo; "ACPT")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-07-29!)
APPEND TO ARRAY:C911($arBarcode; "29907342")

APPEND TO ARRAY:C911($arCodiceCatalina; 94977157)
APPEND TO ARRAY:C911($arDescrizione; "Total Store")
APPEND TO ARRAY:C911($arImporto; 300)
APPEND TO ARRAY:C911($arTipo; "ACPT")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-08-01!)
APPEND TO ARRAY:C911($arBarcode; "29907359")

APPEND TO ARRAY:C911($arCodiceCatalina; 13956612)
APPEND TO ARRAY:C911($arDescrizione; "Total Store")
APPEND TO ARRAY:C911($arImporto; 300)
APPEND TO ARRAY:C911($arTipo; "ACPT")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-08-01!)
APPEND TO ARRAY:C911($arBarcode; "29907366")

APPEND TO ARRAY:C911($arCodiceCatalina; 30670990)
APPEND TO ARRAY:C911($arDescrizione; "Total Store")
APPEND TO ARRAY:C911($arImporto; 300)
APPEND TO ARRAY:C911($arTipo; "ACPT")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-08-04!)
APPEND TO ARRAY:C911($arBarcode; "29907380")

APPEND TO ARRAY:C911($arCodiceCatalina; 53037665)
APPEND TO ARRAY:C911($arDescrizione; "Total Store")
APPEND TO ARRAY:C911($arImporto; 300)
APPEND TO ARRAY:C911($arTipo; "ACPT")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-08-04!)
APPEND TO ARRAY:C911($arBarcode; "29907373")



For ($i; 1; Size of array:C274($arInizio))
	catalinaCaricamento_ACPT($arCodiceCatalina{$i}; $arDescrizione{$i}; $arSoglia{$i}; $arImporto{$i}; $arInizio{$i}; $aFine{$i}; ->$arBarcode{$i})
End for 
