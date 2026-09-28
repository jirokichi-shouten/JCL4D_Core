//%attributes = {"shared":true}
//JCL_tbl_SerialNumber_Reset
//JCL_SerialNumber_Reset
//20180206 wat
//20260928 Codex/wat Coreへ移行
//シリアル番号を初期化、テーブルポインタをもらって番号をゼロに戻す

C_POINTER:C301($1; $tblPtr)
$tblPtr:=$1

SET DATABASE PARAMETER:C642($tblPtr->; Table sequence number:K37:31; 0)

