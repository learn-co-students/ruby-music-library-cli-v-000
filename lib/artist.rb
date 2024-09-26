class Artist
  attr_accessor :name
  @@all = []
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist == nil ? song.artist = self : song.artist

    @songs.include?(song) ? @songs : @songs << song
  end

  def genres
    self.songs.collect { |song| song.genre }.uniq
  end
end
