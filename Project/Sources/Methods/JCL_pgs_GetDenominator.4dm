//%attributes = {"shared":true}
//JCL_pgs_GetDenominator
//20230109 wat
//20260925 Codex/wat ホスト公開属性を追加し、範囲条件の抜けと到達不能条件を修正
//プログレスバーを表示する頻度を分母で指定、繰り返し回数で決める

C_LONGINT:C283($1; $cnt)
$cnt:=$1
C_LONGINT:C283($0; $denominator)
$denominator:=10

Case of 
	: ($cnt<=100)
			$denominator:=10
			
	: ($cnt<=10000)
			$denominator:=100
			
	: ($cnt<=100000)
			$denominator:=1000
			
	: ($cnt<=1000000)
			$denominator:=10000
		
	Else 
		$denominator:=100000
		
End case 

$0:=$denominator
