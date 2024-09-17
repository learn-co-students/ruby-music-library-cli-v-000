class Song
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  extend Concerns::Nameable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name, :genre, :artist

  def self.all
    @@all
  end

  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1]
    genre_name = parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1]
    genre_name = parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.create(song_name)
    song.artist = artist
    song.genre = genre
    song
  end

end
