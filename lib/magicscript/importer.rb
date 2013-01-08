
require "excelsior"
module MagicScript
	class Importer
		attr_accessor :file
		def initialize(filename)
			@file=filename
		end
		def parse
		  rows = Array.new
		  Excelsior::Reader.rows( File.open( @file , 'r') ) do |row|
		    rows << row
		  end
		  rows.shift
		  return rows
		end
	end
end