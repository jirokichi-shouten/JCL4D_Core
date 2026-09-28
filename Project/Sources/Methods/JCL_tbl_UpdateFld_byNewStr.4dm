//%attributes = {"shared":true}
//JCL_tbl_UpdateFld_byNewStr
//Jiro_tbl_UpdateFld_byNewStr
//20100628 wat
//20260928 Codex/wat Coreへ移行
//テーブルとフィールドのポインタをもらって、古い文字列を新しい文字列に置き換える

C_POINTER:C301($1; $inTablePtr)
$inTablePtr:=$1
C_POINTER:C301($2; $inFieldPtr)
$inFieldPtr:=$2
C_TEXT:C284($3; $oldStr; $4; $newStr)
$oldStr:=$3
$newStr:=$4
C_LONGINT:C283($0; $numOfRecs; $i)

READ WRITE:C146($inTablePtr->)
QUERY:C277($inTablePtr->; $inFieldPtr->=$oldStr)
$numOfRecs:=Records in selection:C76($inTablePtr->)
FIRST RECORD:C50($inTablePtr->)
For ($i; 1; $numOfRecs)
	$inFieldPtr->:=$newStr
	SAVE RECORD:C53($inTablePtr->)
	NEXT RECORD:C51($inTablePtr->)
End for 

UNLOAD RECORD:C212($inTablePtr->)
READ ONLY:C145($inTablePtr->)

$0:=$numOfRecs

