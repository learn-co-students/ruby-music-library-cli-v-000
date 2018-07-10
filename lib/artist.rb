class Artist 
  extend Concerns::Findable 
  attr_accessor :name, :song, :genre
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def save 
    @@all << self 
  end 
  
  def genres 
    unique_genre = []
    @songs.collect do |song|
      unique_genre << song.genre unless unique_genre.include?(song.genre)
    end 
    unique_genre 
  end 
  
  def add_song(song)
    song.artist = self unless song.artist 
    @songs << song unless self.songs.include?(song)
  end 
  
  def songs 
    @songs 
  end 
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
end 