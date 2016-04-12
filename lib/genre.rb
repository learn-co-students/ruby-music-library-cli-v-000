require_relative './concerns/findable.rb'

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
		@@all.clear
	end

	def save
		@@all << self
	end

	def self.create(name)
		genre = self.new(name)
		genre.save
	return genre
	end

	def add_song(song)
		if !self.songs.include?(song)
			self.songs << song
			song.genre = self
		end
	end

	def artists
		artists = []
		self.songs.collect do |i|
			artists << i.artist
		end
		artists.uniq
	end

end