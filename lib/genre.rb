class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
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

  def save
    @@all << self
  end

  def self.create(name)
    new_genre = new(name)
    @@all << new_genre
    new_genre
  end

  def songs
    @songs
  end

  def artists
    artists = []
    self.songs.each do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end
end
