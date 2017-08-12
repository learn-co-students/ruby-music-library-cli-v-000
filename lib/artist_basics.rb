class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs, :artist
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

  def save
    @@all << self
  end

  def self.create(song)
    artist = Artist.new(song)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless self.songs.include?(song)
  end

  def genres
      genre_array = self.songs.collect { |song| song.genre }
      genre_array.uniq
  end

end
