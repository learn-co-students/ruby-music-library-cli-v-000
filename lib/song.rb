class Song
  attr_accessor :name, :artist, :genre
  @@all = []

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

  def self.create(song, artist = nil, genre = nil)
    new_song = Song.new(song, artist, genre)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    split = filename.split(" - ")

    artist = split[0]
    song_name = split[1]
    genre = split[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    split = filename.split(" - ")

    artist = split[0]
    song_name = split[1]
    genre = split[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    self.create(song_name, artist, genre)
  end
end
