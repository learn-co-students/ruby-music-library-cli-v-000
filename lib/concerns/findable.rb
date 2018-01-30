module Concerns
	module Findable
		def find_by_name(name)
			obj = self.all.detect do |a|
			 a.name == name 

			end
		end

		def find_or_create_by_name(name)
			if self.find_by_name(name)
				obj= self.find_by_name(name)
				else	
				obj =self.create(name)
			end
			obj
		end
	end
end 