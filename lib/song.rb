require 'pry'

class Song
  attr_accessor :name, :genre

  @@all= []

  #///CLASS METHODS///#
  def initialize(name,genre=nil)
    @name = name
    @genre = genre

  end
  def self.create(name,genre=nil)
    song = Song.new(name,genre)
    song.save
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end

  #///INSTANCE METHODS///#
  def save
    @@all << self
  end
binding.pry
end

a = Song.new("Song1","genre1")
