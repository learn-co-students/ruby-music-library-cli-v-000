require 'pry'

class Song
  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end

    if genre != nil
      self.genre = genre
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? '' : genre.songs << self
  end

  def genre
    @genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file_name)
    parts = file_name.split(" - ")
    song_name = parts[1]
    artist_name = parts[0]
    genre_name = parts[2].split(".")[0]

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    song = self.new(song_name, artist, genre)
    song
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name).tap{ |s| s.save }
  end
end
