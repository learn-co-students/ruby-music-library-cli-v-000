class Genre
  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
    self
  end

  def songs
    @songs
  end

  def artists
    all_artists = self.songs.collect { |song| song.artist }
    all_artists.uniq { |artist| artist }
  end

  def self.create(name)
    Genre.new(name).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
end
