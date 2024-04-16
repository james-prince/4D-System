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
