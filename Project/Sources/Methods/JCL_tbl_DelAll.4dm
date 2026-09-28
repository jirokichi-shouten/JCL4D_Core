//%attributes = {"shared":true}
//JCL_tbl_DelAll
//20171228 wat
//20260928 Codex/wat Coreへ移行
//ポインタをもらって、テーブルのレコードを削除

C_POINTER:C301($1; $tblPtr)
$tblPtr:=$1

READ WRITE:C146($tblPtr->)
TRUNCATE TABLE:C1051($tblPtr->)
JCL_tbl_SerialNumber_Reset($tblPtr)
READ ONLY:C145($tblPtr->)

