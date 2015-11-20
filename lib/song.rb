require 'pry'
require_relative "../concerns/findable.rb"

class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = Artist.new("unknown"), genre = Genre.new("unknown"))
    @name = name
    self.artist= artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def save
    @@all << self
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  #def self.find_by_name(name)
  #  @@all.each do |a|
  #    if a.name == name
  #      return a
  #    end
  #  end
  #end

  #def self.find_or_create_by_name(name)
  #  exist = self.find_by_name(name)
  #  if exist == nil
  #    self.create
  #  end
  #end

end

nice = Song.new("nice")























