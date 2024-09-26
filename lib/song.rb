class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
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
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name = data[1]
    genre_name = data[2][0...-4]

    new_song = Song.find_or_create_by_name(song_name)
    new_song.genre = Genre.find_or_create_by_name(genre_name)
    new_artist = Artist.find_or_create_by_name(artist_name)
    new_artist.add_song(new_song)
    new_song
  end

  def self.create_from_filename(filename)
    new_song = Song.new_from_filename(filename)
    new_song.save
    new_song
  end
end
