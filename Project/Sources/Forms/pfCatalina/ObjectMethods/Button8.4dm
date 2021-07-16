$params:=New object:C1471
$params.format:=vk MS Excel format:K89:2  //".xlsx"
$params.valuesOnly:=True:C214

$docPath:="/Users/if65/Desktop/test.xlsx"
VP EXPORT DOCUMENT("vpImport"; $docPath; $params)
