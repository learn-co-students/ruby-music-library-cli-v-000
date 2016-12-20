require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    #@@all << self
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    if song.artist.nil?
      song.artist = self
    end
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

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end