require 'pry'

class Song

	attr_accessor :name, :artist, :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
	@name = name
	self.artist = artist if artist
	self.genre = genre if genre
	end

	def artist=(artist)
		@artist = artist
		#binding.pry
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self)
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all = []
	end

	def self.create(name, artist = nil, genre = nil)
		new(name, artist, genre).tap {|s| s.save}
	end

	def save
		@@all << self
	end

	def self.find_by_name(name)
		self.all.detect{|song| song.name == name}
	end

	def self.find_or_create_by_name(name)
		self.find_by_name(name) || self.create(name)
	end

	def self.new_from_filename(file)
		naming = file.split(" - ")
		song_artist = naming[0]
		song_name = naming[1]
		song_genre = naming[2].gsub(".mp3", "")

		artist = Artist.find_or_create_by_name(song_artist)
		genre = Genre.find_or_create_by_name(song_genre)
		self.new(song_name, artist, genre)
		#binding.pry
	end

	def self.create_from_filename(file)
		naming = file.split(" - ")
		song_artist = naming[0]
		song_name = naming[1]
		song_genre = naming[2].gsub(".mp3", "")

		artist = Artist.find_or_create_by_name(song_artist)
		genre = Genre.find_or_create_by_name(song_genre)
		self.create(song_name, artist, genre)
	end
end