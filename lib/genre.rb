class Genre
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(genreTitle)
    genre = self.new(genreTitle)
    genre.save
    genre
  end

  def save
    @@all << self
  end

  def artists
    @songs.collect { |song| song.artist }.uniq
  end
end
