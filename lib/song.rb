require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(new_song, artist="", genre="")
    @name = new_song
    self.artist=(artist) unless artist == ""
    # self.genre=(genre)
    @genre = genre
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

  def self.create(song)
  created_song = self.new(song)
  created_song.save
  created_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
   song.genre=(genre)
  end
end
