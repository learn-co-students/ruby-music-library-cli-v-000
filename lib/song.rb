require 'pry'

class Song
  attr_accessor :name, :artist, :genre
    @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.create(name)
    Song.new(name).save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

    # @@all array: methods to save,
    # read & delete list of all Song objects
  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all.clear
  end
    # end @@all methods

  def self.find_by_name(name)
    self.all.find {|song| song if song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end # Song class end
