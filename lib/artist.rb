require './concerns/findable.rb'

class Artist 
	extend Concerns::Findable

	attr_accessor :name, :songs, :genres
	@@all = []	

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.all
		@@all
	end

	def genres
		self.songs.collect{|song| song.genre}.uniq
	end
	
	def self.destroy_all
		all.clear
	end

	def save
		@@all << self
	end

	def add_song(song)
		song.artist = self if song.artist == nil
		song.artist.songs << song
		song.artist.songs.uniq!
	end

	def self.create(name)
		new_artist = self.new(name)
		new_artist.save
		new_artist
	end
end