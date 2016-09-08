class Genre
  attr_accessor :name
  @@all = []

  def self.create(name)
    genre = Genre.new(name)
    @@all << genre
    genre
  end

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
