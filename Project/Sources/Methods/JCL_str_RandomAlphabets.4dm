//%attributes = {"shared":true}
//JCL_str_RandomAlphabets
//20250208 wat@KUALA LUMPUR
//20260922 Codex/wat マニュアル掲載コードをコンポーネントに追加
//id生成ロジックが必要になり、ランダムにアルファベットを返すメソッドを作成
//A:65 - Z:90, a:97 - z:122

C_LONGINT:C283($1; $numOfLetters)
$numOfLetters:=$1
C_TEXT:C284($0; $randoms)
$randoms:=""
C_LONGINT:C283($i)
C_TEXT:C284($letter)
C_LONGINT:C283($alphabetIndex)

For ($i; 1; $numOfLetters)
	//指定された文字数だけ連続
	If (Mod:C98(Random:C100; 2)=1)
		//大文字、Capital letter
		$alphabetIndex:=Mod:C98(Random:C100; 26)+65
		$letter:=Char:C90($alphabetIndex)
	Else
		//小文字、Small letter
		$alphabetIndex:=Mod:C98(Random:C100; 26)+97
		$letter:=Char:C90($alphabetIndex)
	End if

	$randoms:=$randoms+$letter
End for

$0:=$randoms
