require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self) unless self.artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self) unless self.genre.songs.include?(self)
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

  def self.create(name)
    s = new(name)
    s.save
    s
  end

  def self.new_from_filename(filename)
    # artist_name, song_name = filename.split(" - ")[0], filename.split(" - ")[1]
    song_name = filename.split(" - ")[1]
    song = self.new(song_name)
    # song.artist=(artist)
    # song.artist.add_song(song)
    song
  end

end
