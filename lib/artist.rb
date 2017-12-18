require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name
  @@all = []


  def initialize(name)
    @name=name
    @songs=[]
    @@all<<self
  end

  def add_song(song)
    if self.songs.include?(song) == false
      @songs <<song
    end
    if song.artist != self
      song.artist=self
    end
  end

  def songs
    @songs
  end

  def genres
      genres=self.songs.collect do |song|
        song.genre
      end
      genres.uniq
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
    Artist.new(name)
  end
end
