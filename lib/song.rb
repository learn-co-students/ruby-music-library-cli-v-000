require_relative './concerns/findable.rb'

class Song

	attr_accessor :name

	def initialize(name)
		@name = name
	end

	@@all = []

end