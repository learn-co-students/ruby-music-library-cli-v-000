module Concerns
  # Module code here
  module Findable
	  	def find_by_name(name)
			temp = self.all.detect{ |x| x.name == name}
			#temp[0] #use this to return the object instead of an array with the object in it
		end

		def find_or_create_by_name(name)
			temp = self.find_by_name(name)
			#binding.pry
			if temp == nil
				temp = self.create(name)
			end
			temp
		end
	end
end