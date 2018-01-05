require_relative "../config/environment.rb"

class Genre
	extend Concerns::Findable, Concerns::Memorable
	attr_accessor :name, :songs, :artists
	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def add_song(song)
		@songs << song if !(@songs.include?(song))
		song.genre = self if (song.genre.nil?)
	end

	def artists
		artist_list = @songs.map do |song|
			song.artist
		end
		artist_list.uniq
	end

	def self.all
		@@all
	end

	def save
		@@all << self
		self
	end

	def self.create(name)
		Genre.new(name).save
	end
end