class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
    @@all = []

  def initialize(name,artist=nil,genre=nil)
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

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def artist=(artists_name)
    @artist = artists_name
    self.artist.add_song(self)
  end

  def genre=(genre_name)
    @genre = genre_name
    if self.genre.songs.include?(self) == false
    self.genre.add_song(self)
    end
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    genre = genre.gsub(".mp3", "")
    new_song = Song.find_or_create_by_name(song)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song
  end

  def self.create_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    genre = genre.gsub(".mp3", "")
    new_artist = Artist.find_or_create_by_name(artist)
    new_genre = Genre.find_or_create_by_name(genre)
    new_song = Song.new(song, new_artist, new_genre)
    @@all << new_song unless @@all.include?(new_song)
    new_song
  end
end
