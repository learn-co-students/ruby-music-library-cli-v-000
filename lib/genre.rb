class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  
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
  
  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end
  
  def save
    self.class.all << self
  end
  
  def songs
    @songs
  end
  
  def artists
    unique_artist = []
    
    @songs.collect do |song|
      unique_artist << song.artist
    end
    
    unique_artist.uniq
  end
  
end