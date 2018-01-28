require 'pry'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs, :song

  @@all = []

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def save
    if !@@all.include? self
      @@all << self
    end
  end

  def self.create(name)
    self.new(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
    self
  end

  def genres
    #binding.pry
    genres_array = []
    self.songs.each do |song|
      if !genres_array.include?(song.genre)
        genres_array << song.genre
      end
    end
    genres_array
  end


end
