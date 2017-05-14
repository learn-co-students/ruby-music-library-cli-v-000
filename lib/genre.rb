class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    g = self.new(name)
    @@all << g
    g
  end

  def save
    @@all << self
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def self.count
    @@all.size
  end


end
