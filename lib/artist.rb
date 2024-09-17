require 'pry'
class Artist
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all=[]

  def initialize(name)
    @name=name    #initializes with a name
    @songs=[]
  end



  ##! How is this going to be generalizable?
  def self.all  #expose the class variable @@all
    @@all
  end

  def self.destroy_all #destroy all songs!
    @@all.clear
  end

  def save
    @@all<<self  #generalizable save method that requires the all method
  end

  def self.create(name) #just like initialize, but with save!
    artist = Artist.new(name)
    artist.save
    artist
  end

  #relational methods
  def songs
    @songs
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs<<song
      if song.artist==nil
        song.artist=self
      end
    end
  end

  def genres
    res=[]
    @songs.each do |song|
      if !res.include?(song.genre)
        res<<song.genre
      end
    end
    res
  end





end
