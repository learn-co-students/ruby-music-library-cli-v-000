require 'pry'
class Song
  include Concerns::Findable::InstanceMethods
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :artist, :genre
  def artist=(artist)#custom
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
  end

  def self.all
    @@all
  end
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  def self.new_from_filename(filename)#grabbing the filename from our files method in library_parser class
    song = self.new(filename.split(" - ")[-2])
    song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[-1].split(".")[0])
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
end
