class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(genre)
    this_genre = self.new(genre)
    this_genre.save
    this_genre
  end

  def artists
    artists = []
    songs.each { |song| artists << song.artist }
    artists.uniq
  end

end
