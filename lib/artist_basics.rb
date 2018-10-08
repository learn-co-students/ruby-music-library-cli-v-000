class Artist 
  attr_accessor :name, :songs 

  
   @@all = []
   
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def add_song(song)
   @songs << song unless @songs.include? song 
    if song.artist != self  
      song.artist = self 
    end 
end   

  def self.create(name)
    created_artist = Artist.new(name)
    created_artist.save 
    created_artist 
  end 
  
  
  
  def self.all 
    @@all 
  end 
  

  
  def save
    self.class.all << self 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def genres 
  genres_array = []
 @songs.collect do |song|
   genres_array << song.genre 
  end 
  genres_array.uniq
end 

  
  
end 