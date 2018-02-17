class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @artist = artist unless artist == nil
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
    song = self.new(name)
    song.save
    song
  end

end
