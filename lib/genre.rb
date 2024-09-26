#require_relative '/concerns/findable.rb'

class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_reader :artist 

  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save 
    @@all << self 
  end
  
  def self.create(name)
    genre = self.new(name)
    @@all << genre  
    genre 
    #binding.pry
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song) 
    song.genre = self unless song.genre != nil 
    song 
    #binding.pry 
  end
  
  def artists
    #binding.pry
    artists = @songs.collect do |song|
      #binding.pry
      song.artist 
      #binding.pry 
    end
    artists.uniq 
    #binding.pry 
  end

end
