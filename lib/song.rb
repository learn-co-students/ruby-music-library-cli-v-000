require 'pry'
require_relative '../concerns/concerns.rb'

class Song
attr_accessor :name
attr_reader :artist, :genre

extend Concerns::Findable

@@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist
      @artist = artist
      artist.add_song(self)
    end
    if genre
      @genre = genre
      genre.songs << self
    end
  end

  def self.all
    @@all.sort do |song1, song2|
      song1.artist.name <=> song2.artist.name
      end
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist unless self.artist == artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.prepare_song(filename)
    song_array = filename.split(" - ")
    name = song_array[1]
    artist = Artist.find_or_create_by_name(song_array[0])
    genre = Genre.find_or_create_by_name(song_array[2].gsub(".mp3", ""))
    [name, artist, genre]
  end

  def self.new_from_filename(filename)
    song_array = self.prepare_song(filename)
    self.new(song_array[0], song_array[1], song_array[2])
  end

  def self.create_from_filename(filename)
    song_array = self.prepare_song(filename)
    self.create(song_array[0], song_array[1], song_array[2])
  end

  def self.print_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
