require 'pry'

class Artist
  extend Concerns::Findable

attr_accessor :name, :songs, :song, :genre

@@all = []

def initialize(name)
@name = name
@songs = []
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
artist = Artist.new(name)
artist.save
artist
end

def add_song(song)
  song.artist = self unless song.artist
  @songs << song unless songs.include?(song)
end

def genres
@songs.collect do |songs|
songs.genre
end.uniq
end

end
