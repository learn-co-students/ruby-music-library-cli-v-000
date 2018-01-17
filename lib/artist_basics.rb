require 'pry'

class Artist

  extend Concerns::Findable

  #each artist instance has a bunch of songs associated with it, each song has a genre
  

  @@all = []
  

  def initialize(n)
    @name = n
    save
    @songs = []
    
  end

  def name
    @name
  end

  def name=(n)
    @name = n
  end

  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(n)
    Artist.new(n)
  end

  def songs
    @songs
  end

  #adding song to artist

  def add_song(song)
    
    if !@songs.include?(song)
      @songs << song
    end

    if song.artist == nil
      song.artist = self
    end

  end


  # linking genre to artist through songs

  def genres
    a = []
    @songs.collect do |song|
      a << song.genre 
    end 

    return a.uniq
  end


end