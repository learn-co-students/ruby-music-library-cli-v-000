require_relative './concerns/findable.rb'
class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :genres
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    a = self.new(name)
    a.save
    a
  end
  
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
      song.artist = self if song.artist.nil?
    end
  end
  
  def songs
    @songs
  end
  
  def genres
    @songs.map { |m| m.genre }.uniq
  end
  
end