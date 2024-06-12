require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'

class Song

  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  extend Concerns::Findable::ClassMethods
  include Concerns::Findable::InstanceMethods

  attr_accessor :name, :filename
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    filename_split = filename.split(" - ")
    song_name = filename_split[1]
    artist = Artist.find_or_create_by_name(filename_split[0])
    genre = Genre.find_or_create_by_name(filename_split[2].split(".")[0])
    unless find_by_name(song_name)
      self.new(song_name, artist, genre)
    end
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
  end

  def self.create(song_name)
    song = self.new(song_name)
    song.save
    song
  end

end
