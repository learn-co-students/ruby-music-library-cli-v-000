require 'bundler'
Bundler.require

module Concerns

	module InstanceMethods
		def save
			self.all << self
		end
	end

	module ClassMethods

		def destroy_all
			self.all.clear
		end



		def create(name)
			instance = self.new(name)
			save
			instance
		end

	end

end

require_all 'lib'
