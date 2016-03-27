module Concerns::Findable
	def find_by_name(name)
		all.find{|x| x.name == name}
	end

	def find_or_create_by_name(name)
	  if self.all.any?{|x| x.name == name}
	  	self.find_by_name(name)
	  else
			self.create(name)
		end
	end
end