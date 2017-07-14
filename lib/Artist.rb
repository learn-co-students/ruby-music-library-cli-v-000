class Artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  attr_accessor :name, :songs

  def save
    @@all << self
  end

  def add_song(song)
    song.artist = self if song.artist != self || song.artist === nil
    self.songs << song if !self.songs.include?(song)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
  end
end
