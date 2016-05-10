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
      @@all.detect {|n| n.name == name}
    else
      new(name, artist, genre).tap(&:save)
    end
  end

  def self.new_from_filename(file)
    temp_song_file = file.split(' - ')
    artist = Artist.find_or_create_by_name(temp_song_file[0])
    genre = Genre.find_or_create_by_name(temp_song_file[2].gsub(".mp3", ""))
    song = temp_song_file[1]

    create(song, artist, genre)
  end

  def self.create_from_filename(file)
    new_from_filename(file)
  end
end
