# require_relative 'concerns/findable.rb'
require_relative 'artist.rb'

class Song
  # extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  # attr_reader :artist
  @@all = []

  def initialize(name, artist = Artist.new(nil), genre = Genre.new(nil))
    @name = name
    artist.add_song(self) if !artist.songs.include?(self)
    @genre = genre
    @genre.songs << self if !genre.songs.include?(self)
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
    created = self.new(name)
    created.save
    created
  end

  def artist=(artist)
    @artist = artist 
    @artist.add_song(self) if !artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self if !genre.songs.include?(self)
  end
end