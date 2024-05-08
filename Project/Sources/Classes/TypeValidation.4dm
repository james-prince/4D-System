property TypeOrClassCollection : Collection

Class constructor($FirstTypeOrClass;  ... )
	ASSERT(Count parameters#0)
	This.TypeOrClassCollection:=(Value type($FirstTypeOrClass)=Is collection) ? $FirstTypeOrClass : Copy parameters
	
Function _checkValue($FunctionObject : Object; $This : cs.TypeValidation) : Boolean
	var $Value : Variant:=$FunctionObject.value
	return $This.TypeOrClassCollection.some($This._checkValueType; $Value)\
		 || $This.TypeOrClassCollection.some($This._checkValueClass; $Value)
	
Function _checkValueType($FunctionObject : Object; $Value) : Boolean
	var $TypeOrClass : Variant:=$FunctionObject.value
	return (Value type($TypeOrClass)=Is real)\
		 && (Value type($Value)=$TypeOrClass)
	
Function _checkValueClass($FunctionObject : Object; $Value) : Boolean
	var $TypeOrClass : Variant:=$FunctionObject.value
	return (Value type($Value)=Is object)\
		 && (Value type($TypeOrClass)=Is object)\
		 && (OB Instance of($TypeOrClass; 4D.Class))\
		 && (OB Instance of($Value; $TypeOrClass))
	
Function assert($ValueOrValueCollection : Variant; $CheckCollectionItems : Boolean)
	ASSERT(This.check($ValueOrValueCollection; $CheckCollectionItems); JSON Stringify({ValueCollection: $ValueOrValueCollection}))
	
Function check($ValueOrValueCollection : Variant; $CheckCollectionItems : Boolean) : Boolean
	var $ValueCollection : Collection:=$CheckCollectionItems ? $ValueOrValueCollection : [$ValueOrValueCollection]
	return ($ValueCollection.length=0) || ($ValueCollection.every(This._checkValue; This))