class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name, song = nil)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  # def self.create(genre)
  #   genre = Genre.new(genre)
  #   genre.name = genre
  #   genre
  # end

  def songs
    @songs
  end

  def artists
    array_of_artists = @songs.collect do |song|
      song.artist
    end
    array_of_artists.uniq
  end

end
