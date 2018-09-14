class Genre
  @@all = [ ]
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = [ ]
  end

  def save
    @@all << self
  end

  def artists
    songs = Song.all.select {|s| s.genre == self}
    songs.uniq.map {|s| s.artist}
  end

# Class methods
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
