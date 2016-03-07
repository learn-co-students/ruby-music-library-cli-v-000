require 'pry'
class Song

  attr_accessor :name, :artist, :genre
  @@all=[]

  def initialize(name)
    @name = name
    @songs =[]
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

  def self.create(song)
    song = Song.new(song)
    song.save
    song
  end



  

end