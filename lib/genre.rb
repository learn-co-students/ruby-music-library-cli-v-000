class Genre
  attr_accessor :name, :songs, :artists
  @@all = []

# Constructors

  def initialize(name)
    @name = name
    @songs = []
  end

# Class Methods

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

# Instance Methods

  def save
    @@all << self
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

end
