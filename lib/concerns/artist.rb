class Artist
    attr_accessor :name, :songs
    
    @@all =[]
    
  def initialize(name)
    @name = name
    @songs =[]
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
    artist = self.new(name)
    artist.save
  end
  
  def add_song(song)
    if !song.artist 
      song.artist = self
      @songs << song
    end
  end  
  
  def self.genres
    @songs.map do |song|
      binding.pry
      song.genre
    end
  end  
end