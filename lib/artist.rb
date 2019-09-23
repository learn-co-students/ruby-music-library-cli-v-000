require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    Artist.new(name).tap do |artist|
      artist.save
    end
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self if song.artist.nil?
    self.songs << song if !self.songs.include?(song)
  end
  
  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
end