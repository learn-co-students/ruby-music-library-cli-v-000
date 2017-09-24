require_relative "../concerns/Findable.rb"

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all  = []

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
    genre = Genre.new(name)
    genre.save
    return genre
  end

  def artists
    artists = []
    self.songs.each do |song|
      artists << song.artist
    end
    artists.uniq
  end
end
