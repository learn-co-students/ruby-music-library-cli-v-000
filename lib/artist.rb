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

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self unless self.class.all.include?(self)
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless songs.include?(song)
  end

  def genres
    genres = songs.collect {|song| song.genre}
    genres.uniq
  end

 def self.print_artists
    all.each {|artist| puts artist.name}
  end
end