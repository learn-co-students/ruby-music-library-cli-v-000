require 'pry'

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

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

def self.create(name)
  artist = self.new(name)
  artist.save
  artist
end

def add_song(song)
  if song.artist != self
    song.artist = self
end
  if !@songs.include?(song)
    @songs << song
  end
end

def genres
  songs.collect {|song| song.genre}.uniq
end

end
