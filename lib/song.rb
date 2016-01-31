class Song
  attr_accessor :name, :artist

  def initialize(name, artist=nil)
    @name = name
    @artist = artist
  end

  @@all = []

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
