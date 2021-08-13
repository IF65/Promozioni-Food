//%attributes = {}
<>qCode2Status:=New object:C1471(\
"0"; "CARICAMENTO IN CORSO"; \
"1"; "CARICAMENTO TERMINATO"; \
"2"; "GIORNATA TERMINATA"; \
"3"; "NEGOZIO NON APERTO"; \
)

<>qStatus2Code:=New object:C1471()
For each ($item; <>qCode2Status)
	<>qStatus2Code[<>qCode2Status[$item]]:=$item
End for each 

<>qStatusDescription:=New list:C375
For each ($item; <>qCode2Status)
	$id:=Num:C11(<>qStatus2Code[<>qCode2Status[$item]])
	APPEND TO LIST:C376(<>qStatusDescription; <>qCode2Status[$item]; $id)
End for each 

