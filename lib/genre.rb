class Genre
  extend Concerns::Findable

  @@all = [ ]
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = [ ]
  end

  def save
    @@all << self
  end

  def artists
    artists = songs.collect {|s| s.artist}
    artists.uniq
  end

# Class methods
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
