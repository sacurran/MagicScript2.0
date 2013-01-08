module MagicScript
	class PretreatCalc
		NOZZLE_1 = {:start=> 5, :end => 9}
  		NOZZLE_2 = {:start=> 2, :end => 6}
  		NOZZLE_3 = {:start=>-1, :end => 3}
  		NOZZLE_4 = {:start=>-3, :end => 1}
  		NOZZLE_5 = {:start=>-6, :end =>-2}
	  	NOZZLE_6 = {:start=>-9, :end =>-5}



		def initialize(imprint)
			@imprint=imprint
		end
		def calc
			return (starting_point + ending_point + fluid_laydown + nozzle_on_off(NOZZLE_1) +
               nozzle_on_off(NOZZLE_2) + nozzle_on_off(NOZZLE_3) + nozzle_on_off(NOZZLE_4) +
                nozzle_on_off(NOZZLE_5) + nozzle_on_off(NOZZLE_6))
		end

		private

			def position
		  		@imprint[4].to_s
		  	end
		  	def pretreat_level
		  		@imprint[10].to_f
		  	end
		  	def width
		  		@imprint[5].to_f
		  	end
		  	def height
		  		@imprint[6].to_f
		  	end
		  	def inches_from_platen_top
		  		@imprint[7].to_f
		  	end
		  	def inches_from_platen_middle
		  		@imprint[8].to_f
		  	end

		 	def platen_top_offset(position)
	    		if position.include?('Back')
	      			return 3
	    		else
	   		   		return 2
	   		 	end
	 		end

		  	def starting_point
	    		"%02d" % (platen_top_offset(position) + (inches_from_platen_top - 1.5).ceil).to_i
	  		end
	  		
	  		def ending_point
	    		"%02d" % (platen_top_offset(position) + (height.ceil + 2.5).ceil).to_i
	  		end

			def fluid_laydown
			    "%02d" % (pretreat_level).to_i
			end
			
			def nozzle_on_off(nozzle)
			    print_start = (inches_from_platen_middle*1.0) - ( 0.5 * width)
			    print_end = (inches_from_platen_middle*1.0) + (0.5 * width)

			    if (print_start > nozzle[:end]) or (print_end < nozzle[:start])
			      return "00"
			    else
			      return "01"
			    end
			end  		
	end
end