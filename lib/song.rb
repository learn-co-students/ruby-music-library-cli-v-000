require_relative '../config/environment'

class Song
  extend Concerns::Findable
  attr_accessor :artist, :genre, :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    self
  end

  def save
    self.class.all << self
    self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def full_name
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

  def self.create(name)
    instance = self.new(name)
    instance.save
    instance
  end


  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    song_info = filename.split(' - ')
    song_name = song_info[1]
    artist = Artist.find_or_create_by_name(song_info[0])
    genre = Genre.find_or_create_by_name(song_info[2].split('.').first)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
