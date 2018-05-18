require 'pry'
class Song
  @@all = []
  attr_accessor :name,:artist, :genre
  def initialize(name, artist = nil, genre = nil) 
    @name = name 
    @genre = genre
    @artist = artist
    self.save
  end
  def self.all
    @@all
  end 
  def self.destroy_all
    self.all.clear
  end 
  def save 
    self.class.all << self
  end 
  def self.create(song_name)
    song = Song.new(song_name)
  end 
  


end 