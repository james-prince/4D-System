property _date : Date
property _time : Time

Class constructor($Date : Date; $Time : Time)
	This._date:=Count parameters=0 ? Current date : $Date
	This._time:=Count parameters=0 ? Current time : ($Time || ?00:00:00?)
	
Function get time() : Time
	return Time(This._time)
	
Function get date() : Date
	return This._date
	
	
Function subtractDateTime($DateTime : cs.DateTime) : cs.TimeSpan
	return cs.TimeSpan.new($DateTime; This)
	
Function add($Days : Real; $Hours : Real; $Minutes : Real; $Seconds : Integer) : cs.DateTime
	var $NewDate : Date
	var $NewTime : Time
	
	$NewDate:=This.date
	$NewTime:=This.time+$Seconds+($Minutes*60)+($Hours*60*60)+($Days*24*60*60)
	
	While ($NewTime>?24:00:00?)
		$NewTime-=?24:00:00?
		$NewDate+=1
	End while 
	
	While ($NewTime<?00:00:00?)
		$NewTime+=?24:00:00?
		$NewDate-=1
	End while 
	
	return cs.DateTime.new($NewDate; $NewTime)
	
Function get weekDay() : Integer
	return Day number(This.date)
	
	
	
Function get Monday() : Boolean
	return This.weekDay=Monday
	
Function get Tuesday() : Boolean
	return This.weekDay=Tuesday
	
Function get Wednesday() : Boolean
	return This.weekDay=Wednesday
	
Function get Thursday() : Boolean
	return This.weekDay=Thursday
	
Function get Friday() : Boolean
	return This.weekDay=Friday
	
Function get Saturday() : Boolean
	return This.weekDay=Saturday
	
Function get Sunday() : Boolean
	return This.weekDay=Sunday
	
	
Function get second() : Integer
	return This.time-(This.hour*3600)-(This.minute*60)
	
Function get minute() : Integer
	var $Seconds : Real:=This.time-(This.hour*3600)
	return ($Seconds-($Seconds%60))/60
	
Function get hour() : Integer
	var $Seconds : Real:=This.time
	return ($Seconds-($Seconds%3600))/3600
	
	
Function get day() : Integer
	return Day of(This.date)
	
Function get month() : Integer
	return Month of(This.date)
	
Function get year() : Integer
	return Year of(This.date)
	
	
Function get timestamp() : Text
	return String(This.date; ISO date; Time(This.time))
	
Function get formattedTimestamp() : Text
	return Replace string(This.timestamp; "T"; "\t")
	
Function get datestamp() : Text
	return Substring(This.timestamp; 1; 10)
	
Function get weekend() : Boolean
	return (This.Saturday || This.Sunday)
	
Function get weekNumber->$WeekNumber : Integer
	var $FirstDayOfYear:=Add to date(!00-00-00!; Year of(This._date); 1; 1)
	var $DayNumber:=Day number($FirstDayOfYear)
	
	var $Week2Monday : Date
	Case of 
		: ($DayNumber=Monday)
			$Week2Monday:=$FirstDayOfYear+7
		: ($DayNumber=Tuesday)
			$Week2Monday:=$FirstDayOfYear+6
		: ($DayNumber=Wednesday)
			$Week2Monday:=$FirstDayOfYear+5
		: ($DayNumber=Thursday)
			$Week2Monday:=$FirstDayOfYear+4
		: ($DayNumber=Friday)
			$Week2Monday:=$FirstDayOfYear+3+7
		: ($DayNumber=Saturday)
			$Week2Monday:=$FirstDayOfYear+2+7
		: ($DayNumber=Sunday)
			$Week2Monday:=$FirstDayOfYear+1+7
	End case 
	
	$WeekNumber:=Trunc((This._date-$Week2Monday)/7; 0)+2
	return $WeekNumber=0 ? 53 : $WeekNumber
	
Function get secondsSinceEpoch() : Real
	return (This.time+((This.date-!00-00-00!)*24*60*60))
	
	
Function isBefore($DateTime : cs.DateTime) : Boolean
	return This.secondsSinceEpoch<$DateTime.secondsSinceEpoch
	
	
Function isAfter($DateTime : cs.DateTime) : Boolean
	return This.secondsSinceEpoch>$DateTime.secondsSinceEpoch
	