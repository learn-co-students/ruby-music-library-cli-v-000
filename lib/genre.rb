class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.create(name)
    Genre.new(name).tap{|genre| genre.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
