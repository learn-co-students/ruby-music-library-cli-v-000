require'pry'
class Song

  attr_accessor :song, :artist, :name

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name)
    @@all << self
    self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end



end