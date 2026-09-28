//%attributes = {"shared":true}
//JCL_tbl_aryStrFieldPtr_make
//20260928 Codex/wat JCL_tblクラスからCoreへ移行
//指定テーブルのAlpha・Textフィールドポインタを配列で返す

C_TEXT:C284($1; $tblName)
$tblName:=$1
C_POINTER:C301($2; $aryFldPtr)
$aryFldPtr:=$2
C_LONGINT:C283($0; $fieldCount)
C_POINTER:C301($tblPtr; $fldPtr)
C_LONGINT:C283($tableNr; $numOfFields; $i; $type; $len)
C_BOOLEAN:C305($index; $unique; $visible)

$tblPtr:=JCL_tbl_Ptr_byName($tblName)
$tableNr:=Table:C252($tblPtr)
$numOfFields:=Get last field number:C255($tblPtr)
For ($i; 1; $numOfFields)
	If (Is field number valid:C1000($tblPtr; $i)=True:C214)
		GET FIELD PROPERTIES:C258($tableNr; $i; $type; $len; $index; $unique; $visible)
		If (($type=Is alpha field:K8:1) | ($type=Is text:K8:3))
			$fldPtr:=Field:C253($tableNr; $i)
			APPEND TO ARRAY:C911($aryFldPtr->; $fldPtr)
		End if 
	End if 
End for 

$fieldCount:=Size of array:C274($aryFldPtr->)
$0:=$fieldCount

