class Genre
  attr_accessor :name
  extend Concerns::Findable
  @@all = []

  def self.create(name)
    genre = Genre.new(name)
    @@all << genre
    genre
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    artists = songs.collect {|song| song.artist}
    artists.uniq
  end

end
