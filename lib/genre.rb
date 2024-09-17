require_relative '../concerns/findable.rb'


class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs, :artists, :genre

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

  def self.create(gen)
    g = Genre.new(gen)
    @@all << g
    g
  end

  def self.find_by_name(name)
    self.all.find do |x|
      x.name == name
    end
  end

  def songs 
    @songs
  end

   def add_song(song)

    if songs.include?(song)
      song
    else
      @songs << song
      song.genre = self
    end
  end

  def artists
    x = songs.collect do |song|
      song.artist
    end
    return x.uniq
  end






end