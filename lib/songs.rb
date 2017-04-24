require 'pry'
require_relative '../lib/concerns/memorable'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  include Memorable::InstanceMethods
  extend Memorable::ClassMethods

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.all
    @@all
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.push(self) unless genre.songs.include?(self)
  end

end


  #def save
  #  @@all << self
  #end

  #def self.destroy_all
  #  self.all.clear
  #end

  #def self.create(name)
  #  song = Song.new(name)
  #  song.save
  #  song #add after running rspec 001_song_basics_spec WHAT FOR???
  #end
