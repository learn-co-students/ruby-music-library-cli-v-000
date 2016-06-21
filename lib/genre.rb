

class Genre
  attr_accessor :name 

  @@all = [] 

  def initialize(name)
    @name = name 
    @@all << self 
  end

  def Genre.all 
    @@all 
  end

  def Genre.destroy_all
    Genre.all.clear
  end

  def save 
    Genre.all 
  end

  def Genre.create(genre)
    item = Genre.new(genre)
  end
end


