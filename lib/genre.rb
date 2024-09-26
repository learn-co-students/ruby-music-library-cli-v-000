class Genre
  extend Concerns::Findable

  attr_accessor :name, :artist, :songs, :song

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
    g = @@all.detect {|genre| genre.name == name}
    return g if g != nil
    
    genre = Genre.new(name)
    genre.save
    genre
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end
