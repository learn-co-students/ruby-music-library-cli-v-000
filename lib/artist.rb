require 'pry'

class Artist 
  extend Findable
  attr_accessor :name, :songs, :genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
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

  def self.count
    @@all.size
  end

  def self.create(name)
    name = Artist.new(name)
  end

  def add_song(song)
    if song.artist != self
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << (song)
    end
  end

  def genres
    self.songs.collect {|song| song.genre }.uniq
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name) == name;
      create(name)
      else
    end
  end

end