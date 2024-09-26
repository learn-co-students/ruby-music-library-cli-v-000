class Artist
  extend Concerns::Findable

  attr_accessor :name
  @@all =[]

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
    song.artist = self if !song.artist
    @songs<< song if !@songs.include?(song)
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end
end
