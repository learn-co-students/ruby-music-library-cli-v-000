require 'pry'
require './lib/concerns/findable.rb'


class Song
    extend Concerns::Findable

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



    # def self.find_by_name(name)
    #   self.all.detect{|s| s.name == name }
    # end

#create_by_name is the same as .create??
    # def self.find_or_create_by_name(name)
    #   self.find_by_name(name) || self.create(name)
    # end

    # def self.create(name)
    #   song = Song.new(name)
    #   song.save
    #   song
    # end
##
    def self.new_from_filename(filename)
      artist, name, genre = filename.split(" - ")
      #self.all.detect{|a| a.name == name } find by name
      #find_or_create_by_name(name) objects not strings
      find_or_create_by_name(name)

      # song = Song.new(name, artist, genre)
      # song

    end

    def self.create_from_filename(filename)
      artist, name, genre = filename.split("-")
      new_from_filename(name)
    end
end
