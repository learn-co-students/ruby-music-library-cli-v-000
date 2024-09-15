class Genre
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

  def save
    @@all << self
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end
end
