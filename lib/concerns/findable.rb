module Concerns::Findable

	def find_by_name(name)
		self.all.detect {|nombre| nombre.name == name}
	end

	def find_or_create_by_name(name)
		self.find_by_name(name) || self.create_by_name(name)
	end
end