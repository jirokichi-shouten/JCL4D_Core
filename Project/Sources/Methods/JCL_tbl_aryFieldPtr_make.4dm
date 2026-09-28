//%attributes = {"shared":true}
//JCL_tbl_aryFieldPtr_make
//20221013 wat
//20260928 Codex/wat JCL_tblクラスからCoreへ移行
//フィールドポインタの配列を作成

C_LONGINT:C283($1; $tblNr)
$tblNr:=$1
C_POINTER:C301($2; $aryFldPtr)
$aryFldPtr:=$2
C_LONGINT:C283($0; $numOfFlds)
C_LONGINT:C283($numOfFields; $i)
C_POINTER:C301($fldPtr)

$numOfFields:=Get last field number:C255($tblNr)
For ($i; 1; $numOfFields)
	If (Is field number valid:C1000($tblNr; $i)=True:C214)
		$fldPtr:=Field:C253($tblNr; $i)
		APPEND TO ARRAY:C911($aryFldPtr->; $fldPtr)
	End if 
End for 

$numOfFlds:=Size of array:C274($aryFldPtr->)
$0:=$numOfFlds

