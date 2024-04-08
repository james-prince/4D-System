//%attributes = {"shared":true}
#DECLARE($Variant : Variant; $TypeCollection : Collection; $ClassCollection : Collection) : Boolean

//TODO:Replace
//SetProcessDebugInfo([$Variant])

var $Type : Integer
For each ($Type; $TypeCollection || [])
	If (Value type($Variant)=$Type)
		return True
	End if 
End for each 

If (Value type($Variant)#Is object)
	return False
End if 

var $Class : Object
For each ($Class; $ClassCollection || [])
	If (OB Instance of($Variant; $Class))
		return True
	End if 
End for each 

return False
