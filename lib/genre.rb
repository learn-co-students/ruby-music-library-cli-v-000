require './concerns/findable.rb'

class Genre 
	extend Concerns::Findable

	attr_accessor :name, :songs, :artists
	@@all = []	

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.all
		@@all
	end
	
	def self.destroy_all
		all.clear
	end

	def self.create(name)
		new_genre = self.new(name)
		new_genre.save
		new_genre
	end

	def artists
		self.songs.collect{|song| song.artist}.uniq
	end

	def save
		@@all << self
	end
end