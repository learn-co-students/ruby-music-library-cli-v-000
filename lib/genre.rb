class Genre  
  extend Concerns::Findable
  attr_accessor :name, :song, :artist 
  
  @@all = []
  @@song_count = 0 
  

  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def songs 
    @songs 
  end 
  
   def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end 
  
  def artists
    artists = @songs.collect do |song|
      song.artist
    end  
    artists.uniq
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist
  end 
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
  @@all.clear
 end 
 
end 