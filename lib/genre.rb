class Genre 

  attr_accessor :name 

  @@all = []

  def initialize(name)
    @name = name 
  end

  def self.all 
    @@all 
  end 

  def self.destroy_all
    self.all.clear
  end 

  def self.create(new_genre)
    n_genre = Genre.new(new_genre)
    n_genre.save
    n_genre
  end 

  def save 
    @@all.push(self)
  end 

end 