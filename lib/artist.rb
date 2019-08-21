require "pry"
class Artist
@@all = []
  attr_accessor :name, :genre
  attr_reader :songs
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs  = []
  end

  def songs
    @songs
  end

  def genres
    @songs.collect{|g| g.genre}.uniq
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
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
    a = self.new(name)
    a.save
    a
  end


end
