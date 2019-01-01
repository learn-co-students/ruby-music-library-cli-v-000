require 'pry'

class Artist
  
  attr_accessor :name, :song
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
  
  def songs
    @songs
  end
  

  def add_song(song)  #song is an object
    @song << song
    song.artist = self unless song.artist == self

  end

  def self.find_or_create_by_name(artist)
    binding.pry
    if @@all.find {|artist| artist.name == artist}.nil? 
      @@all.find {|artist| artist.name == artist}  
    else
        self.create(artist)
    end
  end

end