class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    self.name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

end
