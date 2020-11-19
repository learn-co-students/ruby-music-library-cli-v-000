class Genre
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs#getter
    @songs
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.destroy_all
    @@all = [] #or self.all.clear
  end
end
