class Song

  attr_accessor :name, :artist

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist = "nil")
    @name = name
    @@all << self
    self.artist = artist
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name)
  end

end
