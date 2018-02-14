
class Genre

  @@all = []

  attr_accessor :name, :songs
  # attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end



  def self.destroy_all
    @@all = []
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
    self.songs.collect{|song| song.artist}.uniq
  end
end
