require_relative './concerns/findable.rb'

class Genre

	attr_accessor :name

	def initialize(name)
		@name = name
	end

	@@all = []

end