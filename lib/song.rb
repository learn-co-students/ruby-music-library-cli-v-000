class Song
	attr_accessor :name
	attr_reader :artist, :genre
	extend Concerns::Findable

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
		@genre = genre
		genre.songs << self if !genre.songs.include?(self)
		genre.add_song(self)
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def self.new_from_filename(filename)
		attributes = filename.chomp(".mp3").split(" - ")
		song = Song.new(attributes[1])
		song.artist = Artist.find_or_create_by_name(attributes[0])
		song.genre = Genre.find_or_create_by_name(attributes[2])
		song
	end

	def self.create_from_filename(filename)
		self.new_from_filename(filename).tap {|song| song.save}
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def self.sorted
		Song.all.sort {|a, b| a.name <=> b.name}
	end
end