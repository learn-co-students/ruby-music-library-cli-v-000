require 'pry'
class Artist
  extend Concerns::Findable

  attr_accessor :name
  @@all = []



  def initialize(name)
    @name = name
     @songs =[]
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
    artist = self.new(artist)
    artist.save
    artist
  end



  def add_song(song)
    binding.pry

    song.artist = self
    @songs << song

  end
   def songs
    @songs
  end
end