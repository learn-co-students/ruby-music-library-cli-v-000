class Genre
  extend Concerns::Findable

  attr_accessor :genre, :artist, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(genre)
    genre = self.new(genre)
    @@all << genre
    genre
  end

  def artists
    songs.collect{ |s| s.artist }.uniq
  end
end
