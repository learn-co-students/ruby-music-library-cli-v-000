require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :genres

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
    if @@all.include?(self)
      nil
    else 
      @@all << self
    end
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    @songs.include?(song) ? nil : @songs << song
    song.artist ? nil : song.artist = self
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end