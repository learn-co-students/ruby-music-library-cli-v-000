require_relative '../concerns/findable.rb'
require 'pry'

class Song < Basics
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  attr_reader :artist, :genre

@@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def initialize(name, artist = nil,  genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre
  end

  def self.create(name, artist = nil,  genre = nil)
    new(name, artist, genre).tap {|att| att.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) 
    artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if 
    !genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    new_input = file.split(" - ")
    artist = Artist.find_or_create_by_name(new_input[0])
    genre = Genre.find_or_create_by_name(new_input[2].chomp(".mp3"))
    self.new(new_input[1], artist, genre)
  end

  def self.create_from_filename(file)
    new_input = file.split(" - ")
    artist = Artist.find_or_create_by_name(new_input[0])
    genre = Genre.find_or_create_by_name(new_input[2].chomp(".mp3"))
    self.create(new_input[1], artist, genre)
  end

def information
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
  
end