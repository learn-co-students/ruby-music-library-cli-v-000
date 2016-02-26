class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    self.name = name
    @songs = []
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
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
    artist_collect = @songs.collect do |song|
      song.artist
    end
    artist_collect.uniq
  end
end