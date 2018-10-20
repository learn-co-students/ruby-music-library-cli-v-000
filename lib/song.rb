require_relative './concerns/findable.rb'
require 'pry'

class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name= name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
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
    song = Song.new(song)
    song.save
    song
  end
  
  def artist=(artist)
    @artist= artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre= genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create(song)
  end
  
  def self.new_from_filename(file_name)
    file = file_name.split('-')
    artist = Artist.find_or_create_by_name(file[0].strip)
    song = file[1].strip
    genre = Genre.find_or_create_by_name(file[2].strip.delete('.mp3'))
    song = Song.new(song, artist, genre)
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    @@all << song
  end
  
end