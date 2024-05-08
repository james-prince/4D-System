property _FormulaCollection : Collection
property _ThisObject : 4D.Function
property _Parameters : Collection

property FormulaResults : Collection

Class constructor($FormulaOrFormulaCollection : Variant; $ThisObject : Object; $Parameters : Collection)
	TypeValidation(Is collection; 4D.Function).assert($FormulaOrFormulaCollection)
	
	Case of 
		: (Value type($FormulaOrFormulaCollection)=Is collection)
			TypeValidation(4D.Function).assert($FormulaOrFormulaCollection; True)
			
			This._FormulaCollection:=$FormulaOrFormulaCollection
			
		: (OB Instance of($FormulaOrFormulaCollection; 4D.Function))
			This._FormulaCollection:=[$FormulaOrFormulaCollection]
	End case 
	
	This._ThisObject:=$ThisObject
	This._Parameters:=$Parameters
	
Function apply()->$LastFormulaResult : Variant
	This.FormulaResults:=[]
	
	var $Formula : 4D.Function
	For each ($Formula; This._FormulaCollection)
		This.FormulaResults.push($Formula.apply(This._ThisObject; This._Parameters))
	End for each 
	
	return This.FormulaResults.last()