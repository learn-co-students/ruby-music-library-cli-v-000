class Song
  extend Concerns::Findable

  @@all = []

  attr_accessor :artist, :name, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.new_from_filename(filename)
    artist = filename.gsub(".mp3","").split(" - ")[0]
    name = filename.gsub(".mp3","").split(" - ")[1]
    genre = filename.gsub(".mp3","").split(" - ")[2]
    song = self.create(name)
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    # song.save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if !artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end
end
