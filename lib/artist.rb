#require_relative './concerns/findable.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
    #since this is a class method the self in front of "all" is not needed
  end

  def self.create(name)
    artist = Artist.new(name) #same as above, Aritst not necessary
    artist.save
    artist
# Or, as a one-liner:
# new(name).tap{ |a| a.save }
  end

  def add_song(song)
    songs << song if !songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end

end
