class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new_instance = new(name)
    new_instance.save
    new_instance
  end
    
  def songs
    @songs
  end
  
  def artists
    @songs.collect{|song| song.artist}.uniq
  end
end
