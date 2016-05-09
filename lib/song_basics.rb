require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless  genre == nil
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    if @@all.detect {|n| n.name == name}
    # if self.all.include?(name)
      @@all.detect {|n| n.name == name}
      # name
    else
      self.new(name, artist, genre).tap(&:save)
    end
  end

  def self.new_from_filename(file)
    temp_song_file = file.split(' - ')

    artist = Artist.create(temp_song_file[0])
    genre = Genre.create(temp_song_file[2].split(".mp3").join)
    song = temp_song_file[1]

    self.create(song, artist, genre)
  end

  def self.create_from_filename(file)
    self.new_from_filename(file)
  end
end
