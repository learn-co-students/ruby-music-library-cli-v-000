require_relative "../config/environment.rb"

class Song
	extend Concerns::Memorable
	attr_accessor :name, :artist, :genre
	@@all = []

	def initialize(name, artist={}, genre={})
		@name = name
		if artist != {}
			self.artist=(artist)
		end
		if genre != {}
			self.genre=(genre)
		end
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self)
	end

	def self.find_by_name(name)
		@@all.find do |song|
			song.name == name
		end
	end

	def self.find_or_create_by_name(name)
		if (self.find_by_name(name))
			self.find_by_name(name)
		else
			self.create(name)
		end
	end

	def self.all
		@@all
	end

	def save
		@@all << self
		self
	end

	def self.create(name)
		Song.new(name).save
	end

	def self.new_from_filename(file)
		song_name = file.split(" - ")[1]
		artist_name = file.split(" - ")[0]
		genre_name = file.split(" - ")[2]
		artist = Artist.find_or_create_by_name(artist_name)
		genre = Genre.find_or_create_by_name(genre_name.split(".")[0])
		song = Song.new(song_name, artist, genre)
	end

	def self.create_from_filename(file)
		new_song = self.new_from_filename(file)
		@@all << new_song
	end
end