require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist

  def initialize(name,*artist)
    @name = name
    #if there is an artist parameter passed, assign it to @artist
    @artist = artist
    if @artist[0].class == Artist
      @artist[0].songs << self
    end
    self
  end

  @@all = [] #holds all Song objects

  def self.create(name)
    s = Song.new(name)
    s.save
    s
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

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

end
