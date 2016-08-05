require_relative './concerns/findable.rb'

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

	def self.destroy_all
		@@all.clear
	end

	def save
		@@all << self
	end

	def self.create(name)
		artist = self.new(name)
		artist.save
		return artist
	end

	def add_song(song)
		if !self.songs.include?(song)
			self.songs << song
			song.artist = self
		end
	end

	def genres
		genres = []
		self.songs.collect do |i| 
			genres << i.genre 
		end
		genres.uniq
	end
end