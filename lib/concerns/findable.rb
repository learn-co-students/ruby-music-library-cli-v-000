module Concerns::Findable

	def find_by_name(name) #=> arg = str
		self.all.detect { |music| music.name == name }
	end
	
	def create(info)
		new_info = self.class.new(info)
		new_info.save
		new_info
	end
	
	def find_or_create_by_name(name)
		self.find_by_name(name) || self.create(name)
	end

end