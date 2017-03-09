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

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(genre)
    self.new(genre).tap { |o| o.save }
  end

  def artists
    @songs.collect { |s| s.artist }.uniq
  end

end
