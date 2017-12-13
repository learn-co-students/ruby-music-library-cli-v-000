class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist= nil, genre= nil)
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
    @@all << self
  end

  def self.create(song_name)
    song = self.new(song_name)
    song.save 
    song
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file_name)
    artist_name, song_name, genre_name = file_name.split(" - ")
    new_song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(new_song)
    genre_name = genre_name.gsub(".mp3","")
    genre = Genre.find_or_create_by_name(genre_name)
    genre.add_song(new_song)
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end
end