
class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.destroy_all
     @@all.clear
  end

  def self.create(name)
    new_class = self.new(name)
    new_class.save
    new_class
  end

  
  def artists
    @songs.collect {|song| song.artist}.uniq
  end
end
