require 'pry'

# create class Artist 
class Artist 
  
  extend Concerns::Findable
# create initialize method w/argument (name)
  attr_accessor :name, :songs 
# create @@all = [] - class variable
  @@all = []
# create initialize method w/argument (name)
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def add_song(song) # once song instance has been created this method should add the songs to the @songs array
    @songs << song
    song.artist = self # what is the current artist? 
  end 
   
# create class methods for:
    # - self.all
  def self.all 
    # - this method will return contents of @@all array
    @@all
  end 
    # - self.destroy_all 
  def self.destroy_all
    # - set @@all to an empty array
    @@all = []
  end

# create save instance method
  def save 
#  # - this method will add Song instances to the @@all array
    @@all << self 
  end 
# create self.create class method 
  def self.create(name)
  # - this will initialize a new artist and save the artist in the @@all array 
    artist = Artist.new(name)
    @@all << artist
    artist
  end 
end 