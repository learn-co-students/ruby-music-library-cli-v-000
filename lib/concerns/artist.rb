require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :genre
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

  #Custom Constructor
  def self.create(new_artist)
    n = Artist.new(new_artist)
    n.save
    n
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

end
