class Artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  attr_accessor :name

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
  end
end
