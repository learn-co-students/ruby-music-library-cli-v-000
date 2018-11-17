require_relative './music_importer'

class Song
  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
    super()
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    unless artist.songs.include?(self)
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    s = filename.split(' - ')
    artist_name, song_name, genre_type = s[0], s[1], s[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_type)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
