class Genre
  # inheritance
  extend Concerns::Findable

  # class variables
  @@all = []

  # attribute accessors
  attr_accessor :name, :songs

  # default and custom constructors
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
  end

  # class methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  # instance methods
  def save
    @@all << self
    self
  end

  def artists
    artists = []
    self.songs.each do |song|
      if !artists.include?(song.artist)
        artists << song.artist
      end
    end
    artists
  end
end
