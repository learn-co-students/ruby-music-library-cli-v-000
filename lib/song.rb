require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    self.save
  end

  #ClassMethods

  def self.create(name)
    self.new(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  #InstanceMethods
  def save
    @@all << self
  end

  def artist=(artist)
    @artist=artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    @genre.add_song(self)
  end

end
