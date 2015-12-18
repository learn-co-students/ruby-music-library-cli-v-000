require_relative "../config/environment.rb"
require 'pry'
class Song
  extend Concerns::Findable
  

  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist=" ", genre=" ")
    @name = name
    self.artist=(artist) if artist.is_a?(Artist)
    self.genre=(genre) if genre.is_a?(Genre)
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.new_by_filename(filename)
    # binding.pry
   
  end

  def self.create_by_filename

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) || genre.songs << self
  end

  def save
    @@all << self
  end

  def self.all 
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end

Song.new_by_filename("Thundercat - For Love I Come - dance.mp3")
