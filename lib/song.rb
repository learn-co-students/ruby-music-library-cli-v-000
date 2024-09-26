require 'pry'
require_relative './concerns/findable.rb'

class Song

	extend Concerns::Findable

	attr_accessor :name, :artist, :genre
	@@all = []

	def initialize(name, artist=nil, genre=nil)
		@name = name
		self.artist = artist if artist
		self.genre = genre if genre
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

	def self.create(name, artist = nil, genre = nil)
		song = self.new(name, artist, genre)
		song.save
		song
	end

	def artist=(artist)
		@artist = artist
		artist.songs << self
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.songs << self unless genre.songs.include?(self)
	end

	def self.find_by_name(name)
		self.all.find {|song| song.name == name}
	end

	def self.find_or_create_by_name(name)
		if self.find_by_name(name) == []
			self.create(name)
		else
			self.find_by_name(name)
		end
	end

	def self.new_from_filename(filename)
		parts = filename.split(" - ")
		artist = Artist.find_or_create_by_name(parts[0])
		genre = Genre.find_or_create_by_name(parts[2].gsub(".mp3", ""))
		song = self.new(parts[1], artist, genre)
	end

	def self.create_from_filename(filename)
		parts = filename.split(" - ")
		artist_name, title, genre_name = parts[0], parts[1], parts[2].gsub(".mp3","")
		artist = Artist.find_or_create_by_name(artist_name)
		genre = Genre.find_or_create_by_name(genre_name)
		self.create(title, artist, genre)
	end

	def to_s
		"#{self.artist.name} - #{self.name} - #{self.genre.name}"
	end

end
