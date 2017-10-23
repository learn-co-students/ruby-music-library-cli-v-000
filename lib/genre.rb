class Genre
  @@all = []
  extend Concerns::Findable

  attr_accessor :name, :songs
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
    self.class.all << self
  end
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  def artists
    self.songs.collect{|song| song.artist}.uniq
  end
end
