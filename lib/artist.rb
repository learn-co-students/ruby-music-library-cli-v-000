require_relative "../config/environment.rb"

class Artist
	extend Concerns::Findable, Concerns::Memorable
	attr_accessor :name, :songs, :genres
	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def add_song(song)
		@songs << song if !(@songs.include?(song))
		song.artist = self if (song.artist.nil?)
	end

	def genres
		genre_list = @songs.map do |song|
			song.genre
		end
		genre_list.uniq
	end

	def self.all
		@@all
	end

	def save
		@@all << self
		self
	end

	def self.create(name)
		Artist.new(name).save
	end
end