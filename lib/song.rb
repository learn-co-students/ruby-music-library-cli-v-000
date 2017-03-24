require 'pry'

class Song
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == self || artist == nil
    self.genre = genre unless genre == nil
  end

  def artist
    @artist
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(name)
    separator = name.split(" - ")

    artist = Artist.find_or_create_by_name(separator[0])
    song = separator[1]
    genre = Genre.find_or_create_by_name(separator[2].chomp(".mp3"))

    song = Song.new(song, artist, genre)
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
    song
  end

  def self.collect_and_format_songs
    self.all.collect {|song, index| "#{song.artist.name} - #{song.name} - #{song.genre.name}"}.sort
  end


















  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Song.new(name)
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
