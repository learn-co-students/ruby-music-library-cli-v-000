require 'pry'

class Song
  extend Concerns::ClassMethods
  extend Concerns::Findable
  include Concerns::InstanceMethods
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize (name, artist = nil, genre = nil)
    @name = name
    @@all << self
    if !(artist == nil)
      self.artist = artist
      self.artist.songs << self if !self.artist.songs.include?(self)
    end
    if !(genre == nil)
      self.genre = genre 
      artist.genres << genre if !artist.genres.include?(genre)
    end
    if !(genre == nil) && !(artist == nil)
      genre.artists << artist if !genre.artists.include?(artist)
    end
  end

  def artist=(artist)
    artist.add_song(self)
    @artist = artist
  end

  def genre=(genre)
    @genre  = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def name_artist=(artist)
    @artist = artist
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self if !@@all.include?(self)
    self
  end

  def self.create (name, artist = nil, genre = nil)
    self.new(name, artist, genre).save
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename filename
    filename = filename.split(" - ")
    filename[2] = filename[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(filename[0])
    genre = Genre.find_or_create_by_name(filename[2])
    song = self.new(filename[1], artist, genre)
    song
  end

  def self.create_from_filename filename
    filename = filename.split(" - ")
    filename[2] = filename[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(filename[0])
    genre = Genre.find_or_create_by_name(filename[2])
    self.create(filename[1], artist, genre)
  end



end


