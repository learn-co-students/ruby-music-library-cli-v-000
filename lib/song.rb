class Song
	attr_accessor :name, :artist, :genre
	extend Concerns:Findable
	include Concerns::InstanceMethods

	@@all = []

	def initialize(name, artist = nil, genre = nil )
		@name = name
		@artist = artist
		@genre = genre
	end

	def self.all
		@@all
	end

	def self.new_from_filename(filename)
		artist, song = filename.split(" - ")[0], filename.split(" - ")[1]
		song = self.new(song)
		song.artist = Artist.find_or_create_by_name(artist)

	end

	def self.create_from_filename(filename)
		artist, song = filename.split(" - ")[0], filename.split(" - ")[1]
		song = self.create(song)
		song.artist = Artist.find_or_create_by_name(artist)
	end

end
