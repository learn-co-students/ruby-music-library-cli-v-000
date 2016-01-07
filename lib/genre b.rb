require_relative '../concerns/findable.rb'


class Genre
	extend CONCERNS::FINDABLE
	
	attr_accessor :name
	@@all = []
	def initialize(name)
		@name =name
		@songs = []
	end
	
	def songs
		@songs
	end
	
	def artists
		artists = self.songs.collect { |x| x.artist }.uniq
		artists
	end
	
	def save
		@@all << self
	end
	
	def self.create(name)
		new_genre = self.new(name)
		new_genre.save
		new_genre
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		@@all.clear
	end
	
	
end