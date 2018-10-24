
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  extend Concerns::Findable

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    song = Song.new(parts[1])
    song.artist_name = parts[0]
    song.genre_name = parts[2].gsub(".mp3", "")
    song
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by_name(artist)
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by_name(genre)
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
end
