require 'pry'

class Song
  extend Concerns::Findable
  extend Concerns::Nameable::ClassMethods
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist.nil?
    self.genre=(genre) unless genre.nil?
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    song_name = (filename.split(" - ")[1])
    artist_name = Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre_name = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
    song = Song.new(song_name, artist_name, genre_name)
  end

  def self.create_from_filename(filename)
    Song.new_from_filename(filename).save
  end

end
