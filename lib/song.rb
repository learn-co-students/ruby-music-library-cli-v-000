require 'pry'

class Song
  attr_accessor :name, :artist

  @@all=[]

  def initialize(name, artist=nil)
    @name=name
    # self.artist=(artist)
    self.artist = artist if artist

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

  def artist=(artist)
    @artist=artist
    artist.add_song(self)
  end

end
