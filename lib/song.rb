require 'pry'

class Song
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

  def self.find_by_name(name)
    @@all.find { |song_name| song_name == name }
  end

  def self.find_or_create_by_name(name)
    s = self.find_by_name(name)
    if s = nil
      self.create(name)
    else
      s
    end
  end

end
