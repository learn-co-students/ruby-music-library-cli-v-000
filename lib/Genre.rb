require 'pry'
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  def add_song(song)
    song.genre = self if song.genre == nil
    self.songs << song unless self.songs.include?(song)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def artists
    artists = []
    self.songs.each {|song| artists << song.artist unless artists.include?(song.artist)}
    artists
  end

end
