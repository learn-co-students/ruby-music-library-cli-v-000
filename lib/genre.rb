class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable

  @@all = []

  def initialize(n)
    @name = n
    @songs = []
  end

  def artists
    artist_list = []
    @songs.each do |s|
      artist_list << s.artist if !(artist_list.include?(s.artist))
    end
    return artist_list
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(n)
    genre = Genre.new(n)
    self.all << genre
    genre
  end
end
