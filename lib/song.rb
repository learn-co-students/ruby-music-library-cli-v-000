# 1/8/19  MUST UPDATE from artist-song modules lab

require 'pry'

class Song
  # extend Findable::ClassMethods
  # include Paramable::InstanceMethods

  attr_accessor :name, :artist, :genre


  def initialize(name, artist: "none", genre: "none")
    @name = name

    #attributes.each{|key, value| self.send(("#{key}="), value)}
  end

  def self.create(name)
    Song.new(name).save
    self
  end

  def artist=(artist)
    @artist = artist
    self.artist = Artist.add_song
  end

  def genre=(genre)
    @genre = genre
  end

# @@all array: methods to save, read & delete list of all Song objects
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
# end @@all methods

end
