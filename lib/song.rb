require 'pry'
class Song
 
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = 0, genre = 0)
    @name = name
    self.artist = artist if artist != 0
    self.genre = genre if genre != 0
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

  def self.create(name, artist = 0, genre = 0)
    self.new(name, artist, genre).tap{|song| song.save}
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    temp = filename.split(/\s-\s/)
    artist = Artist.find_or_create_by_name(temp[0].strip)
    genre = Genre.find_or_create_by_name(temp[2].gsub(".mp3", "").strip)
    song = self.new(temp[1].strip, artist, genre)
  end

  def self.create_from_filename(filename)
    temp = filename.split(/\s-\s/)
    artist = Artist.find_or_create_by_name(temp[0].strip)
    genre = Genre.find_or_create_by_name(temp[2].gsub(".mp3", "").strip)
    song = self.create(temp[1].strip, artist, genre)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

end



