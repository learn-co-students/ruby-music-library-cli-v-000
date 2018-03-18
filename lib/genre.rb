require 'pry'
require_relative './concerns/findable.rb'

class Genre
	extend Concerns::Findable

	attr_accessor :name, :songs, :artists

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
		@@all << self
	end
	
	def self.all
		@@all
	end
	
	def self.destroy_all
		@@all = []
	end
	
	def save
		@@all << self
	end
	
	def self.create(genre)
		newGenre = self.new(genre)
	end

	def add_song(song)
		if !self.songs.include?(song)
			self.songs.push(song)
		end
	end

	def artists
		genre_artists = []
		self.songs.each do |song|
			genre_artists.push(song.artist)
		end
		genre_artists.uniq
	end

end