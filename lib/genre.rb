require_relative '../config/environment.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name="Country")
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def artists
    @songs.collect do |song|
      song.artist
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name="DefaultName")
    song = Genre.new(name)
    song.save
    song
    #binding.pry
  end

  def save
    @@all << self
  end

  def artists
    a = []
    @songs.each do |song|
      a << song.artist
    end
    a.uniq
  end
end