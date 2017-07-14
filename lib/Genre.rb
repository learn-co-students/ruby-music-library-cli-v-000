class Genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  attr_accessor :name, :songs

  def save
    @@all << self
  end

  def artists
    self.songs.collect{|song|song.artist}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
  end
end
