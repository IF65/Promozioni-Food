//%attributes = {}
C_TEXT:C284($1)

$vpAreaName:=$1

$defaultStyle:=VP Get cell style(VP All($vpAreaName; vk current sheet:K89:3))

$workBook:=VP Export to object($vpAreaName)
$workBook.spreadJS.sheetCount:=1
VP IMPORT FROM OBJECT($vpAreaName; $workBook)

C_OBJECT:C1216($column; $rows; $properties)

// definizione stili
$titleStyle:=OB Copy:C1225($defaultStyle)
$titleStyle.hAlign:=vk horizontal align center:K89:40
$titleStyle.vAlign:=vk vertical align center:K89:50
$titleStyle.wordWrap:=True:C214
VP SET CELL STYLE(VP Row($vpAreaName; 0); $titleStyle)

$style:=OB Copy:C1225($defaultStyle)
$style.formatter:="yyyy-mm-dd"
$style.hAlign:=vk horizontal align center:K89:40
$style.vAlign:=vk vertical align center:K89:50
VP SET CELL STYLE(VP Column($vpAreaName; 2; 2); $style)


// definizione righe
$rows:=VP All($vpAreaName; vk current sheet:K89:3)
$properties:=New object:C1471("height"; 24; "resizable"; True:C214)
VP SET ROW ATTRIBUTES($rows; $properties)

$row:=VP Row($vpAreaName; 0)
$properties:=New object:C1471("height"; 48; "resizable"; True:C214)
VP SET ROW ATTRIBUTES($row; $properties)


// definizione colonne
$column:=VP Column($vpAreaName; 0)
$properties:=New object:C1471("width"; 100; "resizable"; True:C214)
VP SET COLUMN ATTRIBUTES($column; $properties)
VP SET TEXT VALUE(VP Cell($vpAreaName; 0; 0); "Codice")

$column:=VP Column($vpAreaName; 1)
$properties:=New object:C1471("width"; 120; "resizable"; True:C214)
VP SET COLUMN ATTRIBUTES($column; $properties)
VP SET TEXT VALUE(VP Cell($vpAreaName; 1; 0); "Codice Catalina")

$column:=VP Column($vpAreaName; 2)
$properties:=New object:C1471("width"; 90; "resizable"; True:C214)
VP SET COLUMN ATTRIBUTES($column; $properties)
VP SET TEXT VALUE(VP Cell($vpAreaName; 2; 0); "Inizio")

$column:=VP Column($vpAreaName; 3)
$properties:=New object:C1471("width"; 90; "resizable"; True:C214)
VP SET COLUMN ATTRIBUTES($column; $properties)
VP SET TEXT VALUE(VP Cell($vpAreaName; 3; 0); "Fine")

$column:=VP Column($vpAreaName; 4)
$properties:=New object:C1471("width"; 90; "resizable"; True:C214)
VP SET COLUMN ATTRIBUTES($column; $properties)
VP SET TEXT VALUE(VP Cell($vpAreaName; 4; 0); "Codice Articolo")

$column:=VP Column($vpAreaName; 5)
$properties:=New object:C1471("width"; 110; "resizable"; True:C214)
VP SET COLUMN ATTRIBUTES($column; $properties)
VP SET TEXT VALUE(VP Cell($vpAreaName; 5; 0); "Barcode")

$column:=VP Column($vpAreaName; 6)
$properties:=New object:C1471("width"; 200; "resizable"; True:C214)
VP SET COLUMN ATTRIBUTES($column; $properties)
VP SET TEXT VALUE(VP Cell($vpAreaName; 6; 0); "Descrizione Articolo")

$column:=VP Column($vpAreaName; 7)
$properties:=New object:C1471("width"; 110; "resizable"; True:C214)
VP SET COLUMN ATTRIBUTES($column; $properties)
VP SET TEXT VALUE(VP Cell($vpAreaName; 7; 0); "Barcode Trigger")

$column:=VP Column($vpAreaName; 8)
$properties:=New object:C1471("width"; 60; "resizable"; True:C214)
VP SET COLUMN ATTRIBUTES($column; $properties)
VP SET TEXT VALUE(VP Cell($vpAreaName; 8; 0); "% Sconto")

$column:=VP Column($vpAreaName; 9)
$properties:=New object:C1471("width"; 50; "resizable"; True:C214)
VP SET COLUMN ATTRIBUTES($column; $properties)
VP SET TEXT VALUE(VP Cell($vpAreaName; 8; 0); "Soglia")

$column:=VP Column($vpAreaName; 9)
$properties:=New object:C1471("width"; 110; "resizable"; True:C214)
VP SET COLUMN ATTRIBUTES($column; $properties)
VP SET TEXT VALUE(VP Cell($vpAreaName; 9; 0); "Nimis")

VP EXPORT DOCUMENT($vpAreaName; "/Users/if65/Desktop/test.xlsx")







