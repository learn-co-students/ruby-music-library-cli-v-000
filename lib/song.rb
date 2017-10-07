require 'pry'

class Song

  @@all = [ ]

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.all #had to fix - forgot self
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self #had to fix -- forgot self.class
  end

  def self.create(name) #had to fix - the problem was it wanted me to return the created instance.
    song = self.new(name)
    song.save
    song
  end

end
