require "pry"

class Song

	extend Concerns::Findable 

	attr_accessor :name, :genre, :artist

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		if artist
			self.artist = artist
		end
		if genre
			self.genre = genre
		end
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		if !genre.songs.include?(self)
			genre.songs << self
		end
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def save
		@@all << self unless @@all.include?(self)
	end

	def self.create(name)
		song = self.new(name)
		song.save
		song
	end

	def self.new_from_filename(filename)
		song = find_or_create_by_name(filename.split(/\s-\s/)[1])
		song.artist = Artist.find_or_create_by_name(filename.split(/\s-\s/)[0])
		song.genre = Genre.find_or_create_by_name(filename.split(/\s-\s|.mp3/)[2])
		song
	end

	def self.create_from_filename(filename)
		new_from_filename(filename).save
	end

end