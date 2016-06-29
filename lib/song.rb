require_relative "../config/environment.rb"

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    if !artist.songs.include?(self)
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre

    if !genre.songs.include?(self)
      genre.add_song(self)
    end
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

end
