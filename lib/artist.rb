class Artist
  attr_accessor :name
  @@all = []

  def self.create(name)
    initialize(name)
    save
  end

  def initialize(name)
    @name = name
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

end
