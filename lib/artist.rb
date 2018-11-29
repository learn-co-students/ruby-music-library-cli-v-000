require 'pry'

class Artist
  @@all = []
  attr_accessor :name
  
  def initialize(name)
    @name = name
    @songs = []
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
  
  def self.create(artist)
    new_artist = Artist.new(artist)
    new_artist.save
    new_artist
  end
  
  def add_song(song)
   unless @songs.include?(song)  
      @songs << song
    end
    song.artist ||= song.artist = self
  end
  
  def songs
    @songs
  end
  
  def genres
  
   songs.collect {|s| s.genre}.uniq
   ###  need to iterate over the songs and return the unique genres
  end
end