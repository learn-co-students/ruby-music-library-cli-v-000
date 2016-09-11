require 'pry'
require_relative '../concerns/findable.rb'

class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist!= nil
      self.artist = artist
    end
    if genre!= nil
      self.genre = genre
    end
    save
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

  def self.count
    @@all.size
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
    @@all.detect{|s| s.name==name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)==false;
      create(name)
    end
  end

  def self.create(song, artist=nil, genre=nil)
    song = Song.new(song, artist=nil, genre=nil)
  end

  def self.new_from_filename(file)
    artist_name, song_name = file.split(" - ")
    genre_name = (file.split.last).gsub!(".mp3","")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    artist_name, song_name = file.split(" - ")
    genre_name = (file.split.last).gsub!(".mp3","")
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

end
