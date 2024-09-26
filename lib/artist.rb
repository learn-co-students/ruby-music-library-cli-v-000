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
    self.all.clear
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def self.create(name)
    song =self.new(name)
    song.save
    song
  end

  def add_song(song)
    if song.artist == nil
    song.artist = self
    end
    if self.songs.include?(song)
    else
    self.songs << song
    end
    end

    def genres
      genres =self.songs.map do
        |song| song.genre
      end
    #  binding.pry
      genres.uniq
    end


end
