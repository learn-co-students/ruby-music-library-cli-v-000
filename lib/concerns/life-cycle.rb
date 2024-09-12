module LifeCycle
	module ClassMethods

		

		def destroy_all
			self.all.clear
		end

		

		def create(name)
			new_obj = self.new(name)
			 self.all << new_obj
			new_obj
		end
	end

	module InstanceMethods
		def save
			self.class.all << self
		end

	end
end