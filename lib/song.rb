require 'pry'

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, *artist_object)
    self.name = name

    artist_object.first.add_song(self) unless artist_object.count == 0
      
  end

  def self.create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
