class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    self.name = name
    self.songs = []
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def save
    self.class.all << self
  end

  def artists
    artists = self.songs.collect {|song| song.artist}
    artists.uniq
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end
end
