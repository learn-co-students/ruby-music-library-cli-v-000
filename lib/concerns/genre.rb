require 'pry'

class Genre

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all 
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    new_name = Genre.name
    @@all << new_name
  end

  #Custom Constructor
  def self.create(new_genre)
    n = Genre.new(new_genre)
  end
 # binding.pry
end
