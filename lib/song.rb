require "pry"
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  extend Concerns::Findable

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.create(song)
    new_song
  end

end
