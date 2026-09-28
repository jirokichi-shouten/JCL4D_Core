//%attributes = {"shared":true}
//JCL_tbl_GetNumber
//20210330 ike wat
//20260928 Codex/wat JCL_tblクラスからCoreへ移行
//テーブル名からテーブル番号を得る

C_TEXT:C284($1; $inTableName)
$inTableName:=$1
C_LONGINT:C283($0; $outTblNr)
$outTblNr:=0
C_LONGINT:C283($i; $numOfTables)

$numOfTables:=Get last table number:C254
For ($i; 1; $numOfTables)
	If (Is table number valid:C999($i)=True:C214)
		If (Table name:C256($i)=$inTableName)
			$outTblNr:=$i
		End if 
	End if 
End for 

$0:=$outTblNr

