class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    Song.all << self
  end

  def self.destroy_all
    Song.all.clear
  end

  def self.create(name, artist = nil, genre = nil)
    Song.new(name, artist, genre).tap {|song| song.save}
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
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    artist_name = parsed[0]
    song_name = parsed[1]
    genre_name = parsed[2].gsub(/\.mp3\z/, "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    song = Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).tap {|song| song.save}
  end
end
