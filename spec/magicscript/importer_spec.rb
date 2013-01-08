require 'spec_helper'
module MagicScript
	describe Importer do 
		before(:each) do
			@importer= Importer.new("bin/testingFiles/test.csv")
		end

		describe "#parse" do
			it "should make array of arrays from rows" do
				obj=@importer.parse
				obj.should be_a(Array)
				obj[0].should be_a(Array)
			end
			it "should skip header row and get correct data" do
				obj=@importer.parse
				obj.count.should ==3
				firstRow=obj[0]
				firstRow.should == ["123","14x16","OrderName","JobName","Full Chest","10","15","0","0","z:\\chet.arp","52","3","1","0.12","3.64","3","Cart",nil]
			end
		end
	end
end