require "pry"

class Song
  extend Concerns::Findable
  attr_accessor :artist, :name, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = (artist) if artist != nil
    self.genre=(genre) if genre != nil
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

  def self.create(song)
    song = Song.new(song)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)

    mp3_removed = filename.gsub('.mp3', '')
    artist = mp3_removed.split(" - ")[0]
    song = mp3_removed.split(" - ")[1]
    genre = mp3_removed.split(" - ")[1]
    song.artist = artist 
    song.genre = genre
    song.save
  end
  
end
