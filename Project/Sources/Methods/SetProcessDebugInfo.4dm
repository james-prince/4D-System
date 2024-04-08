//%attributes = {"shared":true}
#DECLARE($ValuesCollection : Collection)
var ProcessDebugInfoObject : Object

If (Count parameters=0)
	ProcessDebugInfoObject:=Null
	return 
End if 

ProcessDebugInfoObject:={\
Info: $ValuesCollection}