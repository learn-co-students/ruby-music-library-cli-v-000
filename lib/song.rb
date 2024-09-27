require_relative 'concerns/findable.rb'

class Song
	extend Concerns::Findable
	attr_accessor :name, :genre
	attr_reader :artist

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.artist=artist
		self.genre=genre
		
		
	end

	def self.all
		@@all
	end

	def self.destroy_all 
		self.all.clear
	end

	def save
		self.class.all << self
	end

	def self.create(name, artist = nil, genre = nil)
		song = self.new(name, artist, genre)
		song.save
		song
	end

	def artist=(artist)
		if @artist.nil? && !artist.nil?
			@artist = artist
			artist.add_song(self)
		end
	end

	def genre=(genre)
		if @genre.nil? && !genre.nil?
			@genre = genre
			genre.add_song(self)
		end
	end

	def self.new_from_filename(filename)
		temp = filename.split(" - ")
		artist = Artist.find_or_create_by_name(temp[0])
		genre = Genre.find_or_create_by_name(temp[2].sub(".mp3",""))
		new(temp[1], artist, genre)
	end

	def self.create_from_filename(filename)
		temp = new_from_filename(filename)
		temp.save
		temp
	end
	
end