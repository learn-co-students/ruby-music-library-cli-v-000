class Song

  @@all = []

  def initialize(name, artist=nil)
    @name = name
    self.artist = artist unless artist == nil
    @@all << self
  end

  attr_accessor :name#, :artist
  attr_reader :artist

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

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
    song = Song.new(name)
  end
end
