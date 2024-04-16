//%attributes = {"shared":true,"preemptive":"capable"}
#DECLARE($Collection : Collection; $TypeCollection : Collection; $ClassCollection : Collection) : Boolean

$Collection:=$Collection || []

var $CollectionItem : Variant
var $Continue : Boolean
For each ($CollectionItem; $Collection)
	$Continue:=False
	var $Type : Integer
	For each ($Type; $TypeCollection)
		If (Value type($CollectionItem)=$Type)
			$Continue:=True
			break
		End if 
	End for each 
	If ($Continue)
		continue
	End if 
	
	If (Value type($CollectionItem)#Is object)
		return False
	End if 
	
	var $Class : Object
	For each ($Class; $ClassCollection)
		If (OB Instance of($CollectionItem; $Class))
			$Continue:=True
			break
		End if 
	End for each 
	If ($Continue)
		continue
	End if 
	
	return False
	
End for each 

return True