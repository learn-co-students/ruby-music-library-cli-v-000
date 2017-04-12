class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name).tap{|new_genre| new_genre.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
