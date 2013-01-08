Feature: magicscript pushes xml

	As magicscript
	I will push the newly created xml to the server
	So Rob can remote download it later

Scenario: push xml
	Given the xml has been created
	When push xml
	Then the xml will be on the server