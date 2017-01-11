class Genre
  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name

    save
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
  end

  def self.destroy_all
    @@all.clear
  end

end
