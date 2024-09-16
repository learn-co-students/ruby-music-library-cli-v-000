require 'pry'

class Artist
  extend Concerns::Findable

  attr_reader :name

  @@all = []

  def initialize(name)
    self.name=(name)
    @songs = []
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new(name).tap{|a| a.save}
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect{|s| s.genre}.uniq
  end

end
