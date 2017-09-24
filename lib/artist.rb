require_relative "../concerns/findable.rb"

class Artist
  extend Concerns::Findable 
  attr_accessor :name, :songs
  @@all = [] 

 
  def initialize(name) 
    @name = name 
    @songs = []
  end

  def save
    @@all << self 
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self 
  end

  def genres
    songs.collect{ |song| song.genre }.uniq 
  end

  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end