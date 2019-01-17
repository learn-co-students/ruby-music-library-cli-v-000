require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    a = Artist.new(name)
    a.save
    a
  end

# @@all array: methods to save, read & delete list of all Song objects
  def self.all
    @@all
  end

  def save
    @@all << self

  end

  def self.destroy_all
    @@all.clear
  end
# end @@all methods

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect{|song| song.genre}.uniq
  end

end # Artist class end
