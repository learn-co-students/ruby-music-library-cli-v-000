
require 'pry'
class Song
attr_accessor :name
attr_reader :artist, :genre
@@all = []

def initialize(name, artist = nil, genre = nil)
  self.artist = artist if artist
  self.genre = genre if genre
  @name = name
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

def self.create(song)
  new_song = self.new(song)
  new_song.save
  new_song
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
  @@all.find {|x| x.name == name}
end

def self.find_or_create_by_name(name)
  if self.find_by_name(name)
    self.find_by_name(name)
  else
    self.create(name)
   end
end

def self.new_from_filename(filename)

   song_name = filename.split(" - ")[1]
   artist_name = filename.split(" - ")[0]
   genre_name = filename.split(" - ")[2].gsub(".mp3","")
   x = Artist.find_or_create_by_name(artist_name)
   y = Genre.find_or_create_by_name(genre_name)
   new_song = self.new(song_name, x, y)
   new_song

  #  new_song.artist = x
  #  new_song.genre = y
end

def self.create_from_filename(filename)
  self.new_from_filename(filename).save
end









end
