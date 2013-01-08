require 'spec_helper'
module MagicScript
	describe PretreatCalc do 
		before(:each) do
			@calc= PretreatCalc.new(["123","14x16","OrderName","JobName","Full Chest","10","15","0","0","z:\\chet.arp","52","3","1","0.12","3.64",nil,"Cart",nil])
		end
		describe "#calc" do
			it "should correctly create the string" do
				@calc.calc.should == "012052010101010101"
			end
		end
	end
end