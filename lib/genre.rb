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
    @@all = []
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def save
    if @@all.include?(self) == false
      @@all << self
    end
  end

  def artists
    artists = []
    songs.each do |a|
      if artists.include?(a.artist) == false
        artists << a.artist
      end
    end
    artists
  end

end






















