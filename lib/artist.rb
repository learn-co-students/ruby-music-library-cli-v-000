class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).save
    self
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist |= self
    self.songs << song unless self.songs.include?(song)
  end
end
