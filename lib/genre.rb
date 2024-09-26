class Genre
  extend Concerns::Findable
  attr_accessor :name, :song, :songs, :artist, :artists
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
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
  def self.create (name)
    genre = Genre.new(name)
    genre.save
    genre
  end
  def artists
    artist_list = []
    @songs.uniq.collect{|song| artist_list << song.artist}
    artist_list.uniq
  end
end
