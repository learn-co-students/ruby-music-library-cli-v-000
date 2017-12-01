class Song
  attr_accessor :name, :artist, :genre
  attr_reader

  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @artist = artist
  end

  def artist=(artist)
    @artist = artist
    #Artist.add_song(self)
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

  def self.create(name)
    song = Song.new(name).save.last
  end
end
