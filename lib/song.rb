require 'pry'
class Song
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name, :songs, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end

  def artist=(artist)
    artist = Artist.find_or_create_by_name(artist) if artist.class.name != "Artist"
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    genre = Genre.find_or_create_by_name(genre) if genre.class.name != "Genre"
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end

  def self.new_from_filename(file)
    parsed = file.split(" - ")
    song = self.new(parsed[1], parsed[0], parsed[2].split(".mp3")[0])
  end

end
