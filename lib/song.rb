class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name)
    self.name = name
  end

  def self.create(name)
    self.new(name).save
    self.all
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
