class Genre
  extend Concerns::Findable

  attr_accessor :name, :artist, :song
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def artists
    artists = self.songs.collect do |song|
      song.artist
    end
    artists.uniq
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
    created_genre = self.new(name)
    created_genre.save
    created_genre
  end
end
