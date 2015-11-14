class Genre
  extend Concerns::Findable
  
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

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.create(genre)
    genre = Genre.new(genre)
    genre.save
    genre
  end
end
