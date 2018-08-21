class Song

  attr_accessor :name

  @@all = []

  def initialize(name, artist = " ")
    @name = name
    @artist = artist
  end

  def artist=(artist)
    @artist = artist
  end

  def artist
    @artist
  end

  def self.all # Class Reader
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
end
