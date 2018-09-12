class Artist

attr_accessor :name

@@all = []

  def initialize(artist_name)
    @name= artist_name
    @songs= []
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
  def save
    self.class.all << self
  end 
  
  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist
  end 
  
  def songs
    @songs
  end
  
  def add_song(song)
    if !songs.include?(song) # or if songs.include?(song) == false
      songs << song
    end
    
    song.artist = self unless (song.artist == nil) == false 
    
    # This is also correct:
    
    # song.artist = self unless !(song.artist == nil). Without () it will NOT work
    
    # or:


    # if song.artist == nil
    #   song.artist = self
    # end
  end

end