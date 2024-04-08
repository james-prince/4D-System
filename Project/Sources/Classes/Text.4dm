property Text : Text
property _Translate : Boolean
property TranslationProcess : Text
property _TextStyles : Collection
property _Uppercase : Boolean

Class constructor($Text : Text)
	This.Text:=$Text
	This._Translate:=True
	This._TextStyles:=[]
	This._Uppercase:=False
	
Function textStyles( ...  : cs.TextStyle) : cs.Text
	This._TextStyles:=Copy parameters
	return This
	
Function translate($Translate : Boolean; $ProcessName : Text) : cs.Text
	This._Translate:=Count parameters>=1 ? $Translate : True
	This.TranslationProcess:=Count parameters>=2 ? $ProcessName : Null
	return This
	
Function uppercase($Uppercase : Boolean) : cs.Text
	This._Uppercase:=Count parameters>=1 ? $Uppercase : True
	return This
	
Function parse( ... )->$Text : Text
	var $FirstParameter : Variant:=Copy parameters.first()
	var $Parameters : Collection:=((Count parameters=1) && (Value type($FirstParameter)=Is collection))\
		 ? $FirstParameter\
		 : Copy parameters
	
	CollectionTypeCheck($Parameters; [\
		Is real; Is integer; Is longint; Is date; Is time; \
		Is string var; Is text; Is boolean; Is undefined; Is null; \
		Is collection/*[$Value;"FORMAT"]*/])
	
	
	
	$Text:=This.Text
	
	If (This._Translate) && (ds.Translation#Null)
		$Text:=ds.Translation.translate($Text; This.TranslationProcess || "")
	End if 
	
	$Text:=Replace string($Text; "<br>"; CRLF)
	$Text:=Replace string($Text; "<tab>"; Char(Tab))
	
	
	
	$Text:=Replace string($Text; "["; "`[`")
	$Text:=Replace string($Text; "]"; "`]`")
	
	var $Index : Integer
	var $TextStyle : cs.TextStyle
	For ($Index; This._TextStyles.length-1; 0; -1)
		$TextStyle:=This._TextStyles[$Index]
		$Text:=Replace string($Text; "`[`"+String($Index+1)+"`]`"; $TextStyle.toSpan())
	End for 
	$Text:=Replace string($Text; "`[``]`"; "</SPAN>")
	
	$Text:=Replace string($Text; "`[`"; "[")
	$Text:=Replace string($Text; "`]`"; "]")
	
	
	
	$Text:=Replace string($Text; ":"; "`:`")
	
	var $Parameter : Variant
	For ($Index; $Parameters.length-1; 0; -1)
		$Parameter:=$Parameters[$Index]
		
		If (Value type($Parameter)=Is collection)
			ASSERT($Parameter.length=2)
			VariantTypeCheck($Parameter[0]; [\
				Is real; Is integer; Is longint; Is date; Is time; \
				Is string var; Is text; Is boolean; Is undefined; Is null])
			VariantTypeCheck($Parameter[1]; [\
				Is text; Is string var; \
				Is integer; Is integer 64 bits; Is longint; Is real])
			$Parameter:=String($Parameter[0]; $Parameter[1])
		End if 
		
		$Text:=Replace string($Text; "`:`"+String($Index+1); String($Parameter))
	End for 
	
	$Text:=Replace string($Text; "`:`"; ":")
	
	If (This._Uppercase)
		$Text:=Uppercase($Text)
	End if 