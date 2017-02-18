require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  extend Concerns::Findable
  include Concerns::Paramable

  @@songs = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
    self.save
  end

  def self.all
    @@songs
  end

  def self.destroy_all
    @@songs.clear
  end

  def save
    self.class.all << self
    self
  end

  def self.create(name)
    new(name).save
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
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1]
    genre = filename.split(" - ")[2].split(".mp3")[0]
    art_obj = Artist.find_or_create_by_name(artist)
    gen_obj = Genre.find_or_create_by_name(genre)
    Song.new(name, art_obj, gen_obj)
  end

  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1]
    genre = filename.split(" - ")[2].split(".mp3")[0]
    if find_by_name(name) == nil
      art_obj = Artist.find_or_create_by_name(artist)
      gen_obj = Genre.find_or_create_by_name(genre)
      return Song.new(name, art_obj, gen_obj)
    end
    find_by_name(name)
  end

end
