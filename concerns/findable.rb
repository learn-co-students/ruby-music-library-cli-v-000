


module Concerns
	
	module Findable
		def find_by_name(name)
			print_name = self.all.detect { |x| x.name == name}
			print_name
		end
		
		def find_or_create_by_name(name)
			if self.all.detect { |x| x.name == name}.nil?
				print_name = self.create(name)
			else
				self.all.detect { |x| x.name == name }
			end
		end
	end
	
	
	
end


