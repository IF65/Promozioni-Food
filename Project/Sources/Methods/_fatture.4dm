//%attributes = {}
C_TEXT:C284($rootRef)
$rootRef:=DOM Parse XML source:C719("")
If (OK=1)
	C_TEXT:C284($documentRef)
	// we are looking for the document node, since it is the node to which
	// the DOCTYPE node is attached before the root node
	$documentRef:=DOM Get XML document ref:C1088($rootRef)
	ARRAY TEXT:C222($typeArr; 0)
	ARRAY TEXT:C222($valueArr; 0)
	// on this node we look for the DOCTYPE type node among the
	// child nodes
	DOM GET XML CHILD NODES:C1081($refDocument; $typeArr; $valueArr)
	C_TEXT:C284($text)
	$text:=""
	$pos:=Find in array:C230($typeArr; XML DOCTYPE:K45:19)
	If ($pos>-1)
		// We retrieve the DTD declaration in $text
		$text:=$text+"Doctype: "+$valueArr{$pos}+Char:C90(Carriage return:K15:38)
	End if 
	DOM CLOSE XML:C722($rootRef)
End if 
