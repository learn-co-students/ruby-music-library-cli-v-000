require 'pry'

class Song
  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []

  def initialize(name, artist_object = nil, genre_object = nil)
    self.name = name

    self.artist = artist_object if artist_object
    self.genre = genre_object if genre_object

  end

  def self.create(name)
    new_instance = self.new(name)
    new_instance.save
    new_instance
  end

  def artist=(artist_object)
    @artist = artist_object
    artist_object.add_song(self)
  end

  def genre=(genre_object)
    @genre = genre_object
    genre_object.add_song(self)
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

  def self.find_by_name(name)
    self.all.detect { |obj| obj.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
