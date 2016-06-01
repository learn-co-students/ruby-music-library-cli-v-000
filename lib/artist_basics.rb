require 'pry'
class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  
  

#----------Artist methods-----------------
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    return new_artist
  end

  def self.destroy_all
    self.all.clear
  end

  

  
#--------------Genre methods-------------   
  def genres
    genre_array = self.songs.collect do |song|
      song.genre
    end
    genre_array.uniq
  end


#--------------Song methods--------------


  def add_song(song)
    song.artist == nil ? song.artist = self : nil
    if !self.songs.include?(song) 
      @songs << song
    end
    
  end

  def songs
    @songs
  end

end #of Artist class
