require_relative '../concerns/findable.rb'
require 'pry'
class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = "" , genre = "")
    @name = name
     if artist.is_a?(Artist)
       self.artist=(artist)
     end

     if genre.is_a?(Genre)
       self.genre=(genre)
     end

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

  def self.create(name)
    song = self.new(name)
    song.save
    song

  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self) unless @artist.songs.include?(self)

  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self) unless @genre.songs.include?(self)
  end

end
