require_relative 'concerns/findable.rb'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    self.songs << song if !self.songs.include?(song)
    song.artist = self if song.artist != self
  end
  
end