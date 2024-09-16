class Genre
  attr_accessor :name, :genre, :songs
  @@all = []

  extend Concerns::Findable

  def initialize(name, genre = 0)
    @name = name
    @songs = []
    if genre != 0
      @genre = genre
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    songs.map(&:artist).uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    @@all.detect {|genre| genre.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      Genre.find_by_name(name)
    else
      self.create(name)
    end
  end
end
