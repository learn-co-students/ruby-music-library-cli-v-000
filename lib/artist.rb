class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def initialize(name)
    @name = name
    @songs = []
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

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if songs.include?(song) == false
  end

  def genres
    songs.collect { |s| s.genre }.uniq
  end



end
