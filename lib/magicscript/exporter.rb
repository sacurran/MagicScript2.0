require 'net/ftp'
module MagicScript
	class Exporter
		def initialize(file)
			@local_file=file
  			f = File.open(@local_file, 'r+')
 			@server_path='/web/'
 			@ftp = Net::FTP::new('10.1.10.11')
			@ftp.login('FTP-Custom', 'pw4FTP')
			@ftp.chdir(@server_path)
		end

		def push			
			@ftp.put(@local_file)
		end
	end
end
