class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def self.create(name)
    self.new(name).save[-1]
  end
  # Individual instances
  def initialize(name)
    @name = name
  end
  def save
    @@all << self
  end
  def artist=(artist)
    @artist = artist
    artist.songs << self
  end
end
