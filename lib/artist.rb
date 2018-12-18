class Artist 
  
  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name
    @@all = []    
    @songs = []
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all = []
  end

  def save 
    @@all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save 
    new_artist
  end

  def add_song(song)
    if song.artist != self && !songs.include?(song)
      song.artist = self
      @songs << song
    end
  end
  
end 
