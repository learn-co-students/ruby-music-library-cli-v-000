require_relative 'concerns/findable.rb'

class Song < MusicImporter
  extend Concerns::Findable
  include Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = "", genre = "")
    if artist.is_a?(Artist)
      self.artist = artist
    end
    if genre.is_a?(Genre)
      self.genre = genre
    end
    @name = name
    save
  end

  def artist=(artist)
    @artist = Artist.find_or_create_by_name(artist.name)
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def genre=(genre)
    @genre = Genre.find_or_create_by_name(genre.name)
    genre.songs << self unless genre.songs.include?(self)
  end

end