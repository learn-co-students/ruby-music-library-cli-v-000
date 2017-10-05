class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    artists = songs.collect { |song| song.artist }
    artists.uniq
  end



end
