require 'pry'

class Artist
	
	attr_accessor :name

	@@all = []
	
	def initialize(name)
		@name = name
		@songs = []
	end
	
	def songs
		@songs
	end
	
	def add_song(song)
		if self.songs.include?(song)
			nil
		else 
			self.songs << song
		end
	end
	
	def save
		self.class.all << self
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		self.all.clear
	end
	
	def self.create(name)
		artist = self.new(name)
		artist.save
		artist
	end
	
end
