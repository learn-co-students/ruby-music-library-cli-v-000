require_relative '../concerns/findable.rb'

class Artist

  attr_accessor :name, :songs, :artist
  extend Concerns::Findable

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
    @@all << self
  end

  def self.create(artist_name)
    artist = self.new(artist_name)
    artist.save
    artist
  end

  def add_song(song)
    if songs.include?(song) 
      song
    else
      @songs << song 
      song.artist = self
    end
  end

  def songs
    @songs
  end

  def genres
  x = songs.collect do |song|
      song.genre
    end
    return x.uniq
  end


  



end

















