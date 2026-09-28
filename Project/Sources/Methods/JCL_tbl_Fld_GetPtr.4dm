//%attributes = {"shared":true}
//JCL_tbl_Fld_GetPtr
//JCL_tbl_GetFldPtr
//20130120 wat
//zz_tbl_GetIDFieldPtr
//テーブルポインタからIDフィールドのポインタを獲る
//20260928 Codex/wat JCL_tblクラスからCoreへ移行
//テーブルポインタとフィールド名からフィールドポインタを得る

C_POINTER:C301($1; $inTablePtr)
$inTablePtr:=$1  //テーブルポインタ
C_TEXT:C284($2; $searchStr)
$searchStr:=$2  //フィールド名
C_POINTER:C301($3; $outFieldPtrPtr)
$outFieldPtrPtr:=$3
C_LONGINT:C283($0; $retCode)
$retCode:=1  //error
C_LONGINT:C283($tableNr; $numOfFields; $i)
C_TEXT:C284($fieldName)

//テーブル番号を得る
$tableNr:=Table:C252($inTablePtr)

//フィールド情報取得
$numOfFields:=Get last field number:C255($inTablePtr)
For ($i; 1; $numOfFields)
	If (Is field number valid:C1000($inTablePtr; $i)=True:C214)
		$fieldName:=Field name:C257($tableNr; $i)
		If ($searchStr=$fieldName)
			//見つかった
			$outFieldPtrPtr->:=Field:C253($tableNr; $i)
			$i:=$numOfFields  //フォー文を抜ける
			$retCode:=0  // no error
		End if 
	End if 
End for 

$0:=$retCode
