class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all.uniq
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre)
    new_genre = Genre.new(genre)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end

  def artists
    songs.map {|song| song.artist}.uniq
  end
end
