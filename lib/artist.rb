class Artist 
  extend Concerns::Findable

  
  attr_accessor :name
  attr_reader :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end 
  
  
  def add_song(song)
      song.artist = self unless song.artist == self  
      @songs << song unless @songs.include?(song)
  end
 
  def genres
    @songs.collect {|song| song.genre }.uniq
  end
   
  def self.songs 
    @songs 
  end 
 
end 