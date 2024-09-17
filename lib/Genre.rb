class Genre

  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

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

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    if !songs.include?(song)
      songs << song
      song.genre = self
    end
  end

  def artists
    songs.map { |e| e.artist }.uniq
  end
end
