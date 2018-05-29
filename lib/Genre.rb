class Genre
#extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    Genre.new(name).save
  end

  def artists
    @songs.map(&:artist).uniq
  end

  def to_s
    name
  end
end