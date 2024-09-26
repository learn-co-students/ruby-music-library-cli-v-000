require 'pry'
require_relative '../lib/concerns/findable'

class Song

attr_accessor :name, :artist, :genre
extend Concerns::Findable

@@all = []

def initialize(name, artist = nil, genre = nil)
  @name =name
  self.artist= artist unless artist == nil
  self.genre = genre unless genre ==nil
end

def artist=(artist)
    @artist= artist
    artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
  #adds the song to the genre's collection of songs (genre has many songs)
  #song is self and the genre's collection of songs is @songs but in class Genre. How to I get that here?
  #@songs << self or is it genre.songs << self
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
  self.new(name).tap{|song| song.save}
end

def self.new_from_filename(filename)

     artist_name = filename.split(" - ")[0] #"Thundercat" --> artist
     artist_object = Artist.find_or_create_by_name(artist_name)
     song_name = filename.split(" - ")[1] #For Love I Come
     genre_name = filename.split(" - ")[2].gsub(".mp3","") #Dance
     genre_object = Genre.find_or_create_by_name(genre_name)
     new_song = self.new(song_name,artist_object,genre_object)
     new_song
end


def self.create_from_filename(filename)
     self.new_from_filename(filename).save
   end
end
