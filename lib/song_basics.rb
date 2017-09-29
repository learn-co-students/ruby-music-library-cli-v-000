require 'pry'
class Song
	extend Concerns::Findable

	attr_accessor :name, :genre, :songs
	attr_reader :artist

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.artist = artist if artist
		self.genre = genre if genre
		save
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.songs << self unless genre.songs.include?(self)
	end

	def self.all # Class Reader
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def save 
		@@all << self
	end

	def self.create(name, artist = nil, genre = nil)
		new(name, artist, genre).tap{|s| s.save}
	end

	def self.new_from_filename(filename)
		artist_name = filename.split(" - ")[0]
		song_name = filename.split(" - ")[1]
		genre_mp3 = filename.split(" - ")[2]
		genre_name = genre_mp3.split(".")[0]

		artist = Artist.find_or_create_by_name(artist_name)
		genre = Genre.find_or_create_by_name(genre_name)
		self.new(song_name, artist, genre)	
	end

	def self.create_from_filename(filename)
		artist_name = filename.split(" - ")[0]
		song_name = filename.split(" - ")[1]
		genre_mp3 = filename.split(" - ")[2]
		genre_name = genre_mp3.split(".")[0]

		artist = Artist.find_or_create_by_name(artist_name)
		genre = Genre.find_or_create_by_name(genre_name)
		self.create(song_name, artist, genre)			
	end

	def to_s
		self.name
		#puts self.name
	end

end

