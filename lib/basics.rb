require 'pry'

class Basics
  extend Concerns::Findable
  attr_accessor :name
  @@all = 

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
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap do |new_instance|
      @@all << new_instance
    end
  end
end
