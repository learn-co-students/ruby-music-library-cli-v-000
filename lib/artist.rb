require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
    end      
    if !@songs.include?(song)
      @songs << song
    end
    song
  end
  
  def genres
    (@songs.collect {|song| song.genre}).uniq
  end
end    