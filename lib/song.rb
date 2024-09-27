require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :genre
  attr_reader :artist

@@all = []


def initialize(name, artist = nil, genre = nil)
  @name = name
  self.artist=(artist) if artist
  self.genre=(genre) if genre
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end


def genre=(genre)
  @genre  = genre
  genre.songs << self unless genre.songs.include?(self)
end


def self.all
  @@all
end


def self.destroy_all
  all.clear
end

def save
  @@all<< self
end


def self.create(name)
  song = Song.new(name)
  song.save
  song
end

def self.new_from_filename(name)
  artist,song,genre = name.split(" - ")
  genre = genre.split(".")
  genre = genre[0]
  artist = Artist.find_or_create_by_name(artist)
  genre = Genre.find_or_create_by_name(genre)
  self.new(song,artist,genre)
end

def self.create_from_filename(name)
  file = self.new_from_filename(name)
  file.save 

end


end
