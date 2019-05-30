require 'pry'

class Artist
extend Concerns::Findable

  attr_accessor :name, :songs
  attr_reader :genres

  @@all = []

  def initialize(name=nil)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name=nil)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    song.artist = self if song.artist == nil

    if !self.songs.include?(song)
      self.songs << song
    end
  end

  def genres
    self.songs.collect {|i| i.genre }.uniq
  end
end
