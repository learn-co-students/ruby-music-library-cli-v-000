require 'pry'
class Song
  @@all = [ ]
  attr_reader :artist, :genre
  attr_accessor :name

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
    self.save
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

# Class methods
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.find_by_name(song_name)
    self.all.find {|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    binding.pry
    song = self.all.find {|s| s.name == song_name}
    song = self.create(song_name) unless song.name == song_name
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
