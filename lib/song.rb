class Song
  extend Concerns::Findable
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

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    Song.new(name, artist, genre).tap{|i| i.save}
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    song.artist = self
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
    artist_name= parts[0]
    song_name = parts[1]
    genre_name = parts[2].gsub(".mp3","")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name= parts[0]
    song_name = parts[1]
    genre_name = parts[2].gsub(".mp3","")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end
end
