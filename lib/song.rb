require 'pry'
class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = Array.new

  def initialize(name, artist=nil, genre=nil)
    @name = name
    artist ? self.artist = artist : artist = nil
    genre ? self.genre = genre : genre = nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(song)
    self.new(song).tap {|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? genre.songs : genre.songs << self
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    song = filename.split(" - ")[1]
    self.new(song).tap {|song| song.save}
  end

end
