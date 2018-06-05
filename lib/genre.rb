class Genre
  extend Concerns::Findable

  attr_accessor :name

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
    Genre.new(name).save
    @@all.last
  end

  def songs
    @songs
  end

  def artists
    artists = []
    @songs.select do |song|
      artists << song.artist unless artists.include?(song.artist)
    end
    artists
  end

end
