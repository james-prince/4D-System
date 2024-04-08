//%attributes = {}
var $Component : cs.Build4D.Component:=cs.Build4D.Component.new({\
buildName: "System"; \
destinationFolder: "./Bin/"; \
packedProject: True})
ASSERT($Component.build())