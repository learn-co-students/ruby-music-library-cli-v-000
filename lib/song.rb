class Song

  @@all = []

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
end
