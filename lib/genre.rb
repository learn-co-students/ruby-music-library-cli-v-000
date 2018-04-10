class Genre 
    attr_accessor :name 
    
    extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end
  
  def artists
   array = self.songs.map do |song|
      song.artist 
    end 
    array.uniq
  end
  
  def songs 
    @songs 
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
  
  def self.create(genre_name)
    genre = self.new(genre_name)
    genre.save
    genre
  end
  
  
  
end
  