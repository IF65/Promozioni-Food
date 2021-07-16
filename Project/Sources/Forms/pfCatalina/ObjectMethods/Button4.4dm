// creazione template

$all:=VP All("vpImport")
$rows:=VP Get values($all)



For ($i; 1; $rows.count())
	$inizio:=OB Get:C1224($rows[$i][2]; "value"; Is date:K8:7)
	$fine:=OB Get:C1224($rows[$i][3]; "value"; Is date:K8:7)
	
End for 
