//%attributes = {"shared":true}
//JCL_tbl_SetInitValue
//20130613 yabe
//20260928 Codex/wat Coreへ移行
//フィールドタイプに応じてポインタの指す先を初期化

C_LONGINT:C283($1; $type)
$type:=$1
C_POINTER:C301($2; $ptr)
$ptr:=$2

Case of 
	: ($type=Is alpha field:K8:1)
		$ptr->:=""
	: ($type=Is text:K8:3)
		$ptr->:=""
	: ($type=Is real:K8:4)
		$ptr->:=0
	: ($type=Is integer:K8:5)
		$ptr->:=0
	: ($type=Is longint:K8:6)
		$ptr->:=0
	: ($type=Is date:K8:7)
		$ptr->:=!00-00-00!
	: ($type=Is time:K8:8)
		$ptr->:=?00:00:00?
	: ($type=Is boolean:K8:9)
		$ptr->:=False:C215
End case 

