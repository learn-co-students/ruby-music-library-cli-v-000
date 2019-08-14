class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

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

  def save
    @@all << self
    self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
  end

  def songs
    @songs
  end

  def artists
    return_artists = []
    @songs.collect do |song|
      return_artists << song.artist
    end
    return_artists.uniq
  end

end
