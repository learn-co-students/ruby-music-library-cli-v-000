class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
  end

  def songs
    @songs
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
end
