require 'pry'

# require_relative './concerns/findable'
class Song
  @@all = []

  attr_accessor :name, :artist, :genre

  # extend Concerns::Findable

  def initialize(name, artist=nil, genre=nil)
    @name = name
    # @genre = genre
    self.genre = genre if genre
    self.artist = artist if artist
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap {|s| s.save}
    # song = self.new(name)
    # song.save
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(some_filename)
    f = some_filename.split(" - ")
    song = self.find_or_create_by_name(f[1])
    song.artist_name = f[0]
    song.genre = Genre.find_or_create_by_name(f[2].gsub(/\.mp3/, ""))
    song
  end  

  def self.create_from_filename(filename)
    f = filename.split(" - ")
    song, artist, genre = f[1], f[0], f[2].gsub(/\.mp3/, "")
    new_song = Song.find_or_create_by_name(song)
    new_song.artist_name = artist
    new_song.genre = Genre.find_or_create_by_name(genre)
    self.all << new_song
    new_song
  end

  def artist_name=(name)
    new_artist = Artist.find_or_create_by_name(name)
    new_artist.add_song(self)
  end

end
