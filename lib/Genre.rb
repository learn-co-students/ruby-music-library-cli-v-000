class Genre

  attr_accessor :name, :songs
  extend Concerns::Findable
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
    self.all.clear
  end

  def artists
    self.songs.map { |song| song.artist }.uniq
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

end