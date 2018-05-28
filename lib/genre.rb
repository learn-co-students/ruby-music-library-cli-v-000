class Genre
  attr_accessor :name
  extend Concerns::Findable
  @@all = []
  def initialize(name)
    @name = name
    @@all = []
    @songs = []
  end

  def artists
    songs.collect(&:artist).uniq
  end

  def songs
    @songs
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
    genre = self.new(name)
    genre.name = name
    @@all << genre
    genre
  end
end
