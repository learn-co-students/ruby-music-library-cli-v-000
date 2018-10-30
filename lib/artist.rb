class Artist
  attr_accessor :name

  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).save
    return self
  end

  def save
    @@all << self if !@@all.include?(self)
  end

  def add_song(song)
    song.artist = self if !song.artist
    @songs << song if !@songs.include?(song)
  end

  def songs
    @songs
  end

  def genres
    @songs.map { |song| song.genre }.uniq
  end
end
