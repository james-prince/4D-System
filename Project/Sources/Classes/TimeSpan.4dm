Class constructor($InitialDateTime : cs.DateTime; $SecondDateTime : cs.DateTime)
	
	This._totalSeconds:=$SecondDateTime.secondsSinceEpoch-$InitialDateTime.secondsSinceEpoch
	//($SecondDateTime.time+(($SecondDateTime.date-!00/00/0000!)*24*60*60))-\
		($InitialDateTime.time+(($InitialDateTime.date-!00/00/0000!)*24*60*60))
	
Function get totalSeconds() : Real
	return This._totalSeconds
	
Function get totalMinutes() : Real
	return This.totalSeconds/60
	
Function get totalHours() : Real
	return This.totalMinutes/60
	
Function get totalDays() : Real
	return This.totalHours/24
	
	
Function get days() : Integer
	var $Seconds : Real
	$Seconds:=This.totalSeconds
	return ($Seconds-($Seconds%86400))/86400
	
Function get hours() : Integer
	var $Seconds : Real
	$Seconds:=This.totalSeconds-(This.days*86400)
	return ($Seconds-($Seconds%3600))/3600
	
Function get minutes() : Integer
	var $Seconds : Real
	$Seconds:=This.totalSeconds-(This.days*86400)-(This.hours*3600)
	return ($Seconds-($Seconds%60))/60
	
Function get seconds() : Integer
	return \
		This.totalSeconds-(This.days*86400)-(This.hours*3600)-(This.minutes*60)