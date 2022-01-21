//%attributes = {}

C_TEXT:C284($1; $vpArea_t)
C_TEXT:C284($cmd)

If (Count parameters:C259>0)
	$vpArea_t:=$1
	
	
	VP EXPORT DOCUMENT($vpArea_t; "/Users/if65/Desktop/tempVP.xlsx")
	
End if 

//C_TEXT($1)

//$vpAreaName:=$1

//$defaultStyle:=VP Get cell style(VP All($vpAreaName; vk current sheet))

///*$workBook:=VP Export to object($vpAreaName)
//$workBook.spreadJS.sheetCount:=1
//VP IMPORT FROM OBJECT($vpAreaName; $workBook)*/

//C_OBJECT($column; $rows; $properties)

//// definizione stili
//$titleStyle:=OB Copy($defaultStyle)
//$titleStyle.hAlign:=vk horizontal align center
//$titleStyle.vAlign:=vk vertical align center
//$titleStyle.wordWrap:=True
//VP SET CELL STYLE(VP Row($vpAreaName; 0); $titleStyle)

//$style:=OB Copy($defaultStyle)
//$style.formatter:="yyyy-mm-dd"
//$style.hAlign:=vk horizontal align center
//$style.vAlign:=vk vertical align center
//VP SET CELL STYLE(VP Column($vpAreaName; 2; 2); $style)


//// definizione righe
//$rows:=VP All($vpAreaName; vk current sheet)
//$properties:=New object("height"; 24; "resizable"; True)
//VP SET ROW ATTRIBUTES($rows; $properties)

//$row:=VP Row($vpAreaName; 0)
//$properties:=New object("height"; 48; "resizable"; True)
//VP SET ROW ATTRIBUTES($row; $properties)


//// definizione colonne
//$column:=VP Column($vpAreaName; 0)
//$properties:=New object("width"; 100; "resizable"; True)
//VP SET COLUMN ATTRIBUTES($column; $properties)
//VP SET TEXT VALUE(VP Cell($vpAreaName; 0; 0); "Codice")

//$column:=VP Column($vpAreaName; 1)
//$properties:=New object("width"; 120; "resizable"; True)
//VP SET COLUMN ATTRIBUTES($column; $properties)
//VP SET TEXT VALUE(VP Cell($vpAreaName; 1; 0); "Codice Catalina")

//$column:=VP Column($vpAreaName; 2)
//$properties:=New object("width"; 90; "resizable"; True)
//VP SET COLUMN ATTRIBUTES($column; $properties)
//VP SET TEXT VALUE(VP Cell($vpAreaName; 2; 0); "Inizio")

//$column:=VP Column($vpAreaName; 3)
//$properties:=New object("width"; 90; "resizable"; True)
//VP SET COLUMN ATTRIBUTES($column; $properties)
//VP SET TEXT VALUE(VP Cell($vpAreaName; 3; 0); "Fine")

//$column:=VP Column($vpAreaName; 4)
//$properties:=New object("width"; 90; "resizable"; True)
//VP SET COLUMN ATTRIBUTES($column; $properties)
//VP SET TEXT VALUE(VP Cell($vpAreaName; 4; 0); "Codice Articolo")

//$column:=VP Column($vpAreaName; 5)
//$properties:=New object("width"; 110; "resizable"; True)
//VP SET COLUMN ATTRIBUTES($column; $properties)
//VP SET TEXT VALUE(VP Cell($vpAreaName; 5; 0); "Barcode")

//$column:=VP Column($vpAreaName; 6)
//$properties:=New object("width"; 200; "resizable"; True)
//VP SET COLUMN ATTRIBUTES($column; $properties)
//VP SET TEXT VALUE(VP Cell($vpAreaName; 6; 0); "Descrizione Articolo")

//$column:=VP Column($vpAreaName; 7)
//$properties:=New object("width"; 110; "resizable"; True)
//VP SET COLUMN ATTRIBUTES($column; $properties)
//VP SET TEXT VALUE(VP Cell($vpAreaName; 7; 0); "Barcode Trigger")

//$column:=VP Column($vpAreaName; 8)
//$properties:=New object("width"; 60; "resizable"; True)
//VP SET COLUMN ATTRIBUTES($column; $properties)
//VP SET TEXT VALUE(VP Cell($vpAreaName; 8; 0); "% Sconto")

//$column:=VP Column($vpAreaName; 9)
//$properties:=New object("width"; 50; "resizable"; True)
//VP SET COLUMN ATTRIBUTES($column; $properties)
//VP SET TEXT VALUE(VP Cell($vpAreaName; 8; 0); "Soglia")

//$column:=VP Column($vpAreaName; 9)
//$properties:=New object("width"; 110; "resizable"; True)
//VP SET COLUMN ATTRIBUTES($column; $properties)
//VP SET TEXT VALUE(VP Cell($vpAreaName; 9; 0); "Nimis")

//VP EXPORT DOCUMENT($vpAreaName; "/Users/if65/Desktop/test.xlsx")







