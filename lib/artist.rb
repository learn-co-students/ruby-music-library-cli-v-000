require_relative "../lib/concerns/concerns_findable.rb"

class Artist  
  extend Concerns::Findable
  attr_accessor :name, :title
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs 
    @songs
  end
  
  def name
    @name
  end
  
  def name=(name)
    @name = name
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
  
  def self.create(name)
    @name = name
    self.new(name).save
    self
  end
  
   def add_song(song)
     if !song.artist
       song.artist = self
     end
     if !@songs.include?(song)
       self.songs << song
     end
    end
    
  def genres
    artist_genres = []
    #binding.pry
    #self.songs.each do |item|
    @songs.each do |item|
      if !artist_genres.include?(item.genre)
      artist_genres << item.genre
      end
    end
    artist_genres
  end
end