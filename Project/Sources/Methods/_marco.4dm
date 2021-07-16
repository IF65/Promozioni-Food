//%attributes = {}
C_BLOB:C604($1)
C_BOOLEAN:C305($0)

$text:=""
$text:=$text+"<root>"
$text:=$text+"    <stores_list_hdr>"
$text:=$text+"        <stores_list_name>Nuova Lista</stores_list_name>"
$text:=$text+"    </stores_list_hdr>"
$text:=$text+"    <stores_list>"
$text:=$text+"        <store_line>"
$text:=$text+"            <store_code>0109</store_code>"
$text:=$text+"        </store_line>"
$text:=$text+"        <store_line>"
$text:=$text+"            <store_code>0130</store_code>"
$text:=$text+"        </store_line>"
$text:=$text+"        <store_line>"
$text:=$text+"            <store_code>0135</store_code>"
$text:=$text+"        </store_line>"
$text:=$text+"    </stores_list>"
$text:=$text+"</root>"
$text:=$text+" "
$text:=$text+"Che produce il seguente output:"
$text:=$text+"<root>"
$text:=$text+"<stores_list_line>"
$text:=$text+"  <store_list_code>Y0057</store_list_code>"
$text:=$text+"  <store_list_name>Nuova Lista</store_list_name>"
$text:=$text+"  <companies_numb>1</companies_numb>"
$text:=$text+"  <stores_num>3</stores_num>"
$text:=$text+"</stores_list_line>"
$text:=$text+"</root>"

WEB SERVICE SET PARAMETER:C777("MyXMLBlob"; $text)
WEB SERVICE CALL:C778("10.11.14.207"; "MySoapAction"; "StoresLists_Test_Set"; "http://my.namespace.com/"; Web Service manual in:K48:2)
WEB SERVICE GET RESULT:C779($0; "MyOutputVar"; *)
