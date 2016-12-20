require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = new(name).tap{|s| s.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(f)
    new_song = new(f.split(/ - /)[1], Artist.find_or_create_by_name(f.split(/ - /)[0]), Genre.find_or_create_by_name(f.split(/ - /)[2].sub(".mp3", "")))
  end

  def self.create_from_filename(f)
    new_from_filename(f).tap{|s| s.save}
  end
end