class Artist
  # Initial Set Up
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  # Class Methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  # Instance Methods
  def save
    @@all << self
    self
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end
end
