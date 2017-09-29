
require_relative "../concerns/findable_module.rb"
require 'pry'
class Song
  extend Findable::ClassMethods
  include Findable::InstanceMethods
  extend Concerns::Findable

attr_accessor :name, :artist, :genre
@@all = []

  def initialize *args
    @name, @artist, @genre = args
    if self.artist != nil
      artist.add_song(self)
    end
    if self.genre != nil
      genre.add_song(self)
    end
    save
  end

  def artist=(artist)
      @artist = artist
      artist.add_song(self)
  end

  def genre=(genre)
      @genre = genre
      genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect {|i| i.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == false
      Song.new(name)
    end
  end

  def self.new_from_filename(file_name)
    name = file_name.split(" - ")[1]
    artist_name = file_name.split(" - ")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = file_name[/.*\s(.*?).mp3/,1]
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(name, artist, genre)
    song
  end

  def self.create_from_filename(file_name)
    name = file_name.split(" - ")[1]
    artist_name = file_name.split(" - ")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = file_name[/.*\s(.*?).mp3/,1]
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(name, artist, genre)
    song
  end

  def self.create(name)
    Song.new(name) 
  end

  def self.all
    @@all
  end

end
