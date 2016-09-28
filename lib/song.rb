require 'pry'
class Song
	attr_accessor :name, :artist, :genre

    @@all = []

	def initialize(name)
		@name = name
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def save
		self.class.all << self
	end

	def self.create(name)
		song = Song.new(name)
		binding.pry
		self.all << song

	end
end