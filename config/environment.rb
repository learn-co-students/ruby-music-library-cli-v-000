require 'bundler'
require 'pry'
Bundler.require

module Concerns

	module InstanceMethods
		def save
			self.class.all << self
		end
	end

	module Findable

	end

	module ClassMethods

		def destroy_all
			self.all.clear
		end

	end

end

require_all 'lib'
