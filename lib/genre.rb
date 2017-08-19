class Genre   
  extend Concerns::Findable
  
  attr_accessor :name, :songs ,:artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
  
  def artists
    # binding.pry
     songs.collect{ |s| s.artist }.uniq
  end
  
  
 
  
  
  
end