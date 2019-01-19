class Genre 
  attr_accessor :name 
  @@all = []
  def initialize(name)
    @name = name 
  end 
  
  def self.all 
    @@all 
  end
  
  def save 
    @@all << self 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(genre_klass)
    genre_created = Genre.new(genre_klass)
    genre_created.save 
    genre_created
  end
end