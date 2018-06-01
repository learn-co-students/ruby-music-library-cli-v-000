require "pry"
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end
  
  def self.all 
   @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  
  def genres 
    songs.collect{|song| song.genre}.uniq
  end
  

 def self.find_or_create_by_name(artist_name)
    self.find_by_name(artist_name) || self.new(artist_name)
    end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist.nil?
  end
end