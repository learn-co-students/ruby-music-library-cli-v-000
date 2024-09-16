require './concerns/findable.rb'

class Song
	extend Concerns::Findable

	attr_accessor :name, :artist, :genre
	@@all = []	

	def initialize(name, artist=nil, genre=nil)
		@name = name
		@artist = artist
		@genre = genre

		artist.songs << self if artist != nil
		genre.songs << self if genre != nil
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.songs << self
		genre.songs.uniq!
	end

	def self.all
		@@all
	end

	def self.destroy_all
		all.clear
	end

	def save
		@@all << self
	end

	def self.create(name)
		new_song = self.new(name)
		new_song.save
		new_song
	end

	def self.new_from_filename(file)
		file_array = file.split(" - ")
		song_artist = file_array[0]
		song_name = file_array[1]
		song_genre = file_array[2].split(".") # separate genre from file type(.mp3)
		new_artist = Artist.find_or_create_by_name(song_artist)	
		new_genre = Genre.find_or_create_by_name(song_genre[0])	
		new_song = Song.find_or_create_by_name(song_name)
		new_song.artist = new_artist
		new_song.genre = new_genre
		new_song
	end

	def self.create_from_filename(file)
		new_from_filename(file)
	end
end