require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []
 
  def initialize(name)
    @name = name
     @songs = []
    save
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
    name = Artist.new(name)
  end


  def add_song(song)
     if song.artist != self
       song.artist = self
     end
     if !@songs.include?(song)
       @songs << (song)
     end
   end

  # def add_song(song)
  #   if @@all.include?(song.artist) && @song.include?(song)
  #      @songs << song
  #   else 
  #       @songs << song
  #   end
  # end

end