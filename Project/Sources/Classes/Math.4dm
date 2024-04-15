Function ceiling($Number : Real)->$Ceiling : Integer
	$Ceiling:=Round($Number; 0)
	return $Ceiling<$Number ? $Ceiling+1 : $Ceiling
	
Function floor($Number : Real)->$Floor : Integer
	$Floor:=Round($Number; 0)
	return $Floor>$Number ? $Floor-1 : $Floor
	
Function truncate($Number : Real) : Integer
	return $Number<0 ? This.ceiling($Number) : This.floor($Number)
	
	
	
Function divRem($Dividend : Integer; $Divisor : Integer; $RemainderPointer : Pointer)->$Quotient : Integer
	var $Remainder : Integer
	$Remainder:=$Dividend%$Divisor
	$RemainderPointer->:=$Remainder
	return ($Dividend-$Remainder)/$Divisor
	
	
	
Function getNumberCollection($Collection : Collection)->$NumberCollection : Collection
	CollectionTypeCheck($Collection; [Is collection; Is real; Is longint; Is integer; Is integer 64 bits])
	
	$NumberCollection:=[]
	var $Value
	For each ($Value; $Collection)
		If (Value type($Value)=Is collection)
			$NumberCollection:=$NumberCollection.combine(This.getNumberCollection($Value))
		Else 
			$NumberCollection.push($Value)
		End if 
	End for each 
	
Function isEven($Number : Integer) : Boolean
	return ($Number%2)=0
	
	
Function min($CollectionOrFirstNumber;  ... ) : Real
	return This.getNumberCollection(Copy parameters).min()
	
Function max($CollectionOrFirstNumber;  ... ) : Real
	return This.getNumberCollection(Copy parameters).max()
	
Function mean($CollectionOrFirstNumber;  ... ) : Real
	return This.getNumberCollection(Copy parameters).average()
	
Function median($CollectionOrFirstNumber;  ... ) : Real
	var $NumberCollection:=This.getNumberCollection(Copy parameters).orderBy(ck ascending)
	
	return This.isEven($NumberCollection.length) ? \
		($NumberCollection[($NumberCollection.length/2)-1]+$NumberCollection[($NumberCollection.length/2)])/2 : \
		$NumberCollection[(($NumberCollection.length+1)/2)-1]
	
Function modes($CollectionOrFirstNumber;  ... )->$ModesCollection : Collection
	$ModesCollection:=[]
	
	var $NumberCollection:=This.getNumberCollection(Copy parameters)
	
	
	var $MaxInstances; $MinInstances : Integer
	var $Number
	
	For each ($Number; $NumberCollection.distinct())
		If ($NumberCollection.countValues($Number)>$MaxInstances)
			$MaxInstances:=$NumberCollection.countValues($Number)
		End if 
		If ($MinInstances=0) || ($NumberCollection.countValues($Number)<$MinInstances)
			$MinInstances:=$NumberCollection.countValues($Number)
		End if 
	End for each 
	
	If ($MaxInstances=$MinInstances)
		return 
	End if 
	
	For each ($Number; $NumberCollection.distinct())
		If ($NumberCollection.countValues($Number)=$MaxInstances)
			$ModesCollection.push($Number)
		End if 
	End for each 