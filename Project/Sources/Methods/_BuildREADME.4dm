//%attributes = {}
var $File:=Folder(fk database folder).file("README.md")
$File.delete()
var $FileHandler:=$File.open("write")

$FileHandler.writeLine("# 4D-System")
$FileHandler.writeLine("A 4d component containing a collection of classes and project method to extend system functionality.")

var $Folder : 4D.Folder
For each ($Folder; Folder(fk database folder).folder("Documentation").folders())
	$FileHandler.writeLine("# "+$Folder.name)
	
	var $DocumentationFile : 4D.File
	For each ($DocumentationFile; $Folder.files())
		$FileHandler.writeLine("## "+$DocumentationFile.name)
		$FileHandler.writeText(Replace string($DocumentationFile.getText(); "##"; "###"))
		$FileHandler.writeLine("")
	End for each 
End for each 