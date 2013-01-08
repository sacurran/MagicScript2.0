require 'rexml/document'
require 'rexml/xpath'
require 'rexml/element'
require 'magicscript/pretreatcalc'

module MagicScript
	class XmlCreator
		def initialize(folder,imprints)
			@folder=folder
			@imprints=imprints
			@keys=Array.new
			@doc=REXML::Document.new '<Imprints></Imprints>'
		end
		def create
			file=File.new(@folder+"/imprint_export.xml", "w")
	  		@imprints.each do |imprint|
	  			addRow(imprint)
  			end
  			@doc.write file 
			file.close
		end
		def addRow(imprint)
			if @keys.include?(key(imprint))
	      		fillInfo(REXML::XPath.first(@doc,'//Imprints/Imprint[Key=$Key]/Locations',{},"Key"=>key(imprint)), imprint)
	 		else
	 			@keys<<key(imprint)
      			top=@doc.root.add_element 'Imprint'
      			key=top.add_element 'Key'
      			key.add_text(imprint[0].to_s)
      			fillInfo(addTo(top, 'Locations'), imprint)	 			
	    	end
		end
		def fillInfo(parent,imprint)
			location=addTo(parent,'Location')
    		addTo(location,'Name').add_text(locName(imprint))
    		addTo(location,'File').add_text(fileL(imprint))
		    addTo(location, 'Pretreat').add_text(pretreat(imprint)) 
		    addTo(location,'SpecialInstructions').add_text(specialInstructions(imprint))
		end
		def key(imprint)
			imprint[0].to_s
		end
		def locName(imprint)
			imprint[4].to_s
		end
		def fileL(imprint)
			imprint[9].to_s
		end
		def pretreat(imprint)
			p=PretreatCalc.new(imprint)
			p.calc
		end
		def specialInstructions(imprint)
			imprint[17].to_s
		end
		def addTo(parent,child)
			parent.add_element child
		end
	end
end