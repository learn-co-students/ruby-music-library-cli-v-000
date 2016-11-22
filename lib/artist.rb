require 'pry'
class Artist
extend Concerns::Findable  
  attr_accessor :name, :songs


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end  

  def genres
    self.songs.map do |tunes|
      genre = tunes.genre
    end.uniq 
  end

  def add_song(song)
    song.artist = self if song.artist != self
    self.songs << song unless @songs.include?(song)
  end
  
  def self.destroy_all
    @@all.clear
  end       
  
  def save
    @@all << self
  end

  def self.create(artist)  
    artist = self.new(artist)
    artist.save
    artist
  end
end  

def add_song(song)
  song.artist = self unless song.artist == self
  @songs << song unless @songs.include?(song)
end

