class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist != nil
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    genre_array = self.songs.uniq { |song| song.genre.name }
    genre_array.collect { |song| song.genre }
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    self
  end

end
