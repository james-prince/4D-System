# 4D-System
A 4d component containing a collection of classes and project method to extend system functionality.
# Classes
# Methods
## Text
<!-- Returns a cs.System.Text class object for building formatted, styled and localized strings -->
### Description
A shortcut to cs.System.Text.new() that allows quick and readable generation of formatted, styled and localized strings.
### Example
```4d
var $Greeting:=Text("Hello :1, my name is :2").parse("John"; "Mike")
//$Greeting="Hello John, my name is Mike"

//You can pass a 2 item colleciton to parse [$Value; $Format] to format the value directly
var $DisplayPrice:=Text(":1:2").parse("£"; [333333.333333; "####,####,###0.###"])
//$DisplayPrice="£333,333.33"

//You can pass TextStyle class objects using the textStyles() funciton
//This will apply style tags to text - use [$StyleTagIndex]Text To Style[]
var $Text:=Text("[1]This text is bold[] and [2]this text is bold and italic[]")
var $StyledText:=$Text.textStyles(TextStyle.Bold(); TextStyle.Bold().Italic()).parse()
```

