require_relative '../concerns/findable.rb'

class Artist 
  extend Concerns::Findable
  
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    self.name = name 
    @songs = []
  end 

  def songs
    @songs
  end 

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = []
    self.songs.collect do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
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

  def self.create(name)
    created_artist = Artist.new(name)
    created_artist.save
    created_artist
  end 

  def print 
    puts self.name
  end

  def self.print_all
    self.all.each do |artist|
      artist.print
    end
  end
end 