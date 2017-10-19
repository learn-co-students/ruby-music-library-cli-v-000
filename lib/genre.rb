class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists
    @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end
  def save
    Genre.all << self
  end

  def self.destroy_all
    Genre.all.clear
  end

  def self.create(name)
    name = self.new(name)
    name.save
    name
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

end
