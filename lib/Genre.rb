class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    genre = self.new(name)
    genre.save
    genre
  end

#returns collection of artist for all genre's songs without duplicates
  def artists
    songs.collect{|song| song.artist}.uniq
  end
end
