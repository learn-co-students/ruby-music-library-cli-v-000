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

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    bla = self.new(name).save
    puts @@all
    puts "hello"
    puts self.all
    #bla.save
    #binding.pry
  end

end