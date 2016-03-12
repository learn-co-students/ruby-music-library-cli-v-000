require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = Array.new

  def initialize(name)
    @name = name
    @songs = Array.new
  end

  def self.all
    @@all
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if self.songs.include?(song) == false
      self.songs << song
    end
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    thing = Artist.new(name)
    thing.save
    thing
  end

  def self.create_by_name(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
 
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  def self.print_all
    all.each do |thing|
    binding.pry
      puts thing,name
    end
  end

  def genres
    thing = self.songs.collect do |song|
      song.genre
    end
    thing.uniq
  end
end
