class Genre 
  extend Concerns::Findable
  attr_accessor :name, :song 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = [] 
  end 
  
  def songs 
    @songs 
  end 
  
  def artists 
    unique_artist = []
    @songs.collect do |song|
      unique_artist << song.artist unless unique_artist.include?(song.artist)
    end 
    unique_artist 
  end 
  
  def add_song(song)
    song.genre = self unless song.genre 
    @songs << song unless self.songs.include?(song)
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(genre)
    genre = Genre.new(name)
    genre.save 
    genre 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
end 