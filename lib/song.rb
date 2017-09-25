require 'pry'

class Song
  attr_accessor :name, :artist
  # attr_writer :artist

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    # binding.pry
    @artist = artist
    # Artist.add_song
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

  def self.create(name)
      self.new(name).tap{|a| a.save} #initializes and saves the song
  end

  # def artist
  #    @artist
  # end

  def artist=(artist)
  # #   # binding.pry
    artist.add_song
  end



end
