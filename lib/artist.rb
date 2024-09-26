require 'pry'
require_relative './concerns/findable.rb'

class Artist
 extend Concerns::Findable
  attr_accessor :name, :songs
  attr_reader :genre  

  @@all = []
  #@@songs = []
  
  def initialize(name)
    @name = name
    #@song = song 
    @songs = []
  end

  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save 
    @@all << self 
  end
  
  def self.create(name)
    artist = self.new(name)
    @@all << artist 
    artist 
  end
  
   def add_song(song)
    @songs << song unless @songs.include?(song) 
    song.artist = self unless song.artist != nil 
    song 
    #binding.pry 
  end
  
  def genres
    #binding.pry
    genres = @songs.collect do |song|
      #binding.pry
      song.genre 
      #binding.pry 
    end
    genres.uniq  
    #binding.pry 
  end


end
