class Genre
  attr_accessor :name, :songs
  @@all = []
  extend Concerns::Findable

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
    genre
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect { |s| s.artist}.uniq
  end


end
