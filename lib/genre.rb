class Genre 

  attr_accessor :name, :artists, :songs
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    self.class.all << self
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end

  def artists
 
  end
end
 