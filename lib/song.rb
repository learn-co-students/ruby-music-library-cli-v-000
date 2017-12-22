require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist= nil, genre= nil)
    @name = name
    @genre = genre
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    name = self.new(name)
    name.save
    name
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
      @genre = genre
      unless genre.songs.include?(self)
        genre.songs << self
    end
  end

  def self.find_by_name(name)
      @@all.detect do |song|
        song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(file_name)


    file = file_name.split(" - ")
    artist_name = file[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = file[2].split(".")[0]
    genre = Genre.find_or_create_by_name(genre_name)
    name = file[1]
    song = self.new(name, artist, genre)
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    @@all << song
  end




end
