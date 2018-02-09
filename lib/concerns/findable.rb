module Concerns::Findable
	def find_by_name(nam)
		self.all.detect{|song| song.name == nam}
	end

	def find_or_create_by_name(nam)
		self.find_by_name(nam) ? self.find_by_name(nam) : self.create(nam)
	end
end