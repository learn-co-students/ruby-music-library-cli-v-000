class Song
  attr_accessor :name, :artist

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
  def initialize(name, artist = nil)
    @name = name
    if !(artist.nil?)
      self.artist=(artist)
    end
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
end
