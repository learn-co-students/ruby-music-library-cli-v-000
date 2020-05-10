module Concerns

	module Findable

		def find_by_name(name)
			self.all.detect {|a| a.name == name }
		end

		def find_or_create_by_name(name)
			if self.find_by_name(name) == nil
				new_instance = self.new(name)
				self.all << new_instance
				new_instance
			else
				self.all.detect {|artist| artist.name == name}
			end
		end

	end

end