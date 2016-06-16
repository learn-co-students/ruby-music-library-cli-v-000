class Song

	extend Concerns::Findable

	attr_accessor :name
	attr_reader :artist, :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		artist.add_song(self) if artist
		genre.add_song(self) if genre
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all.clear
	end

	def self.create(name)
		song = Song.new(name)
		song.save
		song
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self)
	end

	def self.new_from_filename(filename)
		name = filename.split(" - ")[1]
		artist = filename.split(" - ")[0]
		genre = filename.split(" - ")[2].gsub(".mp3", "")
		song = Song.new(name)
		song.artist = Artist.find_or_create_by_name(artist)
		song.genre = Genre.find_or_create_by_name(genre)
		song.save
		song
	end

	def self.create_from_filename(filename)
		song = self.new_from_filename(filename)
		song
	end

end