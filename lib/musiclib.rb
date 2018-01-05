class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    @@all<<self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    self.all
  end

  def self.destroy_all
    @@all.clear
  end

end
