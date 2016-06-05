require 'pry'

class Song

	extend Concerns::Findable

	attr_accessor :name, :artist, :genre
	
	@@all = []
	
	def initialize(name, artist=nil, genre=nil)
		@name = name
		if artist
			self.artist = artist
		end
		if genre
			self.genre = genre
		end
	end
	
	def save
		@@all << self
	end
	
	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end
	
	def genre=(genre)
		@genre = genre
		genre.add_song(self)
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		self.all.clear
	end
	
	def self.create(name)
		song = self.new(name)
		song.save
		song
	end

	
end
