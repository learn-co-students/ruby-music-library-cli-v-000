require 'pry'
class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist == nil
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def genres
    genres = []
    @songs.each {|s| genres << s.genre if !genres.include?(s.genre)}
    genres
    end

end 
