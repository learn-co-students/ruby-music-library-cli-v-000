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

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self) unless artist == nil
  end

  def genre=(genre)
    @genre = genre
    if self.genre !=nil && self.genre.songs.include?(self) == false
      self.genre.songs << self
    end
  end

  def save
    @@all << self
  end

end
