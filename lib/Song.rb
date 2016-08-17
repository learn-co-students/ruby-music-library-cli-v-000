require "pry"
class Song

  attr_accessor :name


  def initialize(name)
    @name = name
  end
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all.push(self)
  end

  def self.create(name)
    song = self.new(name)
    @@all.push(song)
  end

end
