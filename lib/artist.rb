#saved 
class Artist
  
  extend Concerns::Findable
  

  attr_accessor :name, :songs
  
  @@all = []
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all = []
  end
  
  def genres
    genres = []
    songs.each do |song|
      genres << song.genre
    end 
    genres.uniq
  end 

  def add_song(song)
    if @songs.find{|a| a.name == song.name}
    else
      @songs << song
    end
    if song.artist
      "You have an artist" 
    else
      song.artist=(self) 
    end 
  end 
  
  def save
    @@all << self
  end 
  
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end
    
  
  def initialize(name) 
    @name = name 
    @songs = []
  end 
  
end 