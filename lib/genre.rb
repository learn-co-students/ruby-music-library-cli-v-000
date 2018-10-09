class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.genre == nil
      song.genre = self
    end
    if !@songs.include?(song) 
      @songs << song
    end
  end
  
   def artists
    array = []
    @songs.each { |song| 
      array << song.artist }
      array.uniq
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
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
    
  end
  
end