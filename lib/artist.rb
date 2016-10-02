
require_relative "../lib/concerns/findable.rb"
class Artist

  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable
  
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

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if @songs.include?(song)
      @songs
    else
      @songs << song
      song.artist = self
    end
  end

  def songs 
    @songs
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end


end
