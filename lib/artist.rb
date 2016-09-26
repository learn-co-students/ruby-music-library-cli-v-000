require_relative './concerns/findable.rb'

class Artist

	attr_accessor :name

	def initialize(name)
		@name = name
	end

	@@all = []

end