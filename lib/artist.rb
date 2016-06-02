require 'pry'
class Artist
  attr_accessor :name, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.add_song(song)
    @songs << song
    song.artist = self
  end

  def genres
    self.songs.collect {|song| song.genre}
  end

  def self.all
    @@all
  end

  def save
   @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save 
    new_artist
  end



end