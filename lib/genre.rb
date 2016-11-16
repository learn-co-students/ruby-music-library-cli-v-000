require 'pry'

class Genre

extend Concerns::Findable

attr_accessor :name
attr_reader :songs

@@all = []

def initialize(name)
@name = name
@songs = []
end

def self.all
	@@all
end

def artists
	artist_array = self.songs.collect do |song|
		song.artist
	end
	unique_artist = artist_array.uniq
	unique_artist
end

def add_song(song)
	@songs << song unless @songs.include?(song)
	song.genre = self unless song.genre == self
end

def save
	@@all << self
end

def self.destroy_all
	@@all.clear
end

def self.create(name)
	genre = Genre.new(name)
	genre.save
	self.all[0]
end

end
