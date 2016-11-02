class Song
	attr_accessor :name, :artist, :genre
	extend Concerns::Findable
	include Concerns::InstanceMethods

	@@all = []

	def initialize(name, artist = nil, genre = nil )
		@name = name
		self.artist = artist if artist
		self.genre = genre if genre
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.songs << self unless genre.songs.include?(self)
	end

	def self.all
		@@all
	end

	def self.new_from_filename(filename)
		section = filename.split(" - ")
		artist_name, song_name, genre_name =  section[0], section[1], section[2].gsub(".mp3", "")
		
		artist = Artist.find_or_create_by_name(artist_name)
		genre = Genre.find_or_create_by_name(genre_name)

		song = self.new(song_name, artist, genre)
	end

	def self.create_from_filename(filename)
		section = filename.split(" - ")
		artist_name, song_name, genre_name =  section[0], section[1], section[2].gsub(".mp3", "")
		 artist = Artist.find_or_create_by_name(artist_name)
		 genre = Genre.find_or_create_by_name(genre_name)

		 song = self.create(song_name)
		 song.artist = artist
		 song.genre = genre
		 song
	end

end
