require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song_name)
    Song.new(song_name).save
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless
    genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.find {|name| name}
  end

  def self.find_or_create_by_name(name)
      if song = self.all.find { |song| song.name == name }
    else
      song = self.new(name)
      song.save
    end
    song
  end

end
