class Song

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  attr_accessor :name

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
  end
end
