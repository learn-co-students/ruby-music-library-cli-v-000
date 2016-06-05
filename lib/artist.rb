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
	
	def genres
		self.songs.map {|song| song.genre}.uniq
	end
	
	def add_song(song)
		(self.songs << song && song.artist = self) unless (self.songs.include?(song) && song.artist == self)	
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
