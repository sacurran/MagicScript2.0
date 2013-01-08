require 'net/ftp'
module MagicScript
	class Exporter
		def initialize(file)
			@local_file=file
  			f = File.open(@local_file, 'r+')
 			@server_path='/web/'
 			@ftp = Net::FTP::new()
			@ftp.login()
			@ftp.chdir(@server_path)
		end

		def push			
			@ftp.put(@local_file)
		end
	end
end
