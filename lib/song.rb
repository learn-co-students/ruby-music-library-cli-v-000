class Song

  extend Concerns::Findable

  attr_accessor :name, :genre, :artist

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

  def self.create(name, artist = nil)
    song = Song.new(name, artist)
    song.save
    song
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def self.new_from_filename(file)
    file_split = file.split(" - ")
    artist_name, song_name, genre_name = file_split[0], file_split[1], file_split[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name, artist, genre)
    song
  end

  def self.create_from_filename(file)
    file_split = file.split(" - ")
    artist_name, song_name, genre_name = file_split[0], file_split[1], file_split[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.create(song_name, artist)
    song.genre = genre
    song
  end

end
