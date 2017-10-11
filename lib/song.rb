require 'pry'
require './lib/concerns/findable.rb'


class Song
    include Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

    def initialize(name, artist=nil, genre=nil)
      @name = name
      self.artist = artist if artist
      self.genre = genre if genre
    end


    def artist=(artist)
       @artist = artist
       artist.add_song(self)
    end

    def genre=(genre)
      @genre = genre
      genre.songs << self unless genre.songs.include?(self)
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
      song = Song.new
      song.name = name
      song.save
      song
    end

    def self.find_by_name(name)
      self.all.detect{|s| s.name == name }
    end

#create_by_name is the same as .create??
    def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
    end
##
    def self.new_from_filename(filename)
      artist, song = filename.split(" - ")
      #self.all.detect{|a| a.name == name } find by name
      song = self.new
      song.name = name
      song
    end

    def self.create_from_filename(filename)
      self.new_from_filename(filename)
      song.save
      song
    end
end
