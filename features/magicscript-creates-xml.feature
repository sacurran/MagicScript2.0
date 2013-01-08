Feature: magicscript creates xml

	As magicscript
	I want to take a csv
	Make a correctly formatted xml

Scenario: create xml
	Given a csv
	When I create xml
	Then the xml should have the correct info and format