
class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs, :genre

  @@all = []

  def initialize (name)
    @name = name
    @songs = []
  end

  def artists
    self.songs.map{|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create (name)
    genre = Genre.new(name)
    genre.save
    genre
  end
end
