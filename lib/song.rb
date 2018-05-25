class Song
  attr_accessor :name

  # CLASS VARIABLES AND METHODS
  @@all = Array.new

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  # INSTANCE VARIABLES AND METHODS
  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end
end
