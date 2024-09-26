require_relative './music_importer.rb'

class Song
  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
  #  @artist = artist
    self.artist= artist if artist
    self.genre = genre if genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
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

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  # def self.find_by_name(name)
  #   @@all.find do |song| song.name == name
  #   end
  # end

  # def self.find_or_create_by_name(name)
  #   find_by_name(name) || create(name)
  # end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  # def self.new_from_filename(name)
  #   name = name.split(" - ")[1]
  #   song = Song.new(name)
  # end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end

end
