property _FontColor : Text
property _BackColor : Text
property _FontFamily : Text
property _FontSize : Text
property _FontWeight : Text
property _TextDecoration : Text
property _FontStyle : Text

Class constructor()
	
Function getProperties() : Collection
	return [\
		This._FontColor; \
		This._BackColor; \
		This._FontFamily; \
		This._FontSize; \
		This._FontWeight; \
		This._TextDecoration; \
		This._FontStyle]
	
Function FontFamily($FontFamily : Text) : cs.TextStyle
	This._FontFamily:=Text("font-family: ':1'").translate(False).parse($FontFamily)
	return This
	
Function FontSize($FontSize : Integer) : cs.TextStyle
	This._FontSize:=Text("font-size: :1pt").translate(False).parse($FontSize)
	return This
	
Function Bold() : cs.TextStyle
	This._FontWeight:="font-weight: bold"
	return This
	
Function Underline() : cs.TextStyle
	This._TextDecoration:="text-decoration: underline"
	return This
	
Function Italic() : cs.TextStyle
	This._FontStyle:="font-style: italic"
	return This
	
Function Strikethrough() : cs.TextStyle
	This._TextDecoration:="text-decoration:line-through"
	return This
	
	
	
Function FontColor($Color : Integer) : cs.TextStyle
	This._FontColor:="color:"+This._ColorToHex($Color)
	return This
	
Function BackColor($Color : Integer) : cs.TextStyle
	This._BackColor:="background-color:"+This._ColorToHex($Color)
	return This
	
Function _ColorToHex($ColorInteger : Integer)->$HexColor : Text
	$HexColor:=Substring(String($ColorInteger; "&x"); 3)
	$HexColor:="#"+Substring("00"+$HexColor; Length($HexColor)-3)
	
	
Function toSpan()->$Span : Text
	
	var $Property : Variant
	For each ($Property; This.getProperties())
		If ($Property=Null) || ($Property="")
			continue
		End if 
		
		$Span+=$Span="" ? "<SPAN STYLE=\"" : ";"
		$Span+=$Property
	End for each 
	$Span+="\">"
	
	
	
	
	
	
	//<SPAN STYLE="font-family:'Arial';font-size:9pt;text-align:left;font-weight:normal;font-style:normal;text-decoration:none;color:#000000;background-color:#FFFFFF">What a<SPAN STYLE="font-size:13.5pt">beautiful</SPAN>day!</SPAN>