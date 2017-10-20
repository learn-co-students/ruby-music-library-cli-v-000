class Artist
  attr_accessor :name

  @@all =[]

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
    Artist.new(name).tap do |artist|
      artist.save
    end
  end

end
