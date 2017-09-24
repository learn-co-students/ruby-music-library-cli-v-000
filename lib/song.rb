require 'pry'

class Song
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
      new(name) {|s| s.save } #initializes and saves the song
      # binding.pry
  end

end
