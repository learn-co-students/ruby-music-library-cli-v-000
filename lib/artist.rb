require 'pry'

class Artist

extend Concerns::Findable

attr_accessor :name
attr_reader :songs

@@all = []

def initialize(name)
	@name = name
	@songs = []
end

def add_song(song)
	@songs << song unless @songs.include?(song)
	song.artist = self unless song.artist == self
end


def genres
	genre_array = self.songs.collect do |song|
		song.genre
	end
	unique_genre = genre_array.uniq
	unique_genre
end

def self.all
	@@all
end

def save
	@@all << self
end

def self.destroy_all
	@@all.clear
end

def self.create(name)
	new(name).tap{|a|a.save}
end

end
