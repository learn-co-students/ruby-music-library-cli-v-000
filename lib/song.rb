require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.send("artist=", artist) if artist
    @genre = genre
    self.send("genre=", genre) if genre
    self.save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    if !genre.songs.include?(self)
      genre.songs << self
    end
    @genre = genre
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

  def self.create(name)
    song = self.new(name)
    @@all << song
    song
  end
end
