//%attributes = {"shared":true}
//JCL_str_RandomAlphaNumbers
//20250208 wat@KUALA LUMPUR
//20260922 Codex/wat マニュアル掲載コードをコンポーネントに追加
//id生成ロジックが必要になり、ランダムにアルファベットまたは数字を返すメソッドを作成
//A:65 - Z:90, a:97 - z:122, 0:48 - 9:57

C_LONGINT:C283($1; $numOfLetters)
$numOfLetters:=$1
C_TEXT:C284($0; $randoms)
$randoms:=""
C_LONGINT:C283($i)
C_TEXT:C284($letter)
C_LONGINT:C283($tmpNum)

For ($i; 1; $numOfLetters)
	//指定された文字数だけ連続
	$tmpNum:=Mod:C98(Random:C100; 62)

	If ($tmpNum<10)
		//数字: Number letter
		$letter:=Char:C90($tmpNum+48)
	End if

	If ((10<=$tmpNum) & ($tmpNum<36))
		//大文字、Capital letter
		$letter:=Char:C90($tmpNum+(65-10))
	End if

	If (36<=$tmpNum)
		//小文字、Small letter
		$letter:=Char:C90($tmpNum+(97-36))
	End if

	$randoms:=$randoms+$letter
End for

$0:=$randoms
