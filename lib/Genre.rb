class Genre

  attr_accessor :name, :artist, :songs, :song
  attr_reader :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genre = genre
    @song = song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def artists
    genre.artist = self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

end