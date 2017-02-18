require 'pry'
class Artist
  include Concerns::Findable
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

 #since we have the attr_accessor i'm going to remove this
  `def songs
    @songs
  end`

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def genres
    # this method looks correct :D so let's look at what it calls
    self.songs.collect{|song| song.genre}.uniq
    # binding.pry

  end

  def self.create(name)
    self.new(name).tap{ |g| g.save}
  end
end
