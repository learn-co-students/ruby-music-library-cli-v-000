require_relative "concerns/findable.rb"
require "pry"
class Artist
  extend Concerns::Findable
  attr_accessor :name, :genre, :songs
  @@all = []

  def initialize(name, genre=nil)
    @songs = []
    @name = name
    @genre = genre
  end
  def self.all 
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def save
    @@all << self
    self
  end
  def self.create(artist_name)
    artist = self.new(artist_name)
    artist.save
  end
  def add_song(song)
    song.artist = self if song.artist != self
    @songs << song if !@songs.include?(song)
  end
  def genres
    @songs.collect {|song| song.genre}.uniq
  end
  def find_by_name(name)
    @@all.find {|item| item.name == name}
  end
end
