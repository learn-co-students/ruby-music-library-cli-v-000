class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = nil)
    self.name = name
    if artist != nil
      self.artist = artist
      artist.add_song(self)
    end
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
    @@all << Song.new(name)
    @@all
  end

  def artist
    self.artist
  end

end
