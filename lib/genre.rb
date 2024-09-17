class Genre
  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end
end
