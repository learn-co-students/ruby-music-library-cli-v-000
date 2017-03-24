class Genre
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = Genre.new(name)
    @@all << genre
    genre
  end

  def self.destroy_all
    self.all.clear
  end

end
