class Genre

  extend Concerns::Findable
  extend Concerns::Listable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    self.songs.collect { |s| s.artist }.uniq
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end
end
