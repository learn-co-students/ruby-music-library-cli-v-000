require_relative '../concerns/findable.rb'


class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs, :artist, :genres

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

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
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