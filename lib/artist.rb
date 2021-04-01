require 'pry'

class Artist
  extend Concerns::Findable

  @@all = []  
  attr_accessor :name
  
  def initialize(name)
    @name = name
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
    #new.(name).tap{|a| a.save} #Q&A video refactor
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def songs 
    Song.all.select{|song| song.artist == self}
  end
  
  def add_song(song)
    #song.artist = self unless song.artist == self #Q&A video refactor
    #songs << song unless @songs.include?(song) #Q&A video refactor
    if song.artist == nil
      song.artist = self
    end
  end
  
  def genres 
    #self.songs.collect{|song| song.artist}.uniq #Q&A video refactor
    artist_genres = []
    Song.all.each do |song|
      if song.artist == self 
        artist_genres << song.genre
      end
    end
    artist_genres.uniq
  end
end









