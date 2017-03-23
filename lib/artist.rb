class Artist

  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name=name
    @songs = []
  end

  def save
    artist = Artist.new(name)
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song if !self.songs.include?(song)
    song.artist = self if !song.artist
  end

  def genres
      self.songs.collect { |a| a.genre }.uniq
  end

end
