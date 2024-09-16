class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    save
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    Genre.all.clear
  end

  def save
    @@all << self
  end

  def self.create(genre)
    created_genre = Genre.new(genre)
  end

  def artists
    artist = self.songs.collect do |collection|
      collection.artist
    end
    return artist.uniq
  end

end
