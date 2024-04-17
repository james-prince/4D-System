property ValueCollection : Collection

Class constructor($ValueOrValueCollection : Variant; $CheckCollectionItems : Boolean)
	ASSERT(($CheckCollectionItems=False) || (Value type($ValueOrValueCollection)=Is collection))
	This.ValueCollection:=$CheckCollectionItems ? $ValueOrValueCollection : [$ValueOrValueCollection]
	
Function _checkValue($FunctionObject : Object; $TypeOrClassCollection : Collection; $This : cs.TypeValidation) : Boolean
	var $Value : Variant:=$FunctionObject.value
	return $TypeOrClassCollection.some($This._checkValueType; $Value)\
		 || $TypeOrClassCollection.some($This._checkValueClass; $Value)
	
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
	
Function assert($FirstTypeOrClass;  ... )
	ASSERT(This.check(Copy parameters); JSON Stringify({ValueCollection: This.ValueCollection}))
	
Function check($FirstTypeOrClass;  ... ) : Boolean
	var $TypeOrClassCollection : Collection:=Value type($FirstTypeOrClass)=Is collection ? $FirstTypeOrClass : Copy parameters
	return This.ValueCollection.every(This._checkValue; $TypeOrClassCollection; This)