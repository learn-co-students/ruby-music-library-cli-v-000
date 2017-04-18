require 'pry'

class Song
  attr_accessor :artist, :name, :genre
  extend Concerns::Findable

    @@all = []

    def initialize(name)
      @name = name
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
      song = self.new(name)
      song.save
      song
    end


    # def artist_name=(name)
    #   self.artist = Artist.find_or_create_by_name(name)
    # end


    # def self.new_by_filename(filename)
    #   song_name = filename.split(" - ")[1]
    #   song_artist = filename.split(" - ")[0]
    #
    #   song = Song.new(song_name)
    #   song.artist_name=(song_artist)
    #   song.save
    # end

  end
