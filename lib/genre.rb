class Genre

  attr_accessor :name, :artist, :song
  @songs = []
  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name)
  end
end
