require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name , :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
    save
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(song)
    song = self.new(song)  
  end

  def artist=(artist)
    artist.songs << self
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    genre.songs<< self unless genre.songs.include?(self)
    @genre = genre
  end

  def self.new_from_filename(filename)
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
     name = filename.split(" - ")[1]
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3", ""))
    song = self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    name = filename.split(" - ")[1]
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].gsub(".mp3", ""))
    song = self.new(name, artist, genre)
  end
end