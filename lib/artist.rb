#require 'pry'

class Artist 
  
  attr_accessor :name, :genres 
  attr_reader :songs 
  @@all = []
  extend Concerns::Findable
  
  def initialize(name)
    @name = name 
    @songs = []
  end

  def save
    self.class.all << self
  end
  
  def self.all 
      @@all 
  end
    
  def self.destroy_all
    self.all.clear     
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
    if !song.artist
      song.artist = self 
    end
  end
  
  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre 
    end
    genres.uniq 
  end
  
end