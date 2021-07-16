$all:=VP All("vpImport")
$rows:=VP Get values($all)

$rowCount:=$rows.count()
$columnCount:=$rows[0].count()

$pos_codice:=-1
$pos_reparto:=-1
$pos_tipo:=-1
$pos_valore:=-1
$pos_soglia:=-1
$pos_inizio:=-1
$pos_fine:=-1
$pos_barcode:=-1
For ($i; 0; $columnCount-1)
	Case of 
		: ($rows[0][$i]="codice")
			$pos_codice:=$i
		: ($rows[0][$i]="reparto")
			$pos_reparto:=$i
		: ($rows[0][$i]="tipo")
			$pos_tipo:=$i
		: ($rows[0][$i]="valore")
			$pos_valore:=$i
		: ($rows[0][$i]="soglia")
			$pos_soglia:=$i
		: ($rows[0][$i]="inizio")
			$pos_inizio:=$i
		: ($rows[0][$i]="fine")
			$pos_fine:=$i
		: ($rows[0][$i]="barcode")
			$pos_barcode:=$i
	End case 
End for 

utlTermometro("apri")
utlTermometro("mostra"; "Caricamento in corso...")

If ($pos_codice>=0) & ($pos_reparto>=0) & ($pos_tipo>=0) & ($pos_valore>=0) & ($pos_soglia>=0) & ($pos_inizio>=0) & ($pos_fine>=0) & ($pos_barcode>=0)
	For ($i; 1; $rowCount-1)
		
		$codice:=0
		If ($rows[$i][$pos_codice]#Null:C1517)
			$value:=$rows[$i][$pos_codice]
			
			ARRAY TEXT:C222($matches; 0)
			If (utlMatchRegex("^BL_(\\d+)_(\\d+)$"; $value; ->$matches))
				$codice:=Num:C11($matches{1}+$matches{2})
			End if 
			If (utlMatchRegex("^(\\d+)$"; $value; ->$matches))
				$codice:=Num:C11($matches{1})
			End if 
		End if 
		
		$reparto:=""
		If ($rows[$i][$pos_reparto]#Null:C1517)
			$reparto:=$rows[$i][$pos_reparto]
		End if 
		
		$tipo:=""
		If ($rows[$i][$pos_tipo]#Null:C1517)
			$tipo:=$rows[$i][$pos_tipo]
		End if 
		
		$valore:=0
		If ($rows[$i][$pos_valore]#Null:C1517)
			$valore:=$rows[$i][$pos_valore]
		End if 
		
		$soglia:=0
		If ($rows[$i][$pos_soglia]#Null:C1517)
			$soglia:=$rows[$i][$pos_soglia]
		End if 
		
		$inizio:=!00-00-00!
		If ($rows[$i][$pos_inizio]#Null:C1517)
			$inizio:=OB Get:C1224($rows[$i][$pos_inizio]; "value"; Is date:K8:7)
		End if 
		
		$fine:=!00-00-00!
		If ($rows[$i][$pos_fine]#Null:C1517)
			$fine:=OB Get:C1224($rows[$i][$pos_fine]; "value"; Is date:K8:7)
		End if 
		
		$barcode:=""
		If ($rows[$i][$pos_barcode]#Null:C1517)
			$value:=$rows[$i][$pos_barcode]
			
			ARRAY TEXT:C222($matches; 0)
			If (utlMatchRegex("^(\\d{8}|\\d{13})$"; $value; ->$matches))
				$barcode:=$matches{1}
			End if 
		End if 
		
		If ($codice#0)
			If (OB Is defined:C1231(<>reparti; $reparto))
				
				//0481
				If ($tipo="€") & ($barcode="")
					If (catalinaCaricamento_0481($codice; $reparto; $soglia; $valore; $inizio; $fine; ->$barcode))
						VP SET VALUE(VP Cell("vpImport"; $pos_barcode; $i); New object:C1471("value"; $barcode))
					End if 
				End if 
				
				//ACPT 
				If ($tipo="PUNTI") & ($barcode="")
					If (catalinaCaricamento_ACPT($codice; $reparto; $soglia; $valore; $inizio; $fine; ->$barcode))
						VP SET VALUE(VP Cell("vpImport"; $pos_barcode; $i); New object:C1471("value"; $barcode))
					End if 
				End if 
				
			Else 
				
				//0503
				If ($tipo="€") & (Lowercase:C14($reparto)="@total@") & ($barcode="")
					If (catalinaCaricamento_0503($codice; $soglia; $valore; $inizio; $fine; ->$barcode))
						VP SET VALUE(VP Cell("vpImport"; $pos_barcode; $i); New object:C1471("value"; $barcode))
					End if 
				End if 
				
				//ACPT
				If ($tipo="PUNTI") & (Lowercase:C14($reparto)="@total@") & ($barcode="")
					If (catalinaCaricamento_ACPT($codice; "Total Store"; $soglia; $valore; $inizio; $fine; ->$barcode))
						VP SET VALUE(VP Cell("vpImport"; $pos_barcode; $i); New object:C1471("value"; $barcode))
					End if 
				End if 
			End if 
		End if 
		
	End for 
	
End if 

utlTermometro("chiudi")