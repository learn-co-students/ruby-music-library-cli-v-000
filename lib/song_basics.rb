require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist
  

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist if artist
    artist.songs << self if artist
    
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)#, artist = "")
    new_song = Song.new(name)#, artist)
    new_song.save

    return new_song
  end
  
    
end #of class Song


# def Song.new_by_filename(filename)
  #   new_name = filename.split(" - ")[1]
  #   new_song = Song.new(new_name)
  #   new_song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])    
  #   new_song
  # end