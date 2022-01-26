C_TEXT:C284($path)
$path:=Select folder:C670("Select destination folder"; Get 4D folder:C485(Documents folder:K41:18))
If (Test path name:C476($path)=Is a folder:K24:2)
	AL_SetAreaLongProperty(alpPromozioni; ALP_Area_ExportOptions; AL Export XLSX)  // XLSX 
	AL_SetAreaTextProperty(alpPromozioni; ALP_Area_ExportToFile; $path+"My exported Area.xlsx")  // XLSX export 
	SHOW ON DISK:C922($path+"My exported Area.xlsx")
End if 