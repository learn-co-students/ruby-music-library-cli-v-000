
class Song

  attr_accessor :name, :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
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

  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    unless self.artist == artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    unless self.genre == genre
      @genre = genre
      genre.add_song(self)
    end
  end

  def self.new_from_filename(name_of_file)
    song = name_of_file.split(" - ")[1]
    artist_name = name_of_file.split(" - ")[0]
    genre_name = (name_of_file.split(" - ")[2]).sub(".mp3", "")
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_genre = Genre.find_or_create_by_name(genre_name)
    self.new(song, new_artist, new_genre)
  end

  def self.create_from_filename(name_of_file)
    song = name_of_file.split(" - ")[1]
    artist_name = name_of_file.split(" - ")[0]
    genre_name = (name_of_file.split(" - ")[2]).sub(".mp3", "")
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(song, new_artist, new_genre)
    song.save
    song
  end

end
