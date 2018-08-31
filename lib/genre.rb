class Genre
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    # @artists = []
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
    genre = new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end
  
  def artists
    songs.map do |song|
      song.artist
    end.uniq
  end
end
