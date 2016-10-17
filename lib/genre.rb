class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    save
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def add_song(song)
    @songs << song
  end

  def self.create(genre)
    Genre.new(genre).save
    self
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
  end

end
