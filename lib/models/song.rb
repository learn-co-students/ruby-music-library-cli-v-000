# don't forget to 'extend' modules

class Song
  attr_accessor :name
  
  @@all = []

  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    Song.new(name).save
    self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end