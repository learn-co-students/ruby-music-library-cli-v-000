require 'pry'
require './config/environment.rb'
class Song 
  
  extend Concerns::Findable
  include Concerns::Instance
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    super
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
    genre.songs << self unless genre.songs.any? == self
  end
end

