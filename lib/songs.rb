require 'pry'
require_relative '../lib/concerns/memorable'
require_relative '../lib/artists'
require_relative '../lib/genres'

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

  def self.find_by_name(song_name)
    self.all.find {|s| s.name == song_name} #use .find instead of .select
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name) #I don't like this line
  end

  def self.new_from_filename(file_name)
    artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].split(".")[0])
    song = self.new(file_name.split(" - ")[1], artist, genre)
  end

  def self.create_from_filename(file_name)
    file_name_parts = file_name.split(" - ")
    self.create(file_name_parts[1]).tap do |s| #!test doesn't require validation on unique song
      s.artist = Artist.find_or_create_by_name(file_name_parts[0])
      s.genre = Genre.find_or_create_by_name(file_name_parts[2].split(".")[0])
    end
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
