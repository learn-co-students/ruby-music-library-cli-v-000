require 'pry'
class Artist
  attr_accessor :name
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def genres
    array = []
    self.songs.each do |song|
      array << song.genre
    end
    array.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if !self.songs.include?(song)
      @songs << song
    end
    if song.artist != self
      song.artist = self
    end
  end

end 
