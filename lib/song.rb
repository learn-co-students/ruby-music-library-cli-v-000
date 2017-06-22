class Song
  extend Concerns::ClassMethods
  extend Concerns::Findable
  extend Concerns::Searchable
  include Concerns::InstanceMethods
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
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
    artist_name, song_name, genre = strip_filename(filename)
    new_song = find_or_create_by_name(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(new_song)
    genre = Genre.find_or_create_by_name(genre)
    new_song.genre = genre
    new_song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def self.strip_filename(filename)
    info = filename.split(" - ")
    info[2] = info[2].split(".")[0].lstrip
    info
  end

end
