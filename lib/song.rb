require 'pry'

class Song

	extend Concerns::Findable
	
	attr_accessor :name, :artist, :genre
	
	@@all = []
	
	def initialize(name, artist=nil, genre=nil)
		@name = name
		if artist
			self.artist = artist
		end
		if genre
			self.genre = genre
		end
	end
	
	def self.new_from_filename(filename)
		array = filename.chomp(".mp3")
		artist_name,song_name,genre_name = array.split(" - ")
		song = Song.new(song_name)
		song.artist = Artist.find_or_create_by_name(artist_name)
		song.genre = Genre.find_or_create_by_name(genre_name)
		song
	end
	
	def self.create_from_filename(filename)
		array = filename.chomp(".mp3")
		artist_name,song_name,genre_name = array.split(" - ")
		song = Song.new(song_name)
		song.artist = Artist.find_or_create_by_name(artist_name)
		song.genre = Genre.find_or_create_by_name(genre_name)
		song.save
		song	
	end
	
	def save
		@@all << self
	end
	
	def artist=(artist)
		@artist = artist
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
		self.all.clear
	end
	
	def self.create(name)
		song = self.new(name)
		song.save
		song
	end

	
end
