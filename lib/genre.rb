class Genre
  attr_accessor :name, :songs, :artists
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)

    if song.genre == nil
      song.genre = self
    end
  end

  def artists
    self.songs.map { |song| song.artist }.uniq
  end
end
