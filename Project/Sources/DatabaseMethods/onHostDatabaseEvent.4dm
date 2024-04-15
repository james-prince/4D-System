#DECLARE($EventCode : Integer)

Case of 
	: ($EventCode=On before host database startup)
		_InitializeSingletons
		
	: ($EventCode=On after host database startup)
		
	: ($EventCode=On before host database exit)
		
	: ($EventCode=On after host database exit)
		
End case 
