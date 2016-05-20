class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    self.save
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
   Song.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
end