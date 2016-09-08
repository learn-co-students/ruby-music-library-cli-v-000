class Song
  attr_accessor :name
  @@all = []

  def self.create(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def initialize(name, artist="")
    @name = name
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
  end

  def artist
    @artist
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

end
