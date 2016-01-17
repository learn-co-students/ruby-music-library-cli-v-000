class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
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
    song = Song.new(name)
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
    artist_name = Artist.find_or_create_by_name(parts[0])
    genre_name = Genre.find_or_create_by_name(parts[2].gsub(".mp3", ""))
    song = Song.new(parts[1], artist_name, genre_name)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end