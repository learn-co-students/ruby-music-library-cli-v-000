class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def self.create(name)   #initializes and saves the artist
    artist = new(name)
    artist.save
    artist
  end

  def save                # adds the Artist instance to the @@all class variable
    @@all << self
  end
end
