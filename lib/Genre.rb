class Genre
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
    @@all.clear
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def artists
  Song.all.map { |song| song.artist }
  end

end
