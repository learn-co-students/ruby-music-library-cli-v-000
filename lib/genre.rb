#require 'pry'

class Genre 
  
  attr_accessor :name, :artist
  attr_reader :songs 
  extend Concerns::Findable
  
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
  end
  
  def self.create(name)
    self.new(name).tap do |instance|
      instance.save
    end
  end

  def add_song(song)
    if !self.songs.include?(song)
      self.songs << song
    end
    if !song.genre
      song.genre = self 
    end
  end
  
  def artists 
    artists = [] 
    self.songs.each do |song|
      artists << song.artist 
    end
    artists.uniq 
  end
  
end