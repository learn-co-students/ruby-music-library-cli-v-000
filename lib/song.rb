require 'pry'

class Song
  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song_name)
    song = Song.new(song_name)
    song.save
    song
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(@name)
  end



  def save
    @@all << self
  end

end
