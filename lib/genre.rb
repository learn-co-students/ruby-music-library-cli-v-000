class Genre
  attr_accessor :name, :songs
  # attr_reader :songs
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    self.name = name
    self.songs = []
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
    Genre.new(name).tap do |genre|
      genre.save
    end
  end

  def artists
    artists = []
    self.songs.each do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end

end
