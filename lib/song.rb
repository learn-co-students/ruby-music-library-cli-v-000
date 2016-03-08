require 'pry'
class Song

  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end


  def save
    @@all << self
    #binding.pry
  end

  def self.create(song)

    song = self.new(song)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end



end