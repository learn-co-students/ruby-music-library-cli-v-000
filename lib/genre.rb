# require_relative '../config/environment'

class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end
  
  def add_song(song)
    if song.genre == nil
      song.genre = self
    end
    
    unless @songs.include?(song)
      @songs << song
    end
    
  end
  
  def artists
    artists = []
    @songs.each {|song| artists << song.artist unless artists.include?(song.artist)}
    artists.uniq
  end
  
  def self.all 
    @@all.uniq 
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def save 
    @@all << self unless @@all.include?(self)
  end
end