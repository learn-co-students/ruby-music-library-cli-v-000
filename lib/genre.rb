class Genre
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end

  def to_s
    self.name
  end

  def self.create(name)
    new(name).tap{|g| g.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
