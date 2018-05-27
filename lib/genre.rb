class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs, :artist

  @@all =[]

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def artists
    songs.map(&:artist).uniq
  end

end
