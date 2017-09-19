require 'pry'

class Song

  attr_accessor :name
  #attr_reader :artist

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
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
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.nil?
  end

  def genre=(genre)
    @genre = genre
    unless genre.nil? || genre.songs.include?(self)
      genre.songs << self
    end
  end

  def genre
    @genre
  end

  def artist
    @artist
  end

end
