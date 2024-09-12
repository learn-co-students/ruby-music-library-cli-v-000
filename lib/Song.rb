require 'pry'

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def name
    @name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist
    @artist
  end

  def genre
    @genre
  end

  def self.find_by_name(check_song)
    all.detect{|s|s.name == check_song}
  end

  def self.find_or_create_by_name(check_song)
    self.find_by_name(check_song) || self.create(check_song)
  end

  def self.new_from_filename(file_name)
    name_array = file_name.gsub(".mp3","").split(" - ")
    new_artist = Artist.find_or_create_by_name(name_array[0])
    new_genre = Genre.find_or_create_by_name(name_array[2])
    new_song = self.new(name_array[1],new_artist, new_genre)
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end
end
