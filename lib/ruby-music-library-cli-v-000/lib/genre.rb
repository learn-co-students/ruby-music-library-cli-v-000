class Genre
  attr_accessor :name

  @@all = []

  def initialize(new_genre)
    @name = new_genre
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all = self.all.clear

  end

  def save #calls the all of the Genra class and pushes self
    self.class.all << self
  end

  def self.create(new_genre)
    genre= self.new(new_genre)
    genre.save
    genre
  end




end
