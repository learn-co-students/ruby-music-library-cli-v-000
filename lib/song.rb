
require 'pry'
class Song
	extend Concerns::Findable
	attr_accessor :name
	@@all = []

	def self.all
		@@all
	end

	def initialize(name, artist = nil, genre = nil)
		@name = name
		if artist == nil
			@artist = artist
		else
			self.artist=(artist)
		end

		if genre == nil
			@genre = genre
		else
			self.genre=(genre)
		end

	end

	def artist
		@artist
	end

	def artist=(artist)
		@artist = artist
#binding.pry
		artist.add_song(self)
	end

	def genre
		@genre
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self)
	end

	def save
		@@all << self
	end

	def self.destroy_all
		@@all = []
	end

	def self.create(name)
		temp_song = self.new(name)
		temp_song.save
		temp_song
	end

	def self.new_from_filename(filename)
		song_name = filename.split(" - ")
		#if !find_by_name(song_name[1])
		
			artist = Artist.find_or_create_by_name(song_name[0])
			genre = Genre.find_or_create_by_name(song_name[2].gsub(".mp3", ""))
			song = new(song_name[1], artist, genre)

			song
		#end
	end

	def self.create_from_filename(filename)
		#binding.pry
		song = self.new_from_filename(filename)

		song.save
		
	end

	
end