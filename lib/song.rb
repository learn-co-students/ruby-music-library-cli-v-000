require 'pry'

class Song
  attr_accessor :name

  @@all=[]

  def initialize(name)
    @name=name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song=Song.new(name)
    song.save
    song
    # binding.pry
  end

end
