require_relative './concerns/findable'

class Song
  extend Concerns::Findable

  attr_reader :artist, :genre
  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    song_info = File.basename(filename, ".mp3").split(' - ')

    Song.new(song_info[1], Artist.find_or_create_by_name(song_info[0]), Genre.find_or_create_by_name(song_info[2]))
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) if !genre.songs.include?(self)
  end

end
