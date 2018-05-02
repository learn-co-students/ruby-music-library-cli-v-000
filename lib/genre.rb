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
    @@all.clear
  end
  def self.create(name)   #initializes and saves the genre
    genre = new(name)
    genre.save
    genre
  end

  def save                # adds the Genre instance to the @@all class variable
    @@all << self
  end
end
