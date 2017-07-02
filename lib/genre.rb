class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
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
    @songs = []
  end
  def save
    @@all << self
  end
  def artists
    @songs.collect { |song| song.artist }.uniq
  end
end
