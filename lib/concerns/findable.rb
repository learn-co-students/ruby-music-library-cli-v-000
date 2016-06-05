module Concerns::Findable

	def self.find(name)
		@@all.detect {|x| x.name == name}
	end
	
	def self.find_or_create_by_name(name)
		self.find(name) || self.create(name)
	end

end
