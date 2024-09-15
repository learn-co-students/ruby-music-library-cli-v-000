class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

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
    songs.collect { |song| song.artist }.uniq
  end

  def self.all
    @@all
  end

  def self.create(name)
    self.new(name).tap { |genre| genre.save }
  end

  def self.destroy_all
    self.all.clear
  end
end
