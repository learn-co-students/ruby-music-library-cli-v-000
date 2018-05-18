class Genre 
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @@all << self
  end 
  def self.all
    @@all
  end 
  def self.destroy_all
    self.all.clear
  end 
  def save 
    self.class.all << self 
  end 
  def self.create(genre_name)
    genre = Genre.new(genre_name)
  end 
    
  

end 