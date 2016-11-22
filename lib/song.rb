class Song
  attr_accessor :name
  extend Concerns::Findable
  @@all = []

  def self.create(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def initialize(name, artist = "", genre = "")
    @name = name
    if artist != ""
      artist.add_song(self)
    else
    end
    if genre != ""
      self.genre = genre
    else
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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
