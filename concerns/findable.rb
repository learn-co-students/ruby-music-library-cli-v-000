


module CONCERNS
	
	module FINDABLE
		def find_by_name(name)
			print_name = @@all.detect { |x| x.name == name}
			print_name
		end
		
		def find_or_create_by_name(name)
			if @@all.detect { |x| x.name == name}.nil?
				print_name = self.create(name)
			else
				@@all.detect { |x| x.name == name }
			end
		end
	end
	
	
	
end


