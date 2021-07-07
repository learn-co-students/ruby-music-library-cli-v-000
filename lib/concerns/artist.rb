
require 'pry'
class Artist
  attr_accessor :name
  attr_reader :genre
  extend Concerns::Findable

    @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def genres
    songs.map {|song| song.genre}.uniq
    #songs.map(&:genre).uniq
  end

  def add_song(song)
       song.artist = self unless song.artist
       @songs << song unless @songs.include?(song)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end
end
