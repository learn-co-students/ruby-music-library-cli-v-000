class Genre

  attr_accessor :name, :songs

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

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
end
