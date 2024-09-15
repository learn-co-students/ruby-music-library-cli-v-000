#has many

require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_reader :songs
  
  @@all = []

  def initialize(name)
    @name = name
    @songs = [] #=> store songs in this array
    save
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
    created_artist = Artist.new(name)
  end
  
  def add_song(song) #=> passes in song object as an argument
    if song.artist != self
      song.artist = self
    end
    
    if !@songs.include?(song) #=> if the array does NOT include this song object that walked through the door...
      @songs << song
    end
  end
  
  def genres 
    songs.map(&:genre).uniq
    #=> tap into songs array
    #=> map will return a new array
    #=> return genre for each song in the array
    #=> uniq method will remove any duplicate entries
  end
  
end