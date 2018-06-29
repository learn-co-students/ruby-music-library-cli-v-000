class Artist
  attr_accessor :name, :songs

  @@all = []
  def self.all
    @@all
  end

  def initialize(name)
    self.name = name
  end

  def save
    self.class.all << self
  end

  # MEMORABLE
  def self.create(name)
    artist = self.new(name)
    artist.save
    return artist
  end

  def self.destroy_all
    self.all.clear
  end

end
