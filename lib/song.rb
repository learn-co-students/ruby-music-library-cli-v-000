require_relative './concerns/findable.rb'

class Song
	extend Concerns::Findable
	attr_accessor :name, :artist,:genre
	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		if artist != nil
			self.artist = artist
		end
		if genre != nil
			self.genre = genre
		end
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
		song = self.new(name)
		song.save
		return song
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self)
	end

	# def self.find_by_name(name)
	# 	self.all.detect {|song| song.name == name}
	# end

	# def self.find_or_create_by_name(name)
	# 	if self.find_by_name(name) == nil
	# 		song = self.create(name)
	# 		return song.name
	# 	else
	# 		return name
	# 	end
	# end

	def self.new_from_filename(filename)
		if self.find_by_name(filename.split(" - ")[1]) == nil
			song = Song.new(filename.split(" - ")[1])
			song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
			song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
			return song
		end

	end

	def self.create_from_filename(filename)
		if self.find_by_name(filename.split(" - ")[1]) == nil
			song = Song.create(filename.split(" - ")[1])
			song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
			song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
			return song
		end


	end

end	