class Song

  attr_accessor :name
  @@all = Array.new

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
  end

  def self.all
    @@all
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    @@all << new_song
    new_song
  end

end
