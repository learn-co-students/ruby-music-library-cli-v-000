require "pry"
require_relative "./concerns/findable"

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    if artist
      artist.songs << self
    end
    if genre
      genre.songs << self
      if artist
        artist.genres << genre
      end
    end
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(file_name)
    file = file_name.split(" - ")
    file[2].chomp!(".mp3")

    new_song = Song.find_or_create_by_name(file[1])
    new_song.artist = Artist.find_or_create_by_name(file[0])
    new_song.genre = Genre.find_or_create_by_name(file[2])
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    if !self.genre
      @genre = genre
      genre.songs << self
    end
  end
end
