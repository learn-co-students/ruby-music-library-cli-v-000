class Genre
  extend Concerns::Findable 
  attr_accessor :name
  attr_reader :songs

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

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_genre = new(name)
    new_genre.save
    new_genre
  end

  def artists
    #returns a collection of genres for all of the artist's songs and remove duplicate entries
    songs.collect(&:artist).uniq
  end

end
