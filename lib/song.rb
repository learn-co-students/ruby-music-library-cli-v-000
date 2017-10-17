
class Song
  attr_accessor :name, :artist
    @@all = []
  def initialize(name, artist = nil)
    @name = name
    @artist = artist
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

  def self.create(name)
    Song.new(name).save
  end

  def add_song

  end
end
