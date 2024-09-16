require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name,artist=nil,genre=nil)
    @name = name
    if artist !=nil
      self.artist = artist
    end
    if genre !=nil
      self.genre = genre
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.gsub(".mp3","").split(" - ")
    new_song = Song.find_or_create_by_name(song)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song
  end

  def self.create_from_filename(filename)
    @@all << new_from_filename(filename)
  end

end
