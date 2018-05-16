require 'rspec'

class Song
  extend Concerns::Findable


  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.new_from_filename(name)
    parse_song = name.split(" - ")[1]
    parse_artist = name.split(" - ")[0]
    parse_genre = name.split(" - ")[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(parse_artist)
    genre = Genre.find_or_create_by_name(parse_genre)
    song = self.new(parse_song, artist, genre)
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
  end

end
