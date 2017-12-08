require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @@all << self
    self.artist = artist #if artist
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
    self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.name = name
    new_song
  end

  def artist=(artist)
    @artist = artist
    if artist != nil
      @artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if @genre != nil && @genre.songs.include?(self) == false
      @genre.songs << self
    end
  end

  def self.find_by_name(song)
    @@all.detect {|s| s.name == song}
  end

  def self.find_or_create_by_name(name)
    unless @@all.detect {|s| s.name == name} then
      binding.pry
      self.create(name)
    end
  end


end
