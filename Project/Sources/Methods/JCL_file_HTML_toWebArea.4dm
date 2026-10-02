//%attributes = {"shared":true}
//JCL_file_HTML_toWebArea
//20170724 wat
//オンメモリーのHTMLを一時ファイルに書き出し、Webエリアにロードさせる
//20261002 Codex/wat OSの一時フォルダを使用するようにしてJCL4D_Coreへ移行

C_TEXT:C284($1; $html)
$html:=$1
C_TEXT:C284($2; $objName)  //Webエリアのフォームオブジェクト
$objName:=$2
C_TEXT:C284($3; $fileName)
$fileName:=$3

WA OPEN URL:C1020(*; $objName; "about:blank")

TEXT TO BLOB:C554($html; $blob; UTF8 C string:K22:15)

//OSの一時フォルダへ保存
C_TEXT:C284($tempPath)
$tempPath:=JCL_file_MakeFilePath(Temporary folder:C486; $fileName)
BLOB TO DOCUMENT:C526($tempPath; $blob)

//表示
C_TEXT:C284($posixPath)
$posixPath:="file:///"+Convert path system to POSIX:C1106($tempPath)
WA OPEN URL:C1020(*; $objName; $posixPath)

