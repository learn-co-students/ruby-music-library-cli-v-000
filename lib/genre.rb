class Genre 
  attr_accessor :name
  @@all = []
  
  extend Concerns::Findable
  
  def initialize(name)
    @name = name 
    @@all << self 
    @songs = [] 
  end 
  
  def songs
    @songs 
  end 
  
  def artists 
    array = []
    self.songs.each do |song|
      array << song.artist 
    end 
    array.uniq
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
    new_genre = Genre.new(name)
    new_genre.save 
    new_genre
  end 
  
  def add_song(song)
    if !self.songs.include?(song) 
      @songs << song
    end 
    if song.genre != self 
      song.genre = self 
    end 
  end 
end 