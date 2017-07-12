
require_relative './concerns/findable.rb'

class Genre
  #lets import the finable module using extend because it is class methods
  extend Concerns::Findable
  attr_accessor :name   #setter and getter instance methods
  @@all = []   #an array to keep track of all created instances of Song class

  def initialize(name)
    @name = name
    @@all << self
    @songs=[]
  end

  #class method to display all instances created under Class
  def self.all
    @@all
  end
  #delete all saved instances of an array
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
  #lets initialize a new song as a variable, and then set that variable to save in the array, (make sure you return the new instance object)
  def self.create(name)
    song = self.new(name)
    self.all << song
    song
  end
  def songs
      @songs
  end
  def artists
    self.songs.collect {|song| song.artist}
    .uniq
  end

end
