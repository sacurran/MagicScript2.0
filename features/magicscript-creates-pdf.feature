Feature: magicscript creates pdf
	
	As magicscript
	I will take a csv
	And turn it into a pdf of barcodes
	So Rob can use it in his workflow later

Scenario: creates pdf
	Given a csv
	When I create a pdf
	Then it will contain correctly formatted barcodes
	And it will contain the right information
