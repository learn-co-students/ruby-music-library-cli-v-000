class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs, :artist, :genre
  @@all = []

  def initialize(name, artist="", genre="")
    @name = name
    @songs = []
    @artist = artist
    artist.songs << self unless artist == ""
    @genre = genre
    genre.songs << self unless genre == ""
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

  def self.create(name)
    new_song = self.new(name)
    @@all << new_song
    new_song
  end

  def artist=(art)
    @artist = art
    art.add_song(self)
  end

  def genre=(new_genre)
    @genre = new_genre
    new_genre.songs << self unless new_genre.songs.include?(self) == true
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    song_name = array[1]
    artist_name = Artist.find_or_create_by_name(array[0])
    genre_name = Genre.find_or_create_by_name(array[2][0..-5])
    new_song = Song.new(song_name, artist_name, genre_name)
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    Song.all << new_song
    new_song
  end
end