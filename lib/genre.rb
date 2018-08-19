class Genre
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def self.create(name)
    genre = self.new(name)
    genre
  end

  def self.all
    @@all
  end

  def artists
    artists = []
    self.songs.each do |song|
      artists << song.artist
    end
    artists.uniq
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    all.clear
  end
end
