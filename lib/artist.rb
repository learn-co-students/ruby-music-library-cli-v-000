require_relative "concerns/findable.rb"

class Artist
	extend Concerns::Findable

	attr_accessor :name
	attr_accessor :songs

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
		artist = Artist.new(name)
		@@all << artist
		artist
	end

	def add_song(song)
		@songs << song unless @songs.include?(song)
		song.artist = self unless song.artist == self
	end

	def genres
		songs.map {|song| song.genre}.uniq
	end
end
