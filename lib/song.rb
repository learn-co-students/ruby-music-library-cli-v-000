require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Findable
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(name)
    @artist = name
    artist.add_song(self)
  end

  def genre=(name)
    @genre = name
    genre.add_song(self)
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