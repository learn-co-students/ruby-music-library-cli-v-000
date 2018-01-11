class Genre
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).tap { |s| s.save }
  end
  
  def save
  @@all << self
  end
  
  def songs
    @songs
  end
  
end