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
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
      song = new(name)
      song.save
      song
  end

end
