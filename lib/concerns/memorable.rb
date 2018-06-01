



module Concerns::Memorable

	module ClassMethods


		def self.destroy_all
    		all.clear
		end


		def create(name)
			object = self.new(name).tap do |object|
				object.save
			end
		end
	end


	module InstanceMethods


		def save
			self.class.all << self
		end

	end

end