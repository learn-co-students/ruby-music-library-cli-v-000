
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

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    #artist.name = name
    artist.save
    artist
  end

  def add_song(song)
    #does not assign the artist to the song if the song already has the artist
    song.artist = self if song.artist != self
     
    self.songs << song if self.songs.detect(song) == nil

  end

  def genres
    ary = self.songs.collect do |song|
      song.genre
    end
    ary.uniq
  end


end