//%attributes = {}
ARRAY LONGINT:C221($arCodiceCatalina; 0)
ARRAY REAL:C219($arImporto; 0)
ARRAY TEXT:C222($arTipo; 0)
ARRAY REAL:C219($arSoglia; 0)
ARRAY DATE:C224($arInizio; 0)
ARRAY DATE:C224($aFine; 0)

APPEND TO ARRAY:C911($arCodiceCatalina; 57734047)
APPEND TO ARRAY:C911($arImporto; 3)
APPEND TO ARRAY:C911($arTipo; "0503")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-07-29!)
APPEND TO ARRAY:C911($aBarcode; "9882182203001")

APPEND TO ARRAY:C911($arCodiceCatalina; 11768308)
APPEND TO ARRAY:C911($arImporto; 3)
APPEND TO ARRAY:C911($arTipo; "0503")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-07-29!)
APPEND TO ARRAY:C911($aBarcode; "9882182303008")

APPEND TO ARRAY:C911($arCodiceCatalina; 18922466)
APPEND TO ARRAY:C911($arImporto; 3)
APPEND TO ARRAY:C911($arTipo; "0503")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-07-29!)
APPEND TO ARRAY:C911($aBarcode; "9882182403005")

APPEND TO ARRAY:C911($arCodiceCatalina; 79047216)
APPEND TO ARRAY:C911($arImporto; 3)
APPEND TO ARRAY:C911($arTipo; "0503")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-07-29!)
APPEND TO ARRAY:C911($aBarcode; "9882182503002")

APPEND TO ARRAY:C911($arCodiceCatalina; 90748743)
APPEND TO ARRAY:C911($arImporto; 3)
APPEND TO ARRAY:C911($arTipo; "0503")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-08-01!)
APPEND TO ARRAY:C911($aBarcode; "9882182603009")

APPEND TO ARRAY:C911($arCodiceCatalina; 59955226)
APPEND TO ARRAY:C911($arImporto; 3)
APPEND TO ARRAY:C911($arTipo; "0503")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-08-01!)
APPEND TO ARRAY:C911($aBarcode; "9882182703006")

APPEND TO ARRAY:C911($arCodiceCatalina; 11855869)
APPEND TO ARRAY:C911($arImporto; 3)
APPEND TO ARRAY:C911($arTipo; "0503")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-08-04!)
APPEND TO ARRAY:C911($aBarcode; "9882182803003")

APPEND TO ARRAY:C911($arCodiceCatalina; 97830290)
APPEND TO ARRAY:C911($arImporto; 3)
APPEND TO ARRAY:C911($arTipo; "0503")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-05-24!)
APPEND TO ARRAY:C911($aFine; !2021-08-04!)
APPEND TO ARRAY:C911($aBarcode; "9882182903000")

APPEND TO ARRAY:C911($arCodiceCatalina; 50353110)
APPEND TO ARRAY:C911($arImporto; 3)
APPEND TO ARRAY:C911($arTipo; "0503")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-06-07!)
APPEND TO ARRAY:C911($aFine; !2021-06-20!)
APPEND TO ARRAY:C911($aBarcode; "9882183003006")

APPEND TO ARRAY:C911($arCodiceCatalina; 9429657)
APPEND TO ARRAY:C911($arImporto; 3)
APPEND TO ARRAY:C911($arTipo; "0503")
APPEND TO ARRAY:C911($arSoglia; 30)
APPEND TO ARRAY:C911($arInizio; !2021-07-05!)
APPEND TO ARRAY:C911($aFine; !2021-07-18!)
APPEND TO ARRAY:C911($aBarcode; "9882183103003")


For ($i; 1; Size of array:C274($arInizio))
	catalinaCaricamento_0503($arCodiceCatalina{$i}; $arSoglia{$i}; $arImporto{$i}; $arInizio{$i}; $aFine{$i}; ->$aBarcode{$i})
End for 
