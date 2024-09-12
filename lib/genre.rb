require 'pry'
class Genre
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    genre = self.new(name)
    @@all << genre
    genre
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
      if song.genre == nil
        song.genre = self
        @songs << song
      end   
  end
  
  def artists
    @artists = []
    self.songs.each do |song|
      @artists << song.artist
    end
    @artists.uniq
  end
  
  extend Concerns::Findable
  
end