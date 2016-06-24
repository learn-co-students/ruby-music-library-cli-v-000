require 'pry'
class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable
  
#----------Instance methods-----------------
  def save
    @@all << self
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    genre_array = self.songs.collect do |song|
      song.genre
    end
    genre_array.uniq
  end

  def add_song(song)
    song.artist == nil ? song.artist = self : nil
    if !self.songs.include?(song) 
      @songs << song
    end
  end

#----------class methods------------------ 
  @@all = []

  def self.all
    @@all
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    return new_artist
  end

  def self.destroy_all
    self.all.clear
  end


end #of Artist class
