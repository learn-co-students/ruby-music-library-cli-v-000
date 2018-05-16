class Genre
  
  attr_accessor :name, :artist
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def songs
    @songs
  end
  
  def artists
    self.songs.collect{|s| s.artist}.uniq
  end
  
  
  def add_song(song)
    
  song.genre = self unless song.genre == self 
  @songs << song unless @songs.include?(song)
    
  end
  
  def self.create(name)
  genre = self.new(name)
  genre.save
  genre
  end

end