class Song
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(song)
    x = Song.new(song)
    x.save
  end

end
