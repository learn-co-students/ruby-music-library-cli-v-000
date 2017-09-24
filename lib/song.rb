require_relative './concerns/findable.rb'
require 'pry'
class Song
  extend Concerns::Findable
  
  @@songs = []
  
  attr_accessor :name, :artist, :genre

  def initialize(name,artist=nil,genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre!=nil
  end

  def self.all
    @@songs
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def save
    @@songs << self
  end

  def self.destroy_all
    self.all.clear
  end

def artist=(artist)
  @artist = artist
artist.add_song(self)
end

def genre=(genre)
  @genre = genre
 genre.add_song(self)
end

 def self.new_from_filename(filename)
    file = filename.split(" - ")
    song_name = file[1]
    artist_name = file[0]
    genre_name = file[2].gsub(".mp3","")

    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end


def self.create_from_filename(filename)
    file = filename.split(" - ")
    song_name = file[1]
    artist_name = file[0]
    genre_name = file[2].gsub(".mp3","")

    song = self.create(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song

end
end