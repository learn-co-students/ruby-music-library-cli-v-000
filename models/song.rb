require_relative "../concerns/findable.rb"
require 'pry'
require_relative "../models/artist.rb"
require_relative "../models/genre.rb"

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre


  @@all

  #Accepts Name for a new song
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  #Returns the class variable @@all
  def self.all
    @@all
  end

  #Resets the class variable
  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  #Will initialize a new song and save that song to the class array
  def self.create(song_name)
    song = self.new(song_name)
    song.save
    return song
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(song_name)
    self.all.detect{|o| o.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create(song_name)
    else
      self.find_by_name(song_name)
    end
  end


  def self.new_from_filename(file_name)
    file_array = file_name.split(/\s[-]\s|.mp3/) #Regex to split this particular mp3 file struct

    artist_name = file_array[0]
    song_name = file_array[1]
    genre_name = file_array[2]

    artist = Artist.find_or_create_by_name(artist_name)
    genre =  Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end
end
