class Song

  @@all = []
  attr_accessor :name, :artist, :genre
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.genre = genre if genre
    self.artist = artist if artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    song_attributes = filename.split(" - ")
    artist_name = song_attributes[0]
    artist = Artist.find_or_create_by_name(artist_name)
    song_name = song_attributes[1]
    genre_name = song_attributes[2].chomp(".mp3")
    genre = Genre.find_or_create_by_name(genre_name)
    new_song = self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
end
