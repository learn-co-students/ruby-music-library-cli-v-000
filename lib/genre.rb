

class Genre
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  @@all = [] #holds all Genre objects

  def self.create(name)
    s = Genre.new(name)
    s.save
    s
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

end
