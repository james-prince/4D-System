# 4D-System
 
A 4d component containing a collection of classes and project method to extend system functionality.

# Color() / cs.System.Color
A class containing a list of defined colors by name, and functions to generate color integer values or hex codes.
Can be accessed using the Color() project method shortcut.
```4D
var $BackgroundColor : Integer
$BackgroundColor:=Color.LightCoral
$BackgroundColor:=Color.Orange
$BackgroundColor:=Color.Amber

$BackgroundColor:=Color.fromRGB(150; 0; 0)
$BackgroundColor:=Color.fromHSL(180; 0.5; 0.5)

var $HexColor : Text:=Color.toHex(Color.White)  //#FFFFFF
```


# cs.System.DateTime & cs.System.TimeSpan
A collection of classes to allow 4D to handle DateTimes and TimeSpans
```4D
var $Now:=cs.Sytem.DateTime.new()  //Passing no parameters gets the current date & time
var $ChristmasMorning:=cs.System.DateTime.new(!2024-12-25!; ?06:00:00?)
var $BoxingDayMorning:=$ChristmasMorning.add(1)  //.add($Days; $Hours; $Minutes; $Seconds)

var $IsBeforeChristmas : Boolean:=$Now.isBefore($ChristmasMorning)

var $IsChristmasOnTheWeekend : Boolean:=$ChristmasMorning.weekend

var $ChristmasWeekNumber : Integer:=$ChristmasMorning.weekNumber  //52

var $TimeUntilChristmas : cs.System.TimeSpan:=$ChristmasMorning.subtractDateTime($Now)
ALERT(String($TimeUntilChristmas.days)+" days and "+String($TimeUntilChristmas.hours)+" hours until christmas morning!")


```
