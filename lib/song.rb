require 'pry'
require_relative '../lib/concerns/findable.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @songs = []
    self.artist = artist if artist !=nil
    self.genre = genre if genre !=nil
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
    Song.new(name).save
  end

  def artist=(artist)
      @artist = artist
      artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    name = file.split(' - ')[1]
    artist = Artist.find_or_create_by_name(file.split(' - ')[0])
    genre = Genre.find_or_create_by_name(file.split(' - ')[2].split('.mp3')[0])

    Song.new(name, artist, genre)
  end

  def self.create_from_filename(file)
    Song.new_from_filename(file).save
  end
end
