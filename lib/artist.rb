class Artist
  extend Concerns::Findable

  attr_accessor :name

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
    song = self.new(name)
    song.save
    song
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if not song.artist
    @songs << song if not @songs.include?(song)
  end

  def genres
    # returns unique genres belonging to all the songs of the artist
    @songs.map { |song| song.genre }.uniq
  end

end