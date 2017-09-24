require "pry"

class Song
	attr_accessor :name
	attr_reader :artist, :genre

	extend Concerns::Findable

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		artist.add_song(self) if artist
		genre.add_song(self)  if genre
		@@all << self
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

	def self.create(song)
		song = self.new(song)
	end

	def artist=(artist)
 		@artist = artist
 		artist.add_song(self)
 	end

 	def genre=(genre)
 		@genre = genre
 		genre.add_song(self)
 	end

	def self.find_by_name(name)
  		self.all.find {|song| song.name == name }
  	end
 

	def self.find_or_create_by_name(name)
     	self.find_by_name(name) || self.create(name)
   	end

   	def self.new_from_filename(file)
 		song_data = file.split(/\s-\s|[.]/)
  		name = song_data[1]
  		artist = song_data[0]
  		genre = song_data[2]
 		song = Song.new(name)
 		song.artist = Artist.find_or_create_by_name(artist)
 		song.genre = Genre.find_or_create_by_name(genre)
 		song.save
 		song
 	end

 	def self.create_from_filename(file)
  		song_data = file.split(/\s-\s|[.]/)
  		name = song_data[1]
  		artist = song_data[0]
  		genre = song_data[2]
  		song = self.new(name)
  		song.artist = Artist.find_or_create_by_name(artist)
  		song.genre = Genre.find_or_create_by_name(genre)
  		song
  	end 

	



end