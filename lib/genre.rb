class Genre
  attr_accessor :name

  # CLASS VARIABLES AND METHODS
  @@all = Array.new

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

  # INSTANCE VARIABLES AND METHODS
  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end
end
