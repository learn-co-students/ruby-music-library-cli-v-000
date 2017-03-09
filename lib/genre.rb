require_relative '../concerns/findable.rb'

class Genre
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  # constructor
  def self.create(name)
    new_by_name = Genre.new(name)
    new_by_name.save
    new_by_name
  end
end
