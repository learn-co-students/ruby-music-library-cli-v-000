require 'pry'

class Artist

  extend Concerns::Findable

attr_accessor :name
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
  end

  def self.create(name)
    new_song = new(name)
    @@all << new_song
    new_song
  end

  def add_song(song)
     song.artist = self unless song.artist
     songs << song unless songs.include?(song)
   end

  def songs
    @songs
  end

  def genres
    @songs.collect{|s| s.genre}.uniq
  end
end
