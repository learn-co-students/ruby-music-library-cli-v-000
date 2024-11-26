class Artist 
  extend Concerns::Findable
  attr_accessor :name, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name
    # @@all << self
    @songs = []
  end
  
  def genres
    @songs.collect do |g| #collect returns a NEW array containing values returned by block
      g.genre
    end.uniq
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
  
  def self.create(artist)
    new_artist = self.new(artist)
    new_artist.save
    # new_artist
  end
  
  def songs 
    @songs
  end
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self
    end
    @songs.include?(song) ? nil : @songs << song
    end
    
end
