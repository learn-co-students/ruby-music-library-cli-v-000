class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def artists
    artist_array = self.songs.uniq { |song| song.artist.name }
    artist_array.collect { |song| song.artist }
  end

end
