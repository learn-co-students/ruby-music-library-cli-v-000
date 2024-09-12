class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name,artist = nil, genre = nil)
    @name = name
    self.artist = artist if !(artist == nil)
    self.genre = genre if !(genre == nil)
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
    new_song = Song.new(name)
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
    @@all.detect {|artist| artist.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name)? find_by_name(name) : create(name)
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")

    artist_name = data[0]
    song_name = data[1]
    genre_name = data[2].chomp(".mp3")

    song = Song.new(song_name)

    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(song)

    genre = Genre.find_or_create_by_name(genre_name)
    genre.add_song(song)

    return song
  end

  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
    new_song
  end
end
