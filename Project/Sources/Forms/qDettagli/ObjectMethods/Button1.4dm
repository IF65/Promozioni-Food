$ref:=Open document:C264(""; "*"; Read mode:K24:5)
If (ok=1)
	CLOSE DOCUMENT:C267($ref)
	VP IMPORT DOCUMENT("vpImport"; document)
End if 
