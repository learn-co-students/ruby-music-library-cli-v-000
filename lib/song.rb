
require 'pry'
class Song

  @@all = []
  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
  end
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    @@all << self
  end
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  def self.find_by_name(name)
    self.all.find{|a| a.name == name}
  end
  def self.find_or_create_by_name(name)
     self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    artist
  end
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  def self.new_from_filename(filename)
    file = filename.split(" - ")
    song = Song.new(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2].chomp(".mp3"))
    song
  end
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end
