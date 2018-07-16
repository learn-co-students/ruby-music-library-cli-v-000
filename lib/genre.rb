class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(genre)
    new_genre = new(genre)
    new_genre.save
    new_genre
  end

  def artists
    songs.map{|s| s.artist}.uniq
  end

end
