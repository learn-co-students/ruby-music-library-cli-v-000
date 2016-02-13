require 'pry'
class Artist
   attr_accessor :name, :songs, :artist, :song

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
    self
  end

  def self.create(name)
    #binding.pry
    Artist.new(name).save
  end

  def add_song(song)
    @songs.collect{|o| o.artist}.uniq
    if  song.artist != self
      @songs << song
    end
  end

end