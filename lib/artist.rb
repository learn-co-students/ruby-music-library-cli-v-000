require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres

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
    self.class.all << self
    self
  end

  def self.create(name)
    self.new(name).save
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
    if !song.artist
      song.artist = self
    end
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

end
