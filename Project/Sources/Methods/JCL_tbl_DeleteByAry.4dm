//%attributes = {"shared":true}
//JCL_tbl_DeleteByAry
//20130311 wat
//20260928 Codex/wat Coreへ移行
//テーブルと検索対象フィールドを与えて、配列の要素で検索して物理削除

C_POINTER:C301($1; $tblPtr)
$tblPtr:=$1
C_POINTER:C301($2; $IDFldPtr)
$IDFldPtr:=$2
C_POINTER:C301($3; $IDAryPtr)
$IDAryPtr:=$3
C_LONGINT:C283($i; $sizeOfAry)
C_LONGINT:C283($0; $delCnt)
$delCnt:=0

READ WRITE:C146($tblPtr->)
$sizeOfAry:=Size of array:C274($IDAryPtr->)
For ($i; 1; $sizeOfAry)
	QUERY:C277($tblPtr->; $IDFldPtr->=$IDAryPtr->{$i})
	DELETE SELECTION:C66($tblPtr->)
	$delCnt:=$delCnt+1
End for 
UNLOAD RECORD:C212($tblPtr->)
READ ONLY:C145($tblPtr->)

$0:=$delCnt

