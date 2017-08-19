class Song
	attr_accessor :name
	attr_reader :artist, :genre
	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.genre=(genre) if genre
		self.artist=(artist) if artist
	end

	def save
		@@all << self
	end

	def self.create(name)
		song = self.new(name)
		song.save
		song
	end

	def genre=(genre)
		genre.songs << self if !genre.songs.include?(self)
		@genre = genre
		genre.add_song(self)
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def self.find_by_name(name)
		self.all.detect {|song| song.name == name}
	end

	def self.find_or_create_by_name(name)
		self.find_by_name(name) || self.create(name)
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end
end