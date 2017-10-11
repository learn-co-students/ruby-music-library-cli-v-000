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
## these can be moved to findable
    def self.new_from_filename(filename)
      parts = filename.split(" - ")
      artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      self.new(song_name, artist, genre)
      #turn the strings into objects
    end

    def self.create_from_filename(filename)
      parts = filename.split(" - ")
      artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")
      artist = Artist.find_or_create_by_name(artist_name)
      genre = Genre.find_or_create_by_name(genre_name)
      self.create(song_name, artist, genre)
    end
end
