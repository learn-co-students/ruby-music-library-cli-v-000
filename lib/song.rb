require './concerns/findable.rb'

class Song
	extend Concerns::Findable
	attr_accessor :name
	attr_reader :artist, :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.artist = artist unless artist == nil
		self.genre = genre unless genre == nil
	end

	def save
		@@all << self
		self
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self) unless artist.songs.include?(self)
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self) unless genre.songs.include?(self)
	end



	def self.new_from_filename(filename)
		filename_array = filename.split(" - ")
		artist = Artist.find_or_create_by_name(filename_array[0]) 
		genre = Genre.find_or_create_by_name(filename_array[2].gsub('.mp3', ''))
		song = Song.new(filename_array[1])
		song.artist = artist
		song.genre = genre
		song
	end

	def self.create_from_filename(filename)
		self.new_from_filename(filename).save
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def self.create(name)
		song = self.new(name)
		song.save
		song
	end




end



