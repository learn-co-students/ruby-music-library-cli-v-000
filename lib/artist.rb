class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    all.clear
  end
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
  
  def initialize(name)
    @name= name
    @songs= []
  end
  
  def save
    @@all << self
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    
    if song.artist == nil
      song.artist = self
      else
    end
    
    if @songs.include?(song)
      else
      @songs << song
    end
  end
  
  def genres
    songs.collect {|s| s.genre }.uniq
  end
  
end