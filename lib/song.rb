class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = "")
    self.name = name
    self.artist = artist
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
