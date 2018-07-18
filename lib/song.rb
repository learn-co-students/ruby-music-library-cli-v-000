require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []


  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
    save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
    #@songs << song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    created_song = Song.new(name)
      created_song.save
      created_song
  end

  def genre
    @genre
  end
end
