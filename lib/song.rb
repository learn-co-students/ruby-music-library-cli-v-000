class Song
	extend Concerns::Findable

	attr_accessor :name, :artist, :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
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
		self.class.all << self
	end

	def self.create(song)
		song = Song.new(song)
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

	def self.new_from_filename(file)
		artist, name, genre = file.gsub(".mp3", "").split(" - ")
		song = self.find_or_create_by_name(name)
		song.artist = Artist.find_or_create_by_name(artist)
		song.genre = Genre.find_or_create_by_name(genre)
		song
	end

	def self.create_from_filename(file)
		song = self.new_from_filename(file)
		song.save
		song		
	end
end
