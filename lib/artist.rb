require "pry"

class Artist  
  attr_reader :song
  attr_accessor :name, :title
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs 
    @songs
  end
  
  def name
    @name
  end
  
  def name=(name)
    @name = name
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
    @name = name
    self.new(name).save
    self
  end
  
   def add_song(song)
     #binding.pry
     @song = song
     if !song.artist
       song.artist = self
       self.songs << song
       #@songs << song
     end
    end
    
  def genres
    artist_genres = []
    #binding.pry
    if self.songs == []
      artist_genres << self.song.genre
      elsif self.songs.length > 0
        self.songs.each do |item|
          artist_genres << item.genre
        end
      end
      artist_genres
    end
  end


  #def genres
    artist_genres = []
    #binding.pry
    #if self.songs.length == 0 
      #artist_genres << self.song.genre
    #else 
      #self.songs.each do |item|
      #if !artist_genres.include?(item.genre)
        #artist_genres << item.genre
      #end
    #end
    #artist_genres
  #end
#end
#end