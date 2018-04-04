class Genre
  attr_accessor :name
  attr_reader :artist, :song

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
    song.genre = self unless song.genre
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

end
