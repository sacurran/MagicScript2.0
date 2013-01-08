require 'spec_helper'
require 'net/ftp'
module MagicScript
	describe Exporter do 
		before(:each) do
			@exporter=Exporter.new("bin/testingFiles/innerTest/imprint_export.xml")
		end
		describe "#push" do
			it "should succussfully push xml to ftp" do
				@exporter.push
				@server_path='/web/'
 				@ftp = Net::FTP::new('10.1.10.11')
				@ftp.login('FTP-Custom', 'pw4FTP')
				@ftp.chdir(@server_path)
				@ftp.getbinaryfile("imprint_export.xml","bin/testingFiles/innerTest/transfertest.xml")
				FileUtils.cmp("bin/testingFiles/innerTest/imprint_export.xml","bin/testingFiles/innerTest/transfertest.xml")
			end
		end
	end
end