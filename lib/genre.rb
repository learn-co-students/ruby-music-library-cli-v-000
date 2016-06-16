class Genre

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name

  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
end
