require "pry"
class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []
  def initialize(name)
    @songs = []
    @name = name
    save
  end

  def songs
    @songs
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

  def self.create(song)
    new_song = Artist.new(song)
  end

  def add_song(song)
    # new_song  = Song.new(song)
    if song.artist == nil
      song.artist = self
    end
    # new_song.name = song.name
    if @songs.include?(song) == false
      @songs << song
    end
  end

  def genres
    @songs.map(&:genre).uniq
  end

  



end
