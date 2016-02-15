require_relative './concerns/findable.rb'

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
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song) # add the song being passed in to @songs [] unless it exist on the [] already
    song.artist = self if song.artist == nil # set the value of song.artist to the argument being passed in, if value if == nil
  end

  def songs
    @songs
  end

  def genres
    # iterates through all the elements in the @songs [] and returns a new [] with the results for every element
    self.songs.collect {|song| song.genre}.uniq # returns a new [] by removing duplicate values
  end

end
