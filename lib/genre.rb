class Genre

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @genre = genre
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def add_song(genre)
    @songs << song
    song.genre = self
  end

  def songs
    @songs
  end

  def artists
    artists = []
    @songs.each do |song|
    artists << song.artist if !artists.include?(song.artist)
  end
  artists
  end


end
