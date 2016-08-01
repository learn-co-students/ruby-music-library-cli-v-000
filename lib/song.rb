require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @artist = artist
  end

  def artist=(name)
    @artist = name
    @artist.add_song(self)
  end


  def self.create(name)
    Song.new(name).save
    self
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

end