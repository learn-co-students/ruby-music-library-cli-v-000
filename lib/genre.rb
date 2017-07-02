class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name)
    new(name).tap{|g| g.save }
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end

  def to_s
    self.name
  end
end
