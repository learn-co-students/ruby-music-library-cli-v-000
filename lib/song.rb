require_relative "concerns/findable.rb"

class Song
	extend Concerns::Findable

	attr_accessor :name
	attr_accessor :artist
	attr_accessor :genre

	@@all = []

	def initialize(name, artist=nil, genre=nil)
		@name = name
		@artist = artist unless artist == nil
		artist.add_song(self) unless artist == nil

		@genre = genre unless genre == nil
		genre.songs << self unless genre == nil
	end

	def self.all 
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def save
		@@all << self
	end

	def self.create(name)
		song = Song.new(name)
		@@all << song
		song
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self) unless artist.songs.include?(self)
	end

	def genre=(genre)
		@genre = genre
		genre.songs << self unless genre.songs.include?(self)
	end

	def self.new_from_filename(filename)
		info = filename.split(" - ")
		title, artist_name, genre_name = info[1], info[0], info.last.split(".")[0]

		artist = Artist.find_or_create_by_name(artist_name)
		genre = Genre.find_or_create_by_name(genre_name)
		Song.new(title, artist, genre)
	end

	def self.create_from_filename(filename)
		new_song = new_from_filename(filename)
		@@all << new_song
		new_song
	end
end

