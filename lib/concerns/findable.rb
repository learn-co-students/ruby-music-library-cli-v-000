module Concerns
	module Findable
		def find_by_name(song)
			all.find {|f| f.name == song}
		end

		def find_or_create_by_name(song)
			unless (all.find {|f| f.name == song})
				self.create(song)
			end
			all.find {|f| f.name == song}
		end

	end
end
