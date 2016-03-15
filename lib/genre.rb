class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    songs.map { |song| song.artist }.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def save
    self.class.all << self
  end

end
