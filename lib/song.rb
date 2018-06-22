require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  @@all = []

  def initialize(song_n_s, artist = nil, genre = nil)
    @name = song_n_s
    @@all << self
    self.artist = artist if !artist.nil?
    self.genre = genre if !genre.nil?
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(string)
    new_song = Song.new(string)
  end

  def artist=(artist_inst)
    @artist = artist_inst
    artist.add_song(self)
  end

  def genre=(g_inst)
    @genre = g_inst
    g_inst.songs << self if !g_inst.songs.include?(self)
  end

  def self.new_from_filename(filename_str)
    x = filename_str.split(" - ")
    artist_inst = Artist.find_or_create_by_name(x[0])
    genre_inst = Genre.find_or_create_by_name(x[2][0..-5]) #[^(.mp3)]
    song_inst = Song.new(x[1],artist_inst, genre_inst)
  end

  def self.create_from_filename(filename_str)
    new_from_filename(filename_str)
  end
end