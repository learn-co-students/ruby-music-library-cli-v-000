class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @artist = artist
    self.save
  end

  def artist=(artist)
    @artist = artist if artist
    @artist.add_song(self) if artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name)
  end
end
