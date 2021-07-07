
require "pry"

class Song

	attr_accessor :name
	attr_reader :artist, :genre
	@@all = []
	extend Concerns::Findable
	extend Persistable:: ClassMethods
	include Persistable:: InstanceMethods
	
	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.artist = artist if artist
		self.genre = genre if genre
	end	
	
	def artist=(artist)
	    @artist = artist
			artist.add_song(self)  unless artist.songs.include?(self)
	end
	
	def genre=(genre)
	  @genre = genre
	  genre.add_song(self)  unless genre.songs.include?(self)
	end
	
	def artist
		@artist
	end

	def self.all
		@@all
	end
	
	def self.create(name)
		song = self.new(name)
		song.save
		song
	end
	
	def self.create_from_filename(name)
	  song = self.new_from_filename(name)
	  song.save
	end
	
  def self.new_from_filename(filename)
    song_info = filename.chomp(".mp3").split(" - ")
    song = Song.new(song_info[1])
    song.artist = Artist.find_or_create_by_name(song_info[0]) 
    song.genre = Genre.find_or_create_by_name(song_info[2]) 
    song
  end
end