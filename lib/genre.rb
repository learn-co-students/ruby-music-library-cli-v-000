class Genre
  attr_accessor :name
  @@all = []

  def initialize(name)
    self.name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(genre)
    self.new(genre).save
  end

end
