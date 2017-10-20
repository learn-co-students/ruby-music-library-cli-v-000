class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    self.name = name
    @@all = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    Genre.new(name).tap do |genre|
      genre.save
    end
  end

end
