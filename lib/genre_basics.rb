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
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(genre)
    genre = Genre.new(genre)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    artist_array = self.songs.collect {|song| song.artist}
    artist_array.uniq
  end

end
