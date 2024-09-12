class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    newsong = Song.new(name, artist, genre)
    newsong.save
    newsong
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre if self.genre != genre
    self.genre.add_song(self)
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    artist, name, genre = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    self.create(name, artist, genre)
  end

  def self.destroy_all
    @@all.clear
  end

end
