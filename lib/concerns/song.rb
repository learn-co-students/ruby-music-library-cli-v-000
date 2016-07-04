require 'pry'
class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
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
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist = nil, genre = nil).tap(&:save)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    self.all.detect { |n| n.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file_name)
    artist = Artist.find_or_create_by_name(file_name.split(' - ')[0])
    song = Song.find_or_create_by_name(file_name.split(' - ')[1])
    genre = Genre.find_or_create_by_name(file_name.split(' - ')[2].split('.mp3').first)

    artist.add_song(song)
    genre.add_song(song)
    song
  end

    def self.create_from_filename(file_name)
      self.new_from_filename(file_name)
    end
end
