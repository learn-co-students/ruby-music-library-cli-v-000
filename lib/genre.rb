class Genre
extend Concerns::Findable
  attr_accessor :name, :genres, :songs, :artists
  @@all = []

  def initialize(name)
    @name = name
    @genres = []
    @songs = []
  end

  def self.all
  @@all
  end

  def self.destroy_all
  @@all = []
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
  @songs.collect { |song| song.artist }.uniq
end


def songs
@songs
end
end
