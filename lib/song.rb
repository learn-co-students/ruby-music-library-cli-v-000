require 'pry'
require './config/environment.rb'
class Song 
  
  extend Concerns::Findable
  include Concerns::Instance
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end
  
  def self.all 
    @@all
  end
  
  def artist=(artist)
      @artist = artist
      artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.any?{|song| song == self}
  end
  
  def self.new_from_filename(file)
    file = file.split(" - ")
    artist = Artist.find_or_create_by_name(file[0])
    name = file[1]
    genre = Genre.find_or_create_by_name(file[2].chomp(".mp3"))
    song = self.new(name, artist, genre)
    song
  end
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end
  
end

