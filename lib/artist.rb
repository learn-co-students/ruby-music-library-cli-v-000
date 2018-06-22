require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :song

  @@all = []

  def initialize(name)
      @name = name
      @@all << self
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
      self.new(name)
  end

  def songs
      @songs
  end

  def add_song(song)
        if song.artist == nil
          song.artist = self
        end

        if @songs.include?(song) == false
          @songs << song
        end
  end

  def genres
      songs.map {|song|song.genre}.uniq
  end


end
