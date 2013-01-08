require 'spec_helper'
module MagicScript
	describe XmlCreator do 
		before(:each) do
			@importer= Importer.new("bin/testingFiles/test.csv")
			@innerFolder="bin/testingFiles/innerTest"
			@creator= XmlCreator.new(@innerFolder,@importer.parse)
		end
		describe "#create" do
			it "should create an imprint_export.xml in inner folder" do
				@creator.create
				File.exists?(@innerFolder+"/imprint_export.xml").should == true
			end
			it "should create correctly formatted imprint element" do
				@creator.create
				file = File.open(@innerFolder+"/imprint_export.xml", "rb")
				contents = file.read
				correct="<Imprints><Imprint><Key>123</Key><Locations><Location><Name>Full Chest</Name><File>z:\\chet.arp</File><Pretreat>012052010101010101</Pretreat><SpecialInstructions></SpecialInstructions></Location><Location><Name>Back</Name><File>z:\\chet2.arp</File><Pretreat>022152010101010101</Pretreat><SpecialInstructions></SpecialInstructions></Location></Locations></Imprint><Imprint><Key>124</Key><Locations><Location><Name>Full Chest</Name><File>z:\\chet2.arp</File><Pretreat>012052010101010101</Pretreat><SpecialInstructions></SpecialInstructions></Location></Locations></Imprint></Imprints>"
				contents.should == correct
			end
		end
	end
end