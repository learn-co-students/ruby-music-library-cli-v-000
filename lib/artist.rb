require 'pry'
class Artist

  attr_accessor :name, :genre
  @@all=[]


  def initialize(name)
    @name = name
   # @genre = genre
     @songs=[]
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

  def self.create(artist)
    artist = self.new(artist)
    artist.save
    artist
  end

  #def add_song_by_name(song, genre)
  #  song = Song.new(name,genre)
   # @songs << song
   # song.artist = self
 # end

  def add_song(song)
    song.artist = self
    @songs << song
    

  end

  def songs
    @songs
  end

end