class Song
  attr_accessor :name

  @@all = []

  def initialize(name)
    self.name = name
    @@all = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end

end
