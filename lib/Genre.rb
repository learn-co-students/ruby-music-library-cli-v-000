class Genre
  attr_accessor :name
  attr_reader :artist, :songs

  @@all = []

  extend Concerns::Findable

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

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song if !(self.songs.include?(song))
  end

  def artists
    artists = []
    self.songs.each do |song|
      artists << song.artist if !(artists.include?(song.artist))
    end
    artists
  end

end
