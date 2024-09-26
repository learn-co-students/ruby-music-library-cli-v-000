class Genre

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def artists
    self.songs.collect { |song| song.artist }.uniq
  end

  extend Concerns::Findable
end
